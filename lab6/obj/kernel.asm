
bin/kernel:     file format elf64-littleriscv


Disassembly of section .text:

ffffffffc0200000 <kern_entry>:
ffffffffc0200000:	c020c2b7          	lui	t0,0xc020c
ffffffffc0200004:	ffd0031b          	addiw	t1,zero,-3
ffffffffc0200008:	037a                	slli	t1,t1,0x1e
ffffffffc020000a:	406282b3          	sub	t0,t0,t1
ffffffffc020000e:	00c2d293          	srli	t0,t0,0xc
ffffffffc0200012:	fff0031b          	addiw	t1,zero,-1
ffffffffc0200016:	137e                	slli	t1,t1,0x3f
ffffffffc0200018:	0062e2b3          	or	t0,t0,t1
ffffffffc020001c:	18029073          	csrw	satp,t0
ffffffffc0200020:	12000073          	sfence.vma
ffffffffc0200024:	c020c137          	lui	sp,0xc020c
ffffffffc0200028:	c02002b7          	lui	t0,0xc0200
ffffffffc020002c:	03228293          	addi	t0,t0,50 # ffffffffc0200032 <kern_init>
ffffffffc0200030:	8282                	jr	t0

ffffffffc0200032 <kern_init>:
ffffffffc0200032:	00032517          	auipc	a0,0x32
ffffffffc0200036:	0d650513          	addi	a0,a0,214 # ffffffffc0232108 <buf>
ffffffffc020003a:	0003d617          	auipc	a2,0x3d
ffffffffc020003e:	66660613          	addi	a2,a2,1638 # ffffffffc023d6a0 <end>
ffffffffc0200042:	1141                	addi	sp,sp,-16 # ffffffffc020bff0 <bootstack+0x1ff0>
ffffffffc0200044:	8e09                	sub	a2,a2,a0
ffffffffc0200046:	4581                	li	a1,0
ffffffffc0200048:	e406                	sd	ra,8(sp)
ffffffffc020004a:	296060ef          	jal	ffffffffc02062e0 <memset>
ffffffffc020004e:	51e000ef          	jal	ffffffffc020056c <cons_init>
ffffffffc0200052:	00006597          	auipc	a1,0x6
ffffffffc0200056:	2be58593          	addi	a1,a1,702 # ffffffffc0206310 <etext+0x6>
ffffffffc020005a:	00006517          	auipc	a0,0x6
ffffffffc020005e:	2d650513          	addi	a0,a0,726 # ffffffffc0206330 <etext+0x26>
ffffffffc0200062:	122000ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0200066:	1b2000ef          	jal	ffffffffc0200218 <print_kerninfo>
ffffffffc020006a:	282020ef          	jal	ffffffffc02022ec <pmm_init>
ffffffffc020006e:	5d2000ef          	jal	ffffffffc0200640 <pic_init>
ffffffffc0200072:	5d0000ef          	jal	ffffffffc0200642 <idt_init>
ffffffffc0200076:	743030ef          	jal	ffffffffc0203fb8 <vmm_init>
ffffffffc020007a:	2bb050ef          	jal	ffffffffc0205b34 <sched_init>
ffffffffc020007e:	02d050ef          	jal	ffffffffc02058aa <proc_init>
ffffffffc0200082:	55c000ef          	jal	ffffffffc02005de <ide_init>
ffffffffc0200086:	709020ef          	jal	ffffffffc0202f8e <swap_init>
ffffffffc020008a:	49a000ef          	jal	ffffffffc0200524 <clock_init>
ffffffffc020008e:	5a6000ef          	jal	ffffffffc0200634 <intr_enable>
ffffffffc0200092:	1b3050ef          	jal	ffffffffc0205a44 <cpu_idle>

ffffffffc0200096 <readline>:
ffffffffc0200096:	715d                	addi	sp,sp,-80
ffffffffc0200098:	e486                	sd	ra,72(sp)
ffffffffc020009a:	e0a2                	sd	s0,64(sp)
ffffffffc020009c:	fc26                	sd	s1,56(sp)
ffffffffc020009e:	f84a                	sd	s2,48(sp)
ffffffffc02000a0:	f44e                	sd	s3,40(sp)
ffffffffc02000a2:	f052                	sd	s4,32(sp)
ffffffffc02000a4:	ec56                	sd	s5,24(sp)
ffffffffc02000a6:	e85a                	sd	s6,16(sp)
ffffffffc02000a8:	c901                	beqz	a0,ffffffffc02000b8 <readline+0x22>
ffffffffc02000aa:	85aa                	mv	a1,a0
ffffffffc02000ac:	00006517          	auipc	a0,0x6
ffffffffc02000b0:	28c50513          	addi	a0,a0,652 # ffffffffc0206338 <etext+0x2e>
ffffffffc02000b4:	0d0000ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02000b8:	4401                	li	s0,0
ffffffffc02000ba:	44fd                	li	s1,31
ffffffffc02000bc:	4921                	li	s2,8
ffffffffc02000be:	4a29                	li	s4,10
ffffffffc02000c0:	4ab5                	li	s5,13
ffffffffc02000c2:	00032b17          	auipc	s6,0x32
ffffffffc02000c6:	046b0b13          	addi	s6,s6,70 # ffffffffc0232108 <buf>
ffffffffc02000ca:	3fe00993          	li	s3,1022
ffffffffc02000ce:	13a000ef          	jal	ffffffffc0200208 <getchar>
ffffffffc02000d2:	00054a63          	bltz	a0,ffffffffc02000e6 <readline+0x50>
ffffffffc02000d6:	00a4da63          	bge	s1,a0,ffffffffc02000ea <readline+0x54>
ffffffffc02000da:	0289d263          	bge	s3,s0,ffffffffc02000fe <readline+0x68>
ffffffffc02000de:	12a000ef          	jal	ffffffffc0200208 <getchar>
ffffffffc02000e2:	fe055ae3          	bgez	a0,ffffffffc02000d6 <readline+0x40>
ffffffffc02000e6:	4501                	li	a0,0
ffffffffc02000e8:	a091                	j	ffffffffc020012c <readline+0x96>
ffffffffc02000ea:	03251463          	bne	a0,s2,ffffffffc0200112 <readline+0x7c>
ffffffffc02000ee:	04804963          	bgtz	s0,ffffffffc0200140 <readline+0xaa>
ffffffffc02000f2:	116000ef          	jal	ffffffffc0200208 <getchar>
ffffffffc02000f6:	fe0548e3          	bltz	a0,ffffffffc02000e6 <readline+0x50>
ffffffffc02000fa:	fea4d8e3          	bge	s1,a0,ffffffffc02000ea <readline+0x54>
ffffffffc02000fe:	e42a                	sd	a0,8(sp)
ffffffffc0200100:	0b8000ef          	jal	ffffffffc02001b8 <cputchar>
ffffffffc0200104:	6522                	ld	a0,8(sp)
ffffffffc0200106:	008b07b3          	add	a5,s6,s0
ffffffffc020010a:	2405                	addiw	s0,s0,1
ffffffffc020010c:	00a78023          	sb	a0,0(a5)
ffffffffc0200110:	bf7d                	j	ffffffffc02000ce <readline+0x38>
ffffffffc0200112:	01450463          	beq	a0,s4,ffffffffc020011a <readline+0x84>
ffffffffc0200116:	fb551ce3          	bne	a0,s5,ffffffffc02000ce <readline+0x38>
ffffffffc020011a:	09e000ef          	jal	ffffffffc02001b8 <cputchar>
ffffffffc020011e:	00032517          	auipc	a0,0x32
ffffffffc0200122:	fea50513          	addi	a0,a0,-22 # ffffffffc0232108 <buf>
ffffffffc0200126:	942a                	add	s0,s0,a0
ffffffffc0200128:	00040023          	sb	zero,0(s0)
ffffffffc020012c:	60a6                	ld	ra,72(sp)
ffffffffc020012e:	6406                	ld	s0,64(sp)
ffffffffc0200130:	74e2                	ld	s1,56(sp)
ffffffffc0200132:	7942                	ld	s2,48(sp)
ffffffffc0200134:	79a2                	ld	s3,40(sp)
ffffffffc0200136:	7a02                	ld	s4,32(sp)
ffffffffc0200138:	6ae2                	ld	s5,24(sp)
ffffffffc020013a:	6b42                	ld	s6,16(sp)
ffffffffc020013c:	6161                	addi	sp,sp,80
ffffffffc020013e:	8082                	ret
ffffffffc0200140:	4521                	li	a0,8
ffffffffc0200142:	076000ef          	jal	ffffffffc02001b8 <cputchar>
ffffffffc0200146:	347d                	addiw	s0,s0,-1
ffffffffc0200148:	b759                	j	ffffffffc02000ce <readline+0x38>

ffffffffc020014a <cputch>:
ffffffffc020014a:	1141                	addi	sp,sp,-16
ffffffffc020014c:	e022                	sd	s0,0(sp)
ffffffffc020014e:	e406                	sd	ra,8(sp)
ffffffffc0200150:	842e                	mv	s0,a1
ffffffffc0200152:	41c000ef          	jal	ffffffffc020056e <cons_putc>
ffffffffc0200156:	401c                	lw	a5,0(s0)
ffffffffc0200158:	60a2                	ld	ra,8(sp)
ffffffffc020015a:	2785                	addiw	a5,a5,1
ffffffffc020015c:	c01c                	sw	a5,0(s0)
ffffffffc020015e:	6402                	ld	s0,0(sp)
ffffffffc0200160:	0141                	addi	sp,sp,16
ffffffffc0200162:	8082                	ret

ffffffffc0200164 <vcprintf>:
ffffffffc0200164:	1101                	addi	sp,sp,-32
ffffffffc0200166:	862a                	mv	a2,a0
ffffffffc0200168:	86ae                	mv	a3,a1
ffffffffc020016a:	00000517          	auipc	a0,0x0
ffffffffc020016e:	fe050513          	addi	a0,a0,-32 # ffffffffc020014a <cputch>
ffffffffc0200172:	006c                	addi	a1,sp,12
ffffffffc0200174:	ec06                	sd	ra,24(sp)
ffffffffc0200176:	c602                	sw	zero,12(sp)
ffffffffc0200178:	559050ef          	jal	ffffffffc0205ed0 <vprintfmt>
ffffffffc020017c:	60e2                	ld	ra,24(sp)
ffffffffc020017e:	4532                	lw	a0,12(sp)
ffffffffc0200180:	6105                	addi	sp,sp,32
ffffffffc0200182:	8082                	ret

ffffffffc0200184 <cprintf>:
ffffffffc0200184:	711d                	addi	sp,sp,-96
ffffffffc0200186:	02810313          	addi	t1,sp,40
ffffffffc020018a:	f42e                	sd	a1,40(sp)
ffffffffc020018c:	f832                	sd	a2,48(sp)
ffffffffc020018e:	fc36                	sd	a3,56(sp)
ffffffffc0200190:	862a                	mv	a2,a0
ffffffffc0200192:	004c                	addi	a1,sp,4
ffffffffc0200194:	00000517          	auipc	a0,0x0
ffffffffc0200198:	fb650513          	addi	a0,a0,-74 # ffffffffc020014a <cputch>
ffffffffc020019c:	869a                	mv	a3,t1
ffffffffc020019e:	ec06                	sd	ra,24(sp)
ffffffffc02001a0:	e0ba                	sd	a4,64(sp)
ffffffffc02001a2:	e4be                	sd	a5,72(sp)
ffffffffc02001a4:	e8c2                	sd	a6,80(sp)
ffffffffc02001a6:	ecc6                	sd	a7,88(sp)
ffffffffc02001a8:	e41a                	sd	t1,8(sp)
ffffffffc02001aa:	c202                	sw	zero,4(sp)
ffffffffc02001ac:	525050ef          	jal	ffffffffc0205ed0 <vprintfmt>
ffffffffc02001b0:	60e2                	ld	ra,24(sp)
ffffffffc02001b2:	4512                	lw	a0,4(sp)
ffffffffc02001b4:	6125                	addi	sp,sp,96
ffffffffc02001b6:	8082                	ret

ffffffffc02001b8 <cputchar>:
ffffffffc02001b8:	ae5d                	j	ffffffffc020056e <cons_putc>

ffffffffc02001ba <cputs>:
ffffffffc02001ba:	1101                	addi	sp,sp,-32
ffffffffc02001bc:	ec06                	sd	ra,24(sp)
ffffffffc02001be:	e822                	sd	s0,16(sp)
ffffffffc02001c0:	87aa                	mv	a5,a0
ffffffffc02001c2:	00054503          	lbu	a0,0(a0)
ffffffffc02001c6:	c905                	beqz	a0,ffffffffc02001f6 <cputs+0x3c>
ffffffffc02001c8:	e426                	sd	s1,8(sp)
ffffffffc02001ca:	00178493          	addi	s1,a5,1
ffffffffc02001ce:	8426                	mv	s0,s1
ffffffffc02001d0:	39e000ef          	jal	ffffffffc020056e <cons_putc>
ffffffffc02001d4:	00044503          	lbu	a0,0(s0)
ffffffffc02001d8:	87a2                	mv	a5,s0
ffffffffc02001da:	0405                	addi	s0,s0,1
ffffffffc02001dc:	f975                	bnez	a0,ffffffffc02001d0 <cputs+0x16>
ffffffffc02001de:	9f85                	subw	a5,a5,s1
ffffffffc02001e0:	4529                	li	a0,10
ffffffffc02001e2:	0027841b          	addiw	s0,a5,2
ffffffffc02001e6:	64a2                	ld	s1,8(sp)
ffffffffc02001e8:	386000ef          	jal	ffffffffc020056e <cons_putc>
ffffffffc02001ec:	60e2                	ld	ra,24(sp)
ffffffffc02001ee:	8522                	mv	a0,s0
ffffffffc02001f0:	6442                	ld	s0,16(sp)
ffffffffc02001f2:	6105                	addi	sp,sp,32
ffffffffc02001f4:	8082                	ret
ffffffffc02001f6:	4529                	li	a0,10
ffffffffc02001f8:	376000ef          	jal	ffffffffc020056e <cons_putc>
ffffffffc02001fc:	4405                	li	s0,1
ffffffffc02001fe:	60e2                	ld	ra,24(sp)
ffffffffc0200200:	8522                	mv	a0,s0
ffffffffc0200202:	6442                	ld	s0,16(sp)
ffffffffc0200204:	6105                	addi	sp,sp,32
ffffffffc0200206:	8082                	ret

ffffffffc0200208 <getchar>:
ffffffffc0200208:	1141                	addi	sp,sp,-16
ffffffffc020020a:	e406                	sd	ra,8(sp)
ffffffffc020020c:	396000ef          	jal	ffffffffc02005a2 <cons_getc>
ffffffffc0200210:	dd75                	beqz	a0,ffffffffc020020c <getchar+0x4>
ffffffffc0200212:	60a2                	ld	ra,8(sp)
ffffffffc0200214:	0141                	addi	sp,sp,16
ffffffffc0200216:	8082                	ret

ffffffffc0200218 <print_kerninfo>:
ffffffffc0200218:	1141                	addi	sp,sp,-16
ffffffffc020021a:	00006517          	auipc	a0,0x6
ffffffffc020021e:	12650513          	addi	a0,a0,294 # ffffffffc0206340 <etext+0x36>
ffffffffc0200222:	e406                	sd	ra,8(sp)
ffffffffc0200224:	f61ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0200228:	00000597          	auipc	a1,0x0
ffffffffc020022c:	e0a58593          	addi	a1,a1,-502 # ffffffffc0200032 <kern_init>
ffffffffc0200230:	00006517          	auipc	a0,0x6
ffffffffc0200234:	13050513          	addi	a0,a0,304 # ffffffffc0206360 <etext+0x56>
ffffffffc0200238:	f4dff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc020023c:	00006597          	auipc	a1,0x6
ffffffffc0200240:	0ce58593          	addi	a1,a1,206 # ffffffffc020630a <etext>
ffffffffc0200244:	00006517          	auipc	a0,0x6
ffffffffc0200248:	13c50513          	addi	a0,a0,316 # ffffffffc0206380 <etext+0x76>
ffffffffc020024c:	f39ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0200250:	00032597          	auipc	a1,0x32
ffffffffc0200254:	eb858593          	addi	a1,a1,-328 # ffffffffc0232108 <buf>
ffffffffc0200258:	00006517          	auipc	a0,0x6
ffffffffc020025c:	14850513          	addi	a0,a0,328 # ffffffffc02063a0 <etext+0x96>
ffffffffc0200260:	f25ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0200264:	0003d597          	auipc	a1,0x3d
ffffffffc0200268:	43c58593          	addi	a1,a1,1084 # ffffffffc023d6a0 <end>
ffffffffc020026c:	00006517          	auipc	a0,0x6
ffffffffc0200270:	15450513          	addi	a0,a0,340 # ffffffffc02063c0 <etext+0xb6>
ffffffffc0200274:	f11ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0200278:	0003e797          	auipc	a5,0x3e
ffffffffc020027c:	82778793          	addi	a5,a5,-2009 # ffffffffc023da9f <end+0x3ff>
ffffffffc0200280:	00000717          	auipc	a4,0x0
ffffffffc0200284:	db270713          	addi	a4,a4,-590 # ffffffffc0200032 <kern_init>
ffffffffc0200288:	8f99                	sub	a5,a5,a4
ffffffffc020028a:	43f7d593          	srai	a1,a5,0x3f
ffffffffc020028e:	60a2                	ld	ra,8(sp)
ffffffffc0200290:	3ff5f593          	andi	a1,a1,1023
ffffffffc0200294:	95be                	add	a1,a1,a5
ffffffffc0200296:	85a9                	srai	a1,a1,0xa
ffffffffc0200298:	00006517          	auipc	a0,0x6
ffffffffc020029c:	14850513          	addi	a0,a0,328 # ffffffffc02063e0 <etext+0xd6>
ffffffffc02002a0:	0141                	addi	sp,sp,16
ffffffffc02002a2:	b5cd                	j	ffffffffc0200184 <cprintf>

ffffffffc02002a4 <print_stackframe>:
ffffffffc02002a4:	1141                	addi	sp,sp,-16
ffffffffc02002a6:	00006617          	auipc	a2,0x6
ffffffffc02002aa:	16a60613          	addi	a2,a2,362 # ffffffffc0206410 <etext+0x106>
ffffffffc02002ae:	05b00593          	li	a1,91
ffffffffc02002b2:	00006517          	auipc	a0,0x6
ffffffffc02002b6:	17650513          	addi	a0,a0,374 # ffffffffc0206428 <etext+0x11e>
ffffffffc02002ba:	e406                	sd	ra,8(sp)
ffffffffc02002bc:	1bc000ef          	jal	ffffffffc0200478 <__panic>

ffffffffc02002c0 <mon_help>:
ffffffffc02002c0:	1141                	addi	sp,sp,-16
ffffffffc02002c2:	00006617          	auipc	a2,0x6
ffffffffc02002c6:	17e60613          	addi	a2,a2,382 # ffffffffc0206440 <etext+0x136>
ffffffffc02002ca:	00006597          	auipc	a1,0x6
ffffffffc02002ce:	19658593          	addi	a1,a1,406 # ffffffffc0206460 <etext+0x156>
ffffffffc02002d2:	00006517          	auipc	a0,0x6
ffffffffc02002d6:	19650513          	addi	a0,a0,406 # ffffffffc0206468 <etext+0x15e>
ffffffffc02002da:	e406                	sd	ra,8(sp)
ffffffffc02002dc:	ea9ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02002e0:	00006617          	auipc	a2,0x6
ffffffffc02002e4:	19860613          	addi	a2,a2,408 # ffffffffc0206478 <etext+0x16e>
ffffffffc02002e8:	00006597          	auipc	a1,0x6
ffffffffc02002ec:	1b858593          	addi	a1,a1,440 # ffffffffc02064a0 <etext+0x196>
ffffffffc02002f0:	00006517          	auipc	a0,0x6
ffffffffc02002f4:	17850513          	addi	a0,a0,376 # ffffffffc0206468 <etext+0x15e>
ffffffffc02002f8:	e8dff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02002fc:	00006617          	auipc	a2,0x6
ffffffffc0200300:	1b460613          	addi	a2,a2,436 # ffffffffc02064b0 <etext+0x1a6>
ffffffffc0200304:	00006597          	auipc	a1,0x6
ffffffffc0200308:	1cc58593          	addi	a1,a1,460 # ffffffffc02064d0 <etext+0x1c6>
ffffffffc020030c:	00006517          	auipc	a0,0x6
ffffffffc0200310:	15c50513          	addi	a0,a0,348 # ffffffffc0206468 <etext+0x15e>
ffffffffc0200314:	e71ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0200318:	60a2                	ld	ra,8(sp)
ffffffffc020031a:	4501                	li	a0,0
ffffffffc020031c:	0141                	addi	sp,sp,16
ffffffffc020031e:	8082                	ret

ffffffffc0200320 <mon_kerninfo>:
ffffffffc0200320:	1141                	addi	sp,sp,-16
ffffffffc0200322:	e406                	sd	ra,8(sp)
ffffffffc0200324:	ef5ff0ef          	jal	ffffffffc0200218 <print_kerninfo>
ffffffffc0200328:	60a2                	ld	ra,8(sp)
ffffffffc020032a:	4501                	li	a0,0
ffffffffc020032c:	0141                	addi	sp,sp,16
ffffffffc020032e:	8082                	ret

ffffffffc0200330 <mon_backtrace>:
ffffffffc0200330:	1141                	addi	sp,sp,-16
ffffffffc0200332:	e406                	sd	ra,8(sp)
ffffffffc0200334:	f71ff0ef          	jal	ffffffffc02002a4 <print_stackframe>
ffffffffc0200338:	60a2                	ld	ra,8(sp)
ffffffffc020033a:	4501                	li	a0,0
ffffffffc020033c:	0141                	addi	sp,sp,16
ffffffffc020033e:	8082                	ret

ffffffffc0200340 <kmonitor>:
ffffffffc0200340:	7115                	addi	sp,sp,-224
ffffffffc0200342:	f15a                	sd	s6,160(sp)
ffffffffc0200344:	8b2a                	mv	s6,a0
ffffffffc0200346:	00006517          	auipc	a0,0x6
ffffffffc020034a:	19a50513          	addi	a0,a0,410 # ffffffffc02064e0 <etext+0x1d6>
ffffffffc020034e:	ed86                	sd	ra,216(sp)
ffffffffc0200350:	e9a2                	sd	s0,208(sp)
ffffffffc0200352:	e5a6                	sd	s1,200(sp)
ffffffffc0200354:	e1ca                	sd	s2,192(sp)
ffffffffc0200356:	fd4e                	sd	s3,184(sp)
ffffffffc0200358:	f952                	sd	s4,176(sp)
ffffffffc020035a:	f556                	sd	s5,168(sp)
ffffffffc020035c:	ed5e                	sd	s7,152(sp)
ffffffffc020035e:	e962                	sd	s8,144(sp)
ffffffffc0200360:	e566                	sd	s9,136(sp)
ffffffffc0200362:	e16a                	sd	s10,128(sp)
ffffffffc0200364:	e21ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0200368:	00006517          	auipc	a0,0x6
ffffffffc020036c:	1a050513          	addi	a0,a0,416 # ffffffffc0206508 <etext+0x1fe>
ffffffffc0200370:	e15ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0200374:	000b0563          	beqz	s6,ffffffffc020037e <kmonitor+0x3e>
ffffffffc0200378:	855a                	mv	a0,s6
ffffffffc020037a:	4b0000ef          	jal	ffffffffc020082a <print_trapframe>
ffffffffc020037e:	00008c17          	auipc	s8,0x8
ffffffffc0200382:	2a2c0c13          	addi	s8,s8,674 # ffffffffc0208620 <commands>
ffffffffc0200386:	00006917          	auipc	s2,0x6
ffffffffc020038a:	1aa90913          	addi	s2,s2,426 # ffffffffc0206530 <etext+0x226>
ffffffffc020038e:	00006497          	auipc	s1,0x6
ffffffffc0200392:	1aa48493          	addi	s1,s1,426 # ffffffffc0206538 <etext+0x22e>
ffffffffc0200396:	49bd                	li	s3,15
ffffffffc0200398:	00006a97          	auipc	s5,0x6
ffffffffc020039c:	1a8a8a93          	addi	s5,s5,424 # ffffffffc0206540 <etext+0x236>
ffffffffc02003a0:	4a0d                	li	s4,3
ffffffffc02003a2:	00006b97          	auipc	s7,0x6
ffffffffc02003a6:	1beb8b93          	addi	s7,s7,446 # ffffffffc0206560 <etext+0x256>
ffffffffc02003aa:	854a                	mv	a0,s2
ffffffffc02003ac:	cebff0ef          	jal	ffffffffc0200096 <readline>
ffffffffc02003b0:	842a                	mv	s0,a0
ffffffffc02003b2:	dd65                	beqz	a0,ffffffffc02003aa <kmonitor+0x6a>
ffffffffc02003b4:	00054583          	lbu	a1,0(a0)
ffffffffc02003b8:	4c81                	li	s9,0
ffffffffc02003ba:	e59d                	bnez	a1,ffffffffc02003e8 <kmonitor+0xa8>
ffffffffc02003bc:	fe0c87e3          	beqz	s9,ffffffffc02003aa <kmonitor+0x6a>
ffffffffc02003c0:	00008d17          	auipc	s10,0x8
ffffffffc02003c4:	260d0d13          	addi	s10,s10,608 # ffffffffc0208620 <commands>
ffffffffc02003c8:	4401                	li	s0,0
ffffffffc02003ca:	6582                	ld	a1,0(sp)
ffffffffc02003cc:	000d3503          	ld	a0,0(s10)
ffffffffc02003d0:	6c3050ef          	jal	ffffffffc0206292 <strcmp>
ffffffffc02003d4:	c53d                	beqz	a0,ffffffffc0200442 <kmonitor+0x102>
ffffffffc02003d6:	2405                	addiw	s0,s0,1
ffffffffc02003d8:	0d61                	addi	s10,s10,24
ffffffffc02003da:	ff4418e3          	bne	s0,s4,ffffffffc02003ca <kmonitor+0x8a>
ffffffffc02003de:	6582                	ld	a1,0(sp)
ffffffffc02003e0:	855e                	mv	a0,s7
ffffffffc02003e2:	da3ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02003e6:	b7d1                	j	ffffffffc02003aa <kmonitor+0x6a>
ffffffffc02003e8:	8526                	mv	a0,s1
ffffffffc02003ea:	6e1050ef          	jal	ffffffffc02062ca <strchr>
ffffffffc02003ee:	c901                	beqz	a0,ffffffffc02003fe <kmonitor+0xbe>
ffffffffc02003f0:	00144583          	lbu	a1,1(s0)
ffffffffc02003f4:	00040023          	sb	zero,0(s0)
ffffffffc02003f8:	0405                	addi	s0,s0,1
ffffffffc02003fa:	d1e9                	beqz	a1,ffffffffc02003bc <kmonitor+0x7c>
ffffffffc02003fc:	b7f5                	j	ffffffffc02003e8 <kmonitor+0xa8>
ffffffffc02003fe:	00044783          	lbu	a5,0(s0)
ffffffffc0200402:	dfcd                	beqz	a5,ffffffffc02003bc <kmonitor+0x7c>
ffffffffc0200404:	033c8a63          	beq	s9,s3,ffffffffc0200438 <kmonitor+0xf8>
ffffffffc0200408:	003c9793          	slli	a5,s9,0x3
ffffffffc020040c:	08078793          	addi	a5,a5,128
ffffffffc0200410:	978a                	add	a5,a5,sp
ffffffffc0200412:	f887b023          	sd	s0,-128(a5)
ffffffffc0200416:	00044583          	lbu	a1,0(s0)
ffffffffc020041a:	2c85                	addiw	s9,s9,1
ffffffffc020041c:	e591                	bnez	a1,ffffffffc0200428 <kmonitor+0xe8>
ffffffffc020041e:	bf79                	j	ffffffffc02003bc <kmonitor+0x7c>
ffffffffc0200420:	00144583          	lbu	a1,1(s0)
ffffffffc0200424:	0405                	addi	s0,s0,1
ffffffffc0200426:	d9d9                	beqz	a1,ffffffffc02003bc <kmonitor+0x7c>
ffffffffc0200428:	8526                	mv	a0,s1
ffffffffc020042a:	6a1050ef          	jal	ffffffffc02062ca <strchr>
ffffffffc020042e:	d96d                	beqz	a0,ffffffffc0200420 <kmonitor+0xe0>
ffffffffc0200430:	00044583          	lbu	a1,0(s0)
ffffffffc0200434:	d5c1                	beqz	a1,ffffffffc02003bc <kmonitor+0x7c>
ffffffffc0200436:	bf4d                	j	ffffffffc02003e8 <kmonitor+0xa8>
ffffffffc0200438:	45c1                	li	a1,16
ffffffffc020043a:	8556                	mv	a0,s5
ffffffffc020043c:	d49ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0200440:	b7e1                	j	ffffffffc0200408 <kmonitor+0xc8>
ffffffffc0200442:	00141793          	slli	a5,s0,0x1
ffffffffc0200446:	97a2                	add	a5,a5,s0
ffffffffc0200448:	078e                	slli	a5,a5,0x3
ffffffffc020044a:	97e2                	add	a5,a5,s8
ffffffffc020044c:	6b9c                	ld	a5,16(a5)
ffffffffc020044e:	865a                	mv	a2,s6
ffffffffc0200450:	002c                	addi	a1,sp,8
ffffffffc0200452:	fffc851b          	addiw	a0,s9,-1
ffffffffc0200456:	9782                	jalr	a5
ffffffffc0200458:	f40559e3          	bgez	a0,ffffffffc02003aa <kmonitor+0x6a>
ffffffffc020045c:	60ee                	ld	ra,216(sp)
ffffffffc020045e:	644e                	ld	s0,208(sp)
ffffffffc0200460:	64ae                	ld	s1,200(sp)
ffffffffc0200462:	690e                	ld	s2,192(sp)
ffffffffc0200464:	79ea                	ld	s3,184(sp)
ffffffffc0200466:	7a4a                	ld	s4,176(sp)
ffffffffc0200468:	7aaa                	ld	s5,168(sp)
ffffffffc020046a:	7b0a                	ld	s6,160(sp)
ffffffffc020046c:	6bea                	ld	s7,152(sp)
ffffffffc020046e:	6c4a                	ld	s8,144(sp)
ffffffffc0200470:	6caa                	ld	s9,136(sp)
ffffffffc0200472:	6d0a                	ld	s10,128(sp)
ffffffffc0200474:	612d                	addi	sp,sp,224
ffffffffc0200476:	8082                	ret

ffffffffc0200478 <__panic>:
ffffffffc0200478:	0003d317          	auipc	t1,0x3d
ffffffffc020047c:	18830313          	addi	t1,t1,392 # ffffffffc023d600 <is_panic>
ffffffffc0200480:	00033e03          	ld	t3,0(t1)
ffffffffc0200484:	715d                	addi	sp,sp,-80
ffffffffc0200486:	ec06                	sd	ra,24(sp)
ffffffffc0200488:	f436                	sd	a3,40(sp)
ffffffffc020048a:	f83a                	sd	a4,48(sp)
ffffffffc020048c:	fc3e                	sd	a5,56(sp)
ffffffffc020048e:	e0c2                	sd	a6,64(sp)
ffffffffc0200490:	e4c6                	sd	a7,72(sp)
ffffffffc0200492:	020e1c63          	bnez	t3,ffffffffc02004ca <__panic+0x52>
ffffffffc0200496:	4785                	li	a5,1
ffffffffc0200498:	00f33023          	sd	a5,0(t1)
ffffffffc020049c:	e822                	sd	s0,16(sp)
ffffffffc020049e:	103c                	addi	a5,sp,40
ffffffffc02004a0:	8432                	mv	s0,a2
ffffffffc02004a2:	862e                	mv	a2,a1
ffffffffc02004a4:	85aa                	mv	a1,a0
ffffffffc02004a6:	00006517          	auipc	a0,0x6
ffffffffc02004aa:	0d250513          	addi	a0,a0,210 # ffffffffc0206578 <etext+0x26e>
ffffffffc02004ae:	e43e                	sd	a5,8(sp)
ffffffffc02004b0:	cd5ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02004b4:	65a2                	ld	a1,8(sp)
ffffffffc02004b6:	8522                	mv	a0,s0
ffffffffc02004b8:	cadff0ef          	jal	ffffffffc0200164 <vcprintf>
ffffffffc02004bc:	00006517          	auipc	a0,0x6
ffffffffc02004c0:	0dc50513          	addi	a0,a0,220 # ffffffffc0206598 <etext+0x28e>
ffffffffc02004c4:	cc1ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02004c8:	6442                	ld	s0,16(sp)
ffffffffc02004ca:	4501                	li	a0,0
ffffffffc02004cc:	4581                	li	a1,0
ffffffffc02004ce:	4601                	li	a2,0
ffffffffc02004d0:	48a1                	li	a7,8
ffffffffc02004d2:	00000073          	ecall
ffffffffc02004d6:	164000ef          	jal	ffffffffc020063a <intr_disable>
ffffffffc02004da:	4501                	li	a0,0
ffffffffc02004dc:	e65ff0ef          	jal	ffffffffc0200340 <kmonitor>
ffffffffc02004e0:	bfed                	j	ffffffffc02004da <__panic+0x62>

ffffffffc02004e2 <__warn>:
ffffffffc02004e2:	715d                	addi	sp,sp,-80
ffffffffc02004e4:	e822                	sd	s0,16(sp)
ffffffffc02004e6:	fc3e                	sd	a5,56(sp)
ffffffffc02004e8:	8432                	mv	s0,a2
ffffffffc02004ea:	103c                	addi	a5,sp,40
ffffffffc02004ec:	862e                	mv	a2,a1
ffffffffc02004ee:	85aa                	mv	a1,a0
ffffffffc02004f0:	00006517          	auipc	a0,0x6
ffffffffc02004f4:	0b050513          	addi	a0,a0,176 # ffffffffc02065a0 <etext+0x296>
ffffffffc02004f8:	ec06                	sd	ra,24(sp)
ffffffffc02004fa:	f436                	sd	a3,40(sp)
ffffffffc02004fc:	f83a                	sd	a4,48(sp)
ffffffffc02004fe:	e0c2                	sd	a6,64(sp)
ffffffffc0200500:	e4c6                	sd	a7,72(sp)
ffffffffc0200502:	e43e                	sd	a5,8(sp)
ffffffffc0200504:	c81ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0200508:	65a2                	ld	a1,8(sp)
ffffffffc020050a:	8522                	mv	a0,s0
ffffffffc020050c:	c59ff0ef          	jal	ffffffffc0200164 <vcprintf>
ffffffffc0200510:	00006517          	auipc	a0,0x6
ffffffffc0200514:	08850513          	addi	a0,a0,136 # ffffffffc0206598 <etext+0x28e>
ffffffffc0200518:	c6dff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc020051c:	60e2                	ld	ra,24(sp)
ffffffffc020051e:	6442                	ld	s0,16(sp)
ffffffffc0200520:	6161                	addi	sp,sp,80
ffffffffc0200522:	8082                	ret

ffffffffc0200524 <clock_init>:
ffffffffc0200524:	02000793          	li	a5,32
ffffffffc0200528:	1047a7f3          	csrrs	a5,sie,a5
ffffffffc020052c:	c0102573          	rdtime	a0
ffffffffc0200530:	67e1                	lui	a5,0x18
ffffffffc0200532:	6a078793          	addi	a5,a5,1696 # 186a0 <_binary_obj___user_matrix_out_size+0x15a40>
ffffffffc0200536:	953e                	add	a0,a0,a5
ffffffffc0200538:	4581                	li	a1,0
ffffffffc020053a:	4601                	li	a2,0
ffffffffc020053c:	4881                	li	a7,0
ffffffffc020053e:	00000073          	ecall
ffffffffc0200542:	00006517          	auipc	a0,0x6
ffffffffc0200546:	07e50513          	addi	a0,a0,126 # ffffffffc02065c0 <etext+0x2b6>
ffffffffc020054a:	0003d797          	auipc	a5,0x3d
ffffffffc020054e:	0a07bf23          	sd	zero,190(a5) # ffffffffc023d608 <ticks>
ffffffffc0200552:	b90d                	j	ffffffffc0200184 <cprintf>

ffffffffc0200554 <clock_set_next_event>:
ffffffffc0200554:	c0102573          	rdtime	a0
ffffffffc0200558:	67e1                	lui	a5,0x18
ffffffffc020055a:	6a078793          	addi	a5,a5,1696 # 186a0 <_binary_obj___user_matrix_out_size+0x15a40>
ffffffffc020055e:	953e                	add	a0,a0,a5
ffffffffc0200560:	4581                	li	a1,0
ffffffffc0200562:	4601                	li	a2,0
ffffffffc0200564:	4881                	li	a7,0
ffffffffc0200566:	00000073          	ecall
ffffffffc020056a:	8082                	ret

ffffffffc020056c <cons_init>:
ffffffffc020056c:	8082                	ret

ffffffffc020056e <cons_putc>:
ffffffffc020056e:	100027f3          	csrr	a5,sstatus
ffffffffc0200572:	8b89                	andi	a5,a5,2
ffffffffc0200574:	0ff57513          	zext.b	a0,a0
ffffffffc0200578:	e799                	bnez	a5,ffffffffc0200586 <cons_putc+0x18>
ffffffffc020057a:	4581                	li	a1,0
ffffffffc020057c:	4601                	li	a2,0
ffffffffc020057e:	4885                	li	a7,1
ffffffffc0200580:	00000073          	ecall
ffffffffc0200584:	8082                	ret
ffffffffc0200586:	1101                	addi	sp,sp,-32
ffffffffc0200588:	ec06                	sd	ra,24(sp)
ffffffffc020058a:	e42a                	sd	a0,8(sp)
ffffffffc020058c:	0ae000ef          	jal	ffffffffc020063a <intr_disable>
ffffffffc0200590:	6522                	ld	a0,8(sp)
ffffffffc0200592:	4581                	li	a1,0
ffffffffc0200594:	4601                	li	a2,0
ffffffffc0200596:	4885                	li	a7,1
ffffffffc0200598:	00000073          	ecall
ffffffffc020059c:	60e2                	ld	ra,24(sp)
ffffffffc020059e:	6105                	addi	sp,sp,32
ffffffffc02005a0:	a851                	j	ffffffffc0200634 <intr_enable>

ffffffffc02005a2 <cons_getc>:
ffffffffc02005a2:	100027f3          	csrr	a5,sstatus
ffffffffc02005a6:	8b89                	andi	a5,a5,2
ffffffffc02005a8:	eb89                	bnez	a5,ffffffffc02005ba <cons_getc+0x18>
ffffffffc02005aa:	4501                	li	a0,0
ffffffffc02005ac:	4581                	li	a1,0
ffffffffc02005ae:	4601                	li	a2,0
ffffffffc02005b0:	4889                	li	a7,2
ffffffffc02005b2:	00000073          	ecall
ffffffffc02005b6:	2501                	sext.w	a0,a0
ffffffffc02005b8:	8082                	ret
ffffffffc02005ba:	1101                	addi	sp,sp,-32
ffffffffc02005bc:	ec06                	sd	ra,24(sp)
ffffffffc02005be:	07c000ef          	jal	ffffffffc020063a <intr_disable>
ffffffffc02005c2:	4501                	li	a0,0
ffffffffc02005c4:	4581                	li	a1,0
ffffffffc02005c6:	4601                	li	a2,0
ffffffffc02005c8:	4889                	li	a7,2
ffffffffc02005ca:	00000073          	ecall
ffffffffc02005ce:	2501                	sext.w	a0,a0
ffffffffc02005d0:	e42a                	sd	a0,8(sp)
ffffffffc02005d2:	062000ef          	jal	ffffffffc0200634 <intr_enable>
ffffffffc02005d6:	60e2                	ld	ra,24(sp)
ffffffffc02005d8:	6522                	ld	a0,8(sp)
ffffffffc02005da:	6105                	addi	sp,sp,32
ffffffffc02005dc:	8082                	ret

ffffffffc02005de <ide_init>:
ffffffffc02005de:	8082                	ret

ffffffffc02005e0 <ide_device_valid>:
ffffffffc02005e0:	00253513          	sltiu	a0,a0,2
ffffffffc02005e4:	8082                	ret

ffffffffc02005e6 <ide_device_size>:
ffffffffc02005e6:	03800513          	li	a0,56
ffffffffc02005ea:	8082                	ret

ffffffffc02005ec <ide_read_secs>:
ffffffffc02005ec:	00032797          	auipc	a5,0x32
ffffffffc02005f0:	f1c78793          	addi	a5,a5,-228 # ffffffffc0232508 <ide>
ffffffffc02005f4:	0095959b          	slliw	a1,a1,0x9
ffffffffc02005f8:	1141                	addi	sp,sp,-16
ffffffffc02005fa:	8532                	mv	a0,a2
ffffffffc02005fc:	95be                	add	a1,a1,a5
ffffffffc02005fe:	00969613          	slli	a2,a3,0x9
ffffffffc0200602:	e406                	sd	ra,8(sp)
ffffffffc0200604:	4ef050ef          	jal	ffffffffc02062f2 <memcpy>
ffffffffc0200608:	60a2                	ld	ra,8(sp)
ffffffffc020060a:	4501                	li	a0,0
ffffffffc020060c:	0141                	addi	sp,sp,16
ffffffffc020060e:	8082                	ret

ffffffffc0200610 <ide_write_secs>:
ffffffffc0200610:	0095979b          	slliw	a5,a1,0x9
ffffffffc0200614:	00032517          	auipc	a0,0x32
ffffffffc0200618:	ef450513          	addi	a0,a0,-268 # ffffffffc0232508 <ide>
ffffffffc020061c:	1141                	addi	sp,sp,-16
ffffffffc020061e:	85b2                	mv	a1,a2
ffffffffc0200620:	953e                	add	a0,a0,a5
ffffffffc0200622:	00969613          	slli	a2,a3,0x9
ffffffffc0200626:	e406                	sd	ra,8(sp)
ffffffffc0200628:	4cb050ef          	jal	ffffffffc02062f2 <memcpy>
ffffffffc020062c:	60a2                	ld	ra,8(sp)
ffffffffc020062e:	4501                	li	a0,0
ffffffffc0200630:	0141                	addi	sp,sp,16
ffffffffc0200632:	8082                	ret

ffffffffc0200634 <intr_enable>:
ffffffffc0200634:	100167f3          	csrrsi	a5,sstatus,2
ffffffffc0200638:	8082                	ret

ffffffffc020063a <intr_disable>:
ffffffffc020063a:	100177f3          	csrrci	a5,sstatus,2
ffffffffc020063e:	8082                	ret

ffffffffc0200640 <pic_init>:
ffffffffc0200640:	8082                	ret

ffffffffc0200642 <idt_init>:
ffffffffc0200642:	14005073          	csrwi	sscratch,0
ffffffffc0200646:	00000797          	auipc	a5,0x0
ffffffffc020064a:	61678793          	addi	a5,a5,1558 # ffffffffc0200c5c <__alltraps>
ffffffffc020064e:	10579073          	csrw	stvec,a5
ffffffffc0200652:	000407b7          	lui	a5,0x40
ffffffffc0200656:	1007a7f3          	csrrs	a5,sstatus,a5
ffffffffc020065a:	8082                	ret

ffffffffc020065c <print_regs>:
ffffffffc020065c:	610c                	ld	a1,0(a0)
ffffffffc020065e:	1141                	addi	sp,sp,-16
ffffffffc0200660:	e022                	sd	s0,0(sp)
ffffffffc0200662:	842a                	mv	s0,a0
ffffffffc0200664:	00006517          	auipc	a0,0x6
ffffffffc0200668:	f7c50513          	addi	a0,a0,-132 # ffffffffc02065e0 <etext+0x2d6>
ffffffffc020066c:	e406                	sd	ra,8(sp)
ffffffffc020066e:	b17ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0200672:	640c                	ld	a1,8(s0)
ffffffffc0200674:	00006517          	auipc	a0,0x6
ffffffffc0200678:	f8450513          	addi	a0,a0,-124 # ffffffffc02065f8 <etext+0x2ee>
ffffffffc020067c:	b09ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0200680:	680c                	ld	a1,16(s0)
ffffffffc0200682:	00006517          	auipc	a0,0x6
ffffffffc0200686:	f8e50513          	addi	a0,a0,-114 # ffffffffc0206610 <etext+0x306>
ffffffffc020068a:	afbff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc020068e:	6c0c                	ld	a1,24(s0)
ffffffffc0200690:	00006517          	auipc	a0,0x6
ffffffffc0200694:	f9850513          	addi	a0,a0,-104 # ffffffffc0206628 <etext+0x31e>
ffffffffc0200698:	aedff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc020069c:	700c                	ld	a1,32(s0)
ffffffffc020069e:	00006517          	auipc	a0,0x6
ffffffffc02006a2:	fa250513          	addi	a0,a0,-94 # ffffffffc0206640 <etext+0x336>
ffffffffc02006a6:	adfff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02006aa:	740c                	ld	a1,40(s0)
ffffffffc02006ac:	00006517          	auipc	a0,0x6
ffffffffc02006b0:	fac50513          	addi	a0,a0,-84 # ffffffffc0206658 <etext+0x34e>
ffffffffc02006b4:	ad1ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02006b8:	780c                	ld	a1,48(s0)
ffffffffc02006ba:	00006517          	auipc	a0,0x6
ffffffffc02006be:	fb650513          	addi	a0,a0,-74 # ffffffffc0206670 <etext+0x366>
ffffffffc02006c2:	ac3ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02006c6:	7c0c                	ld	a1,56(s0)
ffffffffc02006c8:	00006517          	auipc	a0,0x6
ffffffffc02006cc:	fc050513          	addi	a0,a0,-64 # ffffffffc0206688 <etext+0x37e>
ffffffffc02006d0:	ab5ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02006d4:	602c                	ld	a1,64(s0)
ffffffffc02006d6:	00006517          	auipc	a0,0x6
ffffffffc02006da:	fca50513          	addi	a0,a0,-54 # ffffffffc02066a0 <etext+0x396>
ffffffffc02006de:	aa7ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02006e2:	642c                	ld	a1,72(s0)
ffffffffc02006e4:	00006517          	auipc	a0,0x6
ffffffffc02006e8:	fd450513          	addi	a0,a0,-44 # ffffffffc02066b8 <etext+0x3ae>
ffffffffc02006ec:	a99ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02006f0:	682c                	ld	a1,80(s0)
ffffffffc02006f2:	00006517          	auipc	a0,0x6
ffffffffc02006f6:	fde50513          	addi	a0,a0,-34 # ffffffffc02066d0 <etext+0x3c6>
ffffffffc02006fa:	a8bff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02006fe:	6c2c                	ld	a1,88(s0)
ffffffffc0200700:	00006517          	auipc	a0,0x6
ffffffffc0200704:	fe850513          	addi	a0,a0,-24 # ffffffffc02066e8 <etext+0x3de>
ffffffffc0200708:	a7dff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc020070c:	702c                	ld	a1,96(s0)
ffffffffc020070e:	00006517          	auipc	a0,0x6
ffffffffc0200712:	ff250513          	addi	a0,a0,-14 # ffffffffc0206700 <etext+0x3f6>
ffffffffc0200716:	a6fff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc020071a:	742c                	ld	a1,104(s0)
ffffffffc020071c:	00006517          	auipc	a0,0x6
ffffffffc0200720:	ffc50513          	addi	a0,a0,-4 # ffffffffc0206718 <etext+0x40e>
ffffffffc0200724:	a61ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0200728:	782c                	ld	a1,112(s0)
ffffffffc020072a:	00006517          	auipc	a0,0x6
ffffffffc020072e:	00650513          	addi	a0,a0,6 # ffffffffc0206730 <etext+0x426>
ffffffffc0200732:	a53ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0200736:	7c2c                	ld	a1,120(s0)
ffffffffc0200738:	00006517          	auipc	a0,0x6
ffffffffc020073c:	01050513          	addi	a0,a0,16 # ffffffffc0206748 <etext+0x43e>
ffffffffc0200740:	a45ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0200744:	604c                	ld	a1,128(s0)
ffffffffc0200746:	00006517          	auipc	a0,0x6
ffffffffc020074a:	01a50513          	addi	a0,a0,26 # ffffffffc0206760 <etext+0x456>
ffffffffc020074e:	a37ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0200752:	644c                	ld	a1,136(s0)
ffffffffc0200754:	00006517          	auipc	a0,0x6
ffffffffc0200758:	02450513          	addi	a0,a0,36 # ffffffffc0206778 <etext+0x46e>
ffffffffc020075c:	a29ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0200760:	684c                	ld	a1,144(s0)
ffffffffc0200762:	00006517          	auipc	a0,0x6
ffffffffc0200766:	02e50513          	addi	a0,a0,46 # ffffffffc0206790 <etext+0x486>
ffffffffc020076a:	a1bff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc020076e:	6c4c                	ld	a1,152(s0)
ffffffffc0200770:	00006517          	auipc	a0,0x6
ffffffffc0200774:	03850513          	addi	a0,a0,56 # ffffffffc02067a8 <etext+0x49e>
ffffffffc0200778:	a0dff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc020077c:	704c                	ld	a1,160(s0)
ffffffffc020077e:	00006517          	auipc	a0,0x6
ffffffffc0200782:	04250513          	addi	a0,a0,66 # ffffffffc02067c0 <etext+0x4b6>
ffffffffc0200786:	9ffff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc020078a:	744c                	ld	a1,168(s0)
ffffffffc020078c:	00006517          	auipc	a0,0x6
ffffffffc0200790:	04c50513          	addi	a0,a0,76 # ffffffffc02067d8 <etext+0x4ce>
ffffffffc0200794:	9f1ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0200798:	784c                	ld	a1,176(s0)
ffffffffc020079a:	00006517          	auipc	a0,0x6
ffffffffc020079e:	05650513          	addi	a0,a0,86 # ffffffffc02067f0 <etext+0x4e6>
ffffffffc02007a2:	9e3ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02007a6:	7c4c                	ld	a1,184(s0)
ffffffffc02007a8:	00006517          	auipc	a0,0x6
ffffffffc02007ac:	06050513          	addi	a0,a0,96 # ffffffffc0206808 <etext+0x4fe>
ffffffffc02007b0:	9d5ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02007b4:	606c                	ld	a1,192(s0)
ffffffffc02007b6:	00006517          	auipc	a0,0x6
ffffffffc02007ba:	06a50513          	addi	a0,a0,106 # ffffffffc0206820 <etext+0x516>
ffffffffc02007be:	9c7ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02007c2:	646c                	ld	a1,200(s0)
ffffffffc02007c4:	00006517          	auipc	a0,0x6
ffffffffc02007c8:	07450513          	addi	a0,a0,116 # ffffffffc0206838 <etext+0x52e>
ffffffffc02007cc:	9b9ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02007d0:	686c                	ld	a1,208(s0)
ffffffffc02007d2:	00006517          	auipc	a0,0x6
ffffffffc02007d6:	07e50513          	addi	a0,a0,126 # ffffffffc0206850 <etext+0x546>
ffffffffc02007da:	9abff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02007de:	6c6c                	ld	a1,216(s0)
ffffffffc02007e0:	00006517          	auipc	a0,0x6
ffffffffc02007e4:	08850513          	addi	a0,a0,136 # ffffffffc0206868 <etext+0x55e>
ffffffffc02007e8:	99dff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02007ec:	706c                	ld	a1,224(s0)
ffffffffc02007ee:	00006517          	auipc	a0,0x6
ffffffffc02007f2:	09250513          	addi	a0,a0,146 # ffffffffc0206880 <etext+0x576>
ffffffffc02007f6:	98fff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02007fa:	746c                	ld	a1,232(s0)
ffffffffc02007fc:	00006517          	auipc	a0,0x6
ffffffffc0200800:	09c50513          	addi	a0,a0,156 # ffffffffc0206898 <etext+0x58e>
ffffffffc0200804:	981ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0200808:	786c                	ld	a1,240(s0)
ffffffffc020080a:	00006517          	auipc	a0,0x6
ffffffffc020080e:	0a650513          	addi	a0,a0,166 # ffffffffc02068b0 <etext+0x5a6>
ffffffffc0200812:	973ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0200816:	7c6c                	ld	a1,248(s0)
ffffffffc0200818:	6402                	ld	s0,0(sp)
ffffffffc020081a:	60a2                	ld	ra,8(sp)
ffffffffc020081c:	00006517          	auipc	a0,0x6
ffffffffc0200820:	0ac50513          	addi	a0,a0,172 # ffffffffc02068c8 <etext+0x5be>
ffffffffc0200824:	0141                	addi	sp,sp,16
ffffffffc0200826:	95fff06f          	j	ffffffffc0200184 <cprintf>

ffffffffc020082a <print_trapframe>:
ffffffffc020082a:	1141                	addi	sp,sp,-16
ffffffffc020082c:	e022                	sd	s0,0(sp)
ffffffffc020082e:	85aa                	mv	a1,a0
ffffffffc0200830:	842a                	mv	s0,a0
ffffffffc0200832:	00006517          	auipc	a0,0x6
ffffffffc0200836:	0ae50513          	addi	a0,a0,174 # ffffffffc02068e0 <etext+0x5d6>
ffffffffc020083a:	e406                	sd	ra,8(sp)
ffffffffc020083c:	949ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0200840:	8522                	mv	a0,s0
ffffffffc0200842:	e1bff0ef          	jal	ffffffffc020065c <print_regs>
ffffffffc0200846:	10043583          	ld	a1,256(s0)
ffffffffc020084a:	00006517          	auipc	a0,0x6
ffffffffc020084e:	0ae50513          	addi	a0,a0,174 # ffffffffc02068f8 <etext+0x5ee>
ffffffffc0200852:	933ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0200856:	10843583          	ld	a1,264(s0)
ffffffffc020085a:	00006517          	auipc	a0,0x6
ffffffffc020085e:	0b650513          	addi	a0,a0,182 # ffffffffc0206910 <etext+0x606>
ffffffffc0200862:	923ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0200866:	11043583          	ld	a1,272(s0)
ffffffffc020086a:	00006517          	auipc	a0,0x6
ffffffffc020086e:	0be50513          	addi	a0,a0,190 # ffffffffc0206928 <etext+0x61e>
ffffffffc0200872:	913ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0200876:	11843583          	ld	a1,280(s0)
ffffffffc020087a:	6402                	ld	s0,0(sp)
ffffffffc020087c:	60a2                	ld	ra,8(sp)
ffffffffc020087e:	00006517          	auipc	a0,0x6
ffffffffc0200882:	0ba50513          	addi	a0,a0,186 # ffffffffc0206938 <etext+0x62e>
ffffffffc0200886:	0141                	addi	sp,sp,16
ffffffffc0200888:	8fdff06f          	j	ffffffffc0200184 <cprintf>

ffffffffc020088c <pgfault_handler>:
ffffffffc020088c:	1101                	addi	sp,sp,-32
ffffffffc020088e:	e426                	sd	s1,8(sp)
ffffffffc0200890:	0003d497          	auipc	s1,0x3d
ffffffffc0200894:	dd848493          	addi	s1,s1,-552 # ffffffffc023d668 <check_mm_struct>
ffffffffc0200898:	609c                	ld	a5,0(s1)
ffffffffc020089a:	e822                	sd	s0,16(sp)
ffffffffc020089c:	ec06                	sd	ra,24(sp)
ffffffffc020089e:	842a                	mv	s0,a0
ffffffffc02008a0:	cfb9                	beqz	a5,ffffffffc02008fe <pgfault_handler+0x72>
ffffffffc02008a2:	10053783          	ld	a5,256(a0)
ffffffffc02008a6:	11053583          	ld	a1,272(a0)
ffffffffc02008aa:	05500613          	li	a2,85
ffffffffc02008ae:	1007f793          	andi	a5,a5,256
ffffffffc02008b2:	c399                	beqz	a5,ffffffffc02008b8 <pgfault_handler+0x2c>
ffffffffc02008b4:	04b00613          	li	a2,75
ffffffffc02008b8:	11843703          	ld	a4,280(s0)
ffffffffc02008bc:	47bd                	li	a5,15
ffffffffc02008be:	05200693          	li	a3,82
ffffffffc02008c2:	04f70e63          	beq	a4,a5,ffffffffc020091e <pgfault_handler+0x92>
ffffffffc02008c6:	00006517          	auipc	a0,0x6
ffffffffc02008ca:	08a50513          	addi	a0,a0,138 # ffffffffc0206950 <etext+0x646>
ffffffffc02008ce:	8b7ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02008d2:	6088                	ld	a0,0(s1)
ffffffffc02008d4:	c50d                	beqz	a0,ffffffffc02008fe <pgfault_handler+0x72>
ffffffffc02008d6:	0003d717          	auipc	a4,0x3d
ffffffffc02008da:	da273703          	ld	a4,-606(a4) # ffffffffc023d678 <current>
ffffffffc02008de:	0003d797          	auipc	a5,0x3d
ffffffffc02008e2:	daa7b783          	ld	a5,-598(a5) # ffffffffc023d688 <idleproc>
ffffffffc02008e6:	02f71f63          	bne	a4,a5,ffffffffc0200924 <pgfault_handler+0x98>
ffffffffc02008ea:	11043603          	ld	a2,272(s0)
ffffffffc02008ee:	11843583          	ld	a1,280(s0)
ffffffffc02008f2:	6442                	ld	s0,16(sp)
ffffffffc02008f4:	60e2                	ld	ra,24(sp)
ffffffffc02008f6:	64a2                	ld	s1,8(sp)
ffffffffc02008f8:	6105                	addi	sp,sp,32
ffffffffc02008fa:	3950306f          	j	ffffffffc020448e <do_pgfault>
ffffffffc02008fe:	0003d797          	auipc	a5,0x3d
ffffffffc0200902:	d7a7b783          	ld	a5,-646(a5) # ffffffffc023d678 <current>
ffffffffc0200906:	cf9d                	beqz	a5,ffffffffc0200944 <pgfault_handler+0xb8>
ffffffffc0200908:	11043603          	ld	a2,272(s0)
ffffffffc020090c:	11843583          	ld	a1,280(s0)
ffffffffc0200910:	6442                	ld	s0,16(sp)
ffffffffc0200912:	60e2                	ld	ra,24(sp)
ffffffffc0200914:	64a2                	ld	s1,8(sp)
ffffffffc0200916:	7788                	ld	a0,40(a5)
ffffffffc0200918:	6105                	addi	sp,sp,32
ffffffffc020091a:	3750306f          	j	ffffffffc020448e <do_pgfault>
ffffffffc020091e:	05700693          	li	a3,87
ffffffffc0200922:	b755                	j	ffffffffc02008c6 <pgfault_handler+0x3a>
ffffffffc0200924:	00006697          	auipc	a3,0x6
ffffffffc0200928:	04c68693          	addi	a3,a3,76 # ffffffffc0206970 <etext+0x666>
ffffffffc020092c:	00006617          	auipc	a2,0x6
ffffffffc0200930:	05c60613          	addi	a2,a2,92 # ffffffffc0206988 <etext+0x67e>
ffffffffc0200934:	06c00593          	li	a1,108
ffffffffc0200938:	00006517          	auipc	a0,0x6
ffffffffc020093c:	06850513          	addi	a0,a0,104 # ffffffffc02069a0 <etext+0x696>
ffffffffc0200940:	b39ff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0200944:	8522                	mv	a0,s0
ffffffffc0200946:	ee5ff0ef          	jal	ffffffffc020082a <print_trapframe>
ffffffffc020094a:	10043783          	ld	a5,256(s0)
ffffffffc020094e:	11043583          	ld	a1,272(s0)
ffffffffc0200952:	05500613          	li	a2,85
ffffffffc0200956:	1007f793          	andi	a5,a5,256
ffffffffc020095a:	c399                	beqz	a5,ffffffffc0200960 <pgfault_handler+0xd4>
ffffffffc020095c:	04b00613          	li	a2,75
ffffffffc0200960:	11843703          	ld	a4,280(s0)
ffffffffc0200964:	47bd                	li	a5,15
ffffffffc0200966:	05200693          	li	a3,82
ffffffffc020096a:	00f71463          	bne	a4,a5,ffffffffc0200972 <pgfault_handler+0xe6>
ffffffffc020096e:	05700693          	li	a3,87
ffffffffc0200972:	00006517          	auipc	a0,0x6
ffffffffc0200976:	fde50513          	addi	a0,a0,-34 # ffffffffc0206950 <etext+0x646>
ffffffffc020097a:	80bff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc020097e:	00006617          	auipc	a2,0x6
ffffffffc0200982:	03a60613          	addi	a2,a2,58 # ffffffffc02069b8 <etext+0x6ae>
ffffffffc0200986:	07300593          	li	a1,115
ffffffffc020098a:	00006517          	auipc	a0,0x6
ffffffffc020098e:	01650513          	addi	a0,a0,22 # ffffffffc02069a0 <etext+0x696>
ffffffffc0200992:	ae7ff0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc0200996 <interrupt_handler>:
ffffffffc0200996:	11853783          	ld	a5,280(a0)
ffffffffc020099a:	472d                	li	a4,11
ffffffffc020099c:	0786                	slli	a5,a5,0x1
ffffffffc020099e:	8385                	srli	a5,a5,0x1
ffffffffc02009a0:	06f76d63          	bltu	a4,a5,ffffffffc0200a1a <interrupt_handler+0x84>
ffffffffc02009a4:	00008717          	auipc	a4,0x8
ffffffffc02009a8:	cc470713          	addi	a4,a4,-828 # ffffffffc0208668 <commands+0x48>
ffffffffc02009ac:	078a                	slli	a5,a5,0x2
ffffffffc02009ae:	97ba                	add	a5,a5,a4
ffffffffc02009b0:	439c                	lw	a5,0(a5)
ffffffffc02009b2:	97ba                	add	a5,a5,a4
ffffffffc02009b4:	8782                	jr	a5
ffffffffc02009b6:	00006517          	auipc	a0,0x6
ffffffffc02009ba:	07a50513          	addi	a0,a0,122 # ffffffffc0206a30 <etext+0x726>
ffffffffc02009be:	fc6ff06f          	j	ffffffffc0200184 <cprintf>
ffffffffc02009c2:	00006517          	auipc	a0,0x6
ffffffffc02009c6:	04e50513          	addi	a0,a0,78 # ffffffffc0206a10 <etext+0x706>
ffffffffc02009ca:	fbaff06f          	j	ffffffffc0200184 <cprintf>
ffffffffc02009ce:	00006517          	auipc	a0,0x6
ffffffffc02009d2:	00250513          	addi	a0,a0,2 # ffffffffc02069d0 <etext+0x6c6>
ffffffffc02009d6:	faeff06f          	j	ffffffffc0200184 <cprintf>
ffffffffc02009da:	00006517          	auipc	a0,0x6
ffffffffc02009de:	01650513          	addi	a0,a0,22 # ffffffffc02069f0 <etext+0x6e6>
ffffffffc02009e2:	fa2ff06f          	j	ffffffffc0200184 <cprintf>
ffffffffc02009e6:	1141                	addi	sp,sp,-16
ffffffffc02009e8:	e406                	sd	ra,8(sp)
ffffffffc02009ea:	b6bff0ef          	jal	ffffffffc0200554 <clock_set_next_event>
ffffffffc02009ee:	0003d717          	auipc	a4,0x3d
ffffffffc02009f2:	c1a70713          	addi	a4,a4,-998 # ffffffffc023d608 <ticks>
ffffffffc02009f6:	631c                	ld	a5,0(a4)
ffffffffc02009f8:	0003d517          	auipc	a0,0x3d
ffffffffc02009fc:	c8053503          	ld	a0,-896(a0) # ffffffffc023d678 <current>
ffffffffc0200a00:	0785                	addi	a5,a5,1
ffffffffc0200a02:	e31c                	sd	a5,0(a4)
ffffffffc0200a04:	cd01                	beqz	a0,ffffffffc0200a1c <interrupt_handler+0x86>
ffffffffc0200a06:	60a2                	ld	ra,8(sp)
ffffffffc0200a08:	0141                	addi	sp,sp,16
ffffffffc0200a0a:	1020506f          	j	ffffffffc0205b0c <sched_class_proc_tick>
ffffffffc0200a0e:	00006517          	auipc	a0,0x6
ffffffffc0200a12:	04250513          	addi	a0,a0,66 # ffffffffc0206a50 <etext+0x746>
ffffffffc0200a16:	f6eff06f          	j	ffffffffc0200184 <cprintf>
ffffffffc0200a1a:	bd01                	j	ffffffffc020082a <print_trapframe>
ffffffffc0200a1c:	60a2                	ld	ra,8(sp)
ffffffffc0200a1e:	0141                	addi	sp,sp,16
ffffffffc0200a20:	8082                	ret

ffffffffc0200a22 <exception_handler>:
ffffffffc0200a22:	11853783          	ld	a5,280(a0)
ffffffffc0200a26:	1101                	addi	sp,sp,-32
ffffffffc0200a28:	e822                	sd	s0,16(sp)
ffffffffc0200a2a:	ec06                	sd	ra,24(sp)
ffffffffc0200a2c:	473d                	li	a4,15
ffffffffc0200a2e:	842a                	mv	s0,a0
ffffffffc0200a30:	16f76363          	bltu	a4,a5,ffffffffc0200b96 <exception_handler+0x174>
ffffffffc0200a34:	00008717          	auipc	a4,0x8
ffffffffc0200a38:	c6470713          	addi	a4,a4,-924 # ffffffffc0208698 <commands+0x78>
ffffffffc0200a3c:	078a                	slli	a5,a5,0x2
ffffffffc0200a3e:	97ba                	add	a5,a5,a4
ffffffffc0200a40:	439c                	lw	a5,0(a5)
ffffffffc0200a42:	97ba                	add	a5,a5,a4
ffffffffc0200a44:	8782                	jr	a5
ffffffffc0200a46:	00006517          	auipc	a0,0x6
ffffffffc0200a4a:	11a50513          	addi	a0,a0,282 # ffffffffc0206b60 <etext+0x856>
ffffffffc0200a4e:	f36ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0200a52:	10843783          	ld	a5,264(s0)
ffffffffc0200a56:	60e2                	ld	ra,24(sp)
ffffffffc0200a58:	0791                	addi	a5,a5,4
ffffffffc0200a5a:	10f43423          	sd	a5,264(s0)
ffffffffc0200a5e:	6442                	ld	s0,16(sp)
ffffffffc0200a60:	6105                	addi	sp,sp,32
ffffffffc0200a62:	3680506f          	j	ffffffffc0205dca <syscall>
ffffffffc0200a66:	00006517          	auipc	a0,0x6
ffffffffc0200a6a:	11a50513          	addi	a0,a0,282 # ffffffffc0206b80 <etext+0x876>
ffffffffc0200a6e:	6442                	ld	s0,16(sp)
ffffffffc0200a70:	60e2                	ld	ra,24(sp)
ffffffffc0200a72:	6105                	addi	sp,sp,32
ffffffffc0200a74:	f10ff06f          	j	ffffffffc0200184 <cprintf>
ffffffffc0200a78:	00006517          	auipc	a0,0x6
ffffffffc0200a7c:	12850513          	addi	a0,a0,296 # ffffffffc0206ba0 <etext+0x896>
ffffffffc0200a80:	b7fd                	j	ffffffffc0200a6e <exception_handler+0x4c>
ffffffffc0200a82:	00006517          	auipc	a0,0x6
ffffffffc0200a86:	13e50513          	addi	a0,a0,318 # ffffffffc0206bc0 <etext+0x8b6>
ffffffffc0200a8a:	b7d5                	j	ffffffffc0200a6e <exception_handler+0x4c>
ffffffffc0200a8c:	00006517          	auipc	a0,0x6
ffffffffc0200a90:	14c50513          	addi	a0,a0,332 # ffffffffc0206bd8 <etext+0x8ce>
ffffffffc0200a94:	e426                	sd	s1,8(sp)
ffffffffc0200a96:	eeeff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0200a9a:	8522                	mv	a0,s0
ffffffffc0200a9c:	df1ff0ef          	jal	ffffffffc020088c <pgfault_handler>
ffffffffc0200aa0:	84aa                	mv	s1,a0
ffffffffc0200aa2:	10051c63          	bnez	a0,ffffffffc0200bba <exception_handler+0x198>
ffffffffc0200aa6:	64a2                	ld	s1,8(sp)
ffffffffc0200aa8:	60e2                	ld	ra,24(sp)
ffffffffc0200aaa:	6442                	ld	s0,16(sp)
ffffffffc0200aac:	6105                	addi	sp,sp,32
ffffffffc0200aae:	8082                	ret
ffffffffc0200ab0:	00006517          	auipc	a0,0x6
ffffffffc0200ab4:	14050513          	addi	a0,a0,320 # ffffffffc0206bf0 <etext+0x8e6>
ffffffffc0200ab8:	e426                	sd	s1,8(sp)
ffffffffc0200aba:	ecaff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0200abe:	8522                	mv	a0,s0
ffffffffc0200ac0:	dcdff0ef          	jal	ffffffffc020088c <pgfault_handler>
ffffffffc0200ac4:	84aa                	mv	s1,a0
ffffffffc0200ac6:	d165                	beqz	a0,ffffffffc0200aa6 <exception_handler+0x84>
ffffffffc0200ac8:	8522                	mv	a0,s0
ffffffffc0200aca:	d61ff0ef          	jal	ffffffffc020082a <print_trapframe>
ffffffffc0200ace:	86a6                	mv	a3,s1
ffffffffc0200ad0:	00006617          	auipc	a2,0x6
ffffffffc0200ad4:	04060613          	addi	a2,a2,64 # ffffffffc0206b10 <etext+0x806>
ffffffffc0200ad8:	0fa00593          	li	a1,250
ffffffffc0200adc:	00006517          	auipc	a0,0x6
ffffffffc0200ae0:	ec450513          	addi	a0,a0,-316 # ffffffffc02069a0 <etext+0x696>
ffffffffc0200ae4:	995ff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0200ae8:	00006517          	auipc	a0,0x6
ffffffffc0200aec:	f8850513          	addi	a0,a0,-120 # ffffffffc0206a70 <etext+0x766>
ffffffffc0200af0:	bfbd                	j	ffffffffc0200a6e <exception_handler+0x4c>
ffffffffc0200af2:	00006517          	auipc	a0,0x6
ffffffffc0200af6:	f9e50513          	addi	a0,a0,-98 # ffffffffc0206a90 <etext+0x786>
ffffffffc0200afa:	bf95                	j	ffffffffc0200a6e <exception_handler+0x4c>
ffffffffc0200afc:	00006517          	auipc	a0,0x6
ffffffffc0200b00:	fb450513          	addi	a0,a0,-76 # ffffffffc0206ab0 <etext+0x7a6>
ffffffffc0200b04:	b7ad                	j	ffffffffc0200a6e <exception_handler+0x4c>
ffffffffc0200b06:	00006517          	auipc	a0,0x6
ffffffffc0200b0a:	fc250513          	addi	a0,a0,-62 # ffffffffc0206ac8 <etext+0x7be>
ffffffffc0200b0e:	e76ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0200b12:	6458                	ld	a4,136(s0)
ffffffffc0200b14:	47a9                	li	a5,10
ffffffffc0200b16:	f8f719e3          	bne	a4,a5,ffffffffc0200aa8 <exception_handler+0x86>
ffffffffc0200b1a:	bf25                	j	ffffffffc0200a52 <exception_handler+0x30>
ffffffffc0200b1c:	00006517          	auipc	a0,0x6
ffffffffc0200b20:	fbc50513          	addi	a0,a0,-68 # ffffffffc0206ad8 <etext+0x7ce>
ffffffffc0200b24:	b7a9                	j	ffffffffc0200a6e <exception_handler+0x4c>
ffffffffc0200b26:	00006517          	auipc	a0,0x6
ffffffffc0200b2a:	fd250513          	addi	a0,a0,-46 # ffffffffc0206af8 <etext+0x7ee>
ffffffffc0200b2e:	e426                	sd	s1,8(sp)
ffffffffc0200b30:	e54ff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0200b34:	8522                	mv	a0,s0
ffffffffc0200b36:	d57ff0ef          	jal	ffffffffc020088c <pgfault_handler>
ffffffffc0200b3a:	84aa                	mv	s1,a0
ffffffffc0200b3c:	d52d                	beqz	a0,ffffffffc0200aa6 <exception_handler+0x84>
ffffffffc0200b3e:	8522                	mv	a0,s0
ffffffffc0200b40:	cebff0ef          	jal	ffffffffc020082a <print_trapframe>
ffffffffc0200b44:	86a6                	mv	a3,s1
ffffffffc0200b46:	00006617          	auipc	a2,0x6
ffffffffc0200b4a:	fca60613          	addi	a2,a2,-54 # ffffffffc0206b10 <etext+0x806>
ffffffffc0200b4e:	0cf00593          	li	a1,207
ffffffffc0200b52:	00006517          	auipc	a0,0x6
ffffffffc0200b56:	e4e50513          	addi	a0,a0,-434 # ffffffffc02069a0 <etext+0x696>
ffffffffc0200b5a:	91fff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0200b5e:	00006517          	auipc	a0,0x6
ffffffffc0200b62:	fea50513          	addi	a0,a0,-22 # ffffffffc0206b48 <etext+0x83e>
ffffffffc0200b66:	e426                	sd	s1,8(sp)
ffffffffc0200b68:	e1cff0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0200b6c:	8522                	mv	a0,s0
ffffffffc0200b6e:	d1fff0ef          	jal	ffffffffc020088c <pgfault_handler>
ffffffffc0200b72:	84aa                	mv	s1,a0
ffffffffc0200b74:	d90d                	beqz	a0,ffffffffc0200aa6 <exception_handler+0x84>
ffffffffc0200b76:	8522                	mv	a0,s0
ffffffffc0200b78:	cb3ff0ef          	jal	ffffffffc020082a <print_trapframe>
ffffffffc0200b7c:	86a6                	mv	a3,s1
ffffffffc0200b7e:	00006617          	auipc	a2,0x6
ffffffffc0200b82:	f9260613          	addi	a2,a2,-110 # ffffffffc0206b10 <etext+0x806>
ffffffffc0200b86:	0d900593          	li	a1,217
ffffffffc0200b8a:	00006517          	auipc	a0,0x6
ffffffffc0200b8e:	e1650513          	addi	a0,a0,-490 # ffffffffc02069a0 <etext+0x696>
ffffffffc0200b92:	8e7ff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0200b96:	8522                	mv	a0,s0
ffffffffc0200b98:	6442                	ld	s0,16(sp)
ffffffffc0200b9a:	60e2                	ld	ra,24(sp)
ffffffffc0200b9c:	6105                	addi	sp,sp,32
ffffffffc0200b9e:	b171                	j	ffffffffc020082a <print_trapframe>
ffffffffc0200ba0:	00006617          	auipc	a2,0x6
ffffffffc0200ba4:	f9060613          	addi	a2,a2,-112 # ffffffffc0206b30 <etext+0x826>
ffffffffc0200ba8:	0d300593          	li	a1,211
ffffffffc0200bac:	00006517          	auipc	a0,0x6
ffffffffc0200bb0:	df450513          	addi	a0,a0,-524 # ffffffffc02069a0 <etext+0x696>
ffffffffc0200bb4:	e426                	sd	s1,8(sp)
ffffffffc0200bb6:	8c3ff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0200bba:	8522                	mv	a0,s0
ffffffffc0200bbc:	c6fff0ef          	jal	ffffffffc020082a <print_trapframe>
ffffffffc0200bc0:	86a6                	mv	a3,s1
ffffffffc0200bc2:	00006617          	auipc	a2,0x6
ffffffffc0200bc6:	f4e60613          	addi	a2,a2,-178 # ffffffffc0206b10 <etext+0x806>
ffffffffc0200bca:	0f300593          	li	a1,243
ffffffffc0200bce:	00006517          	auipc	a0,0x6
ffffffffc0200bd2:	dd250513          	addi	a0,a0,-558 # ffffffffc02069a0 <etext+0x696>
ffffffffc0200bd6:	8a3ff0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc0200bda <trap>:
ffffffffc0200bda:	1101                	addi	sp,sp,-32
ffffffffc0200bdc:	e822                	sd	s0,16(sp)
ffffffffc0200bde:	0003d417          	auipc	s0,0x3d
ffffffffc0200be2:	a9a40413          	addi	s0,s0,-1382 # ffffffffc023d678 <current>
ffffffffc0200be6:	6018                	ld	a4,0(s0)
ffffffffc0200be8:	ec06                	sd	ra,24(sp)
ffffffffc0200bea:	11853683          	ld	a3,280(a0)
ffffffffc0200bee:	c329                	beqz	a4,ffffffffc0200c30 <trap+0x56>
ffffffffc0200bf0:	e426                	sd	s1,8(sp)
ffffffffc0200bf2:	10053483          	ld	s1,256(a0)
ffffffffc0200bf6:	e04a                	sd	s2,0(sp)
ffffffffc0200bf8:	0a073903          	ld	s2,160(a4)
ffffffffc0200bfc:	f348                	sd	a0,160(a4)
ffffffffc0200bfe:	1004f493          	andi	s1,s1,256
ffffffffc0200c02:	0206c463          	bltz	a3,ffffffffc0200c2a <trap+0x50>
ffffffffc0200c06:	e1dff0ef          	jal	ffffffffc0200a22 <exception_handler>
ffffffffc0200c0a:	601c                	ld	a5,0(s0)
ffffffffc0200c0c:	0b27b023          	sd	s2,160(a5)
ffffffffc0200c10:	e499                	bnez	s1,ffffffffc0200c1e <trap+0x44>
ffffffffc0200c12:	0b07a703          	lw	a4,176(a5)
ffffffffc0200c16:	8b05                	andi	a4,a4,1
ffffffffc0200c18:	ef0d                	bnez	a4,ffffffffc0200c52 <trap+0x78>
ffffffffc0200c1a:	6f9c                	ld	a5,24(a5)
ffffffffc0200c1c:	e785                	bnez	a5,ffffffffc0200c44 <trap+0x6a>
ffffffffc0200c1e:	60e2                	ld	ra,24(sp)
ffffffffc0200c20:	6442                	ld	s0,16(sp)
ffffffffc0200c22:	64a2                	ld	s1,8(sp)
ffffffffc0200c24:	6902                	ld	s2,0(sp)
ffffffffc0200c26:	6105                	addi	sp,sp,32
ffffffffc0200c28:	8082                	ret
ffffffffc0200c2a:	d6dff0ef          	jal	ffffffffc0200996 <interrupt_handler>
ffffffffc0200c2e:	bff1                	j	ffffffffc0200c0a <trap+0x30>
ffffffffc0200c30:	0006c663          	bltz	a3,ffffffffc0200c3c <trap+0x62>
ffffffffc0200c34:	6442                	ld	s0,16(sp)
ffffffffc0200c36:	60e2                	ld	ra,24(sp)
ffffffffc0200c38:	6105                	addi	sp,sp,32
ffffffffc0200c3a:	b3e5                	j	ffffffffc0200a22 <exception_handler>
ffffffffc0200c3c:	6442                	ld	s0,16(sp)
ffffffffc0200c3e:	60e2                	ld	ra,24(sp)
ffffffffc0200c40:	6105                	addi	sp,sp,32
ffffffffc0200c42:	bb91                	j	ffffffffc0200996 <interrupt_handler>
ffffffffc0200c44:	6442                	ld	s0,16(sp)
ffffffffc0200c46:	64a2                	ld	s1,8(sp)
ffffffffc0200c48:	6902                	ld	s2,0(sp)
ffffffffc0200c4a:	60e2                	ld	ra,24(sp)
ffffffffc0200c4c:	6105                	addi	sp,sp,32
ffffffffc0200c4e:	03e0506f          	j	ffffffffc0205c8c <schedule>
ffffffffc0200c52:	555d                	li	a0,-9
ffffffffc0200c54:	1b2040ef          	jal	ffffffffc0204e06 <do_exit>
ffffffffc0200c58:	601c                	ld	a5,0(s0)
ffffffffc0200c5a:	b7c1                	j	ffffffffc0200c1a <trap+0x40>

ffffffffc0200c5c <__alltraps>:
ffffffffc0200c5c:	14011173          	csrrw	sp,sscratch,sp
ffffffffc0200c60:	00011463          	bnez	sp,ffffffffc0200c68 <__alltraps+0xc>
ffffffffc0200c64:	14002173          	csrr	sp,sscratch
ffffffffc0200c68:	712d                	addi	sp,sp,-288
ffffffffc0200c6a:	e002                	sd	zero,0(sp)
ffffffffc0200c6c:	e406                	sd	ra,8(sp)
ffffffffc0200c6e:	ec0e                	sd	gp,24(sp)
ffffffffc0200c70:	f012                	sd	tp,32(sp)
ffffffffc0200c72:	f416                	sd	t0,40(sp)
ffffffffc0200c74:	f81a                	sd	t1,48(sp)
ffffffffc0200c76:	fc1e                	sd	t2,56(sp)
ffffffffc0200c78:	e0a2                	sd	s0,64(sp)
ffffffffc0200c7a:	e4a6                	sd	s1,72(sp)
ffffffffc0200c7c:	e8aa                	sd	a0,80(sp)
ffffffffc0200c7e:	ecae                	sd	a1,88(sp)
ffffffffc0200c80:	f0b2                	sd	a2,96(sp)
ffffffffc0200c82:	f4b6                	sd	a3,104(sp)
ffffffffc0200c84:	f8ba                	sd	a4,112(sp)
ffffffffc0200c86:	fcbe                	sd	a5,120(sp)
ffffffffc0200c88:	e142                	sd	a6,128(sp)
ffffffffc0200c8a:	e546                	sd	a7,136(sp)
ffffffffc0200c8c:	e94a                	sd	s2,144(sp)
ffffffffc0200c8e:	ed4e                	sd	s3,152(sp)
ffffffffc0200c90:	f152                	sd	s4,160(sp)
ffffffffc0200c92:	f556                	sd	s5,168(sp)
ffffffffc0200c94:	f95a                	sd	s6,176(sp)
ffffffffc0200c96:	fd5e                	sd	s7,184(sp)
ffffffffc0200c98:	e1e2                	sd	s8,192(sp)
ffffffffc0200c9a:	e5e6                	sd	s9,200(sp)
ffffffffc0200c9c:	e9ea                	sd	s10,208(sp)
ffffffffc0200c9e:	edee                	sd	s11,216(sp)
ffffffffc0200ca0:	f1f2                	sd	t3,224(sp)
ffffffffc0200ca2:	f5f6                	sd	t4,232(sp)
ffffffffc0200ca4:	f9fa                	sd	t5,240(sp)
ffffffffc0200ca6:	fdfe                	sd	t6,248(sp)
ffffffffc0200ca8:	14001473          	csrrw	s0,sscratch,zero
ffffffffc0200cac:	100024f3          	csrr	s1,sstatus
ffffffffc0200cb0:	14102973          	csrr	s2,sepc
ffffffffc0200cb4:	143029f3          	csrr	s3,stval
ffffffffc0200cb8:	14202a73          	csrr	s4,scause
ffffffffc0200cbc:	e822                	sd	s0,16(sp)
ffffffffc0200cbe:	e226                	sd	s1,256(sp)
ffffffffc0200cc0:	e64a                	sd	s2,264(sp)
ffffffffc0200cc2:	ea4e                	sd	s3,272(sp)
ffffffffc0200cc4:	ee52                	sd	s4,280(sp)
ffffffffc0200cc6:	850a                	mv	a0,sp
ffffffffc0200cc8:	f13ff0ef          	jal	ffffffffc0200bda <trap>

ffffffffc0200ccc <__trapret>:
ffffffffc0200ccc:	6492                	ld	s1,256(sp)
ffffffffc0200cce:	6932                	ld	s2,264(sp)
ffffffffc0200cd0:	1004f413          	andi	s0,s1,256
ffffffffc0200cd4:	e401                	bnez	s0,ffffffffc0200cdc <__trapret+0x10>
ffffffffc0200cd6:	1200                	addi	s0,sp,288
ffffffffc0200cd8:	14041073          	csrw	sscratch,s0
ffffffffc0200cdc:	10049073          	csrw	sstatus,s1
ffffffffc0200ce0:	14191073          	csrw	sepc,s2
ffffffffc0200ce4:	60a2                	ld	ra,8(sp)
ffffffffc0200ce6:	61e2                	ld	gp,24(sp)
ffffffffc0200ce8:	7202                	ld	tp,32(sp)
ffffffffc0200cea:	72a2                	ld	t0,40(sp)
ffffffffc0200cec:	7342                	ld	t1,48(sp)
ffffffffc0200cee:	73e2                	ld	t2,56(sp)
ffffffffc0200cf0:	6406                	ld	s0,64(sp)
ffffffffc0200cf2:	64a6                	ld	s1,72(sp)
ffffffffc0200cf4:	6546                	ld	a0,80(sp)
ffffffffc0200cf6:	65e6                	ld	a1,88(sp)
ffffffffc0200cf8:	7606                	ld	a2,96(sp)
ffffffffc0200cfa:	76a6                	ld	a3,104(sp)
ffffffffc0200cfc:	7746                	ld	a4,112(sp)
ffffffffc0200cfe:	77e6                	ld	a5,120(sp)
ffffffffc0200d00:	680a                	ld	a6,128(sp)
ffffffffc0200d02:	68aa                	ld	a7,136(sp)
ffffffffc0200d04:	694a                	ld	s2,144(sp)
ffffffffc0200d06:	69ea                	ld	s3,152(sp)
ffffffffc0200d08:	7a0a                	ld	s4,160(sp)
ffffffffc0200d0a:	7aaa                	ld	s5,168(sp)
ffffffffc0200d0c:	7b4a                	ld	s6,176(sp)
ffffffffc0200d0e:	7bea                	ld	s7,184(sp)
ffffffffc0200d10:	6c0e                	ld	s8,192(sp)
ffffffffc0200d12:	6cae                	ld	s9,200(sp)
ffffffffc0200d14:	6d4e                	ld	s10,208(sp)
ffffffffc0200d16:	6dee                	ld	s11,216(sp)
ffffffffc0200d18:	7e0e                	ld	t3,224(sp)
ffffffffc0200d1a:	7eae                	ld	t4,232(sp)
ffffffffc0200d1c:	7f4e                	ld	t5,240(sp)
ffffffffc0200d1e:	7fee                	ld	t6,248(sp)
ffffffffc0200d20:	6142                	ld	sp,16(sp)
ffffffffc0200d22:	10200073          	sret

ffffffffc0200d26 <forkrets>:
ffffffffc0200d26:	812a                	mv	sp,a0
ffffffffc0200d28:	b755                	j	ffffffffc0200ccc <__trapret>

ffffffffc0200d2a <default_init>:
ffffffffc0200d2a:	00038797          	auipc	a5,0x38
ffffffffc0200d2e:	7de78793          	addi	a5,a5,2014 # ffffffffc0239508 <free_area>
ffffffffc0200d32:	e79c                	sd	a5,8(a5)
ffffffffc0200d34:	e39c                	sd	a5,0(a5)
ffffffffc0200d36:	0007a823          	sw	zero,16(a5)
ffffffffc0200d3a:	8082                	ret

ffffffffc0200d3c <default_nr_free_pages>:
ffffffffc0200d3c:	00038517          	auipc	a0,0x38
ffffffffc0200d40:	7dc56503          	lwu	a0,2012(a0) # ffffffffc0239518 <free_area+0x10>
ffffffffc0200d44:	8082                	ret

ffffffffc0200d46 <default_check>:
ffffffffc0200d46:	715d                	addi	sp,sp,-80
ffffffffc0200d48:	e0a2                	sd	s0,64(sp)
ffffffffc0200d4a:	00038417          	auipc	s0,0x38
ffffffffc0200d4e:	7be40413          	addi	s0,s0,1982 # ffffffffc0239508 <free_area>
ffffffffc0200d52:	641c                	ld	a5,8(s0)
ffffffffc0200d54:	e486                	sd	ra,72(sp)
ffffffffc0200d56:	fc26                	sd	s1,56(sp)
ffffffffc0200d58:	f84a                	sd	s2,48(sp)
ffffffffc0200d5a:	f44e                	sd	s3,40(sp)
ffffffffc0200d5c:	f052                	sd	s4,32(sp)
ffffffffc0200d5e:	ec56                	sd	s5,24(sp)
ffffffffc0200d60:	e85a                	sd	s6,16(sp)
ffffffffc0200d62:	e45e                	sd	s7,8(sp)
ffffffffc0200d64:	e062                	sd	s8,0(sp)
ffffffffc0200d66:	2a878963          	beq	a5,s0,ffffffffc0201018 <default_check+0x2d2>
ffffffffc0200d6a:	4481                	li	s1,0
ffffffffc0200d6c:	4901                	li	s2,0
ffffffffc0200d6e:	ff07b703          	ld	a4,-16(a5)
ffffffffc0200d72:	8b09                	andi	a4,a4,2
ffffffffc0200d74:	2a070663          	beqz	a4,ffffffffc0201020 <default_check+0x2da>
ffffffffc0200d78:	ff87a703          	lw	a4,-8(a5)
ffffffffc0200d7c:	679c                	ld	a5,8(a5)
ffffffffc0200d7e:	2905                	addiw	s2,s2,1
ffffffffc0200d80:	9cb9                	addw	s1,s1,a4
ffffffffc0200d82:	fe8796e3          	bne	a5,s0,ffffffffc0200d6e <default_check+0x28>
ffffffffc0200d86:	89a6                	mv	s3,s1
ffffffffc0200d88:	70d000ef          	jal	ffffffffc0201c94 <nr_free_pages>
ffffffffc0200d8c:	6f351a63          	bne	a0,s3,ffffffffc0201480 <default_check+0x73a>
ffffffffc0200d90:	4505                	li	a0,1
ffffffffc0200d92:	633000ef          	jal	ffffffffc0201bc4 <alloc_pages>
ffffffffc0200d96:	8aaa                	mv	s5,a0
ffffffffc0200d98:	42050463          	beqz	a0,ffffffffc02011c0 <default_check+0x47a>
ffffffffc0200d9c:	4505                	li	a0,1
ffffffffc0200d9e:	627000ef          	jal	ffffffffc0201bc4 <alloc_pages>
ffffffffc0200da2:	89aa                	mv	s3,a0
ffffffffc0200da4:	6e050e63          	beqz	a0,ffffffffc02014a0 <default_check+0x75a>
ffffffffc0200da8:	4505                	li	a0,1
ffffffffc0200daa:	61b000ef          	jal	ffffffffc0201bc4 <alloc_pages>
ffffffffc0200dae:	8a2a                	mv	s4,a0
ffffffffc0200db0:	48050863          	beqz	a0,ffffffffc0201240 <default_check+0x4fa>
ffffffffc0200db4:	293a8663          	beq	s5,s3,ffffffffc0201040 <default_check+0x2fa>
ffffffffc0200db8:	28aa8463          	beq	s5,a0,ffffffffc0201040 <default_check+0x2fa>
ffffffffc0200dbc:	28a98263          	beq	s3,a0,ffffffffc0201040 <default_check+0x2fa>
ffffffffc0200dc0:	000aa783          	lw	a5,0(s5)
ffffffffc0200dc4:	28079e63          	bnez	a5,ffffffffc0201060 <default_check+0x31a>
ffffffffc0200dc8:	0009a783          	lw	a5,0(s3)
ffffffffc0200dcc:	28079a63          	bnez	a5,ffffffffc0201060 <default_check+0x31a>
ffffffffc0200dd0:	411c                	lw	a5,0(a0)
ffffffffc0200dd2:	28079763          	bnez	a5,ffffffffc0201060 <default_check+0x31a>
ffffffffc0200dd6:	0003d797          	auipc	a5,0x3d
ffffffffc0200dda:	86a7b783          	ld	a5,-1942(a5) # ffffffffc023d640 <pages>
ffffffffc0200dde:	40fa8733          	sub	a4,s5,a5
ffffffffc0200de2:	00008617          	auipc	a2,0x8
ffffffffc0200de6:	34e63603          	ld	a2,846(a2) # ffffffffc0209130 <nbase>
ffffffffc0200dea:	8719                	srai	a4,a4,0x6
ffffffffc0200dec:	9732                	add	a4,a4,a2
ffffffffc0200dee:	0003d697          	auipc	a3,0x3d
ffffffffc0200df2:	84a6b683          	ld	a3,-1974(a3) # ffffffffc023d638 <npage>
ffffffffc0200df6:	06b2                	slli	a3,a3,0xc
ffffffffc0200df8:	0732                	slli	a4,a4,0xc
ffffffffc0200dfa:	28d77363          	bgeu	a4,a3,ffffffffc0201080 <default_check+0x33a>
ffffffffc0200dfe:	40f98733          	sub	a4,s3,a5
ffffffffc0200e02:	8719                	srai	a4,a4,0x6
ffffffffc0200e04:	9732                	add	a4,a4,a2
ffffffffc0200e06:	0732                	slli	a4,a4,0xc
ffffffffc0200e08:	4ad77c63          	bgeu	a4,a3,ffffffffc02012c0 <default_check+0x57a>
ffffffffc0200e0c:	40f507b3          	sub	a5,a0,a5
ffffffffc0200e10:	8799                	srai	a5,a5,0x6
ffffffffc0200e12:	97b2                	add	a5,a5,a2
ffffffffc0200e14:	07b2                	slli	a5,a5,0xc
ffffffffc0200e16:	30d7f563          	bgeu	a5,a3,ffffffffc0201120 <default_check+0x3da>
ffffffffc0200e1a:	4505                	li	a0,1
ffffffffc0200e1c:	00043c03          	ld	s8,0(s0)
ffffffffc0200e20:	00843b83          	ld	s7,8(s0)
ffffffffc0200e24:	01042b03          	lw	s6,16(s0)
ffffffffc0200e28:	e400                	sd	s0,8(s0)
ffffffffc0200e2a:	e000                	sd	s0,0(s0)
ffffffffc0200e2c:	00038797          	auipc	a5,0x38
ffffffffc0200e30:	6e07a623          	sw	zero,1772(a5) # ffffffffc0239518 <free_area+0x10>
ffffffffc0200e34:	591000ef          	jal	ffffffffc0201bc4 <alloc_pages>
ffffffffc0200e38:	2c051463          	bnez	a0,ffffffffc0201100 <default_check+0x3ba>
ffffffffc0200e3c:	4585                	li	a1,1
ffffffffc0200e3e:	8556                	mv	a0,s5
ffffffffc0200e40:	615000ef          	jal	ffffffffc0201c54 <free_pages>
ffffffffc0200e44:	4585                	li	a1,1
ffffffffc0200e46:	854e                	mv	a0,s3
ffffffffc0200e48:	60d000ef          	jal	ffffffffc0201c54 <free_pages>
ffffffffc0200e4c:	4585                	li	a1,1
ffffffffc0200e4e:	8552                	mv	a0,s4
ffffffffc0200e50:	605000ef          	jal	ffffffffc0201c54 <free_pages>
ffffffffc0200e54:	4818                	lw	a4,16(s0)
ffffffffc0200e56:	478d                	li	a5,3
ffffffffc0200e58:	28f71463          	bne	a4,a5,ffffffffc02010e0 <default_check+0x39a>
ffffffffc0200e5c:	4505                	li	a0,1
ffffffffc0200e5e:	567000ef          	jal	ffffffffc0201bc4 <alloc_pages>
ffffffffc0200e62:	89aa                	mv	s3,a0
ffffffffc0200e64:	24050e63          	beqz	a0,ffffffffc02010c0 <default_check+0x37a>
ffffffffc0200e68:	4505                	li	a0,1
ffffffffc0200e6a:	55b000ef          	jal	ffffffffc0201bc4 <alloc_pages>
ffffffffc0200e6e:	8aaa                	mv	s5,a0
ffffffffc0200e70:	3a050863          	beqz	a0,ffffffffc0201220 <default_check+0x4da>
ffffffffc0200e74:	4505                	li	a0,1
ffffffffc0200e76:	54f000ef          	jal	ffffffffc0201bc4 <alloc_pages>
ffffffffc0200e7a:	8a2a                	mv	s4,a0
ffffffffc0200e7c:	38050263          	beqz	a0,ffffffffc0201200 <default_check+0x4ba>
ffffffffc0200e80:	4505                	li	a0,1
ffffffffc0200e82:	543000ef          	jal	ffffffffc0201bc4 <alloc_pages>
ffffffffc0200e86:	34051d63          	bnez	a0,ffffffffc02011e0 <default_check+0x49a>
ffffffffc0200e8a:	4585                	li	a1,1
ffffffffc0200e8c:	854e                	mv	a0,s3
ffffffffc0200e8e:	5c7000ef          	jal	ffffffffc0201c54 <free_pages>
ffffffffc0200e92:	641c                	ld	a5,8(s0)
ffffffffc0200e94:	20878663          	beq	a5,s0,ffffffffc02010a0 <default_check+0x35a>
ffffffffc0200e98:	4505                	li	a0,1
ffffffffc0200e9a:	52b000ef          	jal	ffffffffc0201bc4 <alloc_pages>
ffffffffc0200e9e:	30a99163          	bne	s3,a0,ffffffffc02011a0 <default_check+0x45a>
ffffffffc0200ea2:	4505                	li	a0,1
ffffffffc0200ea4:	521000ef          	jal	ffffffffc0201bc4 <alloc_pages>
ffffffffc0200ea8:	2c051c63          	bnez	a0,ffffffffc0201180 <default_check+0x43a>
ffffffffc0200eac:	481c                	lw	a5,16(s0)
ffffffffc0200eae:	2a079963          	bnez	a5,ffffffffc0201160 <default_check+0x41a>
ffffffffc0200eb2:	854e                	mv	a0,s3
ffffffffc0200eb4:	4585                	li	a1,1
ffffffffc0200eb6:	01843023          	sd	s8,0(s0)
ffffffffc0200eba:	01743423          	sd	s7,8(s0)
ffffffffc0200ebe:	01642823          	sw	s6,16(s0)
ffffffffc0200ec2:	593000ef          	jal	ffffffffc0201c54 <free_pages>
ffffffffc0200ec6:	4585                	li	a1,1
ffffffffc0200ec8:	8556                	mv	a0,s5
ffffffffc0200eca:	58b000ef          	jal	ffffffffc0201c54 <free_pages>
ffffffffc0200ece:	4585                	li	a1,1
ffffffffc0200ed0:	8552                	mv	a0,s4
ffffffffc0200ed2:	583000ef          	jal	ffffffffc0201c54 <free_pages>
ffffffffc0200ed6:	4515                	li	a0,5
ffffffffc0200ed8:	4ed000ef          	jal	ffffffffc0201bc4 <alloc_pages>
ffffffffc0200edc:	89aa                	mv	s3,a0
ffffffffc0200ede:	26050163          	beqz	a0,ffffffffc0201140 <default_check+0x3fa>
ffffffffc0200ee2:	651c                	ld	a5,8(a0)
ffffffffc0200ee4:	8b89                	andi	a5,a5,2
ffffffffc0200ee6:	52079d63          	bnez	a5,ffffffffc0201420 <default_check+0x6da>
ffffffffc0200eea:	4505                	li	a0,1
ffffffffc0200eec:	00043b83          	ld	s7,0(s0)
ffffffffc0200ef0:	00843b03          	ld	s6,8(s0)
ffffffffc0200ef4:	e000                	sd	s0,0(s0)
ffffffffc0200ef6:	e400                	sd	s0,8(s0)
ffffffffc0200ef8:	4cd000ef          	jal	ffffffffc0201bc4 <alloc_pages>
ffffffffc0200efc:	50051263          	bnez	a0,ffffffffc0201400 <default_check+0x6ba>
ffffffffc0200f00:	08098a13          	addi	s4,s3,128
ffffffffc0200f04:	8552                	mv	a0,s4
ffffffffc0200f06:	458d                	li	a1,3
ffffffffc0200f08:	01042c03          	lw	s8,16(s0)
ffffffffc0200f0c:	00038797          	auipc	a5,0x38
ffffffffc0200f10:	6007a623          	sw	zero,1548(a5) # ffffffffc0239518 <free_area+0x10>
ffffffffc0200f14:	541000ef          	jal	ffffffffc0201c54 <free_pages>
ffffffffc0200f18:	4511                	li	a0,4
ffffffffc0200f1a:	4ab000ef          	jal	ffffffffc0201bc4 <alloc_pages>
ffffffffc0200f1e:	4c051163          	bnez	a0,ffffffffc02013e0 <default_check+0x69a>
ffffffffc0200f22:	0889b783          	ld	a5,136(s3)
ffffffffc0200f26:	8b89                	andi	a5,a5,2
ffffffffc0200f28:	48078c63          	beqz	a5,ffffffffc02013c0 <default_check+0x67a>
ffffffffc0200f2c:	0909a703          	lw	a4,144(s3)
ffffffffc0200f30:	478d                	li	a5,3
ffffffffc0200f32:	48f71763          	bne	a4,a5,ffffffffc02013c0 <default_check+0x67a>
ffffffffc0200f36:	450d                	li	a0,3
ffffffffc0200f38:	48d000ef          	jal	ffffffffc0201bc4 <alloc_pages>
ffffffffc0200f3c:	8aaa                	mv	s5,a0
ffffffffc0200f3e:	46050163          	beqz	a0,ffffffffc02013a0 <default_check+0x65a>
ffffffffc0200f42:	4505                	li	a0,1
ffffffffc0200f44:	481000ef          	jal	ffffffffc0201bc4 <alloc_pages>
ffffffffc0200f48:	42051c63          	bnez	a0,ffffffffc0201380 <default_check+0x63a>
ffffffffc0200f4c:	415a1a63          	bne	s4,s5,ffffffffc0201360 <default_check+0x61a>
ffffffffc0200f50:	4585                	li	a1,1
ffffffffc0200f52:	854e                	mv	a0,s3
ffffffffc0200f54:	501000ef          	jal	ffffffffc0201c54 <free_pages>
ffffffffc0200f58:	458d                	li	a1,3
ffffffffc0200f5a:	8552                	mv	a0,s4
ffffffffc0200f5c:	4f9000ef          	jal	ffffffffc0201c54 <free_pages>
ffffffffc0200f60:	0089b783          	ld	a5,8(s3)
ffffffffc0200f64:	04098a93          	addi	s5,s3,64
ffffffffc0200f68:	8b89                	andi	a5,a5,2
ffffffffc0200f6a:	3c078b63          	beqz	a5,ffffffffc0201340 <default_check+0x5fa>
ffffffffc0200f6e:	0109a703          	lw	a4,16(s3)
ffffffffc0200f72:	4785                	li	a5,1
ffffffffc0200f74:	3cf71663          	bne	a4,a5,ffffffffc0201340 <default_check+0x5fa>
ffffffffc0200f78:	008a3783          	ld	a5,8(s4)
ffffffffc0200f7c:	8b89                	andi	a5,a5,2
ffffffffc0200f7e:	3a078163          	beqz	a5,ffffffffc0201320 <default_check+0x5da>
ffffffffc0200f82:	010a2703          	lw	a4,16(s4)
ffffffffc0200f86:	478d                	li	a5,3
ffffffffc0200f88:	38f71c63          	bne	a4,a5,ffffffffc0201320 <default_check+0x5da>
ffffffffc0200f8c:	4505                	li	a0,1
ffffffffc0200f8e:	437000ef          	jal	ffffffffc0201bc4 <alloc_pages>
ffffffffc0200f92:	36a99763          	bne	s3,a0,ffffffffc0201300 <default_check+0x5ba>
ffffffffc0200f96:	4585                	li	a1,1
ffffffffc0200f98:	4bd000ef          	jal	ffffffffc0201c54 <free_pages>
ffffffffc0200f9c:	4509                	li	a0,2
ffffffffc0200f9e:	427000ef          	jal	ffffffffc0201bc4 <alloc_pages>
ffffffffc0200fa2:	32aa1f63          	bne	s4,a0,ffffffffc02012e0 <default_check+0x59a>
ffffffffc0200fa6:	4589                	li	a1,2
ffffffffc0200fa8:	4ad000ef          	jal	ffffffffc0201c54 <free_pages>
ffffffffc0200fac:	4585                	li	a1,1
ffffffffc0200fae:	8556                	mv	a0,s5
ffffffffc0200fb0:	4a5000ef          	jal	ffffffffc0201c54 <free_pages>
ffffffffc0200fb4:	4515                	li	a0,5
ffffffffc0200fb6:	40f000ef          	jal	ffffffffc0201bc4 <alloc_pages>
ffffffffc0200fba:	89aa                	mv	s3,a0
ffffffffc0200fbc:	48050263          	beqz	a0,ffffffffc0201440 <default_check+0x6fa>
ffffffffc0200fc0:	4505                	li	a0,1
ffffffffc0200fc2:	403000ef          	jal	ffffffffc0201bc4 <alloc_pages>
ffffffffc0200fc6:	2c051d63          	bnez	a0,ffffffffc02012a0 <default_check+0x55a>
ffffffffc0200fca:	481c                	lw	a5,16(s0)
ffffffffc0200fcc:	2a079a63          	bnez	a5,ffffffffc0201280 <default_check+0x53a>
ffffffffc0200fd0:	4595                	li	a1,5
ffffffffc0200fd2:	854e                	mv	a0,s3
ffffffffc0200fd4:	01842823          	sw	s8,16(s0)
ffffffffc0200fd8:	01743023          	sd	s7,0(s0)
ffffffffc0200fdc:	01643423          	sd	s6,8(s0)
ffffffffc0200fe0:	475000ef          	jal	ffffffffc0201c54 <free_pages>
ffffffffc0200fe4:	641c                	ld	a5,8(s0)
ffffffffc0200fe6:	00878963          	beq	a5,s0,ffffffffc0200ff8 <default_check+0x2b2>
ffffffffc0200fea:	ff87a703          	lw	a4,-8(a5)
ffffffffc0200fee:	679c                	ld	a5,8(a5)
ffffffffc0200ff0:	397d                	addiw	s2,s2,-1
ffffffffc0200ff2:	9c99                	subw	s1,s1,a4
ffffffffc0200ff4:	fe879be3          	bne	a5,s0,ffffffffc0200fea <default_check+0x2a4>
ffffffffc0200ff8:	26091463          	bnez	s2,ffffffffc0201260 <default_check+0x51a>
ffffffffc0200ffc:	46049263          	bnez	s1,ffffffffc0201460 <default_check+0x71a>
ffffffffc0201000:	60a6                	ld	ra,72(sp)
ffffffffc0201002:	6406                	ld	s0,64(sp)
ffffffffc0201004:	74e2                	ld	s1,56(sp)
ffffffffc0201006:	7942                	ld	s2,48(sp)
ffffffffc0201008:	79a2                	ld	s3,40(sp)
ffffffffc020100a:	7a02                	ld	s4,32(sp)
ffffffffc020100c:	6ae2                	ld	s5,24(sp)
ffffffffc020100e:	6b42                	ld	s6,16(sp)
ffffffffc0201010:	6ba2                	ld	s7,8(sp)
ffffffffc0201012:	6c02                	ld	s8,0(sp)
ffffffffc0201014:	6161                	addi	sp,sp,80
ffffffffc0201016:	8082                	ret
ffffffffc0201018:	4981                	li	s3,0
ffffffffc020101a:	4481                	li	s1,0
ffffffffc020101c:	4901                	li	s2,0
ffffffffc020101e:	b3ad                	j	ffffffffc0200d88 <default_check+0x42>
ffffffffc0201020:	00006697          	auipc	a3,0x6
ffffffffc0201024:	be868693          	addi	a3,a3,-1048 # ffffffffc0206c08 <etext+0x8fe>
ffffffffc0201028:	00006617          	auipc	a2,0x6
ffffffffc020102c:	96060613          	addi	a2,a2,-1696 # ffffffffc0206988 <etext+0x67e>
ffffffffc0201030:	0f000593          	li	a1,240
ffffffffc0201034:	00006517          	auipc	a0,0x6
ffffffffc0201038:	be450513          	addi	a0,a0,-1052 # ffffffffc0206c18 <etext+0x90e>
ffffffffc020103c:	c3cff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0201040:	00006697          	auipc	a3,0x6
ffffffffc0201044:	c7068693          	addi	a3,a3,-912 # ffffffffc0206cb0 <etext+0x9a6>
ffffffffc0201048:	00006617          	auipc	a2,0x6
ffffffffc020104c:	94060613          	addi	a2,a2,-1728 # ffffffffc0206988 <etext+0x67e>
ffffffffc0201050:	0bd00593          	li	a1,189
ffffffffc0201054:	00006517          	auipc	a0,0x6
ffffffffc0201058:	bc450513          	addi	a0,a0,-1084 # ffffffffc0206c18 <etext+0x90e>
ffffffffc020105c:	c1cff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0201060:	00006697          	auipc	a3,0x6
ffffffffc0201064:	c7868693          	addi	a3,a3,-904 # ffffffffc0206cd8 <etext+0x9ce>
ffffffffc0201068:	00006617          	auipc	a2,0x6
ffffffffc020106c:	92060613          	addi	a2,a2,-1760 # ffffffffc0206988 <etext+0x67e>
ffffffffc0201070:	0be00593          	li	a1,190
ffffffffc0201074:	00006517          	auipc	a0,0x6
ffffffffc0201078:	ba450513          	addi	a0,a0,-1116 # ffffffffc0206c18 <etext+0x90e>
ffffffffc020107c:	bfcff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0201080:	00006697          	auipc	a3,0x6
ffffffffc0201084:	c9868693          	addi	a3,a3,-872 # ffffffffc0206d18 <etext+0xa0e>
ffffffffc0201088:	00006617          	auipc	a2,0x6
ffffffffc020108c:	90060613          	addi	a2,a2,-1792 # ffffffffc0206988 <etext+0x67e>
ffffffffc0201090:	0c000593          	li	a1,192
ffffffffc0201094:	00006517          	auipc	a0,0x6
ffffffffc0201098:	b8450513          	addi	a0,a0,-1148 # ffffffffc0206c18 <etext+0x90e>
ffffffffc020109c:	bdcff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02010a0:	00006697          	auipc	a3,0x6
ffffffffc02010a4:	d0068693          	addi	a3,a3,-768 # ffffffffc0206da0 <etext+0xa96>
ffffffffc02010a8:	00006617          	auipc	a2,0x6
ffffffffc02010ac:	8e060613          	addi	a2,a2,-1824 # ffffffffc0206988 <etext+0x67e>
ffffffffc02010b0:	0d900593          	li	a1,217
ffffffffc02010b4:	00006517          	auipc	a0,0x6
ffffffffc02010b8:	b6450513          	addi	a0,a0,-1180 # ffffffffc0206c18 <etext+0x90e>
ffffffffc02010bc:	bbcff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02010c0:	00006697          	auipc	a3,0x6
ffffffffc02010c4:	b9068693          	addi	a3,a3,-1136 # ffffffffc0206c50 <etext+0x946>
ffffffffc02010c8:	00006617          	auipc	a2,0x6
ffffffffc02010cc:	8c060613          	addi	a2,a2,-1856 # ffffffffc0206988 <etext+0x67e>
ffffffffc02010d0:	0d200593          	li	a1,210
ffffffffc02010d4:	00006517          	auipc	a0,0x6
ffffffffc02010d8:	b4450513          	addi	a0,a0,-1212 # ffffffffc0206c18 <etext+0x90e>
ffffffffc02010dc:	b9cff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02010e0:	00006697          	auipc	a3,0x6
ffffffffc02010e4:	cb068693          	addi	a3,a3,-848 # ffffffffc0206d90 <etext+0xa86>
ffffffffc02010e8:	00006617          	auipc	a2,0x6
ffffffffc02010ec:	8a060613          	addi	a2,a2,-1888 # ffffffffc0206988 <etext+0x67e>
ffffffffc02010f0:	0d000593          	li	a1,208
ffffffffc02010f4:	00006517          	auipc	a0,0x6
ffffffffc02010f8:	b2450513          	addi	a0,a0,-1244 # ffffffffc0206c18 <etext+0x90e>
ffffffffc02010fc:	b7cff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0201100:	00006697          	auipc	a3,0x6
ffffffffc0201104:	c7868693          	addi	a3,a3,-904 # ffffffffc0206d78 <etext+0xa6e>
ffffffffc0201108:	00006617          	auipc	a2,0x6
ffffffffc020110c:	88060613          	addi	a2,a2,-1920 # ffffffffc0206988 <etext+0x67e>
ffffffffc0201110:	0cb00593          	li	a1,203
ffffffffc0201114:	00006517          	auipc	a0,0x6
ffffffffc0201118:	b0450513          	addi	a0,a0,-1276 # ffffffffc0206c18 <etext+0x90e>
ffffffffc020111c:	b5cff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0201120:	00006697          	auipc	a3,0x6
ffffffffc0201124:	c3868693          	addi	a3,a3,-968 # ffffffffc0206d58 <etext+0xa4e>
ffffffffc0201128:	00006617          	auipc	a2,0x6
ffffffffc020112c:	86060613          	addi	a2,a2,-1952 # ffffffffc0206988 <etext+0x67e>
ffffffffc0201130:	0c200593          	li	a1,194
ffffffffc0201134:	00006517          	auipc	a0,0x6
ffffffffc0201138:	ae450513          	addi	a0,a0,-1308 # ffffffffc0206c18 <etext+0x90e>
ffffffffc020113c:	b3cff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0201140:	00006697          	auipc	a3,0x6
ffffffffc0201144:	ca868693          	addi	a3,a3,-856 # ffffffffc0206de8 <etext+0xade>
ffffffffc0201148:	00006617          	auipc	a2,0x6
ffffffffc020114c:	84060613          	addi	a2,a2,-1984 # ffffffffc0206988 <etext+0x67e>
ffffffffc0201150:	0f800593          	li	a1,248
ffffffffc0201154:	00006517          	auipc	a0,0x6
ffffffffc0201158:	ac450513          	addi	a0,a0,-1340 # ffffffffc0206c18 <etext+0x90e>
ffffffffc020115c:	b1cff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0201160:	00006697          	auipc	a3,0x6
ffffffffc0201164:	c7868693          	addi	a3,a3,-904 # ffffffffc0206dd8 <etext+0xace>
ffffffffc0201168:	00006617          	auipc	a2,0x6
ffffffffc020116c:	82060613          	addi	a2,a2,-2016 # ffffffffc0206988 <etext+0x67e>
ffffffffc0201170:	0df00593          	li	a1,223
ffffffffc0201174:	00006517          	auipc	a0,0x6
ffffffffc0201178:	aa450513          	addi	a0,a0,-1372 # ffffffffc0206c18 <etext+0x90e>
ffffffffc020117c:	afcff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0201180:	00006697          	auipc	a3,0x6
ffffffffc0201184:	bf868693          	addi	a3,a3,-1032 # ffffffffc0206d78 <etext+0xa6e>
ffffffffc0201188:	00006617          	auipc	a2,0x6
ffffffffc020118c:	80060613          	addi	a2,a2,-2048 # ffffffffc0206988 <etext+0x67e>
ffffffffc0201190:	0dd00593          	li	a1,221
ffffffffc0201194:	00006517          	auipc	a0,0x6
ffffffffc0201198:	a8450513          	addi	a0,a0,-1404 # ffffffffc0206c18 <etext+0x90e>
ffffffffc020119c:	adcff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02011a0:	00006697          	auipc	a3,0x6
ffffffffc02011a4:	c1868693          	addi	a3,a3,-1000 # ffffffffc0206db8 <etext+0xaae>
ffffffffc02011a8:	00005617          	auipc	a2,0x5
ffffffffc02011ac:	7e060613          	addi	a2,a2,2016 # ffffffffc0206988 <etext+0x67e>
ffffffffc02011b0:	0dc00593          	li	a1,220
ffffffffc02011b4:	00006517          	auipc	a0,0x6
ffffffffc02011b8:	a6450513          	addi	a0,a0,-1436 # ffffffffc0206c18 <etext+0x90e>
ffffffffc02011bc:	abcff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02011c0:	00006697          	auipc	a3,0x6
ffffffffc02011c4:	a9068693          	addi	a3,a3,-1392 # ffffffffc0206c50 <etext+0x946>
ffffffffc02011c8:	00005617          	auipc	a2,0x5
ffffffffc02011cc:	7c060613          	addi	a2,a2,1984 # ffffffffc0206988 <etext+0x67e>
ffffffffc02011d0:	0b900593          	li	a1,185
ffffffffc02011d4:	00006517          	auipc	a0,0x6
ffffffffc02011d8:	a4450513          	addi	a0,a0,-1468 # ffffffffc0206c18 <etext+0x90e>
ffffffffc02011dc:	a9cff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02011e0:	00006697          	auipc	a3,0x6
ffffffffc02011e4:	b9868693          	addi	a3,a3,-1128 # ffffffffc0206d78 <etext+0xa6e>
ffffffffc02011e8:	00005617          	auipc	a2,0x5
ffffffffc02011ec:	7a060613          	addi	a2,a2,1952 # ffffffffc0206988 <etext+0x67e>
ffffffffc02011f0:	0d600593          	li	a1,214
ffffffffc02011f4:	00006517          	auipc	a0,0x6
ffffffffc02011f8:	a2450513          	addi	a0,a0,-1500 # ffffffffc0206c18 <etext+0x90e>
ffffffffc02011fc:	a7cff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0201200:	00006697          	auipc	a3,0x6
ffffffffc0201204:	a9068693          	addi	a3,a3,-1392 # ffffffffc0206c90 <etext+0x986>
ffffffffc0201208:	00005617          	auipc	a2,0x5
ffffffffc020120c:	78060613          	addi	a2,a2,1920 # ffffffffc0206988 <etext+0x67e>
ffffffffc0201210:	0d400593          	li	a1,212
ffffffffc0201214:	00006517          	auipc	a0,0x6
ffffffffc0201218:	a0450513          	addi	a0,a0,-1532 # ffffffffc0206c18 <etext+0x90e>
ffffffffc020121c:	a5cff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0201220:	00006697          	auipc	a3,0x6
ffffffffc0201224:	a5068693          	addi	a3,a3,-1456 # ffffffffc0206c70 <etext+0x966>
ffffffffc0201228:	00005617          	auipc	a2,0x5
ffffffffc020122c:	76060613          	addi	a2,a2,1888 # ffffffffc0206988 <etext+0x67e>
ffffffffc0201230:	0d300593          	li	a1,211
ffffffffc0201234:	00006517          	auipc	a0,0x6
ffffffffc0201238:	9e450513          	addi	a0,a0,-1564 # ffffffffc0206c18 <etext+0x90e>
ffffffffc020123c:	a3cff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0201240:	00006697          	auipc	a3,0x6
ffffffffc0201244:	a5068693          	addi	a3,a3,-1456 # ffffffffc0206c90 <etext+0x986>
ffffffffc0201248:	00005617          	auipc	a2,0x5
ffffffffc020124c:	74060613          	addi	a2,a2,1856 # ffffffffc0206988 <etext+0x67e>
ffffffffc0201250:	0bb00593          	li	a1,187
ffffffffc0201254:	00006517          	auipc	a0,0x6
ffffffffc0201258:	9c450513          	addi	a0,a0,-1596 # ffffffffc0206c18 <etext+0x90e>
ffffffffc020125c:	a1cff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0201260:	00006697          	auipc	a3,0x6
ffffffffc0201264:	cd868693          	addi	a3,a3,-808 # ffffffffc0206f38 <etext+0xc2e>
ffffffffc0201268:	00005617          	auipc	a2,0x5
ffffffffc020126c:	72060613          	addi	a2,a2,1824 # ffffffffc0206988 <etext+0x67e>
ffffffffc0201270:	12500593          	li	a1,293
ffffffffc0201274:	00006517          	auipc	a0,0x6
ffffffffc0201278:	9a450513          	addi	a0,a0,-1628 # ffffffffc0206c18 <etext+0x90e>
ffffffffc020127c:	9fcff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0201280:	00006697          	auipc	a3,0x6
ffffffffc0201284:	b5868693          	addi	a3,a3,-1192 # ffffffffc0206dd8 <etext+0xace>
ffffffffc0201288:	00005617          	auipc	a2,0x5
ffffffffc020128c:	70060613          	addi	a2,a2,1792 # ffffffffc0206988 <etext+0x67e>
ffffffffc0201290:	11a00593          	li	a1,282
ffffffffc0201294:	00006517          	auipc	a0,0x6
ffffffffc0201298:	98450513          	addi	a0,a0,-1660 # ffffffffc0206c18 <etext+0x90e>
ffffffffc020129c:	9dcff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02012a0:	00006697          	auipc	a3,0x6
ffffffffc02012a4:	ad868693          	addi	a3,a3,-1320 # ffffffffc0206d78 <etext+0xa6e>
ffffffffc02012a8:	00005617          	auipc	a2,0x5
ffffffffc02012ac:	6e060613          	addi	a2,a2,1760 # ffffffffc0206988 <etext+0x67e>
ffffffffc02012b0:	11800593          	li	a1,280
ffffffffc02012b4:	00006517          	auipc	a0,0x6
ffffffffc02012b8:	96450513          	addi	a0,a0,-1692 # ffffffffc0206c18 <etext+0x90e>
ffffffffc02012bc:	9bcff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02012c0:	00006697          	auipc	a3,0x6
ffffffffc02012c4:	a7868693          	addi	a3,a3,-1416 # ffffffffc0206d38 <etext+0xa2e>
ffffffffc02012c8:	00005617          	auipc	a2,0x5
ffffffffc02012cc:	6c060613          	addi	a2,a2,1728 # ffffffffc0206988 <etext+0x67e>
ffffffffc02012d0:	0c100593          	li	a1,193
ffffffffc02012d4:	00006517          	auipc	a0,0x6
ffffffffc02012d8:	94450513          	addi	a0,a0,-1724 # ffffffffc0206c18 <etext+0x90e>
ffffffffc02012dc:	99cff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02012e0:	00006697          	auipc	a3,0x6
ffffffffc02012e4:	c1868693          	addi	a3,a3,-1000 # ffffffffc0206ef8 <etext+0xbee>
ffffffffc02012e8:	00005617          	auipc	a2,0x5
ffffffffc02012ec:	6a060613          	addi	a2,a2,1696 # ffffffffc0206988 <etext+0x67e>
ffffffffc02012f0:	11200593          	li	a1,274
ffffffffc02012f4:	00006517          	auipc	a0,0x6
ffffffffc02012f8:	92450513          	addi	a0,a0,-1756 # ffffffffc0206c18 <etext+0x90e>
ffffffffc02012fc:	97cff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0201300:	00006697          	auipc	a3,0x6
ffffffffc0201304:	bd868693          	addi	a3,a3,-1064 # ffffffffc0206ed8 <etext+0xbce>
ffffffffc0201308:	00005617          	auipc	a2,0x5
ffffffffc020130c:	68060613          	addi	a2,a2,1664 # ffffffffc0206988 <etext+0x67e>
ffffffffc0201310:	11000593          	li	a1,272
ffffffffc0201314:	00006517          	auipc	a0,0x6
ffffffffc0201318:	90450513          	addi	a0,a0,-1788 # ffffffffc0206c18 <etext+0x90e>
ffffffffc020131c:	95cff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0201320:	00006697          	auipc	a3,0x6
ffffffffc0201324:	b9068693          	addi	a3,a3,-1136 # ffffffffc0206eb0 <etext+0xba6>
ffffffffc0201328:	00005617          	auipc	a2,0x5
ffffffffc020132c:	66060613          	addi	a2,a2,1632 # ffffffffc0206988 <etext+0x67e>
ffffffffc0201330:	10e00593          	li	a1,270
ffffffffc0201334:	00006517          	auipc	a0,0x6
ffffffffc0201338:	8e450513          	addi	a0,a0,-1820 # ffffffffc0206c18 <etext+0x90e>
ffffffffc020133c:	93cff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0201340:	00006697          	auipc	a3,0x6
ffffffffc0201344:	b4868693          	addi	a3,a3,-1208 # ffffffffc0206e88 <etext+0xb7e>
ffffffffc0201348:	00005617          	auipc	a2,0x5
ffffffffc020134c:	64060613          	addi	a2,a2,1600 # ffffffffc0206988 <etext+0x67e>
ffffffffc0201350:	10d00593          	li	a1,269
ffffffffc0201354:	00006517          	auipc	a0,0x6
ffffffffc0201358:	8c450513          	addi	a0,a0,-1852 # ffffffffc0206c18 <etext+0x90e>
ffffffffc020135c:	91cff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0201360:	00006697          	auipc	a3,0x6
ffffffffc0201364:	b1868693          	addi	a3,a3,-1256 # ffffffffc0206e78 <etext+0xb6e>
ffffffffc0201368:	00005617          	auipc	a2,0x5
ffffffffc020136c:	62060613          	addi	a2,a2,1568 # ffffffffc0206988 <etext+0x67e>
ffffffffc0201370:	10800593          	li	a1,264
ffffffffc0201374:	00006517          	auipc	a0,0x6
ffffffffc0201378:	8a450513          	addi	a0,a0,-1884 # ffffffffc0206c18 <etext+0x90e>
ffffffffc020137c:	8fcff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0201380:	00006697          	auipc	a3,0x6
ffffffffc0201384:	9f868693          	addi	a3,a3,-1544 # ffffffffc0206d78 <etext+0xa6e>
ffffffffc0201388:	00005617          	auipc	a2,0x5
ffffffffc020138c:	60060613          	addi	a2,a2,1536 # ffffffffc0206988 <etext+0x67e>
ffffffffc0201390:	10700593          	li	a1,263
ffffffffc0201394:	00006517          	auipc	a0,0x6
ffffffffc0201398:	88450513          	addi	a0,a0,-1916 # ffffffffc0206c18 <etext+0x90e>
ffffffffc020139c:	8dcff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02013a0:	00006697          	auipc	a3,0x6
ffffffffc02013a4:	ab868693          	addi	a3,a3,-1352 # ffffffffc0206e58 <etext+0xb4e>
ffffffffc02013a8:	00005617          	auipc	a2,0x5
ffffffffc02013ac:	5e060613          	addi	a2,a2,1504 # ffffffffc0206988 <etext+0x67e>
ffffffffc02013b0:	10600593          	li	a1,262
ffffffffc02013b4:	00006517          	auipc	a0,0x6
ffffffffc02013b8:	86450513          	addi	a0,a0,-1948 # ffffffffc0206c18 <etext+0x90e>
ffffffffc02013bc:	8bcff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02013c0:	00006697          	auipc	a3,0x6
ffffffffc02013c4:	a6868693          	addi	a3,a3,-1432 # ffffffffc0206e28 <etext+0xb1e>
ffffffffc02013c8:	00005617          	auipc	a2,0x5
ffffffffc02013cc:	5c060613          	addi	a2,a2,1472 # ffffffffc0206988 <etext+0x67e>
ffffffffc02013d0:	10500593          	li	a1,261
ffffffffc02013d4:	00006517          	auipc	a0,0x6
ffffffffc02013d8:	84450513          	addi	a0,a0,-1980 # ffffffffc0206c18 <etext+0x90e>
ffffffffc02013dc:	89cff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02013e0:	00006697          	auipc	a3,0x6
ffffffffc02013e4:	a3068693          	addi	a3,a3,-1488 # ffffffffc0206e10 <etext+0xb06>
ffffffffc02013e8:	00005617          	auipc	a2,0x5
ffffffffc02013ec:	5a060613          	addi	a2,a2,1440 # ffffffffc0206988 <etext+0x67e>
ffffffffc02013f0:	10400593          	li	a1,260
ffffffffc02013f4:	00006517          	auipc	a0,0x6
ffffffffc02013f8:	82450513          	addi	a0,a0,-2012 # ffffffffc0206c18 <etext+0x90e>
ffffffffc02013fc:	87cff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0201400:	00006697          	auipc	a3,0x6
ffffffffc0201404:	97868693          	addi	a3,a3,-1672 # ffffffffc0206d78 <etext+0xa6e>
ffffffffc0201408:	00005617          	auipc	a2,0x5
ffffffffc020140c:	58060613          	addi	a2,a2,1408 # ffffffffc0206988 <etext+0x67e>
ffffffffc0201410:	0fe00593          	li	a1,254
ffffffffc0201414:	00006517          	auipc	a0,0x6
ffffffffc0201418:	80450513          	addi	a0,a0,-2044 # ffffffffc0206c18 <etext+0x90e>
ffffffffc020141c:	85cff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0201420:	00006697          	auipc	a3,0x6
ffffffffc0201424:	9d868693          	addi	a3,a3,-1576 # ffffffffc0206df8 <etext+0xaee>
ffffffffc0201428:	00005617          	auipc	a2,0x5
ffffffffc020142c:	56060613          	addi	a2,a2,1376 # ffffffffc0206988 <etext+0x67e>
ffffffffc0201430:	0f900593          	li	a1,249
ffffffffc0201434:	00005517          	auipc	a0,0x5
ffffffffc0201438:	7e450513          	addi	a0,a0,2020 # ffffffffc0206c18 <etext+0x90e>
ffffffffc020143c:	83cff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0201440:	00006697          	auipc	a3,0x6
ffffffffc0201444:	ad868693          	addi	a3,a3,-1320 # ffffffffc0206f18 <etext+0xc0e>
ffffffffc0201448:	00005617          	auipc	a2,0x5
ffffffffc020144c:	54060613          	addi	a2,a2,1344 # ffffffffc0206988 <etext+0x67e>
ffffffffc0201450:	11700593          	li	a1,279
ffffffffc0201454:	00005517          	auipc	a0,0x5
ffffffffc0201458:	7c450513          	addi	a0,a0,1988 # ffffffffc0206c18 <etext+0x90e>
ffffffffc020145c:	81cff0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0201460:	00006697          	auipc	a3,0x6
ffffffffc0201464:	ae868693          	addi	a3,a3,-1304 # ffffffffc0206f48 <etext+0xc3e>
ffffffffc0201468:	00005617          	auipc	a2,0x5
ffffffffc020146c:	52060613          	addi	a2,a2,1312 # ffffffffc0206988 <etext+0x67e>
ffffffffc0201470:	12600593          	li	a1,294
ffffffffc0201474:	00005517          	auipc	a0,0x5
ffffffffc0201478:	7a450513          	addi	a0,a0,1956 # ffffffffc0206c18 <etext+0x90e>
ffffffffc020147c:	ffdfe0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0201480:	00005697          	auipc	a3,0x5
ffffffffc0201484:	7b068693          	addi	a3,a3,1968 # ffffffffc0206c30 <etext+0x926>
ffffffffc0201488:	00005617          	auipc	a2,0x5
ffffffffc020148c:	50060613          	addi	a2,a2,1280 # ffffffffc0206988 <etext+0x67e>
ffffffffc0201490:	0f300593          	li	a1,243
ffffffffc0201494:	00005517          	auipc	a0,0x5
ffffffffc0201498:	78450513          	addi	a0,a0,1924 # ffffffffc0206c18 <etext+0x90e>
ffffffffc020149c:	fddfe0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02014a0:	00005697          	auipc	a3,0x5
ffffffffc02014a4:	7d068693          	addi	a3,a3,2000 # ffffffffc0206c70 <etext+0x966>
ffffffffc02014a8:	00005617          	auipc	a2,0x5
ffffffffc02014ac:	4e060613          	addi	a2,a2,1248 # ffffffffc0206988 <etext+0x67e>
ffffffffc02014b0:	0ba00593          	li	a1,186
ffffffffc02014b4:	00005517          	auipc	a0,0x5
ffffffffc02014b8:	76450513          	addi	a0,a0,1892 # ffffffffc0206c18 <etext+0x90e>
ffffffffc02014bc:	fbdfe0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc02014c0 <default_free_pages>:
ffffffffc02014c0:	1141                	addi	sp,sp,-16
ffffffffc02014c2:	e406                	sd	ra,8(sp)
ffffffffc02014c4:	14058463          	beqz	a1,ffffffffc020160c <default_free_pages+0x14c>
ffffffffc02014c8:	00659713          	slli	a4,a1,0x6
ffffffffc02014cc:	00e506b3          	add	a3,a0,a4
ffffffffc02014d0:	87aa                	mv	a5,a0
ffffffffc02014d2:	c30d                	beqz	a4,ffffffffc02014f4 <default_free_pages+0x34>
ffffffffc02014d4:	6798                	ld	a4,8(a5)
ffffffffc02014d6:	8b05                	andi	a4,a4,1
ffffffffc02014d8:	10071a63          	bnez	a4,ffffffffc02015ec <default_free_pages+0x12c>
ffffffffc02014dc:	6798                	ld	a4,8(a5)
ffffffffc02014de:	8b09                	andi	a4,a4,2
ffffffffc02014e0:	10071663          	bnez	a4,ffffffffc02015ec <default_free_pages+0x12c>
ffffffffc02014e4:	0007b423          	sd	zero,8(a5)
ffffffffc02014e8:	0007a023          	sw	zero,0(a5)
ffffffffc02014ec:	04078793          	addi	a5,a5,64
ffffffffc02014f0:	fed792e3          	bne	a5,a3,ffffffffc02014d4 <default_free_pages+0x14>
ffffffffc02014f4:	2581                	sext.w	a1,a1
ffffffffc02014f6:	c90c                	sw	a1,16(a0)
ffffffffc02014f8:	00850893          	addi	a7,a0,8
ffffffffc02014fc:	4789                	li	a5,2
ffffffffc02014fe:	40f8b02f          	amoor.d	zero,a5,(a7)
ffffffffc0201502:	00038697          	auipc	a3,0x38
ffffffffc0201506:	00668693          	addi	a3,a3,6 # ffffffffc0239508 <free_area>
ffffffffc020150a:	4a98                	lw	a4,16(a3)
ffffffffc020150c:	669c                	ld	a5,8(a3)
ffffffffc020150e:	9f2d                	addw	a4,a4,a1
ffffffffc0201510:	ca98                	sw	a4,16(a3)
ffffffffc0201512:	0ad78163          	beq	a5,a3,ffffffffc02015b4 <default_free_pages+0xf4>
ffffffffc0201516:	fe878713          	addi	a4,a5,-24
ffffffffc020151a:	4581                	li	a1,0
ffffffffc020151c:	01850613          	addi	a2,a0,24
ffffffffc0201520:	00e56a63          	bltu	a0,a4,ffffffffc0201534 <default_free_pages+0x74>
ffffffffc0201524:	6798                	ld	a4,8(a5)
ffffffffc0201526:	04d70c63          	beq	a4,a3,ffffffffc020157e <default_free_pages+0xbe>
ffffffffc020152a:	87ba                	mv	a5,a4
ffffffffc020152c:	fe878713          	addi	a4,a5,-24
ffffffffc0201530:	fee57ae3          	bgeu	a0,a4,ffffffffc0201524 <default_free_pages+0x64>
ffffffffc0201534:	c199                	beqz	a1,ffffffffc020153a <default_free_pages+0x7a>
ffffffffc0201536:	0106b023          	sd	a6,0(a3)
ffffffffc020153a:	6398                	ld	a4,0(a5)
ffffffffc020153c:	e390                	sd	a2,0(a5)
ffffffffc020153e:	e710                	sd	a2,8(a4)
ffffffffc0201540:	f11c                	sd	a5,32(a0)
ffffffffc0201542:	ed18                	sd	a4,24(a0)
ffffffffc0201544:	00d70d63          	beq	a4,a3,ffffffffc020155e <default_free_pages+0x9e>
ffffffffc0201548:	ff872583          	lw	a1,-8(a4)
ffffffffc020154c:	fe870613          	addi	a2,a4,-24
ffffffffc0201550:	02059813          	slli	a6,a1,0x20
ffffffffc0201554:	01a85793          	srli	a5,a6,0x1a
ffffffffc0201558:	97b2                	add	a5,a5,a2
ffffffffc020155a:	02f50c63          	beq	a0,a5,ffffffffc0201592 <default_free_pages+0xd2>
ffffffffc020155e:	711c                	ld	a5,32(a0)
ffffffffc0201560:	00d78c63          	beq	a5,a3,ffffffffc0201578 <default_free_pages+0xb8>
ffffffffc0201564:	4910                	lw	a2,16(a0)
ffffffffc0201566:	fe878693          	addi	a3,a5,-24
ffffffffc020156a:	02061593          	slli	a1,a2,0x20
ffffffffc020156e:	01a5d713          	srli	a4,a1,0x1a
ffffffffc0201572:	972a                	add	a4,a4,a0
ffffffffc0201574:	04e68c63          	beq	a3,a4,ffffffffc02015cc <default_free_pages+0x10c>
ffffffffc0201578:	60a2                	ld	ra,8(sp)
ffffffffc020157a:	0141                	addi	sp,sp,16
ffffffffc020157c:	8082                	ret
ffffffffc020157e:	e790                	sd	a2,8(a5)
ffffffffc0201580:	f114                	sd	a3,32(a0)
ffffffffc0201582:	6798                	ld	a4,8(a5)
ffffffffc0201584:	ed1c                	sd	a5,24(a0)
ffffffffc0201586:	8832                	mv	a6,a2
ffffffffc0201588:	02d70f63          	beq	a4,a3,ffffffffc02015c6 <default_free_pages+0x106>
ffffffffc020158c:	4585                	li	a1,1
ffffffffc020158e:	87ba                	mv	a5,a4
ffffffffc0201590:	bf71                	j	ffffffffc020152c <default_free_pages+0x6c>
ffffffffc0201592:	491c                	lw	a5,16(a0)
ffffffffc0201594:	9fad                	addw	a5,a5,a1
ffffffffc0201596:	fef72c23          	sw	a5,-8(a4)
ffffffffc020159a:	57f5                	li	a5,-3
ffffffffc020159c:	60f8b02f          	amoand.d	zero,a5,(a7)
ffffffffc02015a0:	01853803          	ld	a6,24(a0)
ffffffffc02015a4:	710c                	ld	a1,32(a0)
ffffffffc02015a6:	8532                	mv	a0,a2
ffffffffc02015a8:	00b83423          	sd	a1,8(a6)
ffffffffc02015ac:	671c                	ld	a5,8(a4)
ffffffffc02015ae:	0105b023          	sd	a6,0(a1)
ffffffffc02015b2:	b77d                	j	ffffffffc0201560 <default_free_pages+0xa0>
ffffffffc02015b4:	60a2                	ld	ra,8(sp)
ffffffffc02015b6:	01850713          	addi	a4,a0,24
ffffffffc02015ba:	e398                	sd	a4,0(a5)
ffffffffc02015bc:	e798                	sd	a4,8(a5)
ffffffffc02015be:	f11c                	sd	a5,32(a0)
ffffffffc02015c0:	ed1c                	sd	a5,24(a0)
ffffffffc02015c2:	0141                	addi	sp,sp,16
ffffffffc02015c4:	8082                	ret
ffffffffc02015c6:	e290                	sd	a2,0(a3)
ffffffffc02015c8:	873e                	mv	a4,a5
ffffffffc02015ca:	bfad                	j	ffffffffc0201544 <default_free_pages+0x84>
ffffffffc02015cc:	ff87a703          	lw	a4,-8(a5)
ffffffffc02015d0:	ff078693          	addi	a3,a5,-16
ffffffffc02015d4:	9f31                	addw	a4,a4,a2
ffffffffc02015d6:	c918                	sw	a4,16(a0)
ffffffffc02015d8:	5775                	li	a4,-3
ffffffffc02015da:	60e6b02f          	amoand.d	zero,a4,(a3)
ffffffffc02015de:	6398                	ld	a4,0(a5)
ffffffffc02015e0:	679c                	ld	a5,8(a5)
ffffffffc02015e2:	60a2                	ld	ra,8(sp)
ffffffffc02015e4:	e71c                	sd	a5,8(a4)
ffffffffc02015e6:	e398                	sd	a4,0(a5)
ffffffffc02015e8:	0141                	addi	sp,sp,16
ffffffffc02015ea:	8082                	ret
ffffffffc02015ec:	00006697          	auipc	a3,0x6
ffffffffc02015f0:	97468693          	addi	a3,a3,-1676 # ffffffffc0206f60 <etext+0xc56>
ffffffffc02015f4:	00005617          	auipc	a2,0x5
ffffffffc02015f8:	39460613          	addi	a2,a2,916 # ffffffffc0206988 <etext+0x67e>
ffffffffc02015fc:	08300593          	li	a1,131
ffffffffc0201600:	00005517          	auipc	a0,0x5
ffffffffc0201604:	61850513          	addi	a0,a0,1560 # ffffffffc0206c18 <etext+0x90e>
ffffffffc0201608:	e71fe0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc020160c:	00006697          	auipc	a3,0x6
ffffffffc0201610:	94c68693          	addi	a3,a3,-1716 # ffffffffc0206f58 <etext+0xc4e>
ffffffffc0201614:	00005617          	auipc	a2,0x5
ffffffffc0201618:	37460613          	addi	a2,a2,884 # ffffffffc0206988 <etext+0x67e>
ffffffffc020161c:	08000593          	li	a1,128
ffffffffc0201620:	00005517          	auipc	a0,0x5
ffffffffc0201624:	5f850513          	addi	a0,a0,1528 # ffffffffc0206c18 <etext+0x90e>
ffffffffc0201628:	e51fe0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc020162c <default_alloc_pages>:
ffffffffc020162c:	c949                	beqz	a0,ffffffffc02016be <default_alloc_pages+0x92>
ffffffffc020162e:	00038617          	auipc	a2,0x38
ffffffffc0201632:	eda60613          	addi	a2,a2,-294 # ffffffffc0239508 <free_area>
ffffffffc0201636:	4a0c                	lw	a1,16(a2)
ffffffffc0201638:	872a                	mv	a4,a0
ffffffffc020163a:	02059793          	slli	a5,a1,0x20
ffffffffc020163e:	9381                	srli	a5,a5,0x20
ffffffffc0201640:	00a7eb63          	bltu	a5,a0,ffffffffc0201656 <default_alloc_pages+0x2a>
ffffffffc0201644:	87b2                	mv	a5,a2
ffffffffc0201646:	a029                	j	ffffffffc0201650 <default_alloc_pages+0x24>
ffffffffc0201648:	ff87e683          	lwu	a3,-8(a5)
ffffffffc020164c:	00e6f763          	bgeu	a3,a4,ffffffffc020165a <default_alloc_pages+0x2e>
ffffffffc0201650:	679c                	ld	a5,8(a5)
ffffffffc0201652:	fec79be3          	bne	a5,a2,ffffffffc0201648 <default_alloc_pages+0x1c>
ffffffffc0201656:	4501                	li	a0,0
ffffffffc0201658:	8082                	ret
ffffffffc020165a:	0087b883          	ld	a7,8(a5)
ffffffffc020165e:	ff87a803          	lw	a6,-8(a5)
ffffffffc0201662:	6394                	ld	a3,0(a5)
ffffffffc0201664:	fe878513          	addi	a0,a5,-24
ffffffffc0201668:	02081313          	slli	t1,a6,0x20
ffffffffc020166c:	0116b423          	sd	a7,8(a3)
ffffffffc0201670:	00d8b023          	sd	a3,0(a7)
ffffffffc0201674:	02035313          	srli	t1,t1,0x20
ffffffffc0201678:	0007089b          	sext.w	a7,a4
ffffffffc020167c:	02677963          	bgeu	a4,t1,ffffffffc02016ae <default_alloc_pages+0x82>
ffffffffc0201680:	071a                	slli	a4,a4,0x6
ffffffffc0201682:	972a                	add	a4,a4,a0
ffffffffc0201684:	4118083b          	subw	a6,a6,a7
ffffffffc0201688:	01072823          	sw	a6,16(a4)
ffffffffc020168c:	4589                	li	a1,2
ffffffffc020168e:	00870813          	addi	a6,a4,8
ffffffffc0201692:	40b8302f          	amoor.d	zero,a1,(a6)
ffffffffc0201696:	0086b803          	ld	a6,8(a3)
ffffffffc020169a:	01870313          	addi	t1,a4,24
ffffffffc020169e:	4a0c                	lw	a1,16(a2)
ffffffffc02016a0:	00683023          	sd	t1,0(a6)
ffffffffc02016a4:	0066b423          	sd	t1,8(a3)
ffffffffc02016a8:	03073023          	sd	a6,32(a4)
ffffffffc02016ac:	ef14                	sd	a3,24(a4)
ffffffffc02016ae:	411585bb          	subw	a1,a1,a7
ffffffffc02016b2:	ca0c                	sw	a1,16(a2)
ffffffffc02016b4:	5775                	li	a4,-3
ffffffffc02016b6:	17c1                	addi	a5,a5,-16
ffffffffc02016b8:	60e7b02f          	amoand.d	zero,a4,(a5)
ffffffffc02016bc:	8082                	ret
ffffffffc02016be:	1141                	addi	sp,sp,-16
ffffffffc02016c0:	00006697          	auipc	a3,0x6
ffffffffc02016c4:	89868693          	addi	a3,a3,-1896 # ffffffffc0206f58 <etext+0xc4e>
ffffffffc02016c8:	00005617          	auipc	a2,0x5
ffffffffc02016cc:	2c060613          	addi	a2,a2,704 # ffffffffc0206988 <etext+0x67e>
ffffffffc02016d0:	06200593          	li	a1,98
ffffffffc02016d4:	00005517          	auipc	a0,0x5
ffffffffc02016d8:	54450513          	addi	a0,a0,1348 # ffffffffc0206c18 <etext+0x90e>
ffffffffc02016dc:	e406                	sd	ra,8(sp)
ffffffffc02016de:	d9bfe0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc02016e2 <default_init_memmap>:
ffffffffc02016e2:	1141                	addi	sp,sp,-16
ffffffffc02016e4:	e406                	sd	ra,8(sp)
ffffffffc02016e6:	c5f1                	beqz	a1,ffffffffc02017b2 <default_init_memmap+0xd0>
ffffffffc02016e8:	00659713          	slli	a4,a1,0x6
ffffffffc02016ec:	00e506b3          	add	a3,a0,a4
ffffffffc02016f0:	87aa                	mv	a5,a0
ffffffffc02016f2:	cf11                	beqz	a4,ffffffffc020170e <default_init_memmap+0x2c>
ffffffffc02016f4:	6798                	ld	a4,8(a5)
ffffffffc02016f6:	8b05                	andi	a4,a4,1
ffffffffc02016f8:	cf49                	beqz	a4,ffffffffc0201792 <default_init_memmap+0xb0>
ffffffffc02016fa:	0007a823          	sw	zero,16(a5)
ffffffffc02016fe:	0007b423          	sd	zero,8(a5)
ffffffffc0201702:	0007a023          	sw	zero,0(a5)
ffffffffc0201706:	04078793          	addi	a5,a5,64
ffffffffc020170a:	fed795e3          	bne	a5,a3,ffffffffc02016f4 <default_init_memmap+0x12>
ffffffffc020170e:	2581                	sext.w	a1,a1
ffffffffc0201710:	c90c                	sw	a1,16(a0)
ffffffffc0201712:	4789                	li	a5,2
ffffffffc0201714:	00850713          	addi	a4,a0,8
ffffffffc0201718:	40f7302f          	amoor.d	zero,a5,(a4)
ffffffffc020171c:	00038697          	auipc	a3,0x38
ffffffffc0201720:	dec68693          	addi	a3,a3,-532 # ffffffffc0239508 <free_area>
ffffffffc0201724:	4a98                	lw	a4,16(a3)
ffffffffc0201726:	669c                	ld	a5,8(a3)
ffffffffc0201728:	9f2d                	addw	a4,a4,a1
ffffffffc020172a:	ca98                	sw	a4,16(a3)
ffffffffc020172c:	04d78663          	beq	a5,a3,ffffffffc0201778 <default_init_memmap+0x96>
ffffffffc0201730:	fe878713          	addi	a4,a5,-24
ffffffffc0201734:	4581                	li	a1,0
ffffffffc0201736:	01850613          	addi	a2,a0,24
ffffffffc020173a:	00e56a63          	bltu	a0,a4,ffffffffc020174e <default_init_memmap+0x6c>
ffffffffc020173e:	6798                	ld	a4,8(a5)
ffffffffc0201740:	02d70263          	beq	a4,a3,ffffffffc0201764 <default_init_memmap+0x82>
ffffffffc0201744:	87ba                	mv	a5,a4
ffffffffc0201746:	fe878713          	addi	a4,a5,-24
ffffffffc020174a:	fee57ae3          	bgeu	a0,a4,ffffffffc020173e <default_init_memmap+0x5c>
ffffffffc020174e:	c199                	beqz	a1,ffffffffc0201754 <default_init_memmap+0x72>
ffffffffc0201750:	0106b023          	sd	a6,0(a3)
ffffffffc0201754:	6398                	ld	a4,0(a5)
ffffffffc0201756:	60a2                	ld	ra,8(sp)
ffffffffc0201758:	e390                	sd	a2,0(a5)
ffffffffc020175a:	e710                	sd	a2,8(a4)
ffffffffc020175c:	f11c                	sd	a5,32(a0)
ffffffffc020175e:	ed18                	sd	a4,24(a0)
ffffffffc0201760:	0141                	addi	sp,sp,16
ffffffffc0201762:	8082                	ret
ffffffffc0201764:	e790                	sd	a2,8(a5)
ffffffffc0201766:	f114                	sd	a3,32(a0)
ffffffffc0201768:	6798                	ld	a4,8(a5)
ffffffffc020176a:	ed1c                	sd	a5,24(a0)
ffffffffc020176c:	8832                	mv	a6,a2
ffffffffc020176e:	00d70e63          	beq	a4,a3,ffffffffc020178a <default_init_memmap+0xa8>
ffffffffc0201772:	4585                	li	a1,1
ffffffffc0201774:	87ba                	mv	a5,a4
ffffffffc0201776:	bfc1                	j	ffffffffc0201746 <default_init_memmap+0x64>
ffffffffc0201778:	60a2                	ld	ra,8(sp)
ffffffffc020177a:	01850713          	addi	a4,a0,24
ffffffffc020177e:	e398                	sd	a4,0(a5)
ffffffffc0201780:	e798                	sd	a4,8(a5)
ffffffffc0201782:	f11c                	sd	a5,32(a0)
ffffffffc0201784:	ed1c                	sd	a5,24(a0)
ffffffffc0201786:	0141                	addi	sp,sp,16
ffffffffc0201788:	8082                	ret
ffffffffc020178a:	60a2                	ld	ra,8(sp)
ffffffffc020178c:	e290                	sd	a2,0(a3)
ffffffffc020178e:	0141                	addi	sp,sp,16
ffffffffc0201790:	8082                	ret
ffffffffc0201792:	00005697          	auipc	a3,0x5
ffffffffc0201796:	7f668693          	addi	a3,a3,2038 # ffffffffc0206f88 <etext+0xc7e>
ffffffffc020179a:	00005617          	auipc	a2,0x5
ffffffffc020179e:	1ee60613          	addi	a2,a2,494 # ffffffffc0206988 <etext+0x67e>
ffffffffc02017a2:	04900593          	li	a1,73
ffffffffc02017a6:	00005517          	auipc	a0,0x5
ffffffffc02017aa:	47250513          	addi	a0,a0,1138 # ffffffffc0206c18 <etext+0x90e>
ffffffffc02017ae:	ccbfe0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02017b2:	00005697          	auipc	a3,0x5
ffffffffc02017b6:	7a668693          	addi	a3,a3,1958 # ffffffffc0206f58 <etext+0xc4e>
ffffffffc02017ba:	00005617          	auipc	a2,0x5
ffffffffc02017be:	1ce60613          	addi	a2,a2,462 # ffffffffc0206988 <etext+0x67e>
ffffffffc02017c2:	04600593          	li	a1,70
ffffffffc02017c6:	00005517          	auipc	a0,0x5
ffffffffc02017ca:	45250513          	addi	a0,a0,1106 # ffffffffc0206c18 <etext+0x90e>
ffffffffc02017ce:	cabfe0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc02017d2 <slob_free>:
ffffffffc02017d2:	cd49                	beqz	a0,ffffffffc020186c <slob_free+0x9a>
ffffffffc02017d4:	1141                	addi	sp,sp,-16
ffffffffc02017d6:	e022                	sd	s0,0(sp)
ffffffffc02017d8:	e406                	sd	ra,8(sp)
ffffffffc02017da:	842a                	mv	s0,a0
ffffffffc02017dc:	eda1                	bnez	a1,ffffffffc0201834 <slob_free+0x62>
ffffffffc02017de:	100027f3          	csrr	a5,sstatus
ffffffffc02017e2:	8b89                	andi	a5,a5,2
ffffffffc02017e4:	4501                	li	a0,0
ffffffffc02017e6:	efb9                	bnez	a5,ffffffffc0201844 <slob_free+0x72>
ffffffffc02017e8:	00031617          	auipc	a2,0x31
ffffffffc02017ec:	91060613          	addi	a2,a2,-1776 # ffffffffc02320f8 <slobfree>
ffffffffc02017f0:	621c                	ld	a5,0(a2)
ffffffffc02017f2:	6798                	ld	a4,8(a5)
ffffffffc02017f4:	0287fa63          	bgeu	a5,s0,ffffffffc0201828 <slob_free+0x56>
ffffffffc02017f8:	00e46463          	bltu	s0,a4,ffffffffc0201800 <slob_free+0x2e>
ffffffffc02017fc:	02e7ea63          	bltu	a5,a4,ffffffffc0201830 <slob_free+0x5e>
ffffffffc0201800:	400c                	lw	a1,0(s0)
ffffffffc0201802:	00459693          	slli	a3,a1,0x4
ffffffffc0201806:	96a2                	add	a3,a3,s0
ffffffffc0201808:	04d70d63          	beq	a4,a3,ffffffffc0201862 <slob_free+0x90>
ffffffffc020180c:	438c                	lw	a1,0(a5)
ffffffffc020180e:	e418                	sd	a4,8(s0)
ffffffffc0201810:	00459693          	slli	a3,a1,0x4
ffffffffc0201814:	96be                	add	a3,a3,a5
ffffffffc0201816:	04d40063          	beq	s0,a3,ffffffffc0201856 <slob_free+0x84>
ffffffffc020181a:	e780                	sd	s0,8(a5)
ffffffffc020181c:	e21c                	sd	a5,0(a2)
ffffffffc020181e:	e51d                	bnez	a0,ffffffffc020184c <slob_free+0x7a>
ffffffffc0201820:	60a2                	ld	ra,8(sp)
ffffffffc0201822:	6402                	ld	s0,0(sp)
ffffffffc0201824:	0141                	addi	sp,sp,16
ffffffffc0201826:	8082                	ret
ffffffffc0201828:	00e7e463          	bltu	a5,a4,ffffffffc0201830 <slob_free+0x5e>
ffffffffc020182c:	fce46ae3          	bltu	s0,a4,ffffffffc0201800 <slob_free+0x2e>
ffffffffc0201830:	87ba                	mv	a5,a4
ffffffffc0201832:	b7c1                	j	ffffffffc02017f2 <slob_free+0x20>
ffffffffc0201834:	25bd                	addiw	a1,a1,15
ffffffffc0201836:	8191                	srli	a1,a1,0x4
ffffffffc0201838:	c10c                	sw	a1,0(a0)
ffffffffc020183a:	100027f3          	csrr	a5,sstatus
ffffffffc020183e:	8b89                	andi	a5,a5,2
ffffffffc0201840:	4501                	li	a0,0
ffffffffc0201842:	d3dd                	beqz	a5,ffffffffc02017e8 <slob_free+0x16>
ffffffffc0201844:	df7fe0ef          	jal	ffffffffc020063a <intr_disable>
ffffffffc0201848:	4505                	li	a0,1
ffffffffc020184a:	bf79                	j	ffffffffc02017e8 <slob_free+0x16>
ffffffffc020184c:	6402                	ld	s0,0(sp)
ffffffffc020184e:	60a2                	ld	ra,8(sp)
ffffffffc0201850:	0141                	addi	sp,sp,16
ffffffffc0201852:	de3fe06f          	j	ffffffffc0200634 <intr_enable>
ffffffffc0201856:	4014                	lw	a3,0(s0)
ffffffffc0201858:	843a                	mv	s0,a4
ffffffffc020185a:	00b6873b          	addw	a4,a3,a1
ffffffffc020185e:	c398                	sw	a4,0(a5)
ffffffffc0201860:	bf6d                	j	ffffffffc020181a <slob_free+0x48>
ffffffffc0201862:	4314                	lw	a3,0(a4)
ffffffffc0201864:	6718                	ld	a4,8(a4)
ffffffffc0201866:	9ead                	addw	a3,a3,a1
ffffffffc0201868:	c014                	sw	a3,0(s0)
ffffffffc020186a:	b74d                	j	ffffffffc020180c <slob_free+0x3a>
ffffffffc020186c:	8082                	ret

ffffffffc020186e <__slob_get_free_pages.constprop.0>:
ffffffffc020186e:	4785                	li	a5,1
ffffffffc0201870:	1141                	addi	sp,sp,-16
ffffffffc0201872:	00a7953b          	sllw	a0,a5,a0
ffffffffc0201876:	e406                	sd	ra,8(sp)
ffffffffc0201878:	34c000ef          	jal	ffffffffc0201bc4 <alloc_pages>
ffffffffc020187c:	c91d                	beqz	a0,ffffffffc02018b2 <__slob_get_free_pages.constprop.0+0x44>
ffffffffc020187e:	0003c797          	auipc	a5,0x3c
ffffffffc0201882:	dc27b783          	ld	a5,-574(a5) # ffffffffc023d640 <pages>
ffffffffc0201886:	8d1d                	sub	a0,a0,a5
ffffffffc0201888:	8519                	srai	a0,a0,0x6
ffffffffc020188a:	00008797          	auipc	a5,0x8
ffffffffc020188e:	8a67b783          	ld	a5,-1882(a5) # ffffffffc0209130 <nbase>
ffffffffc0201892:	953e                	add	a0,a0,a5
ffffffffc0201894:	00c51793          	slli	a5,a0,0xc
ffffffffc0201898:	83b1                	srli	a5,a5,0xc
ffffffffc020189a:	0003c717          	auipc	a4,0x3c
ffffffffc020189e:	d9e73703          	ld	a4,-610(a4) # ffffffffc023d638 <npage>
ffffffffc02018a2:	0532                	slli	a0,a0,0xc
ffffffffc02018a4:	00e7fa63          	bgeu	a5,a4,ffffffffc02018b8 <__slob_get_free_pages.constprop.0+0x4a>
ffffffffc02018a8:	0003c797          	auipc	a5,0x3c
ffffffffc02018ac:	d887b783          	ld	a5,-632(a5) # ffffffffc023d630 <va_pa_offset>
ffffffffc02018b0:	953e                	add	a0,a0,a5
ffffffffc02018b2:	60a2                	ld	ra,8(sp)
ffffffffc02018b4:	0141                	addi	sp,sp,16
ffffffffc02018b6:	8082                	ret
ffffffffc02018b8:	86aa                	mv	a3,a0
ffffffffc02018ba:	00005617          	auipc	a2,0x5
ffffffffc02018be:	6f660613          	addi	a2,a2,1782 # ffffffffc0206fb0 <etext+0xca6>
ffffffffc02018c2:	06900593          	li	a1,105
ffffffffc02018c6:	00005517          	auipc	a0,0x5
ffffffffc02018ca:	71250513          	addi	a0,a0,1810 # ffffffffc0206fd8 <etext+0xcce>
ffffffffc02018ce:	babfe0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc02018d2 <slob_alloc.constprop.0>:
ffffffffc02018d2:	1101                	addi	sp,sp,-32
ffffffffc02018d4:	ec06                	sd	ra,24(sp)
ffffffffc02018d6:	e822                	sd	s0,16(sp)
ffffffffc02018d8:	e426                	sd	s1,8(sp)
ffffffffc02018da:	e04a                	sd	s2,0(sp)
ffffffffc02018dc:	01050713          	addi	a4,a0,16
ffffffffc02018e0:	6785                	lui	a5,0x1
ffffffffc02018e2:	0cf77363          	bgeu	a4,a5,ffffffffc02019a8 <slob_alloc.constprop.0+0xd6>
ffffffffc02018e6:	00f50493          	addi	s1,a0,15
ffffffffc02018ea:	8091                	srli	s1,s1,0x4
ffffffffc02018ec:	2481                	sext.w	s1,s1
ffffffffc02018ee:	10002673          	csrr	a2,sstatus
ffffffffc02018f2:	8a09                	andi	a2,a2,2
ffffffffc02018f4:	e25d                	bnez	a2,ffffffffc020199a <slob_alloc.constprop.0+0xc8>
ffffffffc02018f6:	00031917          	auipc	s2,0x31
ffffffffc02018fa:	80290913          	addi	s2,s2,-2046 # ffffffffc02320f8 <slobfree>
ffffffffc02018fe:	00093683          	ld	a3,0(s2)
ffffffffc0201902:	669c                	ld	a5,8(a3)
ffffffffc0201904:	4398                	lw	a4,0(a5)
ffffffffc0201906:	08975e63          	bge	a4,s1,ffffffffc02019a2 <slob_alloc.constprop.0+0xd0>
ffffffffc020190a:	00f68b63          	beq	a3,a5,ffffffffc0201920 <slob_alloc.constprop.0+0x4e>
ffffffffc020190e:	6780                	ld	s0,8(a5)
ffffffffc0201910:	4018                	lw	a4,0(s0)
ffffffffc0201912:	02975a63          	bge	a4,s1,ffffffffc0201946 <slob_alloc.constprop.0+0x74>
ffffffffc0201916:	00093683          	ld	a3,0(s2)
ffffffffc020191a:	87a2                	mv	a5,s0
ffffffffc020191c:	fef699e3          	bne	a3,a5,ffffffffc020190e <slob_alloc.constprop.0+0x3c>
ffffffffc0201920:	ee31                	bnez	a2,ffffffffc020197c <slob_alloc.constprop.0+0xaa>
ffffffffc0201922:	4501                	li	a0,0
ffffffffc0201924:	f4bff0ef          	jal	ffffffffc020186e <__slob_get_free_pages.constprop.0>
ffffffffc0201928:	842a                	mv	s0,a0
ffffffffc020192a:	cd05                	beqz	a0,ffffffffc0201962 <slob_alloc.constprop.0+0x90>
ffffffffc020192c:	6585                	lui	a1,0x1
ffffffffc020192e:	ea5ff0ef          	jal	ffffffffc02017d2 <slob_free>
ffffffffc0201932:	10002673          	csrr	a2,sstatus
ffffffffc0201936:	8a09                	andi	a2,a2,2
ffffffffc0201938:	ee05                	bnez	a2,ffffffffc0201970 <slob_alloc.constprop.0+0x9e>
ffffffffc020193a:	00093783          	ld	a5,0(s2)
ffffffffc020193e:	6780                	ld	s0,8(a5)
ffffffffc0201940:	4018                	lw	a4,0(s0)
ffffffffc0201942:	fc974ae3          	blt	a4,s1,ffffffffc0201916 <slob_alloc.constprop.0+0x44>
ffffffffc0201946:	04e48763          	beq	s1,a4,ffffffffc0201994 <slob_alloc.constprop.0+0xc2>
ffffffffc020194a:	00449693          	slli	a3,s1,0x4
ffffffffc020194e:	96a2                	add	a3,a3,s0
ffffffffc0201950:	e794                	sd	a3,8(a5)
ffffffffc0201952:	640c                	ld	a1,8(s0)
ffffffffc0201954:	9f05                	subw	a4,a4,s1
ffffffffc0201956:	c298                	sw	a4,0(a3)
ffffffffc0201958:	e68c                	sd	a1,8(a3)
ffffffffc020195a:	c004                	sw	s1,0(s0)
ffffffffc020195c:	00f93023          	sd	a5,0(s2)
ffffffffc0201960:	e20d                	bnez	a2,ffffffffc0201982 <slob_alloc.constprop.0+0xb0>
ffffffffc0201962:	60e2                	ld	ra,24(sp)
ffffffffc0201964:	8522                	mv	a0,s0
ffffffffc0201966:	6442                	ld	s0,16(sp)
ffffffffc0201968:	64a2                	ld	s1,8(sp)
ffffffffc020196a:	6902                	ld	s2,0(sp)
ffffffffc020196c:	6105                	addi	sp,sp,32
ffffffffc020196e:	8082                	ret
ffffffffc0201970:	ccbfe0ef          	jal	ffffffffc020063a <intr_disable>
ffffffffc0201974:	00093783          	ld	a5,0(s2)
ffffffffc0201978:	4605                	li	a2,1
ffffffffc020197a:	b7d1                	j	ffffffffc020193e <slob_alloc.constprop.0+0x6c>
ffffffffc020197c:	cb9fe0ef          	jal	ffffffffc0200634 <intr_enable>
ffffffffc0201980:	b74d                	j	ffffffffc0201922 <slob_alloc.constprop.0+0x50>
ffffffffc0201982:	cb3fe0ef          	jal	ffffffffc0200634 <intr_enable>
ffffffffc0201986:	60e2                	ld	ra,24(sp)
ffffffffc0201988:	8522                	mv	a0,s0
ffffffffc020198a:	6442                	ld	s0,16(sp)
ffffffffc020198c:	64a2                	ld	s1,8(sp)
ffffffffc020198e:	6902                	ld	s2,0(sp)
ffffffffc0201990:	6105                	addi	sp,sp,32
ffffffffc0201992:	8082                	ret
ffffffffc0201994:	6418                	ld	a4,8(s0)
ffffffffc0201996:	e798                	sd	a4,8(a5)
ffffffffc0201998:	b7d1                	j	ffffffffc020195c <slob_alloc.constprop.0+0x8a>
ffffffffc020199a:	ca1fe0ef          	jal	ffffffffc020063a <intr_disable>
ffffffffc020199e:	4605                	li	a2,1
ffffffffc02019a0:	bf99                	j	ffffffffc02018f6 <slob_alloc.constprop.0+0x24>
ffffffffc02019a2:	843e                	mv	s0,a5
ffffffffc02019a4:	87b6                	mv	a5,a3
ffffffffc02019a6:	b745                	j	ffffffffc0201946 <slob_alloc.constprop.0+0x74>
ffffffffc02019a8:	00005697          	auipc	a3,0x5
ffffffffc02019ac:	64068693          	addi	a3,a3,1600 # ffffffffc0206fe8 <etext+0xcde>
ffffffffc02019b0:	00005617          	auipc	a2,0x5
ffffffffc02019b4:	fd860613          	addi	a2,a2,-40 # ffffffffc0206988 <etext+0x67e>
ffffffffc02019b8:	06400593          	li	a1,100
ffffffffc02019bc:	00005517          	auipc	a0,0x5
ffffffffc02019c0:	64c50513          	addi	a0,a0,1612 # ffffffffc0207008 <etext+0xcfe>
ffffffffc02019c4:	ab5fe0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc02019c8 <kmalloc_init>:
ffffffffc02019c8:	1141                	addi	sp,sp,-16
ffffffffc02019ca:	00005517          	auipc	a0,0x5
ffffffffc02019ce:	65650513          	addi	a0,a0,1622 # ffffffffc0207020 <etext+0xd16>
ffffffffc02019d2:	e406                	sd	ra,8(sp)
ffffffffc02019d4:	fb0fe0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02019d8:	60a2                	ld	ra,8(sp)
ffffffffc02019da:	00005517          	auipc	a0,0x5
ffffffffc02019de:	65e50513          	addi	a0,a0,1630 # ffffffffc0207038 <etext+0xd2e>
ffffffffc02019e2:	0141                	addi	sp,sp,16
ffffffffc02019e4:	fa0fe06f          	j	ffffffffc0200184 <cprintf>

ffffffffc02019e8 <kallocated>:
ffffffffc02019e8:	4501                	li	a0,0
ffffffffc02019ea:	8082                	ret

ffffffffc02019ec <kmalloc>:
ffffffffc02019ec:	1101                	addi	sp,sp,-32
ffffffffc02019ee:	6785                	lui	a5,0x1
ffffffffc02019f0:	e822                	sd	s0,16(sp)
ffffffffc02019f2:	ec06                	sd	ra,24(sp)
ffffffffc02019f4:	17bd                	addi	a5,a5,-17 # fef <_binary_obj___user_faultread_out_size-0xf01>
ffffffffc02019f6:	842a                	mv	s0,a0
ffffffffc02019f8:	04a7fa63          	bgeu	a5,a0,ffffffffc0201a4c <kmalloc+0x60>
ffffffffc02019fc:	4561                	li	a0,24
ffffffffc02019fe:	e426                	sd	s1,8(sp)
ffffffffc0201a00:	ed3ff0ef          	jal	ffffffffc02018d2 <slob_alloc.constprop.0>
ffffffffc0201a04:	84aa                	mv	s1,a0
ffffffffc0201a06:	c549                	beqz	a0,ffffffffc0201a90 <kmalloc+0xa4>
ffffffffc0201a08:	e04a                	sd	s2,0(sp)
ffffffffc0201a0a:	0004079b          	sext.w	a5,s0
ffffffffc0201a0e:	6905                	lui	s2,0x1
ffffffffc0201a10:	4501                	li	a0,0
ffffffffc0201a12:	00f95763          	bge	s2,a5,ffffffffc0201a20 <kmalloc+0x34>
ffffffffc0201a16:	6705                	lui	a4,0x1
ffffffffc0201a18:	8785                	srai	a5,a5,0x1
ffffffffc0201a1a:	2505                	addiw	a0,a0,1
ffffffffc0201a1c:	fef74ee3          	blt	a4,a5,ffffffffc0201a18 <kmalloc+0x2c>
ffffffffc0201a20:	c088                	sw	a0,0(s1)
ffffffffc0201a22:	e4dff0ef          	jal	ffffffffc020186e <__slob_get_free_pages.constprop.0>
ffffffffc0201a26:	e488                	sd	a0,8(s1)
ffffffffc0201a28:	cd21                	beqz	a0,ffffffffc0201a80 <kmalloc+0x94>
ffffffffc0201a2a:	100027f3          	csrr	a5,sstatus
ffffffffc0201a2e:	8b89                	andi	a5,a5,2
ffffffffc0201a30:	e795                	bnez	a5,ffffffffc0201a5c <kmalloc+0x70>
ffffffffc0201a32:	0003c797          	auipc	a5,0x3c
ffffffffc0201a36:	bde78793          	addi	a5,a5,-1058 # ffffffffc023d610 <bigblocks>
ffffffffc0201a3a:	6398                	ld	a4,0(a5)
ffffffffc0201a3c:	6902                	ld	s2,0(sp)
ffffffffc0201a3e:	e384                	sd	s1,0(a5)
ffffffffc0201a40:	e898                	sd	a4,16(s1)
ffffffffc0201a42:	64a2                	ld	s1,8(sp)
ffffffffc0201a44:	60e2                	ld	ra,24(sp)
ffffffffc0201a46:	6442                	ld	s0,16(sp)
ffffffffc0201a48:	6105                	addi	sp,sp,32
ffffffffc0201a4a:	8082                	ret
ffffffffc0201a4c:	0541                	addi	a0,a0,16
ffffffffc0201a4e:	e85ff0ef          	jal	ffffffffc02018d2 <slob_alloc.constprop.0>
ffffffffc0201a52:	87aa                	mv	a5,a0
ffffffffc0201a54:	0541                	addi	a0,a0,16
ffffffffc0201a56:	f7fd                	bnez	a5,ffffffffc0201a44 <kmalloc+0x58>
ffffffffc0201a58:	4501                	li	a0,0
ffffffffc0201a5a:	b7ed                	j	ffffffffc0201a44 <kmalloc+0x58>
ffffffffc0201a5c:	bdffe0ef          	jal	ffffffffc020063a <intr_disable>
ffffffffc0201a60:	0003c797          	auipc	a5,0x3c
ffffffffc0201a64:	bb078793          	addi	a5,a5,-1104 # ffffffffc023d610 <bigblocks>
ffffffffc0201a68:	6398                	ld	a4,0(a5)
ffffffffc0201a6a:	e384                	sd	s1,0(a5)
ffffffffc0201a6c:	e898                	sd	a4,16(s1)
ffffffffc0201a6e:	bc7fe0ef          	jal	ffffffffc0200634 <intr_enable>
ffffffffc0201a72:	60e2                	ld	ra,24(sp)
ffffffffc0201a74:	6442                	ld	s0,16(sp)
ffffffffc0201a76:	6488                	ld	a0,8(s1)
ffffffffc0201a78:	6902                	ld	s2,0(sp)
ffffffffc0201a7a:	64a2                	ld	s1,8(sp)
ffffffffc0201a7c:	6105                	addi	sp,sp,32
ffffffffc0201a7e:	8082                	ret
ffffffffc0201a80:	8526                	mv	a0,s1
ffffffffc0201a82:	45e1                	li	a1,24
ffffffffc0201a84:	d4fff0ef          	jal	ffffffffc02017d2 <slob_free>
ffffffffc0201a88:	4501                	li	a0,0
ffffffffc0201a8a:	64a2                	ld	s1,8(sp)
ffffffffc0201a8c:	6902                	ld	s2,0(sp)
ffffffffc0201a8e:	bf5d                	j	ffffffffc0201a44 <kmalloc+0x58>
ffffffffc0201a90:	64a2                	ld	s1,8(sp)
ffffffffc0201a92:	4501                	li	a0,0
ffffffffc0201a94:	bf45                	j	ffffffffc0201a44 <kmalloc+0x58>

ffffffffc0201a96 <kfree>:
ffffffffc0201a96:	c169                	beqz	a0,ffffffffc0201b58 <kfree+0xc2>
ffffffffc0201a98:	1101                	addi	sp,sp,-32
ffffffffc0201a9a:	e822                	sd	s0,16(sp)
ffffffffc0201a9c:	ec06                	sd	ra,24(sp)
ffffffffc0201a9e:	03451793          	slli	a5,a0,0x34
ffffffffc0201aa2:	842a                	mv	s0,a0
ffffffffc0201aa4:	e7c9                	bnez	a5,ffffffffc0201b2e <kfree+0x98>
ffffffffc0201aa6:	100027f3          	csrr	a5,sstatus
ffffffffc0201aaa:	8b89                	andi	a5,a5,2
ffffffffc0201aac:	ebc1                	bnez	a5,ffffffffc0201b3c <kfree+0xa6>
ffffffffc0201aae:	0003c797          	auipc	a5,0x3c
ffffffffc0201ab2:	b627b783          	ld	a5,-1182(a5) # ffffffffc023d610 <bigblocks>
ffffffffc0201ab6:	4601                	li	a2,0
ffffffffc0201ab8:	cbbd                	beqz	a5,ffffffffc0201b2e <kfree+0x98>
ffffffffc0201aba:	e426                	sd	s1,8(sp)
ffffffffc0201abc:	0003c697          	auipc	a3,0x3c
ffffffffc0201ac0:	b5468693          	addi	a3,a3,-1196 # ffffffffc023d610 <bigblocks>
ffffffffc0201ac4:	a021                	j	ffffffffc0201acc <kfree+0x36>
ffffffffc0201ac6:	01048693          	addi	a3,s1,16
ffffffffc0201aca:	c3a5                	beqz	a5,ffffffffc0201b2a <kfree+0x94>
ffffffffc0201acc:	6798                	ld	a4,8(a5)
ffffffffc0201ace:	84be                	mv	s1,a5
ffffffffc0201ad0:	6b9c                	ld	a5,16(a5)
ffffffffc0201ad2:	fe871ae3          	bne	a4,s0,ffffffffc0201ac6 <kfree+0x30>
ffffffffc0201ad6:	e29c                	sd	a5,0(a3)
ffffffffc0201ad8:	ee2d                	bnez	a2,ffffffffc0201b52 <kfree+0xbc>
ffffffffc0201ada:	c02007b7          	lui	a5,0xc0200
ffffffffc0201ade:	4098                	lw	a4,0(s1)
ffffffffc0201ae0:	08f46963          	bltu	s0,a5,ffffffffc0201b72 <kfree+0xdc>
ffffffffc0201ae4:	0003c797          	auipc	a5,0x3c
ffffffffc0201ae8:	b4c7b783          	ld	a5,-1204(a5) # ffffffffc023d630 <va_pa_offset>
ffffffffc0201aec:	8c1d                	sub	s0,s0,a5
ffffffffc0201aee:	8031                	srli	s0,s0,0xc
ffffffffc0201af0:	0003c797          	auipc	a5,0x3c
ffffffffc0201af4:	b487b783          	ld	a5,-1208(a5) # ffffffffc023d638 <npage>
ffffffffc0201af8:	06f47163          	bgeu	s0,a5,ffffffffc0201b5a <kfree+0xc4>
ffffffffc0201afc:	00007797          	auipc	a5,0x7
ffffffffc0201b00:	6347b783          	ld	a5,1588(a5) # ffffffffc0209130 <nbase>
ffffffffc0201b04:	8c1d                	sub	s0,s0,a5
ffffffffc0201b06:	041a                	slli	s0,s0,0x6
ffffffffc0201b08:	0003c517          	auipc	a0,0x3c
ffffffffc0201b0c:	b3853503          	ld	a0,-1224(a0) # ffffffffc023d640 <pages>
ffffffffc0201b10:	4585                	li	a1,1
ffffffffc0201b12:	9522                	add	a0,a0,s0
ffffffffc0201b14:	00e595bb          	sllw	a1,a1,a4
ffffffffc0201b18:	13c000ef          	jal	ffffffffc0201c54 <free_pages>
ffffffffc0201b1c:	6442                	ld	s0,16(sp)
ffffffffc0201b1e:	60e2                	ld	ra,24(sp)
ffffffffc0201b20:	8526                	mv	a0,s1
ffffffffc0201b22:	64a2                	ld	s1,8(sp)
ffffffffc0201b24:	45e1                	li	a1,24
ffffffffc0201b26:	6105                	addi	sp,sp,32
ffffffffc0201b28:	b16d                	j	ffffffffc02017d2 <slob_free>
ffffffffc0201b2a:	64a2                	ld	s1,8(sp)
ffffffffc0201b2c:	e205                	bnez	a2,ffffffffc0201b4c <kfree+0xb6>
ffffffffc0201b2e:	ff040513          	addi	a0,s0,-16
ffffffffc0201b32:	6442                	ld	s0,16(sp)
ffffffffc0201b34:	60e2                	ld	ra,24(sp)
ffffffffc0201b36:	4581                	li	a1,0
ffffffffc0201b38:	6105                	addi	sp,sp,32
ffffffffc0201b3a:	b961                	j	ffffffffc02017d2 <slob_free>
ffffffffc0201b3c:	afffe0ef          	jal	ffffffffc020063a <intr_disable>
ffffffffc0201b40:	0003c797          	auipc	a5,0x3c
ffffffffc0201b44:	ad07b783          	ld	a5,-1328(a5) # ffffffffc023d610 <bigblocks>
ffffffffc0201b48:	4605                	li	a2,1
ffffffffc0201b4a:	fba5                	bnez	a5,ffffffffc0201aba <kfree+0x24>
ffffffffc0201b4c:	ae9fe0ef          	jal	ffffffffc0200634 <intr_enable>
ffffffffc0201b50:	bff9                	j	ffffffffc0201b2e <kfree+0x98>
ffffffffc0201b52:	ae3fe0ef          	jal	ffffffffc0200634 <intr_enable>
ffffffffc0201b56:	b751                	j	ffffffffc0201ada <kfree+0x44>
ffffffffc0201b58:	8082                	ret
ffffffffc0201b5a:	00005617          	auipc	a2,0x5
ffffffffc0201b5e:	52660613          	addi	a2,a2,1318 # ffffffffc0207080 <etext+0xd76>
ffffffffc0201b62:	06200593          	li	a1,98
ffffffffc0201b66:	00005517          	auipc	a0,0x5
ffffffffc0201b6a:	47250513          	addi	a0,a0,1138 # ffffffffc0206fd8 <etext+0xcce>
ffffffffc0201b6e:	90bfe0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0201b72:	86a2                	mv	a3,s0
ffffffffc0201b74:	00005617          	auipc	a2,0x5
ffffffffc0201b78:	4e460613          	addi	a2,a2,1252 # ffffffffc0207058 <etext+0xd4e>
ffffffffc0201b7c:	06e00593          	li	a1,110
ffffffffc0201b80:	00005517          	auipc	a0,0x5
ffffffffc0201b84:	45850513          	addi	a0,a0,1112 # ffffffffc0206fd8 <etext+0xcce>
ffffffffc0201b88:	8f1fe0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc0201b8c <pa2page.part.0>:
ffffffffc0201b8c:	1141                	addi	sp,sp,-16
ffffffffc0201b8e:	00005617          	auipc	a2,0x5
ffffffffc0201b92:	4f260613          	addi	a2,a2,1266 # ffffffffc0207080 <etext+0xd76>
ffffffffc0201b96:	06200593          	li	a1,98
ffffffffc0201b9a:	00005517          	auipc	a0,0x5
ffffffffc0201b9e:	43e50513          	addi	a0,a0,1086 # ffffffffc0206fd8 <etext+0xcce>
ffffffffc0201ba2:	e406                	sd	ra,8(sp)
ffffffffc0201ba4:	8d5fe0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc0201ba8 <pte2page.part.0>:
ffffffffc0201ba8:	1141                	addi	sp,sp,-16
ffffffffc0201baa:	00005617          	auipc	a2,0x5
ffffffffc0201bae:	4f660613          	addi	a2,a2,1270 # ffffffffc02070a0 <etext+0xd96>
ffffffffc0201bb2:	07400593          	li	a1,116
ffffffffc0201bb6:	00005517          	auipc	a0,0x5
ffffffffc0201bba:	42250513          	addi	a0,a0,1058 # ffffffffc0206fd8 <etext+0xcce>
ffffffffc0201bbe:	e406                	sd	ra,8(sp)
ffffffffc0201bc0:	8b9fe0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc0201bc4 <alloc_pages>:
ffffffffc0201bc4:	7139                	addi	sp,sp,-64
ffffffffc0201bc6:	f426                	sd	s1,40(sp)
ffffffffc0201bc8:	f04a                	sd	s2,32(sp)
ffffffffc0201bca:	ec4e                	sd	s3,24(sp)
ffffffffc0201bcc:	e852                	sd	s4,16(sp)
ffffffffc0201bce:	e456                	sd	s5,8(sp)
ffffffffc0201bd0:	e05a                	sd	s6,0(sp)
ffffffffc0201bd2:	fc06                	sd	ra,56(sp)
ffffffffc0201bd4:	f822                	sd	s0,48(sp)
ffffffffc0201bd6:	84aa                	mv	s1,a0
ffffffffc0201bd8:	0003c917          	auipc	s2,0x3c
ffffffffc0201bdc:	a4090913          	addi	s2,s2,-1472 # ffffffffc023d618 <pmm_manager>
ffffffffc0201be0:	4a05                	li	s4,1
ffffffffc0201be2:	0003ca97          	auipc	s5,0x3c
ffffffffc0201be6:	a66a8a93          	addi	s5,s5,-1434 # ffffffffc023d648 <swap_init_ok>
ffffffffc0201bea:	0005099b          	sext.w	s3,a0
ffffffffc0201bee:	0003cb17          	auipc	s6,0x3c
ffffffffc0201bf2:	a7ab0b13          	addi	s6,s6,-1414 # ffffffffc023d668 <check_mm_struct>
ffffffffc0201bf6:	a015                	j	ffffffffc0201c1a <alloc_pages+0x56>
ffffffffc0201bf8:	00093783          	ld	a5,0(s2)
ffffffffc0201bfc:	6f9c                	ld	a5,24(a5)
ffffffffc0201bfe:	9782                	jalr	a5
ffffffffc0201c00:	842a                	mv	s0,a0
ffffffffc0201c02:	4601                	li	a2,0
ffffffffc0201c04:	85ce                	mv	a1,s3
ffffffffc0201c06:	ec05                	bnez	s0,ffffffffc0201c3e <alloc_pages+0x7a>
ffffffffc0201c08:	029a6b63          	bltu	s4,s1,ffffffffc0201c3e <alloc_pages+0x7a>
ffffffffc0201c0c:	000aa783          	lw	a5,0(s5)
ffffffffc0201c10:	c79d                	beqz	a5,ffffffffc0201c3e <alloc_pages+0x7a>
ffffffffc0201c12:	000b3503          	ld	a0,0(s6)
ffffffffc0201c16:	259010ef          	jal	ffffffffc020366e <swap_out>
ffffffffc0201c1a:	100027f3          	csrr	a5,sstatus
ffffffffc0201c1e:	8b89                	andi	a5,a5,2
ffffffffc0201c20:	8526                	mv	a0,s1
ffffffffc0201c22:	dbf9                	beqz	a5,ffffffffc0201bf8 <alloc_pages+0x34>
ffffffffc0201c24:	a17fe0ef          	jal	ffffffffc020063a <intr_disable>
ffffffffc0201c28:	00093783          	ld	a5,0(s2)
ffffffffc0201c2c:	8526                	mv	a0,s1
ffffffffc0201c2e:	6f9c                	ld	a5,24(a5)
ffffffffc0201c30:	9782                	jalr	a5
ffffffffc0201c32:	842a                	mv	s0,a0
ffffffffc0201c34:	a01fe0ef          	jal	ffffffffc0200634 <intr_enable>
ffffffffc0201c38:	4601                	li	a2,0
ffffffffc0201c3a:	85ce                	mv	a1,s3
ffffffffc0201c3c:	d471                	beqz	s0,ffffffffc0201c08 <alloc_pages+0x44>
ffffffffc0201c3e:	70e2                	ld	ra,56(sp)
ffffffffc0201c40:	8522                	mv	a0,s0
ffffffffc0201c42:	7442                	ld	s0,48(sp)
ffffffffc0201c44:	74a2                	ld	s1,40(sp)
ffffffffc0201c46:	7902                	ld	s2,32(sp)
ffffffffc0201c48:	69e2                	ld	s3,24(sp)
ffffffffc0201c4a:	6a42                	ld	s4,16(sp)
ffffffffc0201c4c:	6aa2                	ld	s5,8(sp)
ffffffffc0201c4e:	6b02                	ld	s6,0(sp)
ffffffffc0201c50:	6121                	addi	sp,sp,64
ffffffffc0201c52:	8082                	ret

ffffffffc0201c54 <free_pages>:
ffffffffc0201c54:	100027f3          	csrr	a5,sstatus
ffffffffc0201c58:	8b89                	andi	a5,a5,2
ffffffffc0201c5a:	e799                	bnez	a5,ffffffffc0201c68 <free_pages+0x14>
ffffffffc0201c5c:	0003c797          	auipc	a5,0x3c
ffffffffc0201c60:	9bc7b783          	ld	a5,-1604(a5) # ffffffffc023d618 <pmm_manager>
ffffffffc0201c64:	739c                	ld	a5,32(a5)
ffffffffc0201c66:	8782                	jr	a5
ffffffffc0201c68:	1101                	addi	sp,sp,-32
ffffffffc0201c6a:	ec06                	sd	ra,24(sp)
ffffffffc0201c6c:	e822                	sd	s0,16(sp)
ffffffffc0201c6e:	e426                	sd	s1,8(sp)
ffffffffc0201c70:	842a                	mv	s0,a0
ffffffffc0201c72:	84ae                	mv	s1,a1
ffffffffc0201c74:	9c7fe0ef          	jal	ffffffffc020063a <intr_disable>
ffffffffc0201c78:	0003c797          	auipc	a5,0x3c
ffffffffc0201c7c:	9a07b783          	ld	a5,-1632(a5) # ffffffffc023d618 <pmm_manager>
ffffffffc0201c80:	739c                	ld	a5,32(a5)
ffffffffc0201c82:	85a6                	mv	a1,s1
ffffffffc0201c84:	8522                	mv	a0,s0
ffffffffc0201c86:	9782                	jalr	a5
ffffffffc0201c88:	6442                	ld	s0,16(sp)
ffffffffc0201c8a:	60e2                	ld	ra,24(sp)
ffffffffc0201c8c:	64a2                	ld	s1,8(sp)
ffffffffc0201c8e:	6105                	addi	sp,sp,32
ffffffffc0201c90:	9a5fe06f          	j	ffffffffc0200634 <intr_enable>

ffffffffc0201c94 <nr_free_pages>:
ffffffffc0201c94:	100027f3          	csrr	a5,sstatus
ffffffffc0201c98:	8b89                	andi	a5,a5,2
ffffffffc0201c9a:	e799                	bnez	a5,ffffffffc0201ca8 <nr_free_pages+0x14>
ffffffffc0201c9c:	0003c797          	auipc	a5,0x3c
ffffffffc0201ca0:	97c7b783          	ld	a5,-1668(a5) # ffffffffc023d618 <pmm_manager>
ffffffffc0201ca4:	779c                	ld	a5,40(a5)
ffffffffc0201ca6:	8782                	jr	a5
ffffffffc0201ca8:	1141                	addi	sp,sp,-16
ffffffffc0201caa:	e406                	sd	ra,8(sp)
ffffffffc0201cac:	e022                	sd	s0,0(sp)
ffffffffc0201cae:	98dfe0ef          	jal	ffffffffc020063a <intr_disable>
ffffffffc0201cb2:	0003c797          	auipc	a5,0x3c
ffffffffc0201cb6:	9667b783          	ld	a5,-1690(a5) # ffffffffc023d618 <pmm_manager>
ffffffffc0201cba:	779c                	ld	a5,40(a5)
ffffffffc0201cbc:	9782                	jalr	a5
ffffffffc0201cbe:	842a                	mv	s0,a0
ffffffffc0201cc0:	975fe0ef          	jal	ffffffffc0200634 <intr_enable>
ffffffffc0201cc4:	60a2                	ld	ra,8(sp)
ffffffffc0201cc6:	8522                	mv	a0,s0
ffffffffc0201cc8:	6402                	ld	s0,0(sp)
ffffffffc0201cca:	0141                	addi	sp,sp,16
ffffffffc0201ccc:	8082                	ret

ffffffffc0201cce <get_pte>:
ffffffffc0201cce:	01e5d793          	srli	a5,a1,0x1e
ffffffffc0201cd2:	1ff7f793          	andi	a5,a5,511
ffffffffc0201cd6:	7139                	addi	sp,sp,-64
ffffffffc0201cd8:	078e                	slli	a5,a5,0x3
ffffffffc0201cda:	f426                	sd	s1,40(sp)
ffffffffc0201cdc:	00f504b3          	add	s1,a0,a5
ffffffffc0201ce0:	6094                	ld	a3,0(s1)
ffffffffc0201ce2:	f04a                	sd	s2,32(sp)
ffffffffc0201ce4:	ec4e                	sd	s3,24(sp)
ffffffffc0201ce6:	e852                	sd	s4,16(sp)
ffffffffc0201ce8:	fc06                	sd	ra,56(sp)
ffffffffc0201cea:	f822                	sd	s0,48(sp)
ffffffffc0201cec:	e456                	sd	s5,8(sp)
ffffffffc0201cee:	0016f793          	andi	a5,a3,1
ffffffffc0201cf2:	892e                	mv	s2,a1
ffffffffc0201cf4:	89b2                	mv	s3,a2
ffffffffc0201cf6:	0003ca17          	auipc	s4,0x3c
ffffffffc0201cfa:	942a0a13          	addi	s4,s4,-1726 # ffffffffc023d638 <npage>
ffffffffc0201cfe:	eba5                	bnez	a5,ffffffffc0201d6e <get_pte+0xa0>
ffffffffc0201d00:	12060e63          	beqz	a2,ffffffffc0201e3c <get_pte+0x16e>
ffffffffc0201d04:	4505                	li	a0,1
ffffffffc0201d06:	ebfff0ef          	jal	ffffffffc0201bc4 <alloc_pages>
ffffffffc0201d0a:	842a                	mv	s0,a0
ffffffffc0201d0c:	12050863          	beqz	a0,ffffffffc0201e3c <get_pte+0x16e>
ffffffffc0201d10:	e05a                	sd	s6,0(sp)
ffffffffc0201d12:	0003cb17          	auipc	s6,0x3c
ffffffffc0201d16:	92eb0b13          	addi	s6,s6,-1746 # ffffffffc023d640 <pages>
ffffffffc0201d1a:	000b3503          	ld	a0,0(s6)
ffffffffc0201d1e:	00080ab7          	lui	s5,0x80
ffffffffc0201d22:	0003ca17          	auipc	s4,0x3c
ffffffffc0201d26:	916a0a13          	addi	s4,s4,-1770 # ffffffffc023d638 <npage>
ffffffffc0201d2a:	40a40533          	sub	a0,s0,a0
ffffffffc0201d2e:	8519                	srai	a0,a0,0x6
ffffffffc0201d30:	9556                	add	a0,a0,s5
ffffffffc0201d32:	000a3703          	ld	a4,0(s4)
ffffffffc0201d36:	00c51793          	slli	a5,a0,0xc
ffffffffc0201d3a:	4685                	li	a3,1
ffffffffc0201d3c:	c014                	sw	a3,0(s0)
ffffffffc0201d3e:	83b1                	srli	a5,a5,0xc
ffffffffc0201d40:	0532                	slli	a0,a0,0xc
ffffffffc0201d42:	14e7f563          	bgeu	a5,a4,ffffffffc0201e8c <get_pte+0x1be>
ffffffffc0201d46:	0003c797          	auipc	a5,0x3c
ffffffffc0201d4a:	8ea7b783          	ld	a5,-1814(a5) # ffffffffc023d630 <va_pa_offset>
ffffffffc0201d4e:	953e                	add	a0,a0,a5
ffffffffc0201d50:	6605                	lui	a2,0x1
ffffffffc0201d52:	4581                	li	a1,0
ffffffffc0201d54:	58c040ef          	jal	ffffffffc02062e0 <memset>
ffffffffc0201d58:	000b3783          	ld	a5,0(s6)
ffffffffc0201d5c:	6b02                	ld	s6,0(sp)
ffffffffc0201d5e:	40f406b3          	sub	a3,s0,a5
ffffffffc0201d62:	8699                	srai	a3,a3,0x6
ffffffffc0201d64:	96d6                	add	a3,a3,s5
ffffffffc0201d66:	06aa                	slli	a3,a3,0xa
ffffffffc0201d68:	0116e693          	ori	a3,a3,17
ffffffffc0201d6c:	e094                	sd	a3,0(s1)
ffffffffc0201d6e:	77fd                	lui	a5,0xfffff
ffffffffc0201d70:	068a                	slli	a3,a3,0x2
ffffffffc0201d72:	000a3703          	ld	a4,0(s4)
ffffffffc0201d76:	8efd                	and	a3,a3,a5
ffffffffc0201d78:	00c6d793          	srli	a5,a3,0xc
ffffffffc0201d7c:	0ce7f263          	bgeu	a5,a4,ffffffffc0201e40 <get_pte+0x172>
ffffffffc0201d80:	0003ca97          	auipc	s5,0x3c
ffffffffc0201d84:	8b0a8a93          	addi	s5,s5,-1872 # ffffffffc023d630 <va_pa_offset>
ffffffffc0201d88:	000ab603          	ld	a2,0(s5)
ffffffffc0201d8c:	01595793          	srli	a5,s2,0x15
ffffffffc0201d90:	1ff7f793          	andi	a5,a5,511
ffffffffc0201d94:	96b2                	add	a3,a3,a2
ffffffffc0201d96:	078e                	slli	a5,a5,0x3
ffffffffc0201d98:	00f68433          	add	s0,a3,a5
ffffffffc0201d9c:	6014                	ld	a3,0(s0)
ffffffffc0201d9e:	0016f793          	andi	a5,a3,1
ffffffffc0201da2:	e3bd                	bnez	a5,ffffffffc0201e08 <get_pte+0x13a>
ffffffffc0201da4:	08098c63          	beqz	s3,ffffffffc0201e3c <get_pte+0x16e>
ffffffffc0201da8:	4505                	li	a0,1
ffffffffc0201daa:	e1bff0ef          	jal	ffffffffc0201bc4 <alloc_pages>
ffffffffc0201dae:	84aa                	mv	s1,a0
ffffffffc0201db0:	c551                	beqz	a0,ffffffffc0201e3c <get_pte+0x16e>
ffffffffc0201db2:	e05a                	sd	s6,0(sp)
ffffffffc0201db4:	0003cb17          	auipc	s6,0x3c
ffffffffc0201db8:	88cb0b13          	addi	s6,s6,-1908 # ffffffffc023d640 <pages>
ffffffffc0201dbc:	000b3683          	ld	a3,0(s6)
ffffffffc0201dc0:	000809b7          	lui	s3,0x80
ffffffffc0201dc4:	000a3703          	ld	a4,0(s4)
ffffffffc0201dc8:	40d506b3          	sub	a3,a0,a3
ffffffffc0201dcc:	8699                	srai	a3,a3,0x6
ffffffffc0201dce:	96ce                	add	a3,a3,s3
ffffffffc0201dd0:	00c69793          	slli	a5,a3,0xc
ffffffffc0201dd4:	4605                	li	a2,1
ffffffffc0201dd6:	c110                	sw	a2,0(a0)
ffffffffc0201dd8:	83b1                	srli	a5,a5,0xc
ffffffffc0201dda:	06b2                	slli	a3,a3,0xc
ffffffffc0201ddc:	08e7fc63          	bgeu	a5,a4,ffffffffc0201e74 <get_pte+0x1a6>
ffffffffc0201de0:	000ab503          	ld	a0,0(s5)
ffffffffc0201de4:	6605                	lui	a2,0x1
ffffffffc0201de6:	4581                	li	a1,0
ffffffffc0201de8:	9536                	add	a0,a0,a3
ffffffffc0201dea:	4f6040ef          	jal	ffffffffc02062e0 <memset>
ffffffffc0201dee:	000b3783          	ld	a5,0(s6)
ffffffffc0201df2:	6b02                	ld	s6,0(sp)
ffffffffc0201df4:	40f486b3          	sub	a3,s1,a5
ffffffffc0201df8:	8699                	srai	a3,a3,0x6
ffffffffc0201dfa:	96ce                	add	a3,a3,s3
ffffffffc0201dfc:	06aa                	slli	a3,a3,0xa
ffffffffc0201dfe:	0116e693          	ori	a3,a3,17
ffffffffc0201e02:	e014                	sd	a3,0(s0)
ffffffffc0201e04:	000a3703          	ld	a4,0(s4)
ffffffffc0201e08:	77fd                	lui	a5,0xfffff
ffffffffc0201e0a:	068a                	slli	a3,a3,0x2
ffffffffc0201e0c:	8efd                	and	a3,a3,a5
ffffffffc0201e0e:	00c6d793          	srli	a5,a3,0xc
ffffffffc0201e12:	04e7f463          	bgeu	a5,a4,ffffffffc0201e5a <get_pte+0x18c>
ffffffffc0201e16:	000ab783          	ld	a5,0(s5)
ffffffffc0201e1a:	00c95913          	srli	s2,s2,0xc
ffffffffc0201e1e:	1ff97913          	andi	s2,s2,511
ffffffffc0201e22:	96be                	add	a3,a3,a5
ffffffffc0201e24:	090e                	slli	s2,s2,0x3
ffffffffc0201e26:	01268533          	add	a0,a3,s2
ffffffffc0201e2a:	70e2                	ld	ra,56(sp)
ffffffffc0201e2c:	7442                	ld	s0,48(sp)
ffffffffc0201e2e:	74a2                	ld	s1,40(sp)
ffffffffc0201e30:	7902                	ld	s2,32(sp)
ffffffffc0201e32:	69e2                	ld	s3,24(sp)
ffffffffc0201e34:	6a42                	ld	s4,16(sp)
ffffffffc0201e36:	6aa2                	ld	s5,8(sp)
ffffffffc0201e38:	6121                	addi	sp,sp,64
ffffffffc0201e3a:	8082                	ret
ffffffffc0201e3c:	4501                	li	a0,0
ffffffffc0201e3e:	b7f5                	j	ffffffffc0201e2a <get_pte+0x15c>
ffffffffc0201e40:	00005617          	auipc	a2,0x5
ffffffffc0201e44:	17060613          	addi	a2,a2,368 # ffffffffc0206fb0 <etext+0xca6>
ffffffffc0201e48:	0fe00593          	li	a1,254
ffffffffc0201e4c:	00005517          	auipc	a0,0x5
ffffffffc0201e50:	27c50513          	addi	a0,a0,636 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0201e54:	e05a                	sd	s6,0(sp)
ffffffffc0201e56:	e22fe0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0201e5a:	00005617          	auipc	a2,0x5
ffffffffc0201e5e:	15660613          	addi	a2,a2,342 # ffffffffc0206fb0 <etext+0xca6>
ffffffffc0201e62:	10900593          	li	a1,265
ffffffffc0201e66:	00005517          	auipc	a0,0x5
ffffffffc0201e6a:	26250513          	addi	a0,a0,610 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0201e6e:	e05a                	sd	s6,0(sp)
ffffffffc0201e70:	e08fe0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0201e74:	00005617          	auipc	a2,0x5
ffffffffc0201e78:	13c60613          	addi	a2,a2,316 # ffffffffc0206fb0 <etext+0xca6>
ffffffffc0201e7c:	10600593          	li	a1,262
ffffffffc0201e80:	00005517          	auipc	a0,0x5
ffffffffc0201e84:	24850513          	addi	a0,a0,584 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0201e88:	df0fe0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0201e8c:	86aa                	mv	a3,a0
ffffffffc0201e8e:	00005617          	auipc	a2,0x5
ffffffffc0201e92:	12260613          	addi	a2,a2,290 # ffffffffc0206fb0 <etext+0xca6>
ffffffffc0201e96:	0fa00593          	li	a1,250
ffffffffc0201e9a:	00005517          	auipc	a0,0x5
ffffffffc0201e9e:	22e50513          	addi	a0,a0,558 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0201ea2:	dd6fe0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc0201ea6 <get_page>:
ffffffffc0201ea6:	1141                	addi	sp,sp,-16
ffffffffc0201ea8:	e022                	sd	s0,0(sp)
ffffffffc0201eaa:	8432                	mv	s0,a2
ffffffffc0201eac:	4601                	li	a2,0
ffffffffc0201eae:	e406                	sd	ra,8(sp)
ffffffffc0201eb0:	e1fff0ef          	jal	ffffffffc0201cce <get_pte>
ffffffffc0201eb4:	c011                	beqz	s0,ffffffffc0201eb8 <get_page+0x12>
ffffffffc0201eb6:	e008                	sd	a0,0(s0)
ffffffffc0201eb8:	c511                	beqz	a0,ffffffffc0201ec4 <get_page+0x1e>
ffffffffc0201eba:	611c                	ld	a5,0(a0)
ffffffffc0201ebc:	4501                	li	a0,0
ffffffffc0201ebe:	0017f713          	andi	a4,a5,1
ffffffffc0201ec2:	e709                	bnez	a4,ffffffffc0201ecc <get_page+0x26>
ffffffffc0201ec4:	60a2                	ld	ra,8(sp)
ffffffffc0201ec6:	6402                	ld	s0,0(sp)
ffffffffc0201ec8:	0141                	addi	sp,sp,16
ffffffffc0201eca:	8082                	ret
ffffffffc0201ecc:	078a                	slli	a5,a5,0x2
ffffffffc0201ece:	83b1                	srli	a5,a5,0xc
ffffffffc0201ed0:	0003b717          	auipc	a4,0x3b
ffffffffc0201ed4:	76873703          	ld	a4,1896(a4) # ffffffffc023d638 <npage>
ffffffffc0201ed8:	00e7ff63          	bgeu	a5,a4,ffffffffc0201ef6 <get_page+0x50>
ffffffffc0201edc:	60a2                	ld	ra,8(sp)
ffffffffc0201ede:	6402                	ld	s0,0(sp)
ffffffffc0201ee0:	fff80737          	lui	a4,0xfff80
ffffffffc0201ee4:	97ba                	add	a5,a5,a4
ffffffffc0201ee6:	0003b517          	auipc	a0,0x3b
ffffffffc0201eea:	75a53503          	ld	a0,1882(a0) # ffffffffc023d640 <pages>
ffffffffc0201eee:	079a                	slli	a5,a5,0x6
ffffffffc0201ef0:	953e                	add	a0,a0,a5
ffffffffc0201ef2:	0141                	addi	sp,sp,16
ffffffffc0201ef4:	8082                	ret
ffffffffc0201ef6:	c97ff0ef          	jal	ffffffffc0201b8c <pa2page.part.0>

ffffffffc0201efa <unmap_range>:
ffffffffc0201efa:	715d                	addi	sp,sp,-80
ffffffffc0201efc:	00c5e7b3          	or	a5,a1,a2
ffffffffc0201f00:	e486                	sd	ra,72(sp)
ffffffffc0201f02:	e0a2                	sd	s0,64(sp)
ffffffffc0201f04:	fc26                	sd	s1,56(sp)
ffffffffc0201f06:	f84a                	sd	s2,48(sp)
ffffffffc0201f08:	f44e                	sd	s3,40(sp)
ffffffffc0201f0a:	f052                	sd	s4,32(sp)
ffffffffc0201f0c:	ec56                	sd	s5,24(sp)
ffffffffc0201f0e:	e85a                	sd	s6,16(sp)
ffffffffc0201f10:	17d2                	slli	a5,a5,0x34
ffffffffc0201f12:	e7f9                	bnez	a5,ffffffffc0201fe0 <unmap_range+0xe6>
ffffffffc0201f14:	002007b7          	lui	a5,0x200
ffffffffc0201f18:	842e                	mv	s0,a1
ffffffffc0201f1a:	0ef5e363          	bltu	a1,a5,ffffffffc0202000 <unmap_range+0x106>
ffffffffc0201f1e:	8932                	mv	s2,a2
ffffffffc0201f20:	0ec5f063          	bgeu	a1,a2,ffffffffc0202000 <unmap_range+0x106>
ffffffffc0201f24:	4785                	li	a5,1
ffffffffc0201f26:	07fe                	slli	a5,a5,0x1f
ffffffffc0201f28:	0cc7ec63          	bltu	a5,a2,ffffffffc0202000 <unmap_range+0x106>
ffffffffc0201f2c:	89aa                	mv	s3,a0
ffffffffc0201f2e:	6a05                	lui	s4,0x1
ffffffffc0201f30:	00200b37          	lui	s6,0x200
ffffffffc0201f34:	ffe00ab7          	lui	s5,0xffe00
ffffffffc0201f38:	4601                	li	a2,0
ffffffffc0201f3a:	85a2                	mv	a1,s0
ffffffffc0201f3c:	854e                	mv	a0,s3
ffffffffc0201f3e:	d91ff0ef          	jal	ffffffffc0201cce <get_pte>
ffffffffc0201f42:	84aa                	mv	s1,a0
ffffffffc0201f44:	c125                	beqz	a0,ffffffffc0201fa4 <unmap_range+0xaa>
ffffffffc0201f46:	611c                	ld	a5,0(a0)
ffffffffc0201f48:	ef99                	bnez	a5,ffffffffc0201f66 <unmap_range+0x6c>
ffffffffc0201f4a:	9452                	add	s0,s0,s4
ffffffffc0201f4c:	c019                	beqz	s0,ffffffffc0201f52 <unmap_range+0x58>
ffffffffc0201f4e:	ff2465e3          	bltu	s0,s2,ffffffffc0201f38 <unmap_range+0x3e>
ffffffffc0201f52:	60a6                	ld	ra,72(sp)
ffffffffc0201f54:	6406                	ld	s0,64(sp)
ffffffffc0201f56:	74e2                	ld	s1,56(sp)
ffffffffc0201f58:	7942                	ld	s2,48(sp)
ffffffffc0201f5a:	79a2                	ld	s3,40(sp)
ffffffffc0201f5c:	7a02                	ld	s4,32(sp)
ffffffffc0201f5e:	6ae2                	ld	s5,24(sp)
ffffffffc0201f60:	6b42                	ld	s6,16(sp)
ffffffffc0201f62:	6161                	addi	sp,sp,80
ffffffffc0201f64:	8082                	ret
ffffffffc0201f66:	0017f713          	andi	a4,a5,1
ffffffffc0201f6a:	d365                	beqz	a4,ffffffffc0201f4a <unmap_range+0x50>
ffffffffc0201f6c:	078a                	slli	a5,a5,0x2
ffffffffc0201f6e:	83b1                	srli	a5,a5,0xc
ffffffffc0201f70:	0003b717          	auipc	a4,0x3b
ffffffffc0201f74:	6c873703          	ld	a4,1736(a4) # ffffffffc023d638 <npage>
ffffffffc0201f78:	0ae7f463          	bgeu	a5,a4,ffffffffc0202020 <unmap_range+0x126>
ffffffffc0201f7c:	fff80737          	lui	a4,0xfff80
ffffffffc0201f80:	97ba                	add	a5,a5,a4
ffffffffc0201f82:	079a                	slli	a5,a5,0x6
ffffffffc0201f84:	0003b517          	auipc	a0,0x3b
ffffffffc0201f88:	6bc53503          	ld	a0,1724(a0) # ffffffffc023d640 <pages>
ffffffffc0201f8c:	953e                	add	a0,a0,a5
ffffffffc0201f8e:	411c                	lw	a5,0(a0)
ffffffffc0201f90:	fff7871b          	addiw	a4,a5,-1 # 1fffff <_binary_obj___user_matrix_out_size+0x1fd39f>
ffffffffc0201f94:	c118                	sw	a4,0(a0)
ffffffffc0201f96:	cb19                	beqz	a4,ffffffffc0201fac <unmap_range+0xb2>
ffffffffc0201f98:	0004b023          	sd	zero,0(s1)
ffffffffc0201f9c:	12040073          	sfence.vma	s0
ffffffffc0201fa0:	9452                	add	s0,s0,s4
ffffffffc0201fa2:	b76d                	j	ffffffffc0201f4c <unmap_range+0x52>
ffffffffc0201fa4:	945a                	add	s0,s0,s6
ffffffffc0201fa6:	01547433          	and	s0,s0,s5
ffffffffc0201faa:	b74d                	j	ffffffffc0201f4c <unmap_range+0x52>
ffffffffc0201fac:	100027f3          	csrr	a5,sstatus
ffffffffc0201fb0:	8b89                	andi	a5,a5,2
ffffffffc0201fb2:	eb89                	bnez	a5,ffffffffc0201fc4 <unmap_range+0xca>
ffffffffc0201fb4:	0003b797          	auipc	a5,0x3b
ffffffffc0201fb8:	6647b783          	ld	a5,1636(a5) # ffffffffc023d618 <pmm_manager>
ffffffffc0201fbc:	739c                	ld	a5,32(a5)
ffffffffc0201fbe:	4585                	li	a1,1
ffffffffc0201fc0:	9782                	jalr	a5
ffffffffc0201fc2:	bfd9                	j	ffffffffc0201f98 <unmap_range+0x9e>
ffffffffc0201fc4:	e42a                	sd	a0,8(sp)
ffffffffc0201fc6:	e74fe0ef          	jal	ffffffffc020063a <intr_disable>
ffffffffc0201fca:	0003b797          	auipc	a5,0x3b
ffffffffc0201fce:	64e7b783          	ld	a5,1614(a5) # ffffffffc023d618 <pmm_manager>
ffffffffc0201fd2:	739c                	ld	a5,32(a5)
ffffffffc0201fd4:	6522                	ld	a0,8(sp)
ffffffffc0201fd6:	4585                	li	a1,1
ffffffffc0201fd8:	9782                	jalr	a5
ffffffffc0201fda:	e5afe0ef          	jal	ffffffffc0200634 <intr_enable>
ffffffffc0201fde:	bf6d                	j	ffffffffc0201f98 <unmap_range+0x9e>
ffffffffc0201fe0:	00005697          	auipc	a3,0x5
ffffffffc0201fe4:	0f868693          	addi	a3,a3,248 # ffffffffc02070d8 <etext+0xdce>
ffffffffc0201fe8:	00005617          	auipc	a2,0x5
ffffffffc0201fec:	9a060613          	addi	a2,a2,-1632 # ffffffffc0206988 <etext+0x67e>
ffffffffc0201ff0:	14000593          	li	a1,320
ffffffffc0201ff4:	00005517          	auipc	a0,0x5
ffffffffc0201ff8:	0d450513          	addi	a0,a0,212 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0201ffc:	c7cfe0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202000:	00005697          	auipc	a3,0x5
ffffffffc0202004:	10868693          	addi	a3,a3,264 # ffffffffc0207108 <etext+0xdfe>
ffffffffc0202008:	00005617          	auipc	a2,0x5
ffffffffc020200c:	98060613          	addi	a2,a2,-1664 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202010:	14100593          	li	a1,321
ffffffffc0202014:	00005517          	auipc	a0,0x5
ffffffffc0202018:	0b450513          	addi	a0,a0,180 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc020201c:	c5cfe0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202020:	b6dff0ef          	jal	ffffffffc0201b8c <pa2page.part.0>

ffffffffc0202024 <exit_range>:
ffffffffc0202024:	711d                	addi	sp,sp,-96
ffffffffc0202026:	00c5e7b3          	or	a5,a1,a2
ffffffffc020202a:	ec86                	sd	ra,88(sp)
ffffffffc020202c:	e8a2                	sd	s0,80(sp)
ffffffffc020202e:	e4a6                	sd	s1,72(sp)
ffffffffc0202030:	e0ca                	sd	s2,64(sp)
ffffffffc0202032:	fc4e                	sd	s3,56(sp)
ffffffffc0202034:	f852                	sd	s4,48(sp)
ffffffffc0202036:	f456                	sd	s5,40(sp)
ffffffffc0202038:	f05a                	sd	s6,32(sp)
ffffffffc020203a:	ec5e                	sd	s7,24(sp)
ffffffffc020203c:	e862                	sd	s8,16(sp)
ffffffffc020203e:	17d2                	slli	a5,a5,0x34
ffffffffc0202040:	e3f1                	bnez	a5,ffffffffc0202104 <exit_range+0xe0>
ffffffffc0202042:	002007b7          	lui	a5,0x200
ffffffffc0202046:	0ef5eb63          	bltu	a1,a5,ffffffffc020213c <exit_range+0x118>
ffffffffc020204a:	8ab2                	mv	s5,a2
ffffffffc020204c:	0ec5f863          	bgeu	a1,a2,ffffffffc020213c <exit_range+0x118>
ffffffffc0202050:	4785                	li	a5,1
ffffffffc0202052:	ffe00737          	lui	a4,0xffe00
ffffffffc0202056:	07fe                	slli	a5,a5,0x1f
ffffffffc0202058:	00e5f4b3          	and	s1,a1,a4
ffffffffc020205c:	0ec7e063          	bltu	a5,a2,ffffffffc020213c <exit_range+0x118>
ffffffffc0202060:	8b2a                	mv	s6,a0
ffffffffc0202062:	0003bb97          	auipc	s7,0x3b
ffffffffc0202066:	5d6b8b93          	addi	s7,s7,1494 # ffffffffc023d638 <npage>
ffffffffc020206a:	0003bc17          	auipc	s8,0x3b
ffffffffc020206e:	5d6c0c13          	addi	s8,s8,1494 # ffffffffc023d640 <pages>
ffffffffc0202072:	fff809b7          	lui	s3,0xfff80
ffffffffc0202076:	0003b917          	auipc	s2,0x3b
ffffffffc020207a:	5a290913          	addi	s2,s2,1442 # ffffffffc023d618 <pmm_manager>
ffffffffc020207e:	00200a37          	lui	s4,0x200
ffffffffc0202082:	a029                	j	ffffffffc020208c <exit_range+0x68>
ffffffffc0202084:	94d2                	add	s1,s1,s4
ffffffffc0202086:	c4a9                	beqz	s1,ffffffffc02020d0 <exit_range+0xac>
ffffffffc0202088:	0554f463          	bgeu	s1,s5,ffffffffc02020d0 <exit_range+0xac>
ffffffffc020208c:	01e4d413          	srli	s0,s1,0x1e
ffffffffc0202090:	1ff47413          	andi	s0,s0,511
ffffffffc0202094:	040e                	slli	s0,s0,0x3
ffffffffc0202096:	945a                	add	s0,s0,s6
ffffffffc0202098:	601c                	ld	a5,0(s0)
ffffffffc020209a:	0017f713          	andi	a4,a5,1
ffffffffc020209e:	d37d                	beqz	a4,ffffffffc0202084 <exit_range+0x60>
ffffffffc02020a0:	000bb703          	ld	a4,0(s7)
ffffffffc02020a4:	078a                	slli	a5,a5,0x2
ffffffffc02020a6:	83b1                	srli	a5,a5,0xc
ffffffffc02020a8:	06e7fe63          	bgeu	a5,a4,ffffffffc0202124 <exit_range+0x100>
ffffffffc02020ac:	000c3503          	ld	a0,0(s8)
ffffffffc02020b0:	97ce                	add	a5,a5,s3
ffffffffc02020b2:	079a                	slli	a5,a5,0x6
ffffffffc02020b4:	953e                	add	a0,a0,a5
ffffffffc02020b6:	100027f3          	csrr	a5,sstatus
ffffffffc02020ba:	8b89                	andi	a5,a5,2
ffffffffc02020bc:	e795                	bnez	a5,ffffffffc02020e8 <exit_range+0xc4>
ffffffffc02020be:	00093783          	ld	a5,0(s2)
ffffffffc02020c2:	4585                	li	a1,1
ffffffffc02020c4:	739c                	ld	a5,32(a5)
ffffffffc02020c6:	9782                	jalr	a5
ffffffffc02020c8:	00043023          	sd	zero,0(s0)
ffffffffc02020cc:	94d2                	add	s1,s1,s4
ffffffffc02020ce:	fccd                	bnez	s1,ffffffffc0202088 <exit_range+0x64>
ffffffffc02020d0:	60e6                	ld	ra,88(sp)
ffffffffc02020d2:	6446                	ld	s0,80(sp)
ffffffffc02020d4:	64a6                	ld	s1,72(sp)
ffffffffc02020d6:	6906                	ld	s2,64(sp)
ffffffffc02020d8:	79e2                	ld	s3,56(sp)
ffffffffc02020da:	7a42                	ld	s4,48(sp)
ffffffffc02020dc:	7aa2                	ld	s5,40(sp)
ffffffffc02020de:	7b02                	ld	s6,32(sp)
ffffffffc02020e0:	6be2                	ld	s7,24(sp)
ffffffffc02020e2:	6c42                	ld	s8,16(sp)
ffffffffc02020e4:	6125                	addi	sp,sp,96
ffffffffc02020e6:	8082                	ret
ffffffffc02020e8:	e42a                	sd	a0,8(sp)
ffffffffc02020ea:	d50fe0ef          	jal	ffffffffc020063a <intr_disable>
ffffffffc02020ee:	00093783          	ld	a5,0(s2)
ffffffffc02020f2:	6522                	ld	a0,8(sp)
ffffffffc02020f4:	4585                	li	a1,1
ffffffffc02020f6:	739c                	ld	a5,32(a5)
ffffffffc02020f8:	9782                	jalr	a5
ffffffffc02020fa:	d3afe0ef          	jal	ffffffffc0200634 <intr_enable>
ffffffffc02020fe:	00043023          	sd	zero,0(s0)
ffffffffc0202102:	b7e9                	j	ffffffffc02020cc <exit_range+0xa8>
ffffffffc0202104:	00005697          	auipc	a3,0x5
ffffffffc0202108:	fd468693          	addi	a3,a3,-44 # ffffffffc02070d8 <etext+0xdce>
ffffffffc020210c:	00005617          	auipc	a2,0x5
ffffffffc0202110:	87c60613          	addi	a2,a2,-1924 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202114:	15100593          	li	a1,337
ffffffffc0202118:	00005517          	auipc	a0,0x5
ffffffffc020211c:	fb050513          	addi	a0,a0,-80 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0202120:	b58fe0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202124:	00005617          	auipc	a2,0x5
ffffffffc0202128:	f5c60613          	addi	a2,a2,-164 # ffffffffc0207080 <etext+0xd76>
ffffffffc020212c:	06200593          	li	a1,98
ffffffffc0202130:	00005517          	auipc	a0,0x5
ffffffffc0202134:	ea850513          	addi	a0,a0,-344 # ffffffffc0206fd8 <etext+0xcce>
ffffffffc0202138:	b40fe0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc020213c:	00005697          	auipc	a3,0x5
ffffffffc0202140:	fcc68693          	addi	a3,a3,-52 # ffffffffc0207108 <etext+0xdfe>
ffffffffc0202144:	00005617          	auipc	a2,0x5
ffffffffc0202148:	84460613          	addi	a2,a2,-1980 # ffffffffc0206988 <etext+0x67e>
ffffffffc020214c:	15200593          	li	a1,338
ffffffffc0202150:	00005517          	auipc	a0,0x5
ffffffffc0202154:	f7850513          	addi	a0,a0,-136 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0202158:	b20fe0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc020215c <page_remove>:
ffffffffc020215c:	7179                	addi	sp,sp,-48
ffffffffc020215e:	4601                	li	a2,0
ffffffffc0202160:	ec26                	sd	s1,24(sp)
ffffffffc0202162:	f406                	sd	ra,40(sp)
ffffffffc0202164:	84ae                	mv	s1,a1
ffffffffc0202166:	b69ff0ef          	jal	ffffffffc0201cce <get_pte>
ffffffffc020216a:	c901                	beqz	a0,ffffffffc020217a <page_remove+0x1e>
ffffffffc020216c:	611c                	ld	a5,0(a0)
ffffffffc020216e:	f022                	sd	s0,32(sp)
ffffffffc0202170:	842a                	mv	s0,a0
ffffffffc0202172:	0017f713          	andi	a4,a5,1
ffffffffc0202176:	e711                	bnez	a4,ffffffffc0202182 <page_remove+0x26>
ffffffffc0202178:	7402                	ld	s0,32(sp)
ffffffffc020217a:	70a2                	ld	ra,40(sp)
ffffffffc020217c:	64e2                	ld	s1,24(sp)
ffffffffc020217e:	6145                	addi	sp,sp,48
ffffffffc0202180:	8082                	ret
ffffffffc0202182:	078a                	slli	a5,a5,0x2
ffffffffc0202184:	83b1                	srli	a5,a5,0xc
ffffffffc0202186:	0003b717          	auipc	a4,0x3b
ffffffffc020218a:	4b273703          	ld	a4,1202(a4) # ffffffffc023d638 <npage>
ffffffffc020218e:	06e7f363          	bgeu	a5,a4,ffffffffc02021f4 <page_remove+0x98>
ffffffffc0202192:	fff80737          	lui	a4,0xfff80
ffffffffc0202196:	97ba                	add	a5,a5,a4
ffffffffc0202198:	079a                	slli	a5,a5,0x6
ffffffffc020219a:	0003b517          	auipc	a0,0x3b
ffffffffc020219e:	4a653503          	ld	a0,1190(a0) # ffffffffc023d640 <pages>
ffffffffc02021a2:	953e                	add	a0,a0,a5
ffffffffc02021a4:	411c                	lw	a5,0(a0)
ffffffffc02021a6:	fff7871b          	addiw	a4,a5,-1 # 1fffff <_binary_obj___user_matrix_out_size+0x1fd39f>
ffffffffc02021aa:	c118                	sw	a4,0(a0)
ffffffffc02021ac:	cb11                	beqz	a4,ffffffffc02021c0 <page_remove+0x64>
ffffffffc02021ae:	00043023          	sd	zero,0(s0)
ffffffffc02021b2:	12048073          	sfence.vma	s1
ffffffffc02021b6:	7402                	ld	s0,32(sp)
ffffffffc02021b8:	70a2                	ld	ra,40(sp)
ffffffffc02021ba:	64e2                	ld	s1,24(sp)
ffffffffc02021bc:	6145                	addi	sp,sp,48
ffffffffc02021be:	8082                	ret
ffffffffc02021c0:	100027f3          	csrr	a5,sstatus
ffffffffc02021c4:	8b89                	andi	a5,a5,2
ffffffffc02021c6:	eb89                	bnez	a5,ffffffffc02021d8 <page_remove+0x7c>
ffffffffc02021c8:	0003b797          	auipc	a5,0x3b
ffffffffc02021cc:	4507b783          	ld	a5,1104(a5) # ffffffffc023d618 <pmm_manager>
ffffffffc02021d0:	739c                	ld	a5,32(a5)
ffffffffc02021d2:	4585                	li	a1,1
ffffffffc02021d4:	9782                	jalr	a5
ffffffffc02021d6:	bfe1                	j	ffffffffc02021ae <page_remove+0x52>
ffffffffc02021d8:	e42a                	sd	a0,8(sp)
ffffffffc02021da:	c60fe0ef          	jal	ffffffffc020063a <intr_disable>
ffffffffc02021de:	0003b797          	auipc	a5,0x3b
ffffffffc02021e2:	43a7b783          	ld	a5,1082(a5) # ffffffffc023d618 <pmm_manager>
ffffffffc02021e6:	739c                	ld	a5,32(a5)
ffffffffc02021e8:	6522                	ld	a0,8(sp)
ffffffffc02021ea:	4585                	li	a1,1
ffffffffc02021ec:	9782                	jalr	a5
ffffffffc02021ee:	c46fe0ef          	jal	ffffffffc0200634 <intr_enable>
ffffffffc02021f2:	bf75                	j	ffffffffc02021ae <page_remove+0x52>
ffffffffc02021f4:	999ff0ef          	jal	ffffffffc0201b8c <pa2page.part.0>

ffffffffc02021f8 <page_insert>:
ffffffffc02021f8:	7139                	addi	sp,sp,-64
ffffffffc02021fa:	e852                	sd	s4,16(sp)
ffffffffc02021fc:	8a32                	mv	s4,a2
ffffffffc02021fe:	f822                	sd	s0,48(sp)
ffffffffc0202200:	4605                	li	a2,1
ffffffffc0202202:	842e                	mv	s0,a1
ffffffffc0202204:	85d2                	mv	a1,s4
ffffffffc0202206:	f426                	sd	s1,40(sp)
ffffffffc0202208:	fc06                	sd	ra,56(sp)
ffffffffc020220a:	84b6                	mv	s1,a3
ffffffffc020220c:	ac3ff0ef          	jal	ffffffffc0201cce <get_pte>
ffffffffc0202210:	c971                	beqz	a0,ffffffffc02022e4 <page_insert+0xec>
ffffffffc0202212:	4014                	lw	a3,0(s0)
ffffffffc0202214:	611c                	ld	a5,0(a0)
ffffffffc0202216:	ec4e                	sd	s3,24(sp)
ffffffffc0202218:	0016871b          	addiw	a4,a3,1
ffffffffc020221c:	c018                	sw	a4,0(s0)
ffffffffc020221e:	0017f713          	andi	a4,a5,1
ffffffffc0202222:	89aa                	mv	s3,a0
ffffffffc0202224:	eb15                	bnez	a4,ffffffffc0202258 <page_insert+0x60>
ffffffffc0202226:	0003b717          	auipc	a4,0x3b
ffffffffc020222a:	41a73703          	ld	a4,1050(a4) # ffffffffc023d640 <pages>
ffffffffc020222e:	8c19                	sub	s0,s0,a4
ffffffffc0202230:	000807b7          	lui	a5,0x80
ffffffffc0202234:	8419                	srai	s0,s0,0x6
ffffffffc0202236:	943e                	add	s0,s0,a5
ffffffffc0202238:	042a                	slli	s0,s0,0xa
ffffffffc020223a:	8cc1                	or	s1,s1,s0
ffffffffc020223c:	0014e493          	ori	s1,s1,1
ffffffffc0202240:	0099b023          	sd	s1,0(s3) # fffffffffff80000 <end+0x3fd42960>
ffffffffc0202244:	120a0073          	sfence.vma	s4
ffffffffc0202248:	69e2                	ld	s3,24(sp)
ffffffffc020224a:	4501                	li	a0,0
ffffffffc020224c:	70e2                	ld	ra,56(sp)
ffffffffc020224e:	7442                	ld	s0,48(sp)
ffffffffc0202250:	74a2                	ld	s1,40(sp)
ffffffffc0202252:	6a42                	ld	s4,16(sp)
ffffffffc0202254:	6121                	addi	sp,sp,64
ffffffffc0202256:	8082                	ret
ffffffffc0202258:	078a                	slli	a5,a5,0x2
ffffffffc020225a:	f04a                	sd	s2,32(sp)
ffffffffc020225c:	e456                	sd	s5,8(sp)
ffffffffc020225e:	83b1                	srli	a5,a5,0xc
ffffffffc0202260:	0003b717          	auipc	a4,0x3b
ffffffffc0202264:	3d873703          	ld	a4,984(a4) # ffffffffc023d638 <npage>
ffffffffc0202268:	08e7f063          	bgeu	a5,a4,ffffffffc02022e8 <page_insert+0xf0>
ffffffffc020226c:	0003ba97          	auipc	s5,0x3b
ffffffffc0202270:	3d4a8a93          	addi	s5,s5,980 # ffffffffc023d640 <pages>
ffffffffc0202274:	000ab703          	ld	a4,0(s5)
ffffffffc0202278:	fff80637          	lui	a2,0xfff80
ffffffffc020227c:	00c78933          	add	s2,a5,a2
ffffffffc0202280:	091a                	slli	s2,s2,0x6
ffffffffc0202282:	993a                	add	s2,s2,a4
ffffffffc0202284:	01240e63          	beq	s0,s2,ffffffffc02022a0 <page_insert+0xa8>
ffffffffc0202288:	00092783          	lw	a5,0(s2)
ffffffffc020228c:	fff7869b          	addiw	a3,a5,-1 # 7ffff <_binary_obj___user_matrix_out_size+0x7d39f>
ffffffffc0202290:	00d92023          	sw	a3,0(s2)
ffffffffc0202294:	ca91                	beqz	a3,ffffffffc02022a8 <page_insert+0xb0>
ffffffffc0202296:	120a0073          	sfence.vma	s4
ffffffffc020229a:	7902                	ld	s2,32(sp)
ffffffffc020229c:	6aa2                	ld	s5,8(sp)
ffffffffc020229e:	bf41                	j	ffffffffc020222e <page_insert+0x36>
ffffffffc02022a0:	7902                	ld	s2,32(sp)
ffffffffc02022a2:	6aa2                	ld	s5,8(sp)
ffffffffc02022a4:	c014                	sw	a3,0(s0)
ffffffffc02022a6:	b761                	j	ffffffffc020222e <page_insert+0x36>
ffffffffc02022a8:	100027f3          	csrr	a5,sstatus
ffffffffc02022ac:	8b89                	andi	a5,a5,2
ffffffffc02022ae:	ef81                	bnez	a5,ffffffffc02022c6 <page_insert+0xce>
ffffffffc02022b0:	0003b797          	auipc	a5,0x3b
ffffffffc02022b4:	3687b783          	ld	a5,872(a5) # ffffffffc023d618 <pmm_manager>
ffffffffc02022b8:	739c                	ld	a5,32(a5)
ffffffffc02022ba:	4585                	li	a1,1
ffffffffc02022bc:	854a                	mv	a0,s2
ffffffffc02022be:	9782                	jalr	a5
ffffffffc02022c0:	000ab703          	ld	a4,0(s5)
ffffffffc02022c4:	bfc9                	j	ffffffffc0202296 <page_insert+0x9e>
ffffffffc02022c6:	b74fe0ef          	jal	ffffffffc020063a <intr_disable>
ffffffffc02022ca:	0003b797          	auipc	a5,0x3b
ffffffffc02022ce:	34e7b783          	ld	a5,846(a5) # ffffffffc023d618 <pmm_manager>
ffffffffc02022d2:	739c                	ld	a5,32(a5)
ffffffffc02022d4:	4585                	li	a1,1
ffffffffc02022d6:	854a                	mv	a0,s2
ffffffffc02022d8:	9782                	jalr	a5
ffffffffc02022da:	b5afe0ef          	jal	ffffffffc0200634 <intr_enable>
ffffffffc02022de:	000ab703          	ld	a4,0(s5)
ffffffffc02022e2:	bf55                	j	ffffffffc0202296 <page_insert+0x9e>
ffffffffc02022e4:	5571                	li	a0,-4
ffffffffc02022e6:	b79d                	j	ffffffffc020224c <page_insert+0x54>
ffffffffc02022e8:	8a5ff0ef          	jal	ffffffffc0201b8c <pa2page.part.0>

ffffffffc02022ec <pmm_init>:
ffffffffc02022ec:	00006797          	auipc	a5,0x6
ffffffffc02022f0:	3ec78793          	addi	a5,a5,1004 # ffffffffc02086d8 <default_pmm_manager>
ffffffffc02022f4:	638c                	ld	a1,0(a5)
ffffffffc02022f6:	711d                	addi	sp,sp,-96
ffffffffc02022f8:	ec86                	sd	ra,88(sp)
ffffffffc02022fa:	e0ca                	sd	s2,64(sp)
ffffffffc02022fc:	fc4e                	sd	s3,56(sp)
ffffffffc02022fe:	f05a                	sd	s6,32(sp)
ffffffffc0202300:	ec5e                	sd	s7,24(sp)
ffffffffc0202302:	e8a2                	sd	s0,80(sp)
ffffffffc0202304:	e4a6                	sd	s1,72(sp)
ffffffffc0202306:	f852                	sd	s4,48(sp)
ffffffffc0202308:	f456                	sd	s5,40(sp)
ffffffffc020230a:	0003bb97          	auipc	s7,0x3b
ffffffffc020230e:	30eb8b93          	addi	s7,s7,782 # ffffffffc023d618 <pmm_manager>
ffffffffc0202312:	00005517          	auipc	a0,0x5
ffffffffc0202316:	e0e50513          	addi	a0,a0,-498 # ffffffffc0207120 <etext+0xe16>
ffffffffc020231a:	00fbb023          	sd	a5,0(s7)
ffffffffc020231e:	e67fd0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0202322:	000bb783          	ld	a5,0(s7)
ffffffffc0202326:	0003b997          	auipc	s3,0x3b
ffffffffc020232a:	30a98993          	addi	s3,s3,778 # ffffffffc023d630 <va_pa_offset>
ffffffffc020232e:	0003b917          	auipc	s2,0x3b
ffffffffc0202332:	30a90913          	addi	s2,s2,778 # ffffffffc023d638 <npage>
ffffffffc0202336:	679c                	ld	a5,8(a5)
ffffffffc0202338:	0003bb17          	auipc	s6,0x3b
ffffffffc020233c:	308b0b13          	addi	s6,s6,776 # ffffffffc023d640 <pages>
ffffffffc0202340:	9782                	jalr	a5
ffffffffc0202342:	57f5                	li	a5,-3
ffffffffc0202344:	07fa                	slli	a5,a5,0x1e
ffffffffc0202346:	00005517          	auipc	a0,0x5
ffffffffc020234a:	df250513          	addi	a0,a0,-526 # ffffffffc0207138 <etext+0xe2e>
ffffffffc020234e:	00f9b023          	sd	a5,0(s3)
ffffffffc0202352:	e33fd0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0202356:	44300693          	li	a3,1091
ffffffffc020235a:	06d6                	slli	a3,a3,0x15
ffffffffc020235c:	40100613          	li	a2,1025
ffffffffc0202360:	16fd                	addi	a3,a3,-1
ffffffffc0202362:	0656                	slli	a2,a2,0x15
ffffffffc0202364:	088005b7          	lui	a1,0x8800
ffffffffc0202368:	00005517          	auipc	a0,0x5
ffffffffc020236c:	de850513          	addi	a0,a0,-536 # ffffffffc0207150 <etext+0xe46>
ffffffffc0202370:	e15fd0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0202374:	76fd                	lui	a3,0xfffff
ffffffffc0202376:	00088737          	lui	a4,0x88
ffffffffc020237a:	0003c797          	auipc	a5,0x3c
ffffffffc020237e:	32578793          	addi	a5,a5,805 # ffffffffc023e69f <end+0xfff>
ffffffffc0202382:	8ff5                	and	a5,a5,a3
ffffffffc0202384:	60070713          	addi	a4,a4,1536 # 88600 <_binary_obj___user_matrix_out_size+0x859a0>
ffffffffc0202388:	00e93023          	sd	a4,0(s2)
ffffffffc020238c:	00fb3023          	sd	a5,0(s6)
ffffffffc0202390:	4705                	li	a4,1
ffffffffc0202392:	07a1                	addi	a5,a5,8
ffffffffc0202394:	40e7b02f          	amoor.d	zero,a4,(a5)
ffffffffc0202398:	4505                	li	a0,1
ffffffffc020239a:	fff805b7          	lui	a1,0xfff80
ffffffffc020239e:	000b3783          	ld	a5,0(s6)
ffffffffc02023a2:	00671693          	slli	a3,a4,0x6
ffffffffc02023a6:	97b6                	add	a5,a5,a3
ffffffffc02023a8:	07a1                	addi	a5,a5,8
ffffffffc02023aa:	40a7b02f          	amoor.d	zero,a0,(a5)
ffffffffc02023ae:	00093603          	ld	a2,0(s2)
ffffffffc02023b2:	0705                	addi	a4,a4,1
ffffffffc02023b4:	00b607b3          	add	a5,a2,a1
ffffffffc02023b8:	fef763e3          	bltu	a4,a5,ffffffffc020239e <pmm_init+0xb2>
ffffffffc02023bc:	000b3503          	ld	a0,0(s6)
ffffffffc02023c0:	079a                	slli	a5,a5,0x6
ffffffffc02023c2:	c0200737          	lui	a4,0xc0200
ffffffffc02023c6:	00f506b3          	add	a3,a0,a5
ffffffffc02023ca:	50e6e763          	bltu	a3,a4,ffffffffc02028d8 <pmm_init+0x5ec>
ffffffffc02023ce:	0009b583          	ld	a1,0(s3)
ffffffffc02023d2:	44300713          	li	a4,1091
ffffffffc02023d6:	0756                	slli	a4,a4,0x15
ffffffffc02023d8:	8e8d                	sub	a3,a3,a1
ffffffffc02023da:	36e6ea63          	bltu	a3,a4,ffffffffc020274e <pmm_init+0x462>
ffffffffc02023de:	00005517          	auipc	a0,0x5
ffffffffc02023e2:	d9a50513          	addi	a0,a0,-614 # ffffffffc0207178 <etext+0xe6e>
ffffffffc02023e6:	d9ffd0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02023ea:	000bb783          	ld	a5,0(s7)
ffffffffc02023ee:	0003b497          	auipc	s1,0x3b
ffffffffc02023f2:	23a48493          	addi	s1,s1,570 # ffffffffc023d628 <boot_pgdir>
ffffffffc02023f6:	7b9c                	ld	a5,48(a5)
ffffffffc02023f8:	9782                	jalr	a5
ffffffffc02023fa:	00005517          	auipc	a0,0x5
ffffffffc02023fe:	d9650513          	addi	a0,a0,-618 # ffffffffc0207190 <etext+0xe86>
ffffffffc0202402:	d83fd0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0202406:	0000a517          	auipc	a0,0xa
ffffffffc020240a:	bfa50513          	addi	a0,a0,-1030 # ffffffffc020c000 <boot_page_table_sv39>
ffffffffc020240e:	e088                	sd	a0,0(s1)
ffffffffc0202410:	c02007b7          	lui	a5,0xc0200
ffffffffc0202414:	44f56563          	bltu	a0,a5,ffffffffc020285e <pmm_init+0x572>
ffffffffc0202418:	0009b703          	ld	a4,0(s3)
ffffffffc020241c:	00093683          	ld	a3,0(s2)
ffffffffc0202420:	c80007b7          	lui	a5,0xc8000
ffffffffc0202424:	40e50733          	sub	a4,a0,a4
ffffffffc0202428:	0003b617          	auipc	a2,0x3b
ffffffffc020242c:	1ee63c23          	sd	a4,504(a2) # ffffffffc023d620 <boot_cr3>
ffffffffc0202430:	83b1                	srli	a5,a5,0xc
ffffffffc0202432:	64d7e363          	bltu	a5,a3,ffffffffc0202a78 <pmm_init+0x78c>
ffffffffc0202436:	03451793          	slli	a5,a0,0x34
ffffffffc020243a:	60079f63          	bnez	a5,ffffffffc0202a58 <pmm_init+0x76c>
ffffffffc020243e:	4601                	li	a2,0
ffffffffc0202440:	4581                	li	a1,0
ffffffffc0202442:	a65ff0ef          	jal	ffffffffc0201ea6 <get_page>
ffffffffc0202446:	5e051963          	bnez	a0,ffffffffc0202a38 <pmm_init+0x74c>
ffffffffc020244a:	4505                	li	a0,1
ffffffffc020244c:	f78ff0ef          	jal	ffffffffc0201bc4 <alloc_pages>
ffffffffc0202450:	842a                	mv	s0,a0
ffffffffc0202452:	6088                	ld	a0,0(s1)
ffffffffc0202454:	4681                	li	a3,0
ffffffffc0202456:	4601                	li	a2,0
ffffffffc0202458:	85a2                	mv	a1,s0
ffffffffc020245a:	d9fff0ef          	jal	ffffffffc02021f8 <page_insert>
ffffffffc020245e:	5a051d63          	bnez	a0,ffffffffc0202a18 <pmm_init+0x72c>
ffffffffc0202462:	6088                	ld	a0,0(s1)
ffffffffc0202464:	4601                	li	a2,0
ffffffffc0202466:	4581                	li	a1,0
ffffffffc0202468:	867ff0ef          	jal	ffffffffc0201cce <get_pte>
ffffffffc020246c:	58050663          	beqz	a0,ffffffffc02029f8 <pmm_init+0x70c>
ffffffffc0202470:	611c                	ld	a5,0(a0)
ffffffffc0202472:	0017f713          	andi	a4,a5,1
ffffffffc0202476:	56070f63          	beqz	a4,ffffffffc02029f4 <pmm_init+0x708>
ffffffffc020247a:	00093603          	ld	a2,0(s2)
ffffffffc020247e:	078a                	slli	a5,a5,0x2
ffffffffc0202480:	83b1                	srli	a5,a5,0xc
ffffffffc0202482:	56c7f763          	bgeu	a5,a2,ffffffffc02029f0 <pmm_init+0x704>
ffffffffc0202486:	000b3703          	ld	a4,0(s6)
ffffffffc020248a:	fff806b7          	lui	a3,0xfff80
ffffffffc020248e:	97b6                	add	a5,a5,a3
ffffffffc0202490:	079a                	slli	a5,a5,0x6
ffffffffc0202492:	97ba                	add	a5,a5,a4
ffffffffc0202494:	7ef41763          	bne	s0,a5,ffffffffc0202c82 <pmm_init+0x996>
ffffffffc0202498:	4018                	lw	a4,0(s0)
ffffffffc020249a:	4785                	li	a5,1
ffffffffc020249c:	6cf71763          	bne	a4,a5,ffffffffc0202b6a <pmm_init+0x87e>
ffffffffc02024a0:	6088                	ld	a0,0(s1)
ffffffffc02024a2:	77fd                	lui	a5,0xfffff
ffffffffc02024a4:	6114                	ld	a3,0(a0)
ffffffffc02024a6:	068a                	slli	a3,a3,0x2
ffffffffc02024a8:	8efd                	and	a3,a3,a5
ffffffffc02024aa:	00c6d713          	srli	a4,a3,0xc
ffffffffc02024ae:	6ac77263          	bgeu	a4,a2,ffffffffc0202b52 <pmm_init+0x866>
ffffffffc02024b2:	0009ba83          	ld	s5,0(s3)
ffffffffc02024b6:	96d6                	add	a3,a3,s5
ffffffffc02024b8:	0006ba03          	ld	s4,0(a3) # fffffffffff80000 <end+0x3fd42960>
ffffffffc02024bc:	0a0a                	slli	s4,s4,0x2
ffffffffc02024be:	00fa7a33          	and	s4,s4,a5
ffffffffc02024c2:	00ca5793          	srli	a5,s4,0xc
ffffffffc02024c6:	66c7f963          	bgeu	a5,a2,ffffffffc0202b38 <pmm_init+0x84c>
ffffffffc02024ca:	4601                	li	a2,0
ffffffffc02024cc:	6585                	lui	a1,0x1
ffffffffc02024ce:	9ad2                	add	s5,s5,s4
ffffffffc02024d0:	ffeff0ef          	jal	ffffffffc0201cce <get_pte>
ffffffffc02024d4:	0aa1                	addi	s5,s5,8
ffffffffc02024d6:	65551163          	bne	a0,s5,ffffffffc0202b18 <pmm_init+0x82c>
ffffffffc02024da:	4505                	li	a0,1
ffffffffc02024dc:	ee8ff0ef          	jal	ffffffffc0201bc4 <alloc_pages>
ffffffffc02024e0:	8a2a                	mv	s4,a0
ffffffffc02024e2:	6088                	ld	a0,0(s1)
ffffffffc02024e4:	46d1                	li	a3,20
ffffffffc02024e6:	6605                	lui	a2,0x1
ffffffffc02024e8:	85d2                	mv	a1,s4
ffffffffc02024ea:	d0fff0ef          	jal	ffffffffc02021f8 <page_insert>
ffffffffc02024ee:	60051563          	bnez	a0,ffffffffc0202af8 <pmm_init+0x80c>
ffffffffc02024f2:	6088                	ld	a0,0(s1)
ffffffffc02024f4:	4601                	li	a2,0
ffffffffc02024f6:	6585                	lui	a1,0x1
ffffffffc02024f8:	fd6ff0ef          	jal	ffffffffc0201cce <get_pte>
ffffffffc02024fc:	5c050e63          	beqz	a0,ffffffffc0202ad8 <pmm_init+0x7ec>
ffffffffc0202500:	611c                	ld	a5,0(a0)
ffffffffc0202502:	0107f713          	andi	a4,a5,16
ffffffffc0202506:	5a070963          	beqz	a4,ffffffffc0202ab8 <pmm_init+0x7cc>
ffffffffc020250a:	8b91                	andi	a5,a5,4
ffffffffc020250c:	4c078263          	beqz	a5,ffffffffc02029d0 <pmm_init+0x6e4>
ffffffffc0202510:	6088                	ld	a0,0(s1)
ffffffffc0202512:	611c                	ld	a5,0(a0)
ffffffffc0202514:	8bc1                	andi	a5,a5,16
ffffffffc0202516:	48078d63          	beqz	a5,ffffffffc02029b0 <pmm_init+0x6c4>
ffffffffc020251a:	000a2703          	lw	a4,0(s4) # 200000 <_binary_obj___user_matrix_out_size+0x1fd3a0>
ffffffffc020251e:	4785                	li	a5,1
ffffffffc0202520:	46f71863          	bne	a4,a5,ffffffffc0202990 <pmm_init+0x6a4>
ffffffffc0202524:	4681                	li	a3,0
ffffffffc0202526:	6605                	lui	a2,0x1
ffffffffc0202528:	85a2                	mv	a1,s0
ffffffffc020252a:	ccfff0ef          	jal	ffffffffc02021f8 <page_insert>
ffffffffc020252e:	44051163          	bnez	a0,ffffffffc0202970 <pmm_init+0x684>
ffffffffc0202532:	4018                	lw	a4,0(s0)
ffffffffc0202534:	4789                	li	a5,2
ffffffffc0202536:	40f71d63          	bne	a4,a5,ffffffffc0202950 <pmm_init+0x664>
ffffffffc020253a:	000a2783          	lw	a5,0(s4)
ffffffffc020253e:	3e079963          	bnez	a5,ffffffffc0202930 <pmm_init+0x644>
ffffffffc0202542:	6088                	ld	a0,0(s1)
ffffffffc0202544:	4601                	li	a2,0
ffffffffc0202546:	6585                	lui	a1,0x1
ffffffffc0202548:	f86ff0ef          	jal	ffffffffc0201cce <get_pte>
ffffffffc020254c:	3c050263          	beqz	a0,ffffffffc0202910 <pmm_init+0x624>
ffffffffc0202550:	6118                	ld	a4,0(a0)
ffffffffc0202552:	00177793          	andi	a5,a4,1
ffffffffc0202556:	48078f63          	beqz	a5,ffffffffc02029f4 <pmm_init+0x708>
ffffffffc020255a:	00093683          	ld	a3,0(s2)
ffffffffc020255e:	00271793          	slli	a5,a4,0x2
ffffffffc0202562:	83b1                	srli	a5,a5,0xc
ffffffffc0202564:	48d7f663          	bgeu	a5,a3,ffffffffc02029f0 <pmm_init+0x704>
ffffffffc0202568:	000b3683          	ld	a3,0(s6)
ffffffffc020256c:	fff80637          	lui	a2,0xfff80
ffffffffc0202570:	97b2                	add	a5,a5,a2
ffffffffc0202572:	079a                	slli	a5,a5,0x6
ffffffffc0202574:	97b6                	add	a5,a5,a3
ffffffffc0202576:	36f41d63          	bne	s0,a5,ffffffffc02028f0 <pmm_init+0x604>
ffffffffc020257a:	8b41                	andi	a4,a4,16
ffffffffc020257c:	60071763          	bnez	a4,ffffffffc0202b8a <pmm_init+0x89e>
ffffffffc0202580:	6088                	ld	a0,0(s1)
ffffffffc0202582:	4581                	li	a1,0
ffffffffc0202584:	bd9ff0ef          	jal	ffffffffc020215c <page_remove>
ffffffffc0202588:	4018                	lw	a4,0(s0)
ffffffffc020258a:	4785                	li	a5,1
ffffffffc020258c:	32f71663          	bne	a4,a5,ffffffffc02028b8 <pmm_init+0x5cc>
ffffffffc0202590:	000a2783          	lw	a5,0(s4)
ffffffffc0202594:	30079263          	bnez	a5,ffffffffc0202898 <pmm_init+0x5ac>
ffffffffc0202598:	6088                	ld	a0,0(s1)
ffffffffc020259a:	6585                	lui	a1,0x1
ffffffffc020259c:	bc1ff0ef          	jal	ffffffffc020215c <page_remove>
ffffffffc02025a0:	401c                	lw	a5,0(s0)
ffffffffc02025a2:	2c079b63          	bnez	a5,ffffffffc0202878 <pmm_init+0x58c>
ffffffffc02025a6:	000a2783          	lw	a5,0(s4)
ffffffffc02025aa:	4e079763          	bnez	a5,ffffffffc0202a98 <pmm_init+0x7ac>
ffffffffc02025ae:	609c                	ld	a5,0(s1)
ffffffffc02025b0:	00093703          	ld	a4,0(s2)
ffffffffc02025b4:	639c                	ld	a5,0(a5)
ffffffffc02025b6:	078a                	slli	a5,a5,0x2
ffffffffc02025b8:	83b1                	srli	a5,a5,0xc
ffffffffc02025ba:	42e7fb63          	bgeu	a5,a4,ffffffffc02029f0 <pmm_init+0x704>
ffffffffc02025be:	fff80737          	lui	a4,0xfff80
ffffffffc02025c2:	000b3503          	ld	a0,0(s6)
ffffffffc02025c6:	97ba                	add	a5,a5,a4
ffffffffc02025c8:	079a                	slli	a5,a5,0x6
ffffffffc02025ca:	953e                	add	a0,a0,a5
ffffffffc02025cc:	4118                	lw	a4,0(a0)
ffffffffc02025ce:	4785                	li	a5,1
ffffffffc02025d0:	26f71763          	bne	a4,a5,ffffffffc020283e <pmm_init+0x552>
ffffffffc02025d4:	100027f3          	csrr	a5,sstatus
ffffffffc02025d8:	8b89                	andi	a5,a5,2
ffffffffc02025da:	1a079263          	bnez	a5,ffffffffc020277e <pmm_init+0x492>
ffffffffc02025de:	000bb783          	ld	a5,0(s7)
ffffffffc02025e2:	4585                	li	a1,1
ffffffffc02025e4:	739c                	ld	a5,32(a5)
ffffffffc02025e6:	9782                	jalr	a5
ffffffffc02025e8:	609c                	ld	a5,0(s1)
ffffffffc02025ea:	00005517          	auipc	a0,0x5
ffffffffc02025ee:	e6e50513          	addi	a0,a0,-402 # ffffffffc0207458 <etext+0x114e>
ffffffffc02025f2:	c0200437          	lui	s0,0xc0200
ffffffffc02025f6:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0x3fdc1960>
ffffffffc02025fa:	b8bfd0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02025fe:	00093703          	ld	a4,0(s2)
ffffffffc0202602:	7afd                	lui	s5,0xfffff
ffffffffc0202604:	6a05                	lui	s4,0x1
ffffffffc0202606:	00c71793          	slli	a5,a4,0xc
ffffffffc020260a:	02f47c63          	bgeu	s0,a5,ffffffffc0202642 <pmm_init+0x356>
ffffffffc020260e:	00c45793          	srli	a5,s0,0xc
ffffffffc0202612:	6088                	ld	a0,0(s1)
ffffffffc0202614:	1ee7f863          	bgeu	a5,a4,ffffffffc0202804 <pmm_init+0x518>
ffffffffc0202618:	0009b583          	ld	a1,0(s3)
ffffffffc020261c:	4601                	li	a2,0
ffffffffc020261e:	95a2                	add	a1,a1,s0
ffffffffc0202620:	eaeff0ef          	jal	ffffffffc0201cce <get_pte>
ffffffffc0202624:	1c050063          	beqz	a0,ffffffffc02027e4 <pmm_init+0x4f8>
ffffffffc0202628:	611c                	ld	a5,0(a0)
ffffffffc020262a:	078a                	slli	a5,a5,0x2
ffffffffc020262c:	0157f7b3          	and	a5,a5,s5
ffffffffc0202630:	18879a63          	bne	a5,s0,ffffffffc02027c4 <pmm_init+0x4d8>
ffffffffc0202634:	00093703          	ld	a4,0(s2)
ffffffffc0202638:	9452                	add	s0,s0,s4
ffffffffc020263a:	00c71793          	slli	a5,a4,0xc
ffffffffc020263e:	fcf468e3          	bltu	s0,a5,ffffffffc020260e <pmm_init+0x322>
ffffffffc0202642:	609c                	ld	a5,0(s1)
ffffffffc0202644:	639c                	ld	a5,0(a5)
ffffffffc0202646:	5a079e63          	bnez	a5,ffffffffc0202c02 <pmm_init+0x916>
ffffffffc020264a:	4505                	li	a0,1
ffffffffc020264c:	d78ff0ef          	jal	ffffffffc0201bc4 <alloc_pages>
ffffffffc0202650:	842a                	mv	s0,a0
ffffffffc0202652:	6088                	ld	a0,0(s1)
ffffffffc0202654:	4699                	li	a3,6
ffffffffc0202656:	10000613          	li	a2,256
ffffffffc020265a:	85a2                	mv	a1,s0
ffffffffc020265c:	b9dff0ef          	jal	ffffffffc02021f8 <page_insert>
ffffffffc0202660:	58051163          	bnez	a0,ffffffffc0202be2 <pmm_init+0x8f6>
ffffffffc0202664:	4018                	lw	a4,0(s0)
ffffffffc0202666:	4785                	li	a5,1
ffffffffc0202668:	1af71b63          	bne	a4,a5,ffffffffc020281e <pmm_init+0x532>
ffffffffc020266c:	6088                	ld	a0,0(s1)
ffffffffc020266e:	6605                	lui	a2,0x1
ffffffffc0202670:	4699                	li	a3,6
ffffffffc0202672:	10060613          	addi	a2,a2,256 # 1100 <_binary_obj___user_faultread_out_size-0xdf0>
ffffffffc0202676:	85a2                	mv	a1,s0
ffffffffc0202678:	b81ff0ef          	jal	ffffffffc02021f8 <page_insert>
ffffffffc020267c:	5e051363          	bnez	a0,ffffffffc0202c62 <pmm_init+0x976>
ffffffffc0202680:	4018                	lw	a4,0(s0)
ffffffffc0202682:	4789                	li	a5,2
ffffffffc0202684:	5af71f63          	bne	a4,a5,ffffffffc0202c42 <pmm_init+0x956>
ffffffffc0202688:	00005597          	auipc	a1,0x5
ffffffffc020268c:	f0858593          	addi	a1,a1,-248 # ffffffffc0207590 <etext+0x1286>
ffffffffc0202690:	10000513          	li	a0,256
ffffffffc0202694:	3ed030ef          	jal	ffffffffc0206280 <strcpy>
ffffffffc0202698:	6585                	lui	a1,0x1
ffffffffc020269a:	10058593          	addi	a1,a1,256 # 1100 <_binary_obj___user_faultread_out_size-0xdf0>
ffffffffc020269e:	10000513          	li	a0,256
ffffffffc02026a2:	3f1030ef          	jal	ffffffffc0206292 <strcmp>
ffffffffc02026a6:	56051e63          	bnez	a0,ffffffffc0202c22 <pmm_init+0x936>
ffffffffc02026aa:	000b3683          	ld	a3,0(s6)
ffffffffc02026ae:	000807b7          	lui	a5,0x80
ffffffffc02026b2:	00093703          	ld	a4,0(s2)
ffffffffc02026b6:	40d406b3          	sub	a3,s0,a3
ffffffffc02026ba:	8699                	srai	a3,a3,0x6
ffffffffc02026bc:	96be                	add	a3,a3,a5
ffffffffc02026be:	00c69793          	slli	a5,a3,0xc
ffffffffc02026c2:	83b1                	srli	a5,a5,0xc
ffffffffc02026c4:	06b2                	slli	a3,a3,0xc
ffffffffc02026c6:	50e7f263          	bgeu	a5,a4,ffffffffc0202bca <pmm_init+0x8de>
ffffffffc02026ca:	0009b783          	ld	a5,0(s3)
ffffffffc02026ce:	10000513          	li	a0,256
ffffffffc02026d2:	97b6                	add	a5,a5,a3
ffffffffc02026d4:	10078023          	sb	zero,256(a5) # 80100 <_binary_obj___user_matrix_out_size+0x7d4a0>
ffffffffc02026d8:	373030ef          	jal	ffffffffc020624a <strlen>
ffffffffc02026dc:	4c051763          	bnez	a0,ffffffffc0202baa <pmm_init+0x8be>
ffffffffc02026e0:	100027f3          	csrr	a5,sstatus
ffffffffc02026e4:	8b89                	andi	a5,a5,2
ffffffffc02026e6:	e7e1                	bnez	a5,ffffffffc02027ae <pmm_init+0x4c2>
ffffffffc02026e8:	000bb783          	ld	a5,0(s7)
ffffffffc02026ec:	4585                	li	a1,1
ffffffffc02026ee:	8522                	mv	a0,s0
ffffffffc02026f0:	739c                	ld	a5,32(a5)
ffffffffc02026f2:	9782                	jalr	a5
ffffffffc02026f4:	609c                	ld	a5,0(s1)
ffffffffc02026f6:	00093703          	ld	a4,0(s2)
ffffffffc02026fa:	639c                	ld	a5,0(a5)
ffffffffc02026fc:	078a                	slli	a5,a5,0x2
ffffffffc02026fe:	83b1                	srli	a5,a5,0xc
ffffffffc0202700:	2ee7f863          	bgeu	a5,a4,ffffffffc02029f0 <pmm_init+0x704>
ffffffffc0202704:	000b3503          	ld	a0,0(s6)
ffffffffc0202708:	fff80737          	lui	a4,0xfff80
ffffffffc020270c:	97ba                	add	a5,a5,a4
ffffffffc020270e:	079a                	slli	a5,a5,0x6
ffffffffc0202710:	953e                	add	a0,a0,a5
ffffffffc0202712:	100027f3          	csrr	a5,sstatus
ffffffffc0202716:	8b89                	andi	a5,a5,2
ffffffffc0202718:	efbd                	bnez	a5,ffffffffc0202796 <pmm_init+0x4aa>
ffffffffc020271a:	000bb783          	ld	a5,0(s7)
ffffffffc020271e:	4585                	li	a1,1
ffffffffc0202720:	739c                	ld	a5,32(a5)
ffffffffc0202722:	9782                	jalr	a5
ffffffffc0202724:	609c                	ld	a5,0(s1)
ffffffffc0202726:	00005517          	auipc	a0,0x5
ffffffffc020272a:	ee250513          	addi	a0,a0,-286 # ffffffffc0207608 <etext+0x12fe>
ffffffffc020272e:	0007b023          	sd	zero,0(a5)
ffffffffc0202732:	a53fd0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0202736:	6446                	ld	s0,80(sp)
ffffffffc0202738:	60e6                	ld	ra,88(sp)
ffffffffc020273a:	64a6                	ld	s1,72(sp)
ffffffffc020273c:	6906                	ld	s2,64(sp)
ffffffffc020273e:	79e2                	ld	s3,56(sp)
ffffffffc0202740:	7a42                	ld	s4,48(sp)
ffffffffc0202742:	7aa2                	ld	s5,40(sp)
ffffffffc0202744:	7b02                	ld	s6,32(sp)
ffffffffc0202746:	6be2                	ld	s7,24(sp)
ffffffffc0202748:	6125                	addi	sp,sp,96
ffffffffc020274a:	a7eff06f          	j	ffffffffc02019c8 <kmalloc_init>
ffffffffc020274e:	6785                	lui	a5,0x1
ffffffffc0202750:	17fd                	addi	a5,a5,-1 # fff <_binary_obj___user_faultread_out_size-0xef1>
ffffffffc0202752:	96be                	add	a3,a3,a5
ffffffffc0202754:	77fd                	lui	a5,0xfffff
ffffffffc0202756:	8ff5                	and	a5,a5,a3
ffffffffc0202758:	00c7d693          	srli	a3,a5,0xc
ffffffffc020275c:	28c6fa63          	bgeu	a3,a2,ffffffffc02029f0 <pmm_init+0x704>
ffffffffc0202760:	000bb603          	ld	a2,0(s7)
ffffffffc0202764:	fff805b7          	lui	a1,0xfff80
ffffffffc0202768:	96ae                	add	a3,a3,a1
ffffffffc020276a:	6a10                	ld	a2,16(a2)
ffffffffc020276c:	8f1d                	sub	a4,a4,a5
ffffffffc020276e:	069a                	slli	a3,a3,0x6
ffffffffc0202770:	00c75593          	srli	a1,a4,0xc
ffffffffc0202774:	9536                	add	a0,a0,a3
ffffffffc0202776:	9602                	jalr	a2
ffffffffc0202778:	0009b583          	ld	a1,0(s3)
ffffffffc020277c:	b18d                	j	ffffffffc02023de <pmm_init+0xf2>
ffffffffc020277e:	e42a                	sd	a0,8(sp)
ffffffffc0202780:	ebbfd0ef          	jal	ffffffffc020063a <intr_disable>
ffffffffc0202784:	000bb783          	ld	a5,0(s7)
ffffffffc0202788:	6522                	ld	a0,8(sp)
ffffffffc020278a:	4585                	li	a1,1
ffffffffc020278c:	739c                	ld	a5,32(a5)
ffffffffc020278e:	9782                	jalr	a5
ffffffffc0202790:	ea5fd0ef          	jal	ffffffffc0200634 <intr_enable>
ffffffffc0202794:	bd91                	j	ffffffffc02025e8 <pmm_init+0x2fc>
ffffffffc0202796:	e42a                	sd	a0,8(sp)
ffffffffc0202798:	ea3fd0ef          	jal	ffffffffc020063a <intr_disable>
ffffffffc020279c:	000bb783          	ld	a5,0(s7)
ffffffffc02027a0:	6522                	ld	a0,8(sp)
ffffffffc02027a2:	4585                	li	a1,1
ffffffffc02027a4:	739c                	ld	a5,32(a5)
ffffffffc02027a6:	9782                	jalr	a5
ffffffffc02027a8:	e8dfd0ef          	jal	ffffffffc0200634 <intr_enable>
ffffffffc02027ac:	bfa5                	j	ffffffffc0202724 <pmm_init+0x438>
ffffffffc02027ae:	e8dfd0ef          	jal	ffffffffc020063a <intr_disable>
ffffffffc02027b2:	000bb783          	ld	a5,0(s7)
ffffffffc02027b6:	4585                	li	a1,1
ffffffffc02027b8:	8522                	mv	a0,s0
ffffffffc02027ba:	739c                	ld	a5,32(a5)
ffffffffc02027bc:	9782                	jalr	a5
ffffffffc02027be:	e77fd0ef          	jal	ffffffffc0200634 <intr_enable>
ffffffffc02027c2:	bf0d                	j	ffffffffc02026f4 <pmm_init+0x408>
ffffffffc02027c4:	00005697          	auipc	a3,0x5
ffffffffc02027c8:	cf468693          	addi	a3,a3,-780 # ffffffffc02074b8 <etext+0x11ae>
ffffffffc02027cc:	00004617          	auipc	a2,0x4
ffffffffc02027d0:	1bc60613          	addi	a2,a2,444 # ffffffffc0206988 <etext+0x67e>
ffffffffc02027d4:	22700593          	li	a1,551
ffffffffc02027d8:	00005517          	auipc	a0,0x5
ffffffffc02027dc:	8f050513          	addi	a0,a0,-1808 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc02027e0:	c99fd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02027e4:	00005697          	auipc	a3,0x5
ffffffffc02027e8:	c9468693          	addi	a3,a3,-876 # ffffffffc0207478 <etext+0x116e>
ffffffffc02027ec:	00004617          	auipc	a2,0x4
ffffffffc02027f0:	19c60613          	addi	a2,a2,412 # ffffffffc0206988 <etext+0x67e>
ffffffffc02027f4:	22600593          	li	a1,550
ffffffffc02027f8:	00005517          	auipc	a0,0x5
ffffffffc02027fc:	8d050513          	addi	a0,a0,-1840 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0202800:	c79fd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202804:	86a2                	mv	a3,s0
ffffffffc0202806:	00004617          	auipc	a2,0x4
ffffffffc020280a:	7aa60613          	addi	a2,a2,1962 # ffffffffc0206fb0 <etext+0xca6>
ffffffffc020280e:	22600593          	li	a1,550
ffffffffc0202812:	00005517          	auipc	a0,0x5
ffffffffc0202816:	8b650513          	addi	a0,a0,-1866 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc020281a:	c5ffd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc020281e:	00005697          	auipc	a3,0x5
ffffffffc0202822:	d0268693          	addi	a3,a3,-766 # ffffffffc0207520 <etext+0x1216>
ffffffffc0202826:	00004617          	auipc	a2,0x4
ffffffffc020282a:	16260613          	addi	a2,a2,354 # ffffffffc0206988 <etext+0x67e>
ffffffffc020282e:	23000593          	li	a1,560
ffffffffc0202832:	00005517          	auipc	a0,0x5
ffffffffc0202836:	89650513          	addi	a0,a0,-1898 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc020283a:	c3ffd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc020283e:	00005697          	auipc	a3,0x5
ffffffffc0202842:	bf268693          	addi	a3,a3,-1038 # ffffffffc0207430 <etext+0x1126>
ffffffffc0202846:	00004617          	auipc	a2,0x4
ffffffffc020284a:	14260613          	addi	a2,a2,322 # ffffffffc0206988 <etext+0x67e>
ffffffffc020284e:	21b00593          	li	a1,539
ffffffffc0202852:	00005517          	auipc	a0,0x5
ffffffffc0202856:	87650513          	addi	a0,a0,-1930 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc020285a:	c1ffd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc020285e:	86aa                	mv	a3,a0
ffffffffc0202860:	00004617          	auipc	a2,0x4
ffffffffc0202864:	7f860613          	addi	a2,a2,2040 # ffffffffc0207058 <etext+0xd4e>
ffffffffc0202868:	0c100593          	li	a1,193
ffffffffc020286c:	00005517          	auipc	a0,0x5
ffffffffc0202870:	85c50513          	addi	a0,a0,-1956 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0202874:	c05fd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202878:	00005697          	auipc	a3,0x5
ffffffffc020287c:	ba068693          	addi	a3,a3,-1120 # ffffffffc0207418 <etext+0x110e>
ffffffffc0202880:	00004617          	auipc	a2,0x4
ffffffffc0202884:	10860613          	addi	a2,a2,264 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202888:	21800593          	li	a1,536
ffffffffc020288c:	00005517          	auipc	a0,0x5
ffffffffc0202890:	83c50513          	addi	a0,a0,-1988 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0202894:	be5fd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202898:	00005697          	auipc	a3,0x5
ffffffffc020289c:	b5068693          	addi	a3,a3,-1200 # ffffffffc02073e8 <etext+0x10de>
ffffffffc02028a0:	00004617          	auipc	a2,0x4
ffffffffc02028a4:	0e860613          	addi	a2,a2,232 # ffffffffc0206988 <etext+0x67e>
ffffffffc02028a8:	21500593          	li	a1,533
ffffffffc02028ac:	00005517          	auipc	a0,0x5
ffffffffc02028b0:	81c50513          	addi	a0,a0,-2020 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc02028b4:	bc5fd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02028b8:	00005697          	auipc	a3,0x5
ffffffffc02028bc:	9f068693          	addi	a3,a3,-1552 # ffffffffc02072a8 <etext+0xf9e>
ffffffffc02028c0:	00004617          	auipc	a2,0x4
ffffffffc02028c4:	0c860613          	addi	a2,a2,200 # ffffffffc0206988 <etext+0x67e>
ffffffffc02028c8:	21400593          	li	a1,532
ffffffffc02028cc:	00004517          	auipc	a0,0x4
ffffffffc02028d0:	7fc50513          	addi	a0,a0,2044 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc02028d4:	ba5fd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02028d8:	00004617          	auipc	a2,0x4
ffffffffc02028dc:	78060613          	addi	a2,a2,1920 # ffffffffc0207058 <etext+0xd4e>
ffffffffc02028e0:	07f00593          	li	a1,127
ffffffffc02028e4:	00004517          	auipc	a0,0x4
ffffffffc02028e8:	7e450513          	addi	a0,a0,2020 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc02028ec:	b8dfd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02028f0:	00005697          	auipc	a3,0x5
ffffffffc02028f4:	9a068693          	addi	a3,a3,-1632 # ffffffffc0207290 <etext+0xf86>
ffffffffc02028f8:	00004617          	auipc	a2,0x4
ffffffffc02028fc:	09060613          	addi	a2,a2,144 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202900:	21000593          	li	a1,528
ffffffffc0202904:	00004517          	auipc	a0,0x4
ffffffffc0202908:	7c450513          	addi	a0,a0,1988 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc020290c:	b6dfd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202910:	00005697          	auipc	a3,0x5
ffffffffc0202914:	a1068693          	addi	a3,a3,-1520 # ffffffffc0207320 <etext+0x1016>
ffffffffc0202918:	00004617          	auipc	a2,0x4
ffffffffc020291c:	07060613          	addi	a2,a2,112 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202920:	20f00593          	li	a1,527
ffffffffc0202924:	00004517          	auipc	a0,0x4
ffffffffc0202928:	7a450513          	addi	a0,a0,1956 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc020292c:	b4dfd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202930:	00005697          	auipc	a3,0x5
ffffffffc0202934:	ab868693          	addi	a3,a3,-1352 # ffffffffc02073e8 <etext+0x10de>
ffffffffc0202938:	00004617          	auipc	a2,0x4
ffffffffc020293c:	05060613          	addi	a2,a2,80 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202940:	20e00593          	li	a1,526
ffffffffc0202944:	00004517          	auipc	a0,0x4
ffffffffc0202948:	78450513          	addi	a0,a0,1924 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc020294c:	b2dfd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202950:	00005697          	auipc	a3,0x5
ffffffffc0202954:	a8068693          	addi	a3,a3,-1408 # ffffffffc02073d0 <etext+0x10c6>
ffffffffc0202958:	00004617          	auipc	a2,0x4
ffffffffc020295c:	03060613          	addi	a2,a2,48 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202960:	20d00593          	li	a1,525
ffffffffc0202964:	00004517          	auipc	a0,0x4
ffffffffc0202968:	76450513          	addi	a0,a0,1892 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc020296c:	b0dfd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202970:	00005697          	auipc	a3,0x5
ffffffffc0202974:	a3068693          	addi	a3,a3,-1488 # ffffffffc02073a0 <etext+0x1096>
ffffffffc0202978:	00004617          	auipc	a2,0x4
ffffffffc020297c:	01060613          	addi	a2,a2,16 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202980:	20c00593          	li	a1,524
ffffffffc0202984:	00004517          	auipc	a0,0x4
ffffffffc0202988:	74450513          	addi	a0,a0,1860 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc020298c:	aedfd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202990:	00005697          	auipc	a3,0x5
ffffffffc0202994:	9f868693          	addi	a3,a3,-1544 # ffffffffc0207388 <etext+0x107e>
ffffffffc0202998:	00004617          	auipc	a2,0x4
ffffffffc020299c:	ff060613          	addi	a2,a2,-16 # ffffffffc0206988 <etext+0x67e>
ffffffffc02029a0:	20a00593          	li	a1,522
ffffffffc02029a4:	00004517          	auipc	a0,0x4
ffffffffc02029a8:	72450513          	addi	a0,a0,1828 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc02029ac:	acdfd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02029b0:	00005697          	auipc	a3,0x5
ffffffffc02029b4:	9c068693          	addi	a3,a3,-1600 # ffffffffc0207370 <etext+0x1066>
ffffffffc02029b8:	00004617          	auipc	a2,0x4
ffffffffc02029bc:	fd060613          	addi	a2,a2,-48 # ffffffffc0206988 <etext+0x67e>
ffffffffc02029c0:	20900593          	li	a1,521
ffffffffc02029c4:	00004517          	auipc	a0,0x4
ffffffffc02029c8:	70450513          	addi	a0,a0,1796 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc02029cc:	aadfd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02029d0:	00005697          	auipc	a3,0x5
ffffffffc02029d4:	99068693          	addi	a3,a3,-1648 # ffffffffc0207360 <etext+0x1056>
ffffffffc02029d8:	00004617          	auipc	a2,0x4
ffffffffc02029dc:	fb060613          	addi	a2,a2,-80 # ffffffffc0206988 <etext+0x67e>
ffffffffc02029e0:	20800593          	li	a1,520
ffffffffc02029e4:	00004517          	auipc	a0,0x4
ffffffffc02029e8:	6e450513          	addi	a0,a0,1764 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc02029ec:	a8dfd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02029f0:	99cff0ef          	jal	ffffffffc0201b8c <pa2page.part.0>
ffffffffc02029f4:	9b4ff0ef          	jal	ffffffffc0201ba8 <pte2page.part.0>
ffffffffc02029f8:	00005697          	auipc	a3,0x5
ffffffffc02029fc:	86868693          	addi	a3,a3,-1944 # ffffffffc0207260 <etext+0xf56>
ffffffffc0202a00:	00004617          	auipc	a2,0x4
ffffffffc0202a04:	f8860613          	addi	a2,a2,-120 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202a08:	1fc00593          	li	a1,508
ffffffffc0202a0c:	00004517          	auipc	a0,0x4
ffffffffc0202a10:	6bc50513          	addi	a0,a0,1724 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0202a14:	a65fd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202a18:	00005697          	auipc	a3,0x5
ffffffffc0202a1c:	81868693          	addi	a3,a3,-2024 # ffffffffc0207230 <etext+0xf26>
ffffffffc0202a20:	00004617          	auipc	a2,0x4
ffffffffc0202a24:	f6860613          	addi	a2,a2,-152 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202a28:	1f900593          	li	a1,505
ffffffffc0202a2c:	00004517          	auipc	a0,0x4
ffffffffc0202a30:	69c50513          	addi	a0,a0,1692 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0202a34:	a45fd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202a38:	00004697          	auipc	a3,0x4
ffffffffc0202a3c:	7d068693          	addi	a3,a3,2000 # ffffffffc0207208 <etext+0xefe>
ffffffffc0202a40:	00004617          	auipc	a2,0x4
ffffffffc0202a44:	f4860613          	addi	a2,a2,-184 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202a48:	1f500593          	li	a1,501
ffffffffc0202a4c:	00004517          	auipc	a0,0x4
ffffffffc0202a50:	67c50513          	addi	a0,a0,1660 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0202a54:	a25fd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202a58:	00004697          	auipc	a3,0x4
ffffffffc0202a5c:	77868693          	addi	a3,a3,1912 # ffffffffc02071d0 <etext+0xec6>
ffffffffc0202a60:	00004617          	auipc	a2,0x4
ffffffffc0202a64:	f2860613          	addi	a2,a2,-216 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202a68:	1f400593          	li	a1,500
ffffffffc0202a6c:	00004517          	auipc	a0,0x4
ffffffffc0202a70:	65c50513          	addi	a0,a0,1628 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0202a74:	a05fd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202a78:	00004697          	auipc	a3,0x4
ffffffffc0202a7c:	73868693          	addi	a3,a3,1848 # ffffffffc02071b0 <etext+0xea6>
ffffffffc0202a80:	00004617          	auipc	a2,0x4
ffffffffc0202a84:	f0860613          	addi	a2,a2,-248 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202a88:	1f300593          	li	a1,499
ffffffffc0202a8c:	00004517          	auipc	a0,0x4
ffffffffc0202a90:	63c50513          	addi	a0,a0,1596 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0202a94:	9e5fd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202a98:	00005697          	auipc	a3,0x5
ffffffffc0202a9c:	95068693          	addi	a3,a3,-1712 # ffffffffc02073e8 <etext+0x10de>
ffffffffc0202aa0:	00004617          	auipc	a2,0x4
ffffffffc0202aa4:	ee860613          	addi	a2,a2,-280 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202aa8:	21900593          	li	a1,537
ffffffffc0202aac:	00004517          	auipc	a0,0x4
ffffffffc0202ab0:	61c50513          	addi	a0,a0,1564 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0202ab4:	9c5fd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202ab8:	00005697          	auipc	a3,0x5
ffffffffc0202abc:	89868693          	addi	a3,a3,-1896 # ffffffffc0207350 <etext+0x1046>
ffffffffc0202ac0:	00004617          	auipc	a2,0x4
ffffffffc0202ac4:	ec860613          	addi	a2,a2,-312 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202ac8:	20700593          	li	a1,519
ffffffffc0202acc:	00004517          	auipc	a0,0x4
ffffffffc0202ad0:	5fc50513          	addi	a0,a0,1532 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0202ad4:	9a5fd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202ad8:	00005697          	auipc	a3,0x5
ffffffffc0202adc:	84868693          	addi	a3,a3,-1976 # ffffffffc0207320 <etext+0x1016>
ffffffffc0202ae0:	00004617          	auipc	a2,0x4
ffffffffc0202ae4:	ea860613          	addi	a2,a2,-344 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202ae8:	20600593          	li	a1,518
ffffffffc0202aec:	00004517          	auipc	a0,0x4
ffffffffc0202af0:	5dc50513          	addi	a0,a0,1500 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0202af4:	985fd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202af8:	00004697          	auipc	a3,0x4
ffffffffc0202afc:	7f068693          	addi	a3,a3,2032 # ffffffffc02072e8 <etext+0xfde>
ffffffffc0202b00:	00004617          	auipc	a2,0x4
ffffffffc0202b04:	e8860613          	addi	a2,a2,-376 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202b08:	20500593          	li	a1,517
ffffffffc0202b0c:	00004517          	auipc	a0,0x4
ffffffffc0202b10:	5bc50513          	addi	a0,a0,1468 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0202b14:	965fd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202b18:	00004697          	auipc	a3,0x4
ffffffffc0202b1c:	7a868693          	addi	a3,a3,1960 # ffffffffc02072c0 <etext+0xfb6>
ffffffffc0202b20:	00004617          	auipc	a2,0x4
ffffffffc0202b24:	e6860613          	addi	a2,a2,-408 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202b28:	20200593          	li	a1,514
ffffffffc0202b2c:	00004517          	auipc	a0,0x4
ffffffffc0202b30:	59c50513          	addi	a0,a0,1436 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0202b34:	945fd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202b38:	86d2                	mv	a3,s4
ffffffffc0202b3a:	00004617          	auipc	a2,0x4
ffffffffc0202b3e:	47660613          	addi	a2,a2,1142 # ffffffffc0206fb0 <etext+0xca6>
ffffffffc0202b42:	20100593          	li	a1,513
ffffffffc0202b46:	00004517          	auipc	a0,0x4
ffffffffc0202b4a:	58250513          	addi	a0,a0,1410 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0202b4e:	92bfd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202b52:	00004617          	auipc	a2,0x4
ffffffffc0202b56:	45e60613          	addi	a2,a2,1118 # ffffffffc0206fb0 <etext+0xca6>
ffffffffc0202b5a:	20000593          	li	a1,512
ffffffffc0202b5e:	00004517          	auipc	a0,0x4
ffffffffc0202b62:	56a50513          	addi	a0,a0,1386 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0202b66:	913fd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202b6a:	00004697          	auipc	a3,0x4
ffffffffc0202b6e:	73e68693          	addi	a3,a3,1854 # ffffffffc02072a8 <etext+0xf9e>
ffffffffc0202b72:	00004617          	auipc	a2,0x4
ffffffffc0202b76:	e1660613          	addi	a2,a2,-490 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202b7a:	1fe00593          	li	a1,510
ffffffffc0202b7e:	00004517          	auipc	a0,0x4
ffffffffc0202b82:	54a50513          	addi	a0,a0,1354 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0202b86:	8f3fd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202b8a:	00005697          	auipc	a3,0x5
ffffffffc0202b8e:	87668693          	addi	a3,a3,-1930 # ffffffffc0207400 <etext+0x10f6>
ffffffffc0202b92:	00004617          	auipc	a2,0x4
ffffffffc0202b96:	df660613          	addi	a2,a2,-522 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202b9a:	21100593          	li	a1,529
ffffffffc0202b9e:	00004517          	auipc	a0,0x4
ffffffffc0202ba2:	52a50513          	addi	a0,a0,1322 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0202ba6:	8d3fd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202baa:	00005697          	auipc	a3,0x5
ffffffffc0202bae:	a3668693          	addi	a3,a3,-1482 # ffffffffc02075e0 <etext+0x12d6>
ffffffffc0202bb2:	00004617          	auipc	a2,0x4
ffffffffc0202bb6:	dd660613          	addi	a2,a2,-554 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202bba:	23900593          	li	a1,569
ffffffffc0202bbe:	00004517          	auipc	a0,0x4
ffffffffc0202bc2:	50a50513          	addi	a0,a0,1290 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0202bc6:	8b3fd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202bca:	00004617          	auipc	a2,0x4
ffffffffc0202bce:	3e660613          	addi	a2,a2,998 # ffffffffc0206fb0 <etext+0xca6>
ffffffffc0202bd2:	06900593          	li	a1,105
ffffffffc0202bd6:	00004517          	auipc	a0,0x4
ffffffffc0202bda:	40250513          	addi	a0,a0,1026 # ffffffffc0206fd8 <etext+0xcce>
ffffffffc0202bde:	89bfd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202be2:	00005697          	auipc	a3,0x5
ffffffffc0202be6:	90668693          	addi	a3,a3,-1786 # ffffffffc02074e8 <etext+0x11de>
ffffffffc0202bea:	00004617          	auipc	a2,0x4
ffffffffc0202bee:	d9e60613          	addi	a2,a2,-610 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202bf2:	22f00593          	li	a1,559
ffffffffc0202bf6:	00004517          	auipc	a0,0x4
ffffffffc0202bfa:	4d250513          	addi	a0,a0,1234 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0202bfe:	87bfd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202c02:	00005697          	auipc	a3,0x5
ffffffffc0202c06:	8ce68693          	addi	a3,a3,-1842 # ffffffffc02074d0 <etext+0x11c6>
ffffffffc0202c0a:	00004617          	auipc	a2,0x4
ffffffffc0202c0e:	d7e60613          	addi	a2,a2,-642 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202c12:	22b00593          	li	a1,555
ffffffffc0202c16:	00004517          	auipc	a0,0x4
ffffffffc0202c1a:	4b250513          	addi	a0,a0,1202 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0202c1e:	85bfd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202c22:	00005697          	auipc	a3,0x5
ffffffffc0202c26:	98668693          	addi	a3,a3,-1658 # ffffffffc02075a8 <etext+0x129e>
ffffffffc0202c2a:	00004617          	auipc	a2,0x4
ffffffffc0202c2e:	d5e60613          	addi	a2,a2,-674 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202c32:	23600593          	li	a1,566
ffffffffc0202c36:	00004517          	auipc	a0,0x4
ffffffffc0202c3a:	49250513          	addi	a0,a0,1170 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0202c3e:	83bfd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202c42:	00005697          	auipc	a3,0x5
ffffffffc0202c46:	93668693          	addi	a3,a3,-1738 # ffffffffc0207578 <etext+0x126e>
ffffffffc0202c4a:	00004617          	auipc	a2,0x4
ffffffffc0202c4e:	d3e60613          	addi	a2,a2,-706 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202c52:	23200593          	li	a1,562
ffffffffc0202c56:	00004517          	auipc	a0,0x4
ffffffffc0202c5a:	47250513          	addi	a0,a0,1138 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0202c5e:	81bfd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202c62:	00005697          	auipc	a3,0x5
ffffffffc0202c66:	8d668693          	addi	a3,a3,-1834 # ffffffffc0207538 <etext+0x122e>
ffffffffc0202c6a:	00004617          	auipc	a2,0x4
ffffffffc0202c6e:	d1e60613          	addi	a2,a2,-738 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202c72:	23100593          	li	a1,561
ffffffffc0202c76:	00004517          	auipc	a0,0x4
ffffffffc0202c7a:	45250513          	addi	a0,a0,1106 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0202c7e:	ffafd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202c82:	00004697          	auipc	a3,0x4
ffffffffc0202c86:	60e68693          	addi	a3,a3,1550 # ffffffffc0207290 <etext+0xf86>
ffffffffc0202c8a:	00004617          	auipc	a2,0x4
ffffffffc0202c8e:	cfe60613          	addi	a2,a2,-770 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202c92:	1fd00593          	li	a1,509
ffffffffc0202c96:	00004517          	auipc	a0,0x4
ffffffffc0202c9a:	43250513          	addi	a0,a0,1074 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0202c9e:	fdafd0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc0202ca2 <copy_range>:
ffffffffc0202ca2:	7159                	addi	sp,sp,-112
ffffffffc0202ca4:	00d667b3          	or	a5,a2,a3
ffffffffc0202ca8:	f486                	sd	ra,104(sp)
ffffffffc0202caa:	f0a2                	sd	s0,96(sp)
ffffffffc0202cac:	eca6                	sd	s1,88(sp)
ffffffffc0202cae:	e8ca                	sd	s2,80(sp)
ffffffffc0202cb0:	e4ce                	sd	s3,72(sp)
ffffffffc0202cb2:	e0d2                	sd	s4,64(sp)
ffffffffc0202cb4:	fc56                	sd	s5,56(sp)
ffffffffc0202cb6:	f85a                	sd	s6,48(sp)
ffffffffc0202cb8:	f45e                	sd	s7,40(sp)
ffffffffc0202cba:	f062                	sd	s8,32(sp)
ffffffffc0202cbc:	ec66                	sd	s9,24(sp)
ffffffffc0202cbe:	e86a                	sd	s10,16(sp)
ffffffffc0202cc0:	e46e                	sd	s11,8(sp)
ffffffffc0202cc2:	17d2                	slli	a5,a5,0x34
ffffffffc0202cc4:	1e079563          	bnez	a5,ffffffffc0202eae <copy_range+0x20c>
ffffffffc0202cc8:	002007b7          	lui	a5,0x200
ffffffffc0202ccc:	8432                	mv	s0,a2
ffffffffc0202cce:	16f66863          	bltu	a2,a5,ffffffffc0202e3e <copy_range+0x19c>
ffffffffc0202cd2:	8936                	mv	s2,a3
ffffffffc0202cd4:	16d67563          	bgeu	a2,a3,ffffffffc0202e3e <copy_range+0x19c>
ffffffffc0202cd8:	4785                	li	a5,1
ffffffffc0202cda:	07fe                	slli	a5,a5,0x1f
ffffffffc0202cdc:	16d7e163          	bltu	a5,a3,ffffffffc0202e3e <copy_range+0x19c>
ffffffffc0202ce0:	5b7d                	li	s6,-1
ffffffffc0202ce2:	8aaa                	mv	s5,a0
ffffffffc0202ce4:	89ae                	mv	s3,a1
ffffffffc0202ce6:	6a05                	lui	s4,0x1
ffffffffc0202ce8:	0003bc97          	auipc	s9,0x3b
ffffffffc0202cec:	950c8c93          	addi	s9,s9,-1712 # ffffffffc023d638 <npage>
ffffffffc0202cf0:	0003bc17          	auipc	s8,0x3b
ffffffffc0202cf4:	950c0c13          	addi	s8,s8,-1712 # ffffffffc023d640 <pages>
ffffffffc0202cf8:	00080bb7          	lui	s7,0x80
ffffffffc0202cfc:	00cb5b13          	srli	s6,s6,0xc
ffffffffc0202d00:	4601                	li	a2,0
ffffffffc0202d02:	85a2                	mv	a1,s0
ffffffffc0202d04:	854e                	mv	a0,s3
ffffffffc0202d06:	fc9fe0ef          	jal	ffffffffc0201cce <get_pte>
ffffffffc0202d0a:	84aa                	mv	s1,a0
ffffffffc0202d0c:	c17d                	beqz	a0,ffffffffc0202df2 <copy_range+0x150>
ffffffffc0202d0e:	611c                	ld	a5,0(a0)
ffffffffc0202d10:	8b85                	andi	a5,a5,1
ffffffffc0202d12:	e78d                	bnez	a5,ffffffffc0202d3c <copy_range+0x9a>
ffffffffc0202d14:	9452                	add	s0,s0,s4
ffffffffc0202d16:	c019                	beqz	s0,ffffffffc0202d1c <copy_range+0x7a>
ffffffffc0202d18:	ff2464e3          	bltu	s0,s2,ffffffffc0202d00 <copy_range+0x5e>
ffffffffc0202d1c:	4501                	li	a0,0
ffffffffc0202d1e:	70a6                	ld	ra,104(sp)
ffffffffc0202d20:	7406                	ld	s0,96(sp)
ffffffffc0202d22:	64e6                	ld	s1,88(sp)
ffffffffc0202d24:	6946                	ld	s2,80(sp)
ffffffffc0202d26:	69a6                	ld	s3,72(sp)
ffffffffc0202d28:	6a06                	ld	s4,64(sp)
ffffffffc0202d2a:	7ae2                	ld	s5,56(sp)
ffffffffc0202d2c:	7b42                	ld	s6,48(sp)
ffffffffc0202d2e:	7ba2                	ld	s7,40(sp)
ffffffffc0202d30:	7c02                	ld	s8,32(sp)
ffffffffc0202d32:	6ce2                	ld	s9,24(sp)
ffffffffc0202d34:	6d42                	ld	s10,16(sp)
ffffffffc0202d36:	6da2                	ld	s11,8(sp)
ffffffffc0202d38:	6165                	addi	sp,sp,112
ffffffffc0202d3a:	8082                	ret
ffffffffc0202d3c:	4605                	li	a2,1
ffffffffc0202d3e:	85a2                	mv	a1,s0
ffffffffc0202d40:	8556                	mv	a0,s5
ffffffffc0202d42:	f8dfe0ef          	jal	ffffffffc0201cce <get_pte>
ffffffffc0202d46:	cd4d                	beqz	a0,ffffffffc0202e00 <copy_range+0x15e>
ffffffffc0202d48:	609c                	ld	a5,0(s1)
ffffffffc0202d4a:	0017f713          	andi	a4,a5,1
ffffffffc0202d4e:	01f7f493          	andi	s1,a5,31
ffffffffc0202d52:	14070263          	beqz	a4,ffffffffc0202e96 <copy_range+0x1f4>
ffffffffc0202d56:	000cb683          	ld	a3,0(s9)
ffffffffc0202d5a:	078a                	slli	a5,a5,0x2
ffffffffc0202d5c:	00c7d713          	srli	a4,a5,0xc
ffffffffc0202d60:	10d77f63          	bgeu	a4,a3,ffffffffc0202e7e <copy_range+0x1dc>
ffffffffc0202d64:	000c3783          	ld	a5,0(s8)
ffffffffc0202d68:	fff806b7          	lui	a3,0xfff80
ffffffffc0202d6c:	9736                	add	a4,a4,a3
ffffffffc0202d6e:	071a                	slli	a4,a4,0x6
ffffffffc0202d70:	4505                	li	a0,1
ffffffffc0202d72:	00e78db3          	add	s11,a5,a4
ffffffffc0202d76:	e4ffe0ef          	jal	ffffffffc0201bc4 <alloc_pages>
ffffffffc0202d7a:	8d2a                	mv	s10,a0
ffffffffc0202d7c:	0a0d8163          	beqz	s11,ffffffffc0202e1e <copy_range+0x17c>
ffffffffc0202d80:	cd79                	beqz	a0,ffffffffc0202e5e <copy_range+0x1bc>
ffffffffc0202d82:	000c3703          	ld	a4,0(s8)
ffffffffc0202d86:	000cb603          	ld	a2,0(s9)
ffffffffc0202d8a:	40ed86b3          	sub	a3,s11,a4
ffffffffc0202d8e:	8699                	srai	a3,a3,0x6
ffffffffc0202d90:	96de                	add	a3,a3,s7
ffffffffc0202d92:	0166f7b3          	and	a5,a3,s6
ffffffffc0202d96:	06b2                	slli	a3,a3,0xc
ffffffffc0202d98:	06c7f763          	bgeu	a5,a2,ffffffffc0202e06 <copy_range+0x164>
ffffffffc0202d9c:	40e507b3          	sub	a5,a0,a4
ffffffffc0202da0:	0003b717          	auipc	a4,0x3b
ffffffffc0202da4:	89070713          	addi	a4,a4,-1904 # ffffffffc023d630 <va_pa_offset>
ffffffffc0202da8:	6308                	ld	a0,0(a4)
ffffffffc0202daa:	8799                	srai	a5,a5,0x6
ffffffffc0202dac:	97de                	add	a5,a5,s7
ffffffffc0202dae:	0167f733          	and	a4,a5,s6
ffffffffc0202db2:	00a685b3          	add	a1,a3,a0
ffffffffc0202db6:	07b2                	slli	a5,a5,0xc
ffffffffc0202db8:	04c77663          	bgeu	a4,a2,ffffffffc0202e04 <copy_range+0x162>
ffffffffc0202dbc:	6605                	lui	a2,0x1
ffffffffc0202dbe:	953e                	add	a0,a0,a5
ffffffffc0202dc0:	532030ef          	jal	ffffffffc02062f2 <memcpy>
ffffffffc0202dc4:	86a6                	mv	a3,s1
ffffffffc0202dc6:	8622                	mv	a2,s0
ffffffffc0202dc8:	85ea                	mv	a1,s10
ffffffffc0202dca:	8556                	mv	a0,s5
ffffffffc0202dcc:	c2cff0ef          	jal	ffffffffc02021f8 <page_insert>
ffffffffc0202dd0:	d131                	beqz	a0,ffffffffc0202d14 <copy_range+0x72>
ffffffffc0202dd2:	00005697          	auipc	a3,0x5
ffffffffc0202dd6:	87668693          	addi	a3,a3,-1930 # ffffffffc0207648 <etext+0x133e>
ffffffffc0202dda:	00004617          	auipc	a2,0x4
ffffffffc0202dde:	bae60613          	addi	a2,a2,-1106 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202de2:	19900593          	li	a1,409
ffffffffc0202de6:	00004517          	auipc	a0,0x4
ffffffffc0202dea:	2e250513          	addi	a0,a0,738 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0202dee:	e8afd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202df2:	002007b7          	lui	a5,0x200
ffffffffc0202df6:	97a2                	add	a5,a5,s0
ffffffffc0202df8:	ffe00437          	lui	s0,0xffe00
ffffffffc0202dfc:	8c7d                	and	s0,s0,a5
ffffffffc0202dfe:	bf21                	j	ffffffffc0202d16 <copy_range+0x74>
ffffffffc0202e00:	5571                	li	a0,-4
ffffffffc0202e02:	bf31                	j	ffffffffc0202d1e <copy_range+0x7c>
ffffffffc0202e04:	86be                	mv	a3,a5
ffffffffc0202e06:	00004617          	auipc	a2,0x4
ffffffffc0202e0a:	1aa60613          	addi	a2,a2,426 # ffffffffc0206fb0 <etext+0xca6>
ffffffffc0202e0e:	06900593          	li	a1,105
ffffffffc0202e12:	00004517          	auipc	a0,0x4
ffffffffc0202e16:	1c650513          	addi	a0,a0,454 # ffffffffc0206fd8 <etext+0xcce>
ffffffffc0202e1a:	e5efd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202e1e:	00005697          	auipc	a3,0x5
ffffffffc0202e22:	80a68693          	addi	a3,a3,-2038 # ffffffffc0207628 <etext+0x131e>
ffffffffc0202e26:	00004617          	auipc	a2,0x4
ffffffffc0202e2a:	b6260613          	addi	a2,a2,-1182 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202e2e:	17e00593          	li	a1,382
ffffffffc0202e32:	00004517          	auipc	a0,0x4
ffffffffc0202e36:	29650513          	addi	a0,a0,662 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0202e3a:	e3efd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202e3e:	00004697          	auipc	a3,0x4
ffffffffc0202e42:	2ca68693          	addi	a3,a3,714 # ffffffffc0207108 <etext+0xdfe>
ffffffffc0202e46:	00004617          	auipc	a2,0x4
ffffffffc0202e4a:	b4260613          	addi	a2,a2,-1214 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202e4e:	16a00593          	li	a1,362
ffffffffc0202e52:	00004517          	auipc	a0,0x4
ffffffffc0202e56:	27650513          	addi	a0,a0,630 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0202e5a:	e1efd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202e5e:	00004697          	auipc	a3,0x4
ffffffffc0202e62:	7da68693          	addi	a3,a3,2010 # ffffffffc0207638 <etext+0x132e>
ffffffffc0202e66:	00004617          	auipc	a2,0x4
ffffffffc0202e6a:	b2260613          	addi	a2,a2,-1246 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202e6e:	17f00593          	li	a1,383
ffffffffc0202e72:	00004517          	auipc	a0,0x4
ffffffffc0202e76:	25650513          	addi	a0,a0,598 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0202e7a:	dfefd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202e7e:	00004617          	auipc	a2,0x4
ffffffffc0202e82:	20260613          	addi	a2,a2,514 # ffffffffc0207080 <etext+0xd76>
ffffffffc0202e86:	06200593          	li	a1,98
ffffffffc0202e8a:	00004517          	auipc	a0,0x4
ffffffffc0202e8e:	14e50513          	addi	a0,a0,334 # ffffffffc0206fd8 <etext+0xcce>
ffffffffc0202e92:	de6fd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202e96:	00004617          	auipc	a2,0x4
ffffffffc0202e9a:	20a60613          	addi	a2,a2,522 # ffffffffc02070a0 <etext+0xd96>
ffffffffc0202e9e:	07400593          	li	a1,116
ffffffffc0202ea2:	00004517          	auipc	a0,0x4
ffffffffc0202ea6:	13650513          	addi	a0,a0,310 # ffffffffc0206fd8 <etext+0xcce>
ffffffffc0202eaa:	dcefd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0202eae:	00004697          	auipc	a3,0x4
ffffffffc0202eb2:	22a68693          	addi	a3,a3,554 # ffffffffc02070d8 <etext+0xdce>
ffffffffc0202eb6:	00004617          	auipc	a2,0x4
ffffffffc0202eba:	ad260613          	addi	a2,a2,-1326 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202ebe:	16900593          	li	a1,361
ffffffffc0202ec2:	00004517          	auipc	a0,0x4
ffffffffc0202ec6:	20650513          	addi	a0,a0,518 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0202eca:	daefd0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc0202ece <tlb_invalidate>:
ffffffffc0202ece:	12058073          	sfence.vma	a1
ffffffffc0202ed2:	8082                	ret

ffffffffc0202ed4 <pgdir_alloc_page>:
ffffffffc0202ed4:	7179                	addi	sp,sp,-48
ffffffffc0202ed6:	e84a                	sd	s2,16(sp)
ffffffffc0202ed8:	892a                	mv	s2,a0
ffffffffc0202eda:	4505                	li	a0,1
ffffffffc0202edc:	ec26                	sd	s1,24(sp)
ffffffffc0202ede:	e44e                	sd	s3,8(sp)
ffffffffc0202ee0:	f406                	sd	ra,40(sp)
ffffffffc0202ee2:	f022                	sd	s0,32(sp)
ffffffffc0202ee4:	84ae                	mv	s1,a1
ffffffffc0202ee6:	89b2                	mv	s3,a2
ffffffffc0202ee8:	cddfe0ef          	jal	ffffffffc0201bc4 <alloc_pages>
ffffffffc0202eec:	c12d                	beqz	a0,ffffffffc0202f4e <pgdir_alloc_page+0x7a>
ffffffffc0202eee:	842a                	mv	s0,a0
ffffffffc0202ef0:	85aa                	mv	a1,a0
ffffffffc0202ef2:	86ce                	mv	a3,s3
ffffffffc0202ef4:	8626                	mv	a2,s1
ffffffffc0202ef6:	854a                	mv	a0,s2
ffffffffc0202ef8:	b00ff0ef          	jal	ffffffffc02021f8 <page_insert>
ffffffffc0202efc:	ed0d                	bnez	a0,ffffffffc0202f36 <pgdir_alloc_page+0x62>
ffffffffc0202efe:	0003a797          	auipc	a5,0x3a
ffffffffc0202f02:	74a7a783          	lw	a5,1866(a5) # ffffffffc023d648 <swap_init_ok>
ffffffffc0202f06:	c385                	beqz	a5,ffffffffc0202f26 <pgdir_alloc_page+0x52>
ffffffffc0202f08:	0003a517          	auipc	a0,0x3a
ffffffffc0202f0c:	76053503          	ld	a0,1888(a0) # ffffffffc023d668 <check_mm_struct>
ffffffffc0202f10:	c919                	beqz	a0,ffffffffc0202f26 <pgdir_alloc_page+0x52>
ffffffffc0202f12:	4681                	li	a3,0
ffffffffc0202f14:	8622                	mv	a2,s0
ffffffffc0202f16:	85a6                	mv	a1,s1
ffffffffc0202f18:	74a000ef          	jal	ffffffffc0203662 <swap_map_swappable>
ffffffffc0202f1c:	4018                	lw	a4,0(s0)
ffffffffc0202f1e:	fc04                	sd	s1,56(s0)
ffffffffc0202f20:	4785                	li	a5,1
ffffffffc0202f22:	04f71663          	bne	a4,a5,ffffffffc0202f6e <pgdir_alloc_page+0x9a>
ffffffffc0202f26:	70a2                	ld	ra,40(sp)
ffffffffc0202f28:	8522                	mv	a0,s0
ffffffffc0202f2a:	7402                	ld	s0,32(sp)
ffffffffc0202f2c:	64e2                	ld	s1,24(sp)
ffffffffc0202f2e:	6942                	ld	s2,16(sp)
ffffffffc0202f30:	69a2                	ld	s3,8(sp)
ffffffffc0202f32:	6145                	addi	sp,sp,48
ffffffffc0202f34:	8082                	ret
ffffffffc0202f36:	100027f3          	csrr	a5,sstatus
ffffffffc0202f3a:	8b89                	andi	a5,a5,2
ffffffffc0202f3c:	eb99                	bnez	a5,ffffffffc0202f52 <pgdir_alloc_page+0x7e>
ffffffffc0202f3e:	0003a797          	auipc	a5,0x3a
ffffffffc0202f42:	6da7b783          	ld	a5,1754(a5) # ffffffffc023d618 <pmm_manager>
ffffffffc0202f46:	739c                	ld	a5,32(a5)
ffffffffc0202f48:	4585                	li	a1,1
ffffffffc0202f4a:	8522                	mv	a0,s0
ffffffffc0202f4c:	9782                	jalr	a5
ffffffffc0202f4e:	4401                	li	s0,0
ffffffffc0202f50:	bfd9                	j	ffffffffc0202f26 <pgdir_alloc_page+0x52>
ffffffffc0202f52:	ee8fd0ef          	jal	ffffffffc020063a <intr_disable>
ffffffffc0202f56:	0003a797          	auipc	a5,0x3a
ffffffffc0202f5a:	6c27b783          	ld	a5,1730(a5) # ffffffffc023d618 <pmm_manager>
ffffffffc0202f5e:	739c                	ld	a5,32(a5)
ffffffffc0202f60:	8522                	mv	a0,s0
ffffffffc0202f62:	4585                	li	a1,1
ffffffffc0202f64:	9782                	jalr	a5
ffffffffc0202f66:	4401                	li	s0,0
ffffffffc0202f68:	eccfd0ef          	jal	ffffffffc0200634 <intr_enable>
ffffffffc0202f6c:	bf6d                	j	ffffffffc0202f26 <pgdir_alloc_page+0x52>
ffffffffc0202f6e:	00004697          	auipc	a3,0x4
ffffffffc0202f72:	6ea68693          	addi	a3,a3,1770 # ffffffffc0207658 <etext+0x134e>
ffffffffc0202f76:	00004617          	auipc	a2,0x4
ffffffffc0202f7a:	a1260613          	addi	a2,a2,-1518 # ffffffffc0206988 <etext+0x67e>
ffffffffc0202f7e:	1d800593          	li	a1,472
ffffffffc0202f82:	00004517          	auipc	a0,0x4
ffffffffc0202f86:	14650513          	addi	a0,a0,326 # ffffffffc02070c8 <etext+0xdbe>
ffffffffc0202f8a:	ceefd0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc0202f8e <swap_init>:
ffffffffc0202f8e:	7135                	addi	sp,sp,-160
ffffffffc0202f90:	ed06                	sd	ra,152(sp)
ffffffffc0202f92:	69c010ef          	jal	ffffffffc020462e <swapfs_init>
ffffffffc0202f96:	0003a697          	auipc	a3,0x3a
ffffffffc0202f9a:	6ba6b683          	ld	a3,1722(a3) # ffffffffc023d650 <max_swap_offset>
ffffffffc0202f9e:	010007b7          	lui	a5,0x1000
ffffffffc0202fa2:	ff968713          	addi	a4,a3,-7
ffffffffc0202fa6:	17e1                	addi	a5,a5,-8 # fffff8 <_binary_obj___user_matrix_out_size+0xffd398>
ffffffffc0202fa8:	42e7ef63          	bltu	a5,a4,ffffffffc02033e6 <swap_init+0x458>
ffffffffc0202fac:	0002f797          	auipc	a5,0x2f
ffffffffc0202fb0:	0dc78793          	addi	a5,a5,220 # ffffffffc0232088 <swap_manager_fifo>
ffffffffc0202fb4:	6798                	ld	a4,8(a5)
ffffffffc0202fb6:	e14a                	sd	s2,128(sp)
ffffffffc0202fb8:	f0da                	sd	s6,96(sp)
ffffffffc0202fba:	0003ab17          	auipc	s6,0x3a
ffffffffc0202fbe:	69eb0b13          	addi	s6,s6,1694 # ffffffffc023d658 <sm>
ffffffffc0202fc2:	00fb3023          	sd	a5,0(s6)
ffffffffc0202fc6:	9702                	jalr	a4
ffffffffc0202fc8:	892a                	mv	s2,a0
ffffffffc0202fca:	c519                	beqz	a0,ffffffffc0202fd8 <swap_init+0x4a>
ffffffffc0202fcc:	60ea                	ld	ra,152(sp)
ffffffffc0202fce:	7b06                	ld	s6,96(sp)
ffffffffc0202fd0:	854a                	mv	a0,s2
ffffffffc0202fd2:	690a                	ld	s2,128(sp)
ffffffffc0202fd4:	610d                	addi	sp,sp,160
ffffffffc0202fd6:	8082                	ret
ffffffffc0202fd8:	000b3783          	ld	a5,0(s6)
ffffffffc0202fdc:	00004517          	auipc	a0,0x4
ffffffffc0202fe0:	6c450513          	addi	a0,a0,1732 # ffffffffc02076a0 <etext+0x1396>
ffffffffc0202fe4:	e922                	sd	s0,144(sp)
ffffffffc0202fe6:	638c                	ld	a1,0(a5)
ffffffffc0202fe8:	4785                	li	a5,1
ffffffffc0202fea:	e0ea                	sd	s10,64(sp)
ffffffffc0202fec:	fc6e                	sd	s11,56(sp)
ffffffffc0202fee:	0003a717          	auipc	a4,0x3a
ffffffffc0202ff2:	64f72d23          	sw	a5,1626(a4) # ffffffffc023d648 <swap_init_ok>
ffffffffc0202ff6:	e526                	sd	s1,136(sp)
ffffffffc0202ff8:	fcce                	sd	s3,120(sp)
ffffffffc0202ffa:	f8d2                	sd	s4,112(sp)
ffffffffc0202ffc:	f4d6                	sd	s5,104(sp)
ffffffffc0202ffe:	ecde                	sd	s7,88(sp)
ffffffffc0203000:	e8e2                	sd	s8,80(sp)
ffffffffc0203002:	e4e6                	sd	s9,72(sp)
ffffffffc0203004:	00036417          	auipc	s0,0x36
ffffffffc0203008:	50440413          	addi	s0,s0,1284 # ffffffffc0239508 <free_area>
ffffffffc020300c:	978fd0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0203010:	641c                	ld	a5,8(s0)
ffffffffc0203012:	4d01                	li	s10,0
ffffffffc0203014:	4d81                	li	s11,0
ffffffffc0203016:	30878e63          	beq	a5,s0,ffffffffc0203332 <swap_init+0x3a4>
ffffffffc020301a:	ff07b703          	ld	a4,-16(a5)
ffffffffc020301e:	8b09                	andi	a4,a4,2
ffffffffc0203020:	30070b63          	beqz	a4,ffffffffc0203336 <swap_init+0x3a8>
ffffffffc0203024:	ff87a703          	lw	a4,-8(a5)
ffffffffc0203028:	679c                	ld	a5,8(a5)
ffffffffc020302a:	2d85                	addiw	s11,s11,1
ffffffffc020302c:	01a70d3b          	addw	s10,a4,s10
ffffffffc0203030:	fe8795e3          	bne	a5,s0,ffffffffc020301a <swap_init+0x8c>
ffffffffc0203034:	84ea                	mv	s1,s10
ffffffffc0203036:	c5ffe0ef          	jal	ffffffffc0201c94 <nr_free_pages>
ffffffffc020303a:	4c951e63          	bne	a0,s1,ffffffffc0203516 <swap_init+0x588>
ffffffffc020303e:	866a                	mv	a2,s10
ffffffffc0203040:	85ee                	mv	a1,s11
ffffffffc0203042:	00004517          	auipc	a0,0x4
ffffffffc0203046:	67650513          	addi	a0,a0,1654 # ffffffffc02076b8 <etext+0x13ae>
ffffffffc020304a:	93afd0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc020304e:	3b7000ef          	jal	ffffffffc0203c04 <mm_create>
ffffffffc0203052:	ec2a                	sd	a0,24(sp)
ffffffffc0203054:	5a050163          	beqz	a0,ffffffffc02035f6 <swap_init+0x668>
ffffffffc0203058:	0003a797          	auipc	a5,0x3a
ffffffffc020305c:	61078793          	addi	a5,a5,1552 # ffffffffc023d668 <check_mm_struct>
ffffffffc0203060:	6398                	ld	a4,0(a5)
ffffffffc0203062:	5a071a63          	bnez	a4,ffffffffc0203616 <swap_init+0x688>
ffffffffc0203066:	66e2                	ld	a3,24(sp)
ffffffffc0203068:	0003aa97          	auipc	s5,0x3a
ffffffffc020306c:	5c0aba83          	ld	s5,1472(s5) # ffffffffc023d628 <boot_pgdir>
ffffffffc0203070:	000ab703          	ld	a4,0(s5)
ffffffffc0203074:	e394                	sd	a3,0(a5)
ffffffffc0203076:	0156bc23          	sd	s5,24(a3)
ffffffffc020307a:	42071e63          	bnez	a4,ffffffffc02034b6 <swap_init+0x528>
ffffffffc020307e:	6599                	lui	a1,0x6
ffffffffc0203080:	460d                	li	a2,3
ffffffffc0203082:	6505                	lui	a0,0x1
ffffffffc0203084:	3c9000ef          	jal	ffffffffc0203c4c <vma_create>
ffffffffc0203088:	85aa                	mv	a1,a0
ffffffffc020308a:	44050663          	beqz	a0,ffffffffc02034d6 <swap_init+0x548>
ffffffffc020308e:	64e2                	ld	s1,24(sp)
ffffffffc0203090:	8526                	mv	a0,s1
ffffffffc0203092:	429000ef          	jal	ffffffffc0203cba <insert_vma_struct>
ffffffffc0203096:	00004517          	auipc	a0,0x4
ffffffffc020309a:	69250513          	addi	a0,a0,1682 # ffffffffc0207728 <etext+0x141e>
ffffffffc020309e:	8e6fd0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02030a2:	6c88                	ld	a0,24(s1)
ffffffffc02030a4:	4605                	li	a2,1
ffffffffc02030a6:	6585                	lui	a1,0x1
ffffffffc02030a8:	c27fe0ef          	jal	ffffffffc0201cce <get_pte>
ffffffffc02030ac:	44050563          	beqz	a0,ffffffffc02034f6 <swap_init+0x568>
ffffffffc02030b0:	00004517          	auipc	a0,0x4
ffffffffc02030b4:	6c850513          	addi	a0,a0,1736 # ffffffffc0207778 <etext+0x146e>
ffffffffc02030b8:	00036497          	auipc	s1,0x36
ffffffffc02030bc:	48848493          	addi	s1,s1,1160 # ffffffffc0239540 <check_rp>
ffffffffc02030c0:	8c4fd0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02030c4:	00036997          	auipc	s3,0x36
ffffffffc02030c8:	49c98993          	addi	s3,s3,1180 # ffffffffc0239560 <swap_out_seq_no>
ffffffffc02030cc:	8ba6                	mv	s7,s1
ffffffffc02030ce:	4505                	li	a0,1
ffffffffc02030d0:	af5fe0ef          	jal	ffffffffc0201bc4 <alloc_pages>
ffffffffc02030d4:	00abb023          	sd	a0,0(s7) # 80000 <_binary_obj___user_matrix_out_size+0x7d3a0>
ffffffffc02030d8:	2e050763          	beqz	a0,ffffffffc02033c6 <swap_init+0x438>
ffffffffc02030dc:	651c                	ld	a5,8(a0)
ffffffffc02030de:	8b89                	andi	a5,a5,2
ffffffffc02030e0:	2c079363          	bnez	a5,ffffffffc02033a6 <swap_init+0x418>
ffffffffc02030e4:	0ba1                	addi	s7,s7,8
ffffffffc02030e6:	ff3b94e3          	bne	s7,s3,ffffffffc02030ce <swap_init+0x140>
ffffffffc02030ea:	601c                	ld	a5,0(s0)
ffffffffc02030ec:	00843a03          	ld	s4,8(s0)
ffffffffc02030f0:	e000                	sd	s0,0(s0)
ffffffffc02030f2:	f03e                	sd	a5,32(sp)
ffffffffc02030f4:	481c                	lw	a5,16(s0)
ffffffffc02030f6:	e400                	sd	s0,8(s0)
ffffffffc02030f8:	00036b97          	auipc	s7,0x36
ffffffffc02030fc:	448b8b93          	addi	s7,s7,1096 # ffffffffc0239540 <check_rp>
ffffffffc0203100:	f43e                	sd	a5,40(sp)
ffffffffc0203102:	00036797          	auipc	a5,0x36
ffffffffc0203106:	4007ab23          	sw	zero,1046(a5) # ffffffffc0239518 <free_area+0x10>
ffffffffc020310a:	000bb503          	ld	a0,0(s7)
ffffffffc020310e:	4585                	li	a1,1
ffffffffc0203110:	0ba1                	addi	s7,s7,8
ffffffffc0203112:	b43fe0ef          	jal	ffffffffc0201c54 <free_pages>
ffffffffc0203116:	ff3b9ae3          	bne	s7,s3,ffffffffc020310a <swap_init+0x17c>
ffffffffc020311a:	01042b83          	lw	s7,16(s0)
ffffffffc020311e:	4791                	li	a5,4
ffffffffc0203120:	50fb9b63          	bne	s7,a5,ffffffffc0203636 <swap_init+0x6a8>
ffffffffc0203124:	00004517          	auipc	a0,0x4
ffffffffc0203128:	6dc50513          	addi	a0,a0,1756 # ffffffffc0207800 <etext+0x14f6>
ffffffffc020312c:	858fd0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0203130:	0003a797          	auipc	a5,0x3a
ffffffffc0203134:	5207a823          	sw	zero,1328(a5) # ffffffffc023d660 <pgfault_num>
ffffffffc0203138:	6785                	lui	a5,0x1
ffffffffc020313a:	4529                	li	a0,10
ffffffffc020313c:	00a78023          	sb	a0,0(a5) # 1000 <_binary_obj___user_faultread_out_size-0xef0>
ffffffffc0203140:	0003a597          	auipc	a1,0x3a
ffffffffc0203144:	5205a583          	lw	a1,1312(a1) # ffffffffc023d660 <pgfault_num>
ffffffffc0203148:	4605                	li	a2,1
ffffffffc020314a:	0003a797          	auipc	a5,0x3a
ffffffffc020314e:	51678793          	addi	a5,a5,1302 # ffffffffc023d660 <pgfault_num>
ffffffffc0203152:	46c59263          	bne	a1,a2,ffffffffc02035b6 <swap_init+0x628>
ffffffffc0203156:	6605                	lui	a2,0x1
ffffffffc0203158:	00a60823          	sb	a0,16(a2) # 1010 <_binary_obj___user_faultread_out_size-0xee0>
ffffffffc020315c:	4388                	lw	a0,0(a5)
ffffffffc020315e:	46b51c63          	bne	a0,a1,ffffffffc02035d6 <swap_init+0x648>
ffffffffc0203162:	6609                	lui	a2,0x2
ffffffffc0203164:	45ad                	li	a1,11
ffffffffc0203166:	00b60023          	sb	a1,0(a2) # 2000 <_binary_obj___user_hello_out_size+0x38>
ffffffffc020316a:	4390                	lw	a2,0(a5)
ffffffffc020316c:	4889                	li	a7,2
ffffffffc020316e:	0006051b          	sext.w	a0,a2
ffffffffc0203172:	3d161263          	bne	a2,a7,ffffffffc0203536 <swap_init+0x5a8>
ffffffffc0203176:	6609                	lui	a2,0x2
ffffffffc0203178:	00b60823          	sb	a1,16(a2) # 2010 <_binary_obj___user_hello_out_size+0x48>
ffffffffc020317c:	438c                	lw	a1,0(a5)
ffffffffc020317e:	3ca59c63          	bne	a1,a0,ffffffffc0203556 <swap_init+0x5c8>
ffffffffc0203182:	660d                	lui	a2,0x3
ffffffffc0203184:	45b1                	li	a1,12
ffffffffc0203186:	00b60023          	sb	a1,0(a2) # 3000 <_binary_obj___user_matrix_out_size+0x3a0>
ffffffffc020318a:	4390                	lw	a2,0(a5)
ffffffffc020318c:	488d                	li	a7,3
ffffffffc020318e:	0006051b          	sext.w	a0,a2
ffffffffc0203192:	3f161263          	bne	a2,a7,ffffffffc0203576 <swap_init+0x5e8>
ffffffffc0203196:	660d                	lui	a2,0x3
ffffffffc0203198:	00b60823          	sb	a1,16(a2) # 3010 <_binary_obj___user_matrix_out_size+0x3b0>
ffffffffc020319c:	438c                	lw	a1,0(a5)
ffffffffc020319e:	3ea59c63          	bne	a1,a0,ffffffffc0203596 <swap_init+0x608>
ffffffffc02031a2:	6611                	lui	a2,0x4
ffffffffc02031a4:	45b5                	li	a1,13
ffffffffc02031a6:	00b60023          	sb	a1,0(a2) # 4000 <_binary_obj___user_matrix_out_size+0x13a0>
ffffffffc02031aa:	4390                	lw	a2,0(a5)
ffffffffc02031ac:	0006051b          	sext.w	a0,a2
ffffffffc02031b0:	29761363          	bne	a2,s7,ffffffffc0203436 <swap_init+0x4a8>
ffffffffc02031b4:	6611                	lui	a2,0x4
ffffffffc02031b6:	00b60823          	sb	a1,16(a2) # 4010 <_binary_obj___user_matrix_out_size+0x13b0>
ffffffffc02031ba:	439c                	lw	a5,0(a5)
ffffffffc02031bc:	28a79d63          	bne	a5,a0,ffffffffc0203456 <swap_init+0x4c8>
ffffffffc02031c0:	481c                	lw	a5,16(s0)
ffffffffc02031c2:	2a079a63          	bnez	a5,ffffffffc0203476 <swap_init+0x4e8>
ffffffffc02031c6:	00036797          	auipc	a5,0x36
ffffffffc02031ca:	3c278793          	addi	a5,a5,962 # ffffffffc0239588 <swap_in_seq_no>
ffffffffc02031ce:	00036617          	auipc	a2,0x36
ffffffffc02031d2:	39260613          	addi	a2,a2,914 # ffffffffc0239560 <swap_out_seq_no>
ffffffffc02031d6:	00036517          	auipc	a0,0x36
ffffffffc02031da:	3da50513          	addi	a0,a0,986 # ffffffffc02395b0 <pra_list_head>
ffffffffc02031de:	55fd                	li	a1,-1
ffffffffc02031e0:	c38c                	sw	a1,0(a5)
ffffffffc02031e2:	c20c                	sw	a1,0(a2)
ffffffffc02031e4:	0791                	addi	a5,a5,4
ffffffffc02031e6:	0611                	addi	a2,a2,4
ffffffffc02031e8:	fea79ce3          	bne	a5,a0,ffffffffc02031e0 <swap_init+0x252>
ffffffffc02031ec:	00036897          	auipc	a7,0x36
ffffffffc02031f0:	33488893          	addi	a7,a7,820 # ffffffffc0239520 <check_ptep>
ffffffffc02031f4:	00036317          	auipc	t1,0x36
ffffffffc02031f8:	34c30313          	addi	t1,t1,844 # ffffffffc0239540 <check_rp>
ffffffffc02031fc:	6585                	lui	a1,0x1
ffffffffc02031fe:	0003ab97          	auipc	s7,0x3a
ffffffffc0203202:	43ab8b93          	addi	s7,s7,1082 # ffffffffc023d638 <npage>
ffffffffc0203206:	0003ac17          	auipc	s8,0x3a
ffffffffc020320a:	43ac0c13          	addi	s8,s8,1082 # ffffffffc023d640 <pages>
ffffffffc020320e:	00006c97          	auipc	s9,0x6
ffffffffc0203212:	f22c8c93          	addi	s9,s9,-222 # ffffffffc0209130 <nbase>
ffffffffc0203216:	0008b023          	sd	zero,0(a7)
ffffffffc020321a:	4601                	li	a2,0
ffffffffc020321c:	8556                	mv	a0,s5
ffffffffc020321e:	e81a                	sd	t1,16(sp)
ffffffffc0203220:	e42e                	sd	a1,8(sp)
ffffffffc0203222:	e046                	sd	a7,0(sp)
ffffffffc0203224:	aabfe0ef          	jal	ffffffffc0201cce <get_pte>
ffffffffc0203228:	6882                	ld	a7,0(sp)
ffffffffc020322a:	65a2                	ld	a1,8(sp)
ffffffffc020322c:	6342                	ld	t1,16(sp)
ffffffffc020322e:	00a8b023          	sd	a0,0(a7)
ffffffffc0203232:	1e050263          	beqz	a0,ffffffffc0203416 <swap_init+0x488>
ffffffffc0203236:	611c                	ld	a5,0(a0)
ffffffffc0203238:	0017f613          	andi	a2,a5,1
ffffffffc020323c:	12060d63          	beqz	a2,ffffffffc0203376 <swap_init+0x3e8>
ffffffffc0203240:	000bb603          	ld	a2,0(s7)
ffffffffc0203244:	078a                	slli	a5,a5,0x2
ffffffffc0203246:	83b1                	srli	a5,a5,0xc
ffffffffc0203248:	14c7f363          	bgeu	a5,a2,ffffffffc020338e <swap_init+0x400>
ffffffffc020324c:	000cbe03          	ld	t3,0(s9)
ffffffffc0203250:	000c3603          	ld	a2,0(s8)
ffffffffc0203254:	00033503          	ld	a0,0(t1)
ffffffffc0203258:	41c787b3          	sub	a5,a5,t3
ffffffffc020325c:	079a                	slli	a5,a5,0x6
ffffffffc020325e:	6705                	lui	a4,0x1
ffffffffc0203260:	97b2                	add	a5,a5,a2
ffffffffc0203262:	0321                	addi	t1,t1,8
ffffffffc0203264:	08a1                	addi	a7,a7,8
ffffffffc0203266:	95ba                	add	a1,a1,a4
ffffffffc0203268:	0ef51763          	bne	a0,a5,ffffffffc0203356 <swap_init+0x3c8>
ffffffffc020326c:	6795                	lui	a5,0x5
ffffffffc020326e:	faf594e3          	bne	a1,a5,ffffffffc0203216 <swap_init+0x288>
ffffffffc0203272:	00004517          	auipc	a0,0x4
ffffffffc0203276:	63650513          	addi	a0,a0,1590 # ffffffffc02078a8 <etext+0x159e>
ffffffffc020327a:	f0bfc0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc020327e:	000b3783          	ld	a5,0(s6)
ffffffffc0203282:	7f9c                	ld	a5,56(a5)
ffffffffc0203284:	9782                	jalr	a5
ffffffffc0203286:	20051863          	bnez	a0,ffffffffc0203496 <swap_init+0x508>
ffffffffc020328a:	6088                	ld	a0,0(s1)
ffffffffc020328c:	4585                	li	a1,1
ffffffffc020328e:	04a1                	addi	s1,s1,8
ffffffffc0203290:	9c5fe0ef          	jal	ffffffffc0201c54 <free_pages>
ffffffffc0203294:	ff349be3          	bne	s1,s3,ffffffffc020328a <swap_init+0x2fc>
ffffffffc0203298:	000ab783          	ld	a5,0(s5)
ffffffffc020329c:	000bb603          	ld	a2,0(s7)
ffffffffc02032a0:	078a                	slli	a5,a5,0x2
ffffffffc02032a2:	83b1                	srli	a5,a5,0xc
ffffffffc02032a4:	0ec7f563          	bgeu	a5,a2,ffffffffc020338e <swap_init+0x400>
ffffffffc02032a8:	000cb603          	ld	a2,0(s9)
ffffffffc02032ac:	000c3503          	ld	a0,0(s8)
ffffffffc02032b0:	4585                	li	a1,1
ffffffffc02032b2:	8f91                	sub	a5,a5,a2
ffffffffc02032b4:	079a                	slli	a5,a5,0x6
ffffffffc02032b6:	953e                	add	a0,a0,a5
ffffffffc02032b8:	99dfe0ef          	jal	ffffffffc0201c54 <free_pages>
ffffffffc02032bc:	67e2                	ld	a5,24(sp)
ffffffffc02032be:	000ab023          	sd	zero,0(s5)
ffffffffc02032c2:	0007bc23          	sd	zero,24(a5) # 5018 <_binary_obj___user_matrix_out_size+0x23b8>
ffffffffc02032c6:	853e                	mv	a0,a5
ffffffffc02032c8:	2c3000ef          	jal	ffffffffc0203d8a <mm_destroy>
ffffffffc02032cc:	77a2                	ld	a5,40(sp)
ffffffffc02032ce:	01443423          	sd	s4,8(s0)
ffffffffc02032d2:	c81c                	sw	a5,16(s0)
ffffffffc02032d4:	0003a797          	auipc	a5,0x3a
ffffffffc02032d8:	3807ba23          	sd	zero,916(a5) # ffffffffc023d668 <check_mm_struct>
ffffffffc02032dc:	7782                	ld	a5,32(sp)
ffffffffc02032de:	e01c                	sd	a5,0(s0)
ffffffffc02032e0:	008a0b63          	beq	s4,s0,ffffffffc02032f6 <swap_init+0x368>
ffffffffc02032e4:	ff8a2783          	lw	a5,-8(s4) # ff8 <_binary_obj___user_faultread_out_size-0xef8>
ffffffffc02032e8:	008a3a03          	ld	s4,8(s4)
ffffffffc02032ec:	3dfd                	addiw	s11,s11,-1
ffffffffc02032ee:	40fd0d3b          	subw	s10,s10,a5
ffffffffc02032f2:	fe8a19e3          	bne	s4,s0,ffffffffc02032e4 <swap_init+0x356>
ffffffffc02032f6:	866a                	mv	a2,s10
ffffffffc02032f8:	85ee                	mv	a1,s11
ffffffffc02032fa:	00004517          	auipc	a0,0x4
ffffffffc02032fe:	5de50513          	addi	a0,a0,1502 # ffffffffc02078d8 <etext+0x15ce>
ffffffffc0203302:	e83fc0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0203306:	00004517          	auipc	a0,0x4
ffffffffc020330a:	5f250513          	addi	a0,a0,1522 # ffffffffc02078f8 <etext+0x15ee>
ffffffffc020330e:	e77fc0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0203312:	60ea                	ld	ra,152(sp)
ffffffffc0203314:	644a                	ld	s0,144(sp)
ffffffffc0203316:	64aa                	ld	s1,136(sp)
ffffffffc0203318:	79e6                	ld	s3,120(sp)
ffffffffc020331a:	7a46                	ld	s4,112(sp)
ffffffffc020331c:	7aa6                	ld	s5,104(sp)
ffffffffc020331e:	6be6                	ld	s7,88(sp)
ffffffffc0203320:	6c46                	ld	s8,80(sp)
ffffffffc0203322:	6ca6                	ld	s9,72(sp)
ffffffffc0203324:	6d06                	ld	s10,64(sp)
ffffffffc0203326:	7de2                	ld	s11,56(sp)
ffffffffc0203328:	7b06                	ld	s6,96(sp)
ffffffffc020332a:	854a                	mv	a0,s2
ffffffffc020332c:	690a                	ld	s2,128(sp)
ffffffffc020332e:	610d                	addi	sp,sp,160
ffffffffc0203330:	8082                	ret
ffffffffc0203332:	4481                	li	s1,0
ffffffffc0203334:	b309                	j	ffffffffc0203036 <swap_init+0xa8>
ffffffffc0203336:	00004697          	auipc	a3,0x4
ffffffffc020333a:	8d268693          	addi	a3,a3,-1838 # ffffffffc0206c08 <etext+0x8fe>
ffffffffc020333e:	00003617          	auipc	a2,0x3
ffffffffc0203342:	64a60613          	addi	a2,a2,1610 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203346:	0bc00593          	li	a1,188
ffffffffc020334a:	00004517          	auipc	a0,0x4
ffffffffc020334e:	34650513          	addi	a0,a0,838 # ffffffffc0207690 <etext+0x1386>
ffffffffc0203352:	926fd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0203356:	00004697          	auipc	a3,0x4
ffffffffc020335a:	52a68693          	addi	a3,a3,1322 # ffffffffc0207880 <etext+0x1576>
ffffffffc020335e:	00003617          	auipc	a2,0x3
ffffffffc0203362:	62a60613          	addi	a2,a2,1578 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203366:	0fc00593          	li	a1,252
ffffffffc020336a:	00004517          	auipc	a0,0x4
ffffffffc020336e:	32650513          	addi	a0,a0,806 # ffffffffc0207690 <etext+0x1386>
ffffffffc0203372:	906fd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0203376:	00004617          	auipc	a2,0x4
ffffffffc020337a:	d2a60613          	addi	a2,a2,-726 # ffffffffc02070a0 <etext+0xd96>
ffffffffc020337e:	07400593          	li	a1,116
ffffffffc0203382:	00004517          	auipc	a0,0x4
ffffffffc0203386:	c5650513          	addi	a0,a0,-938 # ffffffffc0206fd8 <etext+0xcce>
ffffffffc020338a:	8eefd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc020338e:	00004617          	auipc	a2,0x4
ffffffffc0203392:	cf260613          	addi	a2,a2,-782 # ffffffffc0207080 <etext+0xd76>
ffffffffc0203396:	06200593          	li	a1,98
ffffffffc020339a:	00004517          	auipc	a0,0x4
ffffffffc020339e:	c3e50513          	addi	a0,a0,-962 # ffffffffc0206fd8 <etext+0xcce>
ffffffffc02033a2:	8d6fd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02033a6:	00004697          	auipc	a3,0x4
ffffffffc02033aa:	41268693          	addi	a3,a3,1042 # ffffffffc02077b8 <etext+0x14ae>
ffffffffc02033ae:	00003617          	auipc	a2,0x3
ffffffffc02033b2:	5da60613          	addi	a2,a2,1498 # ffffffffc0206988 <etext+0x67e>
ffffffffc02033b6:	0dd00593          	li	a1,221
ffffffffc02033ba:	00004517          	auipc	a0,0x4
ffffffffc02033be:	2d650513          	addi	a0,a0,726 # ffffffffc0207690 <etext+0x1386>
ffffffffc02033c2:	8b6fd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02033c6:	00004697          	auipc	a3,0x4
ffffffffc02033ca:	3da68693          	addi	a3,a3,986 # ffffffffc02077a0 <etext+0x1496>
ffffffffc02033ce:	00003617          	auipc	a2,0x3
ffffffffc02033d2:	5ba60613          	addi	a2,a2,1466 # ffffffffc0206988 <etext+0x67e>
ffffffffc02033d6:	0dc00593          	li	a1,220
ffffffffc02033da:	00004517          	auipc	a0,0x4
ffffffffc02033de:	2b650513          	addi	a0,a0,694 # ffffffffc0207690 <etext+0x1386>
ffffffffc02033e2:	896fd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02033e6:	00004617          	auipc	a2,0x4
ffffffffc02033ea:	28a60613          	addi	a2,a2,650 # ffffffffc0207670 <etext+0x1366>
ffffffffc02033ee:	02800593          	li	a1,40
ffffffffc02033f2:	00004517          	auipc	a0,0x4
ffffffffc02033f6:	29e50513          	addi	a0,a0,670 # ffffffffc0207690 <etext+0x1386>
ffffffffc02033fa:	e922                	sd	s0,144(sp)
ffffffffc02033fc:	e526                	sd	s1,136(sp)
ffffffffc02033fe:	e14a                	sd	s2,128(sp)
ffffffffc0203400:	fcce                	sd	s3,120(sp)
ffffffffc0203402:	f8d2                	sd	s4,112(sp)
ffffffffc0203404:	f4d6                	sd	s5,104(sp)
ffffffffc0203406:	f0da                	sd	s6,96(sp)
ffffffffc0203408:	ecde                	sd	s7,88(sp)
ffffffffc020340a:	e8e2                	sd	s8,80(sp)
ffffffffc020340c:	e4e6                	sd	s9,72(sp)
ffffffffc020340e:	e0ea                	sd	s10,64(sp)
ffffffffc0203410:	fc6e                	sd	s11,56(sp)
ffffffffc0203412:	866fd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0203416:	00004697          	auipc	a3,0x4
ffffffffc020341a:	45268693          	addi	a3,a3,1106 # ffffffffc0207868 <etext+0x155e>
ffffffffc020341e:	00003617          	auipc	a2,0x3
ffffffffc0203422:	56a60613          	addi	a2,a2,1386 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203426:	0fb00593          	li	a1,251
ffffffffc020342a:	00004517          	auipc	a0,0x4
ffffffffc020342e:	26650513          	addi	a0,a0,614 # ffffffffc0207690 <etext+0x1386>
ffffffffc0203432:	846fd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0203436:	00004697          	auipc	a3,0x4
ffffffffc020343a:	42268693          	addi	a3,a3,1058 # ffffffffc0207858 <etext+0x154e>
ffffffffc020343e:	00003617          	auipc	a2,0x3
ffffffffc0203442:	54a60613          	addi	a2,a2,1354 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203446:	09f00593          	li	a1,159
ffffffffc020344a:	00004517          	auipc	a0,0x4
ffffffffc020344e:	24650513          	addi	a0,a0,582 # ffffffffc0207690 <etext+0x1386>
ffffffffc0203452:	826fd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0203456:	00004697          	auipc	a3,0x4
ffffffffc020345a:	40268693          	addi	a3,a3,1026 # ffffffffc0207858 <etext+0x154e>
ffffffffc020345e:	00003617          	auipc	a2,0x3
ffffffffc0203462:	52a60613          	addi	a2,a2,1322 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203466:	0a100593          	li	a1,161
ffffffffc020346a:	00004517          	auipc	a0,0x4
ffffffffc020346e:	22650513          	addi	a0,a0,550 # ffffffffc0207690 <etext+0x1386>
ffffffffc0203472:	806fd0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0203476:	00004697          	auipc	a3,0x4
ffffffffc020347a:	96268693          	addi	a3,a3,-1694 # ffffffffc0206dd8 <etext+0xace>
ffffffffc020347e:	00003617          	auipc	a2,0x3
ffffffffc0203482:	50a60613          	addi	a2,a2,1290 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203486:	0f300593          	li	a1,243
ffffffffc020348a:	00004517          	auipc	a0,0x4
ffffffffc020348e:	20650513          	addi	a0,a0,518 # ffffffffc0207690 <etext+0x1386>
ffffffffc0203492:	fe7fc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0203496:	00004697          	auipc	a3,0x4
ffffffffc020349a:	43a68693          	addi	a3,a3,1082 # ffffffffc02078d0 <etext+0x15c6>
ffffffffc020349e:	00003617          	auipc	a2,0x3
ffffffffc02034a2:	4ea60613          	addi	a2,a2,1258 # ffffffffc0206988 <etext+0x67e>
ffffffffc02034a6:	10200593          	li	a1,258
ffffffffc02034aa:	00004517          	auipc	a0,0x4
ffffffffc02034ae:	1e650513          	addi	a0,a0,486 # ffffffffc0207690 <etext+0x1386>
ffffffffc02034b2:	fc7fc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02034b6:	00004697          	auipc	a3,0x4
ffffffffc02034ba:	25268693          	addi	a3,a3,594 # ffffffffc0207708 <etext+0x13fe>
ffffffffc02034be:	00003617          	auipc	a2,0x3
ffffffffc02034c2:	4ca60613          	addi	a2,a2,1226 # ffffffffc0206988 <etext+0x67e>
ffffffffc02034c6:	0cc00593          	li	a1,204
ffffffffc02034ca:	00004517          	auipc	a0,0x4
ffffffffc02034ce:	1c650513          	addi	a0,a0,454 # ffffffffc0207690 <etext+0x1386>
ffffffffc02034d2:	fa7fc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02034d6:	00004697          	auipc	a3,0x4
ffffffffc02034da:	24268693          	addi	a3,a3,578 # ffffffffc0207718 <etext+0x140e>
ffffffffc02034de:	00003617          	auipc	a2,0x3
ffffffffc02034e2:	4aa60613          	addi	a2,a2,1194 # ffffffffc0206988 <etext+0x67e>
ffffffffc02034e6:	0cf00593          	li	a1,207
ffffffffc02034ea:	00004517          	auipc	a0,0x4
ffffffffc02034ee:	1a650513          	addi	a0,a0,422 # ffffffffc0207690 <etext+0x1386>
ffffffffc02034f2:	f87fc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02034f6:	00004697          	auipc	a3,0x4
ffffffffc02034fa:	26a68693          	addi	a3,a3,618 # ffffffffc0207760 <etext+0x1456>
ffffffffc02034fe:	00003617          	auipc	a2,0x3
ffffffffc0203502:	48a60613          	addi	a2,a2,1162 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203506:	0d700593          	li	a1,215
ffffffffc020350a:	00004517          	auipc	a0,0x4
ffffffffc020350e:	18650513          	addi	a0,a0,390 # ffffffffc0207690 <etext+0x1386>
ffffffffc0203512:	f67fc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0203516:	00003697          	auipc	a3,0x3
ffffffffc020351a:	71a68693          	addi	a3,a3,1818 # ffffffffc0206c30 <etext+0x926>
ffffffffc020351e:	00003617          	auipc	a2,0x3
ffffffffc0203522:	46a60613          	addi	a2,a2,1130 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203526:	0bf00593          	li	a1,191
ffffffffc020352a:	00004517          	auipc	a0,0x4
ffffffffc020352e:	16650513          	addi	a0,a0,358 # ffffffffc0207690 <etext+0x1386>
ffffffffc0203532:	f47fc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0203536:	00004697          	auipc	a3,0x4
ffffffffc020353a:	30268693          	addi	a3,a3,770 # ffffffffc0207838 <etext+0x152e>
ffffffffc020353e:	00003617          	auipc	a2,0x3
ffffffffc0203542:	44a60613          	addi	a2,a2,1098 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203546:	09700593          	li	a1,151
ffffffffc020354a:	00004517          	auipc	a0,0x4
ffffffffc020354e:	14650513          	addi	a0,a0,326 # ffffffffc0207690 <etext+0x1386>
ffffffffc0203552:	f27fc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0203556:	00004697          	auipc	a3,0x4
ffffffffc020355a:	2e268693          	addi	a3,a3,738 # ffffffffc0207838 <etext+0x152e>
ffffffffc020355e:	00003617          	auipc	a2,0x3
ffffffffc0203562:	42a60613          	addi	a2,a2,1066 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203566:	09900593          	li	a1,153
ffffffffc020356a:	00004517          	auipc	a0,0x4
ffffffffc020356e:	12650513          	addi	a0,a0,294 # ffffffffc0207690 <etext+0x1386>
ffffffffc0203572:	f07fc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0203576:	00004697          	auipc	a3,0x4
ffffffffc020357a:	2d268693          	addi	a3,a3,722 # ffffffffc0207848 <etext+0x153e>
ffffffffc020357e:	00003617          	auipc	a2,0x3
ffffffffc0203582:	40a60613          	addi	a2,a2,1034 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203586:	09b00593          	li	a1,155
ffffffffc020358a:	00004517          	auipc	a0,0x4
ffffffffc020358e:	10650513          	addi	a0,a0,262 # ffffffffc0207690 <etext+0x1386>
ffffffffc0203592:	ee7fc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0203596:	00004697          	auipc	a3,0x4
ffffffffc020359a:	2b268693          	addi	a3,a3,690 # ffffffffc0207848 <etext+0x153e>
ffffffffc020359e:	00003617          	auipc	a2,0x3
ffffffffc02035a2:	3ea60613          	addi	a2,a2,1002 # ffffffffc0206988 <etext+0x67e>
ffffffffc02035a6:	09d00593          	li	a1,157
ffffffffc02035aa:	00004517          	auipc	a0,0x4
ffffffffc02035ae:	0e650513          	addi	a0,a0,230 # ffffffffc0207690 <etext+0x1386>
ffffffffc02035b2:	ec7fc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02035b6:	00004697          	auipc	a3,0x4
ffffffffc02035ba:	27268693          	addi	a3,a3,626 # ffffffffc0207828 <etext+0x151e>
ffffffffc02035be:	00003617          	auipc	a2,0x3
ffffffffc02035c2:	3ca60613          	addi	a2,a2,970 # ffffffffc0206988 <etext+0x67e>
ffffffffc02035c6:	09300593          	li	a1,147
ffffffffc02035ca:	00004517          	auipc	a0,0x4
ffffffffc02035ce:	0c650513          	addi	a0,a0,198 # ffffffffc0207690 <etext+0x1386>
ffffffffc02035d2:	ea7fc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02035d6:	00004697          	auipc	a3,0x4
ffffffffc02035da:	25268693          	addi	a3,a3,594 # ffffffffc0207828 <etext+0x151e>
ffffffffc02035de:	00003617          	auipc	a2,0x3
ffffffffc02035e2:	3aa60613          	addi	a2,a2,938 # ffffffffc0206988 <etext+0x67e>
ffffffffc02035e6:	09500593          	li	a1,149
ffffffffc02035ea:	00004517          	auipc	a0,0x4
ffffffffc02035ee:	0a650513          	addi	a0,a0,166 # ffffffffc0207690 <etext+0x1386>
ffffffffc02035f2:	e87fc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02035f6:	00004697          	auipc	a3,0x4
ffffffffc02035fa:	0ea68693          	addi	a3,a3,234 # ffffffffc02076e0 <etext+0x13d6>
ffffffffc02035fe:	00003617          	auipc	a2,0x3
ffffffffc0203602:	38a60613          	addi	a2,a2,906 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203606:	0c400593          	li	a1,196
ffffffffc020360a:	00004517          	auipc	a0,0x4
ffffffffc020360e:	08650513          	addi	a0,a0,134 # ffffffffc0207690 <etext+0x1386>
ffffffffc0203612:	e67fc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0203616:	00004697          	auipc	a3,0x4
ffffffffc020361a:	0da68693          	addi	a3,a3,218 # ffffffffc02076f0 <etext+0x13e6>
ffffffffc020361e:	00003617          	auipc	a2,0x3
ffffffffc0203622:	36a60613          	addi	a2,a2,874 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203626:	0c700593          	li	a1,199
ffffffffc020362a:	00004517          	auipc	a0,0x4
ffffffffc020362e:	06650513          	addi	a0,a0,102 # ffffffffc0207690 <etext+0x1386>
ffffffffc0203632:	e47fc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0203636:	00004697          	auipc	a3,0x4
ffffffffc020363a:	1a268693          	addi	a3,a3,418 # ffffffffc02077d8 <etext+0x14ce>
ffffffffc020363e:	00003617          	auipc	a2,0x3
ffffffffc0203642:	34a60613          	addi	a2,a2,842 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203646:	0ea00593          	li	a1,234
ffffffffc020364a:	00004517          	auipc	a0,0x4
ffffffffc020364e:	04650513          	addi	a0,a0,70 # ffffffffc0207690 <etext+0x1386>
ffffffffc0203652:	e27fc0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc0203656 <swap_init_mm>:
ffffffffc0203656:	0003a797          	auipc	a5,0x3a
ffffffffc020365a:	0027b783          	ld	a5,2(a5) # ffffffffc023d658 <sm>
ffffffffc020365e:	6b9c                	ld	a5,16(a5)
ffffffffc0203660:	8782                	jr	a5

ffffffffc0203662 <swap_map_swappable>:
ffffffffc0203662:	0003a797          	auipc	a5,0x3a
ffffffffc0203666:	ff67b783          	ld	a5,-10(a5) # ffffffffc023d658 <sm>
ffffffffc020366a:	739c                	ld	a5,32(a5)
ffffffffc020366c:	8782                	jr	a5

ffffffffc020366e <swap_out>:
ffffffffc020366e:	711d                	addi	sp,sp,-96
ffffffffc0203670:	ec86                	sd	ra,88(sp)
ffffffffc0203672:	e8a2                	sd	s0,80(sp)
ffffffffc0203674:	0e058663          	beqz	a1,ffffffffc0203760 <swap_out+0xf2>
ffffffffc0203678:	e0ca                	sd	s2,64(sp)
ffffffffc020367a:	fc4e                	sd	s3,56(sp)
ffffffffc020367c:	f852                	sd	s4,48(sp)
ffffffffc020367e:	f456                	sd	s5,40(sp)
ffffffffc0203680:	f05a                	sd	s6,32(sp)
ffffffffc0203682:	ec5e                	sd	s7,24(sp)
ffffffffc0203684:	e4a6                	sd	s1,72(sp)
ffffffffc0203686:	e862                	sd	s8,16(sp)
ffffffffc0203688:	8a2e                	mv	s4,a1
ffffffffc020368a:	892a                	mv	s2,a0
ffffffffc020368c:	8ab2                	mv	s5,a2
ffffffffc020368e:	4401                	li	s0,0
ffffffffc0203690:	0003a997          	auipc	s3,0x3a
ffffffffc0203694:	fc898993          	addi	s3,s3,-56 # ffffffffc023d658 <sm>
ffffffffc0203698:	00004b17          	auipc	s6,0x4
ffffffffc020369c:	2e0b0b13          	addi	s6,s6,736 # ffffffffc0207978 <etext+0x166e>
ffffffffc02036a0:	00004b97          	auipc	s7,0x4
ffffffffc02036a4:	2c0b8b93          	addi	s7,s7,704 # ffffffffc0207960 <etext+0x1656>
ffffffffc02036a8:	a825                	j	ffffffffc02036e0 <swap_out+0x72>
ffffffffc02036aa:	67a2                	ld	a5,8(sp)
ffffffffc02036ac:	8626                	mv	a2,s1
ffffffffc02036ae:	85a2                	mv	a1,s0
ffffffffc02036b0:	7f94                	ld	a3,56(a5)
ffffffffc02036b2:	855a                	mv	a0,s6
ffffffffc02036b4:	2405                	addiw	s0,s0,1
ffffffffc02036b6:	82b1                	srli	a3,a3,0xc
ffffffffc02036b8:	0685                	addi	a3,a3,1
ffffffffc02036ba:	acbfc0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02036be:	6522                	ld	a0,8(sp)
ffffffffc02036c0:	4585                	li	a1,1
ffffffffc02036c2:	7d1c                	ld	a5,56(a0)
ffffffffc02036c4:	83b1                	srli	a5,a5,0xc
ffffffffc02036c6:	0785                	addi	a5,a5,1
ffffffffc02036c8:	07a2                	slli	a5,a5,0x8
ffffffffc02036ca:	00fc3023          	sd	a5,0(s8)
ffffffffc02036ce:	d86fe0ef          	jal	ffffffffc0201c54 <free_pages>
ffffffffc02036d2:	01893503          	ld	a0,24(s2)
ffffffffc02036d6:	85a6                	mv	a1,s1
ffffffffc02036d8:	ff6ff0ef          	jal	ffffffffc0202ece <tlb_invalidate>
ffffffffc02036dc:	048a0d63          	beq	s4,s0,ffffffffc0203736 <swap_out+0xc8>
ffffffffc02036e0:	0009b783          	ld	a5,0(s3)
ffffffffc02036e4:	8656                	mv	a2,s5
ffffffffc02036e6:	002c                	addi	a1,sp,8
ffffffffc02036e8:	7b9c                	ld	a5,48(a5)
ffffffffc02036ea:	854a                	mv	a0,s2
ffffffffc02036ec:	9782                	jalr	a5
ffffffffc02036ee:	e12d                	bnez	a0,ffffffffc0203750 <swap_out+0xe2>
ffffffffc02036f0:	67a2                	ld	a5,8(sp)
ffffffffc02036f2:	01893503          	ld	a0,24(s2)
ffffffffc02036f6:	4601                	li	a2,0
ffffffffc02036f8:	7f84                	ld	s1,56(a5)
ffffffffc02036fa:	85a6                	mv	a1,s1
ffffffffc02036fc:	dd2fe0ef          	jal	ffffffffc0201cce <get_pte>
ffffffffc0203700:	611c                	ld	a5,0(a0)
ffffffffc0203702:	8c2a                	mv	s8,a0
ffffffffc0203704:	8b85                	andi	a5,a5,1
ffffffffc0203706:	cfb9                	beqz	a5,ffffffffc0203764 <swap_out+0xf6>
ffffffffc0203708:	65a2                	ld	a1,8(sp)
ffffffffc020370a:	7d9c                	ld	a5,56(a1)
ffffffffc020370c:	83b1                	srli	a5,a5,0xc
ffffffffc020370e:	0785                	addi	a5,a5,1
ffffffffc0203710:	00879513          	slli	a0,a5,0x8
ffffffffc0203714:	7e1000ef          	jal	ffffffffc02046f4 <swapfs_write>
ffffffffc0203718:	d949                	beqz	a0,ffffffffc02036aa <swap_out+0x3c>
ffffffffc020371a:	855e                	mv	a0,s7
ffffffffc020371c:	a69fc0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0203720:	0009b783          	ld	a5,0(s3)
ffffffffc0203724:	6622                	ld	a2,8(sp)
ffffffffc0203726:	4681                	li	a3,0
ffffffffc0203728:	739c                	ld	a5,32(a5)
ffffffffc020372a:	85a6                	mv	a1,s1
ffffffffc020372c:	854a                	mv	a0,s2
ffffffffc020372e:	2405                	addiw	s0,s0,1
ffffffffc0203730:	9782                	jalr	a5
ffffffffc0203732:	fa8a17e3          	bne	s4,s0,ffffffffc02036e0 <swap_out+0x72>
ffffffffc0203736:	64a6                	ld	s1,72(sp)
ffffffffc0203738:	6906                	ld	s2,64(sp)
ffffffffc020373a:	79e2                	ld	s3,56(sp)
ffffffffc020373c:	7a42                	ld	s4,48(sp)
ffffffffc020373e:	7aa2                	ld	s5,40(sp)
ffffffffc0203740:	7b02                	ld	s6,32(sp)
ffffffffc0203742:	6be2                	ld	s7,24(sp)
ffffffffc0203744:	6c42                	ld	s8,16(sp)
ffffffffc0203746:	60e6                	ld	ra,88(sp)
ffffffffc0203748:	8522                	mv	a0,s0
ffffffffc020374a:	6446                	ld	s0,80(sp)
ffffffffc020374c:	6125                	addi	sp,sp,96
ffffffffc020374e:	8082                	ret
ffffffffc0203750:	85a2                	mv	a1,s0
ffffffffc0203752:	00004517          	auipc	a0,0x4
ffffffffc0203756:	1c650513          	addi	a0,a0,454 # ffffffffc0207918 <etext+0x160e>
ffffffffc020375a:	a2bfc0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc020375e:	bfe1                	j	ffffffffc0203736 <swap_out+0xc8>
ffffffffc0203760:	4401                	li	s0,0
ffffffffc0203762:	b7d5                	j	ffffffffc0203746 <swap_out+0xd8>
ffffffffc0203764:	00004697          	auipc	a3,0x4
ffffffffc0203768:	1e468693          	addi	a3,a3,484 # ffffffffc0207948 <etext+0x163e>
ffffffffc020376c:	00003617          	auipc	a2,0x3
ffffffffc0203770:	21c60613          	addi	a2,a2,540 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203774:	06800593          	li	a1,104
ffffffffc0203778:	00004517          	auipc	a0,0x4
ffffffffc020377c:	f1850513          	addi	a0,a0,-232 # ffffffffc0207690 <etext+0x1386>
ffffffffc0203780:	cf9fc0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc0203784 <swap_in>:
ffffffffc0203784:	7179                	addi	sp,sp,-48
ffffffffc0203786:	e84a                	sd	s2,16(sp)
ffffffffc0203788:	892a                	mv	s2,a0
ffffffffc020378a:	4505                	li	a0,1
ffffffffc020378c:	ec26                	sd	s1,24(sp)
ffffffffc020378e:	e44e                	sd	s3,8(sp)
ffffffffc0203790:	f406                	sd	ra,40(sp)
ffffffffc0203792:	f022                	sd	s0,32(sp)
ffffffffc0203794:	84ae                	mv	s1,a1
ffffffffc0203796:	89b2                	mv	s3,a2
ffffffffc0203798:	c2cfe0ef          	jal	ffffffffc0201bc4 <alloc_pages>
ffffffffc020379c:	c129                	beqz	a0,ffffffffc02037de <swap_in+0x5a>
ffffffffc020379e:	842a                	mv	s0,a0
ffffffffc02037a0:	01893503          	ld	a0,24(s2)
ffffffffc02037a4:	4601                	li	a2,0
ffffffffc02037a6:	85a6                	mv	a1,s1
ffffffffc02037a8:	d26fe0ef          	jal	ffffffffc0201cce <get_pte>
ffffffffc02037ac:	892a                	mv	s2,a0
ffffffffc02037ae:	6108                	ld	a0,0(a0)
ffffffffc02037b0:	85a2                	mv	a1,s0
ffffffffc02037b2:	6b5000ef          	jal	ffffffffc0204666 <swapfs_read>
ffffffffc02037b6:	00093583          	ld	a1,0(s2)
ffffffffc02037ba:	8626                	mv	a2,s1
ffffffffc02037bc:	00004517          	auipc	a0,0x4
ffffffffc02037c0:	20c50513          	addi	a0,a0,524 # ffffffffc02079c8 <etext+0x16be>
ffffffffc02037c4:	81a1                	srli	a1,a1,0x8
ffffffffc02037c6:	9bffc0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02037ca:	70a2                	ld	ra,40(sp)
ffffffffc02037cc:	0089b023          	sd	s0,0(s3)
ffffffffc02037d0:	7402                	ld	s0,32(sp)
ffffffffc02037d2:	64e2                	ld	s1,24(sp)
ffffffffc02037d4:	6942                	ld	s2,16(sp)
ffffffffc02037d6:	69a2                	ld	s3,8(sp)
ffffffffc02037d8:	4501                	li	a0,0
ffffffffc02037da:	6145                	addi	sp,sp,48
ffffffffc02037dc:	8082                	ret
ffffffffc02037de:	00004697          	auipc	a3,0x4
ffffffffc02037e2:	1da68693          	addi	a3,a3,474 # ffffffffc02079b8 <etext+0x16ae>
ffffffffc02037e6:	00003617          	auipc	a2,0x3
ffffffffc02037ea:	1a260613          	addi	a2,a2,418 # ffffffffc0206988 <etext+0x67e>
ffffffffc02037ee:	07e00593          	li	a1,126
ffffffffc02037f2:	00004517          	auipc	a0,0x4
ffffffffc02037f6:	e9e50513          	addi	a0,a0,-354 # ffffffffc0207690 <etext+0x1386>
ffffffffc02037fa:	c7ffc0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc02037fe <_fifo_init_mm>:
ffffffffc02037fe:	00036797          	auipc	a5,0x36
ffffffffc0203802:	db278793          	addi	a5,a5,-590 # ffffffffc02395b0 <pra_list_head>
ffffffffc0203806:	f51c                	sd	a5,40(a0)
ffffffffc0203808:	e79c                	sd	a5,8(a5)
ffffffffc020380a:	e39c                	sd	a5,0(a5)
ffffffffc020380c:	4501                	li	a0,0
ffffffffc020380e:	8082                	ret

ffffffffc0203810 <_fifo_init>:
ffffffffc0203810:	4501                	li	a0,0
ffffffffc0203812:	8082                	ret

ffffffffc0203814 <_fifo_set_unswappable>:
ffffffffc0203814:	4501                	li	a0,0
ffffffffc0203816:	8082                	ret

ffffffffc0203818 <_fifo_tick_event>:
ffffffffc0203818:	4501                	li	a0,0
ffffffffc020381a:	8082                	ret

ffffffffc020381c <_fifo_check_swap>:
ffffffffc020381c:	711d                	addi	sp,sp,-96
ffffffffc020381e:	fc4e                	sd	s3,56(sp)
ffffffffc0203820:	f852                	sd	s4,48(sp)
ffffffffc0203822:	00004517          	auipc	a0,0x4
ffffffffc0203826:	1e650513          	addi	a0,a0,486 # ffffffffc0207a08 <etext+0x16fe>
ffffffffc020382a:	698d                	lui	s3,0x3
ffffffffc020382c:	4a31                	li	s4,12
ffffffffc020382e:	e4a6                	sd	s1,72(sp)
ffffffffc0203830:	ec86                	sd	ra,88(sp)
ffffffffc0203832:	e8a2                	sd	s0,80(sp)
ffffffffc0203834:	e0ca                	sd	s2,64(sp)
ffffffffc0203836:	f456                	sd	s5,40(sp)
ffffffffc0203838:	f05a                	sd	s6,32(sp)
ffffffffc020383a:	ec5e                	sd	s7,24(sp)
ffffffffc020383c:	e862                	sd	s8,16(sp)
ffffffffc020383e:	e466                	sd	s9,8(sp)
ffffffffc0203840:	945fc0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0203844:	01498023          	sb	s4,0(s3) # 3000 <_binary_obj___user_matrix_out_size+0x3a0>
ffffffffc0203848:	0003a497          	auipc	s1,0x3a
ffffffffc020384c:	e184a483          	lw	s1,-488(s1) # ffffffffc023d660 <pgfault_num>
ffffffffc0203850:	4791                	li	a5,4
ffffffffc0203852:	14f49963          	bne	s1,a5,ffffffffc02039a4 <_fifo_check_swap+0x188>
ffffffffc0203856:	00004517          	auipc	a0,0x4
ffffffffc020385a:	1f250513          	addi	a0,a0,498 # ffffffffc0207a48 <etext+0x173e>
ffffffffc020385e:	6a85                	lui	s5,0x1
ffffffffc0203860:	4b29                	li	s6,10
ffffffffc0203862:	923fc0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0203866:	0003a417          	auipc	s0,0x3a
ffffffffc020386a:	dfa40413          	addi	s0,s0,-518 # ffffffffc023d660 <pgfault_num>
ffffffffc020386e:	016a8023          	sb	s6,0(s5) # 1000 <_binary_obj___user_faultread_out_size-0xef0>
ffffffffc0203872:	401c                	lw	a5,0(s0)
ffffffffc0203874:	0007891b          	sext.w	s2,a5
ffffffffc0203878:	2a979663          	bne	a5,s1,ffffffffc0203b24 <_fifo_check_swap+0x308>
ffffffffc020387c:	00004517          	auipc	a0,0x4
ffffffffc0203880:	1f450513          	addi	a0,a0,500 # ffffffffc0207a70 <etext+0x1766>
ffffffffc0203884:	6b91                	lui	s7,0x4
ffffffffc0203886:	4c35                	li	s8,13
ffffffffc0203888:	8fdfc0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc020388c:	018b8023          	sb	s8,0(s7) # 4000 <_binary_obj___user_matrix_out_size+0x13a0>
ffffffffc0203890:	401c                	lw	a5,0(s0)
ffffffffc0203892:	00078c9b          	sext.w	s9,a5
ffffffffc0203896:	27279763          	bne	a5,s2,ffffffffc0203b04 <_fifo_check_swap+0x2e8>
ffffffffc020389a:	00004517          	auipc	a0,0x4
ffffffffc020389e:	1fe50513          	addi	a0,a0,510 # ffffffffc0207a98 <etext+0x178e>
ffffffffc02038a2:	6489                	lui	s1,0x2
ffffffffc02038a4:	492d                	li	s2,11
ffffffffc02038a6:	8dffc0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02038aa:	01248023          	sb	s2,0(s1) # 2000 <_binary_obj___user_hello_out_size+0x38>
ffffffffc02038ae:	401c                	lw	a5,0(s0)
ffffffffc02038b0:	23979a63          	bne	a5,s9,ffffffffc0203ae4 <_fifo_check_swap+0x2c8>
ffffffffc02038b4:	00004517          	auipc	a0,0x4
ffffffffc02038b8:	20c50513          	addi	a0,a0,524 # ffffffffc0207ac0 <etext+0x17b6>
ffffffffc02038bc:	8c9fc0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02038c0:	6795                	lui	a5,0x5
ffffffffc02038c2:	4739                	li	a4,14
ffffffffc02038c4:	00e78023          	sb	a4,0(a5) # 5000 <_binary_obj___user_matrix_out_size+0x23a0>
ffffffffc02038c8:	401c                	lw	a5,0(s0)
ffffffffc02038ca:	4715                	li	a4,5
ffffffffc02038cc:	00078c9b          	sext.w	s9,a5
ffffffffc02038d0:	1ee79a63          	bne	a5,a4,ffffffffc0203ac4 <_fifo_check_swap+0x2a8>
ffffffffc02038d4:	00004517          	auipc	a0,0x4
ffffffffc02038d8:	1c450513          	addi	a0,a0,452 # ffffffffc0207a98 <etext+0x178e>
ffffffffc02038dc:	8a9fc0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02038e0:	01248023          	sb	s2,0(s1)
ffffffffc02038e4:	401c                	lw	a5,0(s0)
ffffffffc02038e6:	1b979f63          	bne	a5,s9,ffffffffc0203aa4 <_fifo_check_swap+0x288>
ffffffffc02038ea:	00004517          	auipc	a0,0x4
ffffffffc02038ee:	15e50513          	addi	a0,a0,350 # ffffffffc0207a48 <etext+0x173e>
ffffffffc02038f2:	893fc0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02038f6:	016a8023          	sb	s6,0(s5)
ffffffffc02038fa:	4018                	lw	a4,0(s0)
ffffffffc02038fc:	4799                	li	a5,6
ffffffffc02038fe:	18f71363          	bne	a4,a5,ffffffffc0203a84 <_fifo_check_swap+0x268>
ffffffffc0203902:	00004517          	auipc	a0,0x4
ffffffffc0203906:	19650513          	addi	a0,a0,406 # ffffffffc0207a98 <etext+0x178e>
ffffffffc020390a:	87bfc0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc020390e:	01248023          	sb	s2,0(s1)
ffffffffc0203912:	4018                	lw	a4,0(s0)
ffffffffc0203914:	479d                	li	a5,7
ffffffffc0203916:	14f71763          	bne	a4,a5,ffffffffc0203a64 <_fifo_check_swap+0x248>
ffffffffc020391a:	00004517          	auipc	a0,0x4
ffffffffc020391e:	0ee50513          	addi	a0,a0,238 # ffffffffc0207a08 <etext+0x16fe>
ffffffffc0203922:	863fc0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0203926:	01498023          	sb	s4,0(s3)
ffffffffc020392a:	4018                	lw	a4,0(s0)
ffffffffc020392c:	47a1                	li	a5,8
ffffffffc020392e:	10f71b63          	bne	a4,a5,ffffffffc0203a44 <_fifo_check_swap+0x228>
ffffffffc0203932:	00004517          	auipc	a0,0x4
ffffffffc0203936:	13e50513          	addi	a0,a0,318 # ffffffffc0207a70 <etext+0x1766>
ffffffffc020393a:	84bfc0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc020393e:	018b8023          	sb	s8,0(s7)
ffffffffc0203942:	4018                	lw	a4,0(s0)
ffffffffc0203944:	47a5                	li	a5,9
ffffffffc0203946:	0cf71f63          	bne	a4,a5,ffffffffc0203a24 <_fifo_check_swap+0x208>
ffffffffc020394a:	00004517          	auipc	a0,0x4
ffffffffc020394e:	17650513          	addi	a0,a0,374 # ffffffffc0207ac0 <etext+0x17b6>
ffffffffc0203952:	833fc0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0203956:	6795                	lui	a5,0x5
ffffffffc0203958:	4739                	li	a4,14
ffffffffc020395a:	00e78023          	sb	a4,0(a5) # 5000 <_binary_obj___user_matrix_out_size+0x23a0>
ffffffffc020395e:	401c                	lw	a5,0(s0)
ffffffffc0203960:	4729                	li	a4,10
ffffffffc0203962:	0007849b          	sext.w	s1,a5
ffffffffc0203966:	08e79f63          	bne	a5,a4,ffffffffc0203a04 <_fifo_check_swap+0x1e8>
ffffffffc020396a:	00004517          	auipc	a0,0x4
ffffffffc020396e:	0de50513          	addi	a0,a0,222 # ffffffffc0207a48 <etext+0x173e>
ffffffffc0203972:	813fc0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0203976:	6785                	lui	a5,0x1
ffffffffc0203978:	0007c783          	lbu	a5,0(a5) # 1000 <_binary_obj___user_faultread_out_size-0xef0>
ffffffffc020397c:	06979463          	bne	a5,s1,ffffffffc02039e4 <_fifo_check_swap+0x1c8>
ffffffffc0203980:	4018                	lw	a4,0(s0)
ffffffffc0203982:	47ad                	li	a5,11
ffffffffc0203984:	04f71063          	bne	a4,a5,ffffffffc02039c4 <_fifo_check_swap+0x1a8>
ffffffffc0203988:	60e6                	ld	ra,88(sp)
ffffffffc020398a:	6446                	ld	s0,80(sp)
ffffffffc020398c:	64a6                	ld	s1,72(sp)
ffffffffc020398e:	6906                	ld	s2,64(sp)
ffffffffc0203990:	79e2                	ld	s3,56(sp)
ffffffffc0203992:	7a42                	ld	s4,48(sp)
ffffffffc0203994:	7aa2                	ld	s5,40(sp)
ffffffffc0203996:	7b02                	ld	s6,32(sp)
ffffffffc0203998:	6be2                	ld	s7,24(sp)
ffffffffc020399a:	6c42                	ld	s8,16(sp)
ffffffffc020399c:	6ca2                	ld	s9,8(sp)
ffffffffc020399e:	4501                	li	a0,0
ffffffffc02039a0:	6125                	addi	sp,sp,96
ffffffffc02039a2:	8082                	ret
ffffffffc02039a4:	00004697          	auipc	a3,0x4
ffffffffc02039a8:	eb468693          	addi	a3,a3,-332 # ffffffffc0207858 <etext+0x154e>
ffffffffc02039ac:	00003617          	auipc	a2,0x3
ffffffffc02039b0:	fdc60613          	addi	a2,a2,-36 # ffffffffc0206988 <etext+0x67e>
ffffffffc02039b4:	05100593          	li	a1,81
ffffffffc02039b8:	00004517          	auipc	a0,0x4
ffffffffc02039bc:	07850513          	addi	a0,a0,120 # ffffffffc0207a30 <etext+0x1726>
ffffffffc02039c0:	ab9fc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02039c4:	00004697          	auipc	a3,0x4
ffffffffc02039c8:	1ac68693          	addi	a3,a3,428 # ffffffffc0207b70 <etext+0x1866>
ffffffffc02039cc:	00003617          	auipc	a2,0x3
ffffffffc02039d0:	fbc60613          	addi	a2,a2,-68 # ffffffffc0206988 <etext+0x67e>
ffffffffc02039d4:	07300593          	li	a1,115
ffffffffc02039d8:	00004517          	auipc	a0,0x4
ffffffffc02039dc:	05850513          	addi	a0,a0,88 # ffffffffc0207a30 <etext+0x1726>
ffffffffc02039e0:	a99fc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02039e4:	00004697          	auipc	a3,0x4
ffffffffc02039e8:	16468693          	addi	a3,a3,356 # ffffffffc0207b48 <etext+0x183e>
ffffffffc02039ec:	00003617          	auipc	a2,0x3
ffffffffc02039f0:	f9c60613          	addi	a2,a2,-100 # ffffffffc0206988 <etext+0x67e>
ffffffffc02039f4:	07100593          	li	a1,113
ffffffffc02039f8:	00004517          	auipc	a0,0x4
ffffffffc02039fc:	03850513          	addi	a0,a0,56 # ffffffffc0207a30 <etext+0x1726>
ffffffffc0203a00:	a79fc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0203a04:	00004697          	auipc	a3,0x4
ffffffffc0203a08:	13468693          	addi	a3,a3,308 # ffffffffc0207b38 <etext+0x182e>
ffffffffc0203a0c:	00003617          	auipc	a2,0x3
ffffffffc0203a10:	f7c60613          	addi	a2,a2,-132 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203a14:	06f00593          	li	a1,111
ffffffffc0203a18:	00004517          	auipc	a0,0x4
ffffffffc0203a1c:	01850513          	addi	a0,a0,24 # ffffffffc0207a30 <etext+0x1726>
ffffffffc0203a20:	a59fc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0203a24:	00004697          	auipc	a3,0x4
ffffffffc0203a28:	10468693          	addi	a3,a3,260 # ffffffffc0207b28 <etext+0x181e>
ffffffffc0203a2c:	00003617          	auipc	a2,0x3
ffffffffc0203a30:	f5c60613          	addi	a2,a2,-164 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203a34:	06c00593          	li	a1,108
ffffffffc0203a38:	00004517          	auipc	a0,0x4
ffffffffc0203a3c:	ff850513          	addi	a0,a0,-8 # ffffffffc0207a30 <etext+0x1726>
ffffffffc0203a40:	a39fc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0203a44:	00004697          	auipc	a3,0x4
ffffffffc0203a48:	0d468693          	addi	a3,a3,212 # ffffffffc0207b18 <etext+0x180e>
ffffffffc0203a4c:	00003617          	auipc	a2,0x3
ffffffffc0203a50:	f3c60613          	addi	a2,a2,-196 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203a54:	06900593          	li	a1,105
ffffffffc0203a58:	00004517          	auipc	a0,0x4
ffffffffc0203a5c:	fd850513          	addi	a0,a0,-40 # ffffffffc0207a30 <etext+0x1726>
ffffffffc0203a60:	a19fc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0203a64:	00004697          	auipc	a3,0x4
ffffffffc0203a68:	0a468693          	addi	a3,a3,164 # ffffffffc0207b08 <etext+0x17fe>
ffffffffc0203a6c:	00003617          	auipc	a2,0x3
ffffffffc0203a70:	f1c60613          	addi	a2,a2,-228 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203a74:	06600593          	li	a1,102
ffffffffc0203a78:	00004517          	auipc	a0,0x4
ffffffffc0203a7c:	fb850513          	addi	a0,a0,-72 # ffffffffc0207a30 <etext+0x1726>
ffffffffc0203a80:	9f9fc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0203a84:	00004697          	auipc	a3,0x4
ffffffffc0203a88:	07468693          	addi	a3,a3,116 # ffffffffc0207af8 <etext+0x17ee>
ffffffffc0203a8c:	00003617          	auipc	a2,0x3
ffffffffc0203a90:	efc60613          	addi	a2,a2,-260 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203a94:	06300593          	li	a1,99
ffffffffc0203a98:	00004517          	auipc	a0,0x4
ffffffffc0203a9c:	f9850513          	addi	a0,a0,-104 # ffffffffc0207a30 <etext+0x1726>
ffffffffc0203aa0:	9d9fc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0203aa4:	00004697          	auipc	a3,0x4
ffffffffc0203aa8:	04468693          	addi	a3,a3,68 # ffffffffc0207ae8 <etext+0x17de>
ffffffffc0203aac:	00003617          	auipc	a2,0x3
ffffffffc0203ab0:	edc60613          	addi	a2,a2,-292 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203ab4:	06000593          	li	a1,96
ffffffffc0203ab8:	00004517          	auipc	a0,0x4
ffffffffc0203abc:	f7850513          	addi	a0,a0,-136 # ffffffffc0207a30 <etext+0x1726>
ffffffffc0203ac0:	9b9fc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0203ac4:	00004697          	auipc	a3,0x4
ffffffffc0203ac8:	02468693          	addi	a3,a3,36 # ffffffffc0207ae8 <etext+0x17de>
ffffffffc0203acc:	00003617          	auipc	a2,0x3
ffffffffc0203ad0:	ebc60613          	addi	a2,a2,-324 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203ad4:	05d00593          	li	a1,93
ffffffffc0203ad8:	00004517          	auipc	a0,0x4
ffffffffc0203adc:	f5850513          	addi	a0,a0,-168 # ffffffffc0207a30 <etext+0x1726>
ffffffffc0203ae0:	999fc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0203ae4:	00004697          	auipc	a3,0x4
ffffffffc0203ae8:	d7468693          	addi	a3,a3,-652 # ffffffffc0207858 <etext+0x154e>
ffffffffc0203aec:	00003617          	auipc	a2,0x3
ffffffffc0203af0:	e9c60613          	addi	a2,a2,-356 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203af4:	05a00593          	li	a1,90
ffffffffc0203af8:	00004517          	auipc	a0,0x4
ffffffffc0203afc:	f3850513          	addi	a0,a0,-200 # ffffffffc0207a30 <etext+0x1726>
ffffffffc0203b00:	979fc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0203b04:	00004697          	auipc	a3,0x4
ffffffffc0203b08:	d5468693          	addi	a3,a3,-684 # ffffffffc0207858 <etext+0x154e>
ffffffffc0203b0c:	00003617          	auipc	a2,0x3
ffffffffc0203b10:	e7c60613          	addi	a2,a2,-388 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203b14:	05700593          	li	a1,87
ffffffffc0203b18:	00004517          	auipc	a0,0x4
ffffffffc0203b1c:	f1850513          	addi	a0,a0,-232 # ffffffffc0207a30 <etext+0x1726>
ffffffffc0203b20:	959fc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0203b24:	00004697          	auipc	a3,0x4
ffffffffc0203b28:	d3468693          	addi	a3,a3,-716 # ffffffffc0207858 <etext+0x154e>
ffffffffc0203b2c:	00003617          	auipc	a2,0x3
ffffffffc0203b30:	e5c60613          	addi	a2,a2,-420 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203b34:	05400593          	li	a1,84
ffffffffc0203b38:	00004517          	auipc	a0,0x4
ffffffffc0203b3c:	ef850513          	addi	a0,a0,-264 # ffffffffc0207a30 <etext+0x1726>
ffffffffc0203b40:	939fc0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc0203b44 <_fifo_swap_out_victim>:
ffffffffc0203b44:	751c                	ld	a5,40(a0)
ffffffffc0203b46:	1141                	addi	sp,sp,-16
ffffffffc0203b48:	e406                	sd	ra,8(sp)
ffffffffc0203b4a:	cf91                	beqz	a5,ffffffffc0203b66 <_fifo_swap_out_victim+0x22>
ffffffffc0203b4c:	ee0d                	bnez	a2,ffffffffc0203b86 <_fifo_swap_out_victim+0x42>
ffffffffc0203b4e:	679c                	ld	a5,8(a5)
ffffffffc0203b50:	60a2                	ld	ra,8(sp)
ffffffffc0203b52:	4501                	li	a0,0
ffffffffc0203b54:	6394                	ld	a3,0(a5)
ffffffffc0203b56:	6798                	ld	a4,8(a5)
ffffffffc0203b58:	fd878793          	addi	a5,a5,-40
ffffffffc0203b5c:	e698                	sd	a4,8(a3)
ffffffffc0203b5e:	e314                	sd	a3,0(a4)
ffffffffc0203b60:	e19c                	sd	a5,0(a1)
ffffffffc0203b62:	0141                	addi	sp,sp,16
ffffffffc0203b64:	8082                	ret
ffffffffc0203b66:	00004697          	auipc	a3,0x4
ffffffffc0203b6a:	01a68693          	addi	a3,a3,26 # ffffffffc0207b80 <etext+0x1876>
ffffffffc0203b6e:	00003617          	auipc	a2,0x3
ffffffffc0203b72:	e1a60613          	addi	a2,a2,-486 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203b76:	04100593          	li	a1,65
ffffffffc0203b7a:	00004517          	auipc	a0,0x4
ffffffffc0203b7e:	eb650513          	addi	a0,a0,-330 # ffffffffc0207a30 <etext+0x1726>
ffffffffc0203b82:	8f7fc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0203b86:	00004697          	auipc	a3,0x4
ffffffffc0203b8a:	00a68693          	addi	a3,a3,10 # ffffffffc0207b90 <etext+0x1886>
ffffffffc0203b8e:	00003617          	auipc	a2,0x3
ffffffffc0203b92:	dfa60613          	addi	a2,a2,-518 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203b96:	04200593          	li	a1,66
ffffffffc0203b9a:	00004517          	auipc	a0,0x4
ffffffffc0203b9e:	e9650513          	addi	a0,a0,-362 # ffffffffc0207a30 <etext+0x1726>
ffffffffc0203ba2:	8d7fc0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc0203ba6 <_fifo_map_swappable>:
ffffffffc0203ba6:	751c                	ld	a5,40(a0)
ffffffffc0203ba8:	cb91                	beqz	a5,ffffffffc0203bbc <_fifo_map_swappable+0x16>
ffffffffc0203baa:	6394                	ld	a3,0(a5)
ffffffffc0203bac:	02860713          	addi	a4,a2,40
ffffffffc0203bb0:	e398                	sd	a4,0(a5)
ffffffffc0203bb2:	e698                	sd	a4,8(a3)
ffffffffc0203bb4:	4501                	li	a0,0
ffffffffc0203bb6:	fa1c                	sd	a5,48(a2)
ffffffffc0203bb8:	f614                	sd	a3,40(a2)
ffffffffc0203bba:	8082                	ret
ffffffffc0203bbc:	1141                	addi	sp,sp,-16
ffffffffc0203bbe:	00004697          	auipc	a3,0x4
ffffffffc0203bc2:	fe268693          	addi	a3,a3,-30 # ffffffffc0207ba0 <etext+0x1896>
ffffffffc0203bc6:	00003617          	auipc	a2,0x3
ffffffffc0203bca:	dc260613          	addi	a2,a2,-574 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203bce:	03200593          	li	a1,50
ffffffffc0203bd2:	00004517          	auipc	a0,0x4
ffffffffc0203bd6:	e5e50513          	addi	a0,a0,-418 # ffffffffc0207a30 <etext+0x1726>
ffffffffc0203bda:	e406                	sd	ra,8(sp)
ffffffffc0203bdc:	89dfc0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc0203be0 <check_vma_overlap.part.0>:
ffffffffc0203be0:	1141                	addi	sp,sp,-16
ffffffffc0203be2:	00004697          	auipc	a3,0x4
ffffffffc0203be6:	ff668693          	addi	a3,a3,-10 # ffffffffc0207bd8 <etext+0x18ce>
ffffffffc0203bea:	00003617          	auipc	a2,0x3
ffffffffc0203bee:	d9e60613          	addi	a2,a2,-610 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203bf2:	06d00593          	li	a1,109
ffffffffc0203bf6:	00004517          	auipc	a0,0x4
ffffffffc0203bfa:	00250513          	addi	a0,a0,2 # ffffffffc0207bf8 <etext+0x18ee>
ffffffffc0203bfe:	e406                	sd	ra,8(sp)
ffffffffc0203c00:	879fc0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc0203c04 <mm_create>:
ffffffffc0203c04:	1141                	addi	sp,sp,-16
ffffffffc0203c06:	04000513          	li	a0,64
ffffffffc0203c0a:	e022                	sd	s0,0(sp)
ffffffffc0203c0c:	e406                	sd	ra,8(sp)
ffffffffc0203c0e:	ddffd0ef          	jal	ffffffffc02019ec <kmalloc>
ffffffffc0203c12:	842a                	mv	s0,a0
ffffffffc0203c14:	c505                	beqz	a0,ffffffffc0203c3c <mm_create+0x38>
ffffffffc0203c16:	e408                	sd	a0,8(s0)
ffffffffc0203c18:	e008                	sd	a0,0(s0)
ffffffffc0203c1a:	00053823          	sd	zero,16(a0)
ffffffffc0203c1e:	00053c23          	sd	zero,24(a0)
ffffffffc0203c22:	02052023          	sw	zero,32(a0)
ffffffffc0203c26:	0003a797          	auipc	a5,0x3a
ffffffffc0203c2a:	a227a783          	lw	a5,-1502(a5) # ffffffffc023d648 <swap_init_ok>
ffffffffc0203c2e:	ef81                	bnez	a5,ffffffffc0203c46 <mm_create+0x42>
ffffffffc0203c30:	02053423          	sd	zero,40(a0)
ffffffffc0203c34:	02042823          	sw	zero,48(s0)
ffffffffc0203c38:	02043c23          	sd	zero,56(s0)
ffffffffc0203c3c:	60a2                	ld	ra,8(sp)
ffffffffc0203c3e:	8522                	mv	a0,s0
ffffffffc0203c40:	6402                	ld	s0,0(sp)
ffffffffc0203c42:	0141                	addi	sp,sp,16
ffffffffc0203c44:	8082                	ret
ffffffffc0203c46:	a11ff0ef          	jal	ffffffffc0203656 <swap_init_mm>
ffffffffc0203c4a:	b7ed                	j	ffffffffc0203c34 <mm_create+0x30>

ffffffffc0203c4c <vma_create>:
ffffffffc0203c4c:	1101                	addi	sp,sp,-32
ffffffffc0203c4e:	e04a                	sd	s2,0(sp)
ffffffffc0203c50:	892a                	mv	s2,a0
ffffffffc0203c52:	03000513          	li	a0,48
ffffffffc0203c56:	e822                	sd	s0,16(sp)
ffffffffc0203c58:	e426                	sd	s1,8(sp)
ffffffffc0203c5a:	ec06                	sd	ra,24(sp)
ffffffffc0203c5c:	84ae                	mv	s1,a1
ffffffffc0203c5e:	8432                	mv	s0,a2
ffffffffc0203c60:	d8dfd0ef          	jal	ffffffffc02019ec <kmalloc>
ffffffffc0203c64:	c509                	beqz	a0,ffffffffc0203c6e <vma_create+0x22>
ffffffffc0203c66:	01253423          	sd	s2,8(a0)
ffffffffc0203c6a:	e904                	sd	s1,16(a0)
ffffffffc0203c6c:	cd00                	sw	s0,24(a0)
ffffffffc0203c6e:	60e2                	ld	ra,24(sp)
ffffffffc0203c70:	6442                	ld	s0,16(sp)
ffffffffc0203c72:	64a2                	ld	s1,8(sp)
ffffffffc0203c74:	6902                	ld	s2,0(sp)
ffffffffc0203c76:	6105                	addi	sp,sp,32
ffffffffc0203c78:	8082                	ret

ffffffffc0203c7a <find_vma>:
ffffffffc0203c7a:	86aa                	mv	a3,a0
ffffffffc0203c7c:	c505                	beqz	a0,ffffffffc0203ca4 <find_vma+0x2a>
ffffffffc0203c7e:	6908                	ld	a0,16(a0)
ffffffffc0203c80:	c501                	beqz	a0,ffffffffc0203c88 <find_vma+0xe>
ffffffffc0203c82:	651c                	ld	a5,8(a0)
ffffffffc0203c84:	02f5f663          	bgeu	a1,a5,ffffffffc0203cb0 <find_vma+0x36>
ffffffffc0203c88:	669c                	ld	a5,8(a3)
ffffffffc0203c8a:	00f68d63          	beq	a3,a5,ffffffffc0203ca4 <find_vma+0x2a>
ffffffffc0203c8e:	fe87b703          	ld	a4,-24(a5)
ffffffffc0203c92:	00e5e663          	bltu	a1,a4,ffffffffc0203c9e <find_vma+0x24>
ffffffffc0203c96:	ff07b703          	ld	a4,-16(a5)
ffffffffc0203c9a:	00e5e763          	bltu	a1,a4,ffffffffc0203ca8 <find_vma+0x2e>
ffffffffc0203c9e:	679c                	ld	a5,8(a5)
ffffffffc0203ca0:	fef697e3          	bne	a3,a5,ffffffffc0203c8e <find_vma+0x14>
ffffffffc0203ca4:	4501                	li	a0,0
ffffffffc0203ca6:	8082                	ret
ffffffffc0203ca8:	fe078513          	addi	a0,a5,-32
ffffffffc0203cac:	ea88                	sd	a0,16(a3)
ffffffffc0203cae:	8082                	ret
ffffffffc0203cb0:	691c                	ld	a5,16(a0)
ffffffffc0203cb2:	fcf5fbe3          	bgeu	a1,a5,ffffffffc0203c88 <find_vma+0xe>
ffffffffc0203cb6:	ea88                	sd	a0,16(a3)
ffffffffc0203cb8:	8082                	ret

ffffffffc0203cba <insert_vma_struct>:
ffffffffc0203cba:	6590                	ld	a2,8(a1)
ffffffffc0203cbc:	0105b803          	ld	a6,16(a1) # 1010 <_binary_obj___user_faultread_out_size-0xee0>
ffffffffc0203cc0:	1141                	addi	sp,sp,-16
ffffffffc0203cc2:	e406                	sd	ra,8(sp)
ffffffffc0203cc4:	87aa                	mv	a5,a0
ffffffffc0203cc6:	01066763          	bltu	a2,a6,ffffffffc0203cd4 <insert_vma_struct+0x1a>
ffffffffc0203cca:	a085                	j	ffffffffc0203d2a <insert_vma_struct+0x70>
ffffffffc0203ccc:	fe87b703          	ld	a4,-24(a5)
ffffffffc0203cd0:	04e66863          	bltu	a2,a4,ffffffffc0203d20 <insert_vma_struct+0x66>
ffffffffc0203cd4:	86be                	mv	a3,a5
ffffffffc0203cd6:	679c                	ld	a5,8(a5)
ffffffffc0203cd8:	fef51ae3          	bne	a0,a5,ffffffffc0203ccc <insert_vma_struct+0x12>
ffffffffc0203cdc:	02a68463          	beq	a3,a0,ffffffffc0203d04 <insert_vma_struct+0x4a>
ffffffffc0203ce0:	ff06b703          	ld	a4,-16(a3)
ffffffffc0203ce4:	fe86b883          	ld	a7,-24(a3)
ffffffffc0203ce8:	08e8f163          	bgeu	a7,a4,ffffffffc0203d6a <insert_vma_struct+0xb0>
ffffffffc0203cec:	04e66f63          	bltu	a2,a4,ffffffffc0203d4a <insert_vma_struct+0x90>
ffffffffc0203cf0:	00f50a63          	beq	a0,a5,ffffffffc0203d04 <insert_vma_struct+0x4a>
ffffffffc0203cf4:	fe87b703          	ld	a4,-24(a5)
ffffffffc0203cf8:	05076963          	bltu	a4,a6,ffffffffc0203d4a <insert_vma_struct+0x90>
ffffffffc0203cfc:	ff07b603          	ld	a2,-16(a5)
ffffffffc0203d00:	02c77363          	bgeu	a4,a2,ffffffffc0203d26 <insert_vma_struct+0x6c>
ffffffffc0203d04:	5118                	lw	a4,32(a0)
ffffffffc0203d06:	e188                	sd	a0,0(a1)
ffffffffc0203d08:	02058613          	addi	a2,a1,32
ffffffffc0203d0c:	e390                	sd	a2,0(a5)
ffffffffc0203d0e:	e690                	sd	a2,8(a3)
ffffffffc0203d10:	60a2                	ld	ra,8(sp)
ffffffffc0203d12:	f59c                	sd	a5,40(a1)
ffffffffc0203d14:	f194                	sd	a3,32(a1)
ffffffffc0203d16:	0017079b          	addiw	a5,a4,1 # 1001 <_binary_obj___user_faultread_out_size-0xeef>
ffffffffc0203d1a:	d11c                	sw	a5,32(a0)
ffffffffc0203d1c:	0141                	addi	sp,sp,16
ffffffffc0203d1e:	8082                	ret
ffffffffc0203d20:	fca690e3          	bne	a3,a0,ffffffffc0203ce0 <insert_vma_struct+0x26>
ffffffffc0203d24:	bfd1                	j	ffffffffc0203cf8 <insert_vma_struct+0x3e>
ffffffffc0203d26:	ebbff0ef          	jal	ffffffffc0203be0 <check_vma_overlap.part.0>
ffffffffc0203d2a:	00004697          	auipc	a3,0x4
ffffffffc0203d2e:	ede68693          	addi	a3,a3,-290 # ffffffffc0207c08 <etext+0x18fe>
ffffffffc0203d32:	00003617          	auipc	a2,0x3
ffffffffc0203d36:	c5660613          	addi	a2,a2,-938 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203d3a:	07400593          	li	a1,116
ffffffffc0203d3e:	00004517          	auipc	a0,0x4
ffffffffc0203d42:	eba50513          	addi	a0,a0,-326 # ffffffffc0207bf8 <etext+0x18ee>
ffffffffc0203d46:	f32fc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0203d4a:	00004697          	auipc	a3,0x4
ffffffffc0203d4e:	efe68693          	addi	a3,a3,-258 # ffffffffc0207c48 <etext+0x193e>
ffffffffc0203d52:	00003617          	auipc	a2,0x3
ffffffffc0203d56:	c3660613          	addi	a2,a2,-970 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203d5a:	06c00593          	li	a1,108
ffffffffc0203d5e:	00004517          	auipc	a0,0x4
ffffffffc0203d62:	e9a50513          	addi	a0,a0,-358 # ffffffffc0207bf8 <etext+0x18ee>
ffffffffc0203d66:	f12fc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0203d6a:	00004697          	auipc	a3,0x4
ffffffffc0203d6e:	ebe68693          	addi	a3,a3,-322 # ffffffffc0207c28 <etext+0x191e>
ffffffffc0203d72:	00003617          	auipc	a2,0x3
ffffffffc0203d76:	c1660613          	addi	a2,a2,-1002 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203d7a:	06b00593          	li	a1,107
ffffffffc0203d7e:	00004517          	auipc	a0,0x4
ffffffffc0203d82:	e7a50513          	addi	a0,a0,-390 # ffffffffc0207bf8 <etext+0x18ee>
ffffffffc0203d86:	ef2fc0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc0203d8a <mm_destroy>:
ffffffffc0203d8a:	591c                	lw	a5,48(a0)
ffffffffc0203d8c:	1141                	addi	sp,sp,-16
ffffffffc0203d8e:	e406                	sd	ra,8(sp)
ffffffffc0203d90:	e022                	sd	s0,0(sp)
ffffffffc0203d92:	e78d                	bnez	a5,ffffffffc0203dbc <mm_destroy+0x32>
ffffffffc0203d94:	842a                	mv	s0,a0
ffffffffc0203d96:	6508                	ld	a0,8(a0)
ffffffffc0203d98:	00a40c63          	beq	s0,a0,ffffffffc0203db0 <mm_destroy+0x26>
ffffffffc0203d9c:	6118                	ld	a4,0(a0)
ffffffffc0203d9e:	651c                	ld	a5,8(a0)
ffffffffc0203da0:	1501                	addi	a0,a0,-32
ffffffffc0203da2:	e71c                	sd	a5,8(a4)
ffffffffc0203da4:	e398                	sd	a4,0(a5)
ffffffffc0203da6:	cf1fd0ef          	jal	ffffffffc0201a96 <kfree>
ffffffffc0203daa:	6408                	ld	a0,8(s0)
ffffffffc0203dac:	fea418e3          	bne	s0,a0,ffffffffc0203d9c <mm_destroy+0x12>
ffffffffc0203db0:	8522                	mv	a0,s0
ffffffffc0203db2:	6402                	ld	s0,0(sp)
ffffffffc0203db4:	60a2                	ld	ra,8(sp)
ffffffffc0203db6:	0141                	addi	sp,sp,16
ffffffffc0203db8:	cdffd06f          	j	ffffffffc0201a96 <kfree>
ffffffffc0203dbc:	00004697          	auipc	a3,0x4
ffffffffc0203dc0:	eac68693          	addi	a3,a3,-340 # ffffffffc0207c68 <etext+0x195e>
ffffffffc0203dc4:	00003617          	auipc	a2,0x3
ffffffffc0203dc8:	bc460613          	addi	a2,a2,-1084 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203dcc:	09400593          	li	a1,148
ffffffffc0203dd0:	00004517          	auipc	a0,0x4
ffffffffc0203dd4:	e2850513          	addi	a0,a0,-472 # ffffffffc0207bf8 <etext+0x18ee>
ffffffffc0203dd8:	ea0fc0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc0203ddc <mm_map>:
ffffffffc0203ddc:	6785                	lui	a5,0x1
ffffffffc0203dde:	17fd                	addi	a5,a5,-1 # fff <_binary_obj___user_faultread_out_size-0xef1>
ffffffffc0203de0:	7139                	addi	sp,sp,-64
ffffffffc0203de2:	787d                	lui	a6,0xfffff
ffffffffc0203de4:	963e                	add	a2,a2,a5
ffffffffc0203de6:	f822                	sd	s0,48(sp)
ffffffffc0203de8:	f426                	sd	s1,40(sp)
ffffffffc0203dea:	962e                	add	a2,a2,a1
ffffffffc0203dec:	fc06                	sd	ra,56(sp)
ffffffffc0203dee:	0105f4b3          	and	s1,a1,a6
ffffffffc0203df2:	002007b7          	lui	a5,0x200
ffffffffc0203df6:	01067433          	and	s0,a2,a6
ffffffffc0203dfa:	08f4e363          	bltu	s1,a5,ffffffffc0203e80 <mm_map+0xa4>
ffffffffc0203dfe:	0884f163          	bgeu	s1,s0,ffffffffc0203e80 <mm_map+0xa4>
ffffffffc0203e02:	4785                	li	a5,1
ffffffffc0203e04:	07fe                	slli	a5,a5,0x1f
ffffffffc0203e06:	0687ed63          	bltu	a5,s0,ffffffffc0203e80 <mm_map+0xa4>
ffffffffc0203e0a:	ec4e                	sd	s3,24(sp)
ffffffffc0203e0c:	89aa                	mv	s3,a0
ffffffffc0203e0e:	c93d                	beqz	a0,ffffffffc0203e84 <mm_map+0xa8>
ffffffffc0203e10:	85a6                	mv	a1,s1
ffffffffc0203e12:	e852                	sd	s4,16(sp)
ffffffffc0203e14:	e456                	sd	s5,8(sp)
ffffffffc0203e16:	8a3a                	mv	s4,a4
ffffffffc0203e18:	8ab6                	mv	s5,a3
ffffffffc0203e1a:	e61ff0ef          	jal	ffffffffc0203c7a <find_vma>
ffffffffc0203e1e:	c501                	beqz	a0,ffffffffc0203e26 <mm_map+0x4a>
ffffffffc0203e20:	651c                	ld	a5,8(a0)
ffffffffc0203e22:	0487ec63          	bltu	a5,s0,ffffffffc0203e7a <mm_map+0x9e>
ffffffffc0203e26:	03000513          	li	a0,48
ffffffffc0203e2a:	f04a                	sd	s2,32(sp)
ffffffffc0203e2c:	bc1fd0ef          	jal	ffffffffc02019ec <kmalloc>
ffffffffc0203e30:	892a                	mv	s2,a0
ffffffffc0203e32:	5571                	li	a0,-4
ffffffffc0203e34:	02090a63          	beqz	s2,ffffffffc0203e68 <mm_map+0x8c>
ffffffffc0203e38:	00993423          	sd	s1,8(s2)
ffffffffc0203e3c:	00893823          	sd	s0,16(s2)
ffffffffc0203e40:	01592c23          	sw	s5,24(s2)
ffffffffc0203e44:	85ca                	mv	a1,s2
ffffffffc0203e46:	854e                	mv	a0,s3
ffffffffc0203e48:	e73ff0ef          	jal	ffffffffc0203cba <insert_vma_struct>
ffffffffc0203e4c:	000a0463          	beqz	s4,ffffffffc0203e54 <mm_map+0x78>
ffffffffc0203e50:	012a3023          	sd	s2,0(s4)
ffffffffc0203e54:	7902                	ld	s2,32(sp)
ffffffffc0203e56:	69e2                	ld	s3,24(sp)
ffffffffc0203e58:	6a42                	ld	s4,16(sp)
ffffffffc0203e5a:	6aa2                	ld	s5,8(sp)
ffffffffc0203e5c:	4501                	li	a0,0
ffffffffc0203e5e:	70e2                	ld	ra,56(sp)
ffffffffc0203e60:	7442                	ld	s0,48(sp)
ffffffffc0203e62:	74a2                	ld	s1,40(sp)
ffffffffc0203e64:	6121                	addi	sp,sp,64
ffffffffc0203e66:	8082                	ret
ffffffffc0203e68:	70e2                	ld	ra,56(sp)
ffffffffc0203e6a:	7442                	ld	s0,48(sp)
ffffffffc0203e6c:	7902                	ld	s2,32(sp)
ffffffffc0203e6e:	69e2                	ld	s3,24(sp)
ffffffffc0203e70:	6a42                	ld	s4,16(sp)
ffffffffc0203e72:	6aa2                	ld	s5,8(sp)
ffffffffc0203e74:	74a2                	ld	s1,40(sp)
ffffffffc0203e76:	6121                	addi	sp,sp,64
ffffffffc0203e78:	8082                	ret
ffffffffc0203e7a:	69e2                	ld	s3,24(sp)
ffffffffc0203e7c:	6a42                	ld	s4,16(sp)
ffffffffc0203e7e:	6aa2                	ld	s5,8(sp)
ffffffffc0203e80:	5575                	li	a0,-3
ffffffffc0203e82:	bff1                	j	ffffffffc0203e5e <mm_map+0x82>
ffffffffc0203e84:	00004697          	auipc	a3,0x4
ffffffffc0203e88:	85c68693          	addi	a3,a3,-1956 # ffffffffc02076e0 <etext+0x13d6>
ffffffffc0203e8c:	00003617          	auipc	a2,0x3
ffffffffc0203e90:	afc60613          	addi	a2,a2,-1284 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203e94:	0a700593          	li	a1,167
ffffffffc0203e98:	00004517          	auipc	a0,0x4
ffffffffc0203e9c:	d6050513          	addi	a0,a0,-672 # ffffffffc0207bf8 <etext+0x18ee>
ffffffffc0203ea0:	f04a                	sd	s2,32(sp)
ffffffffc0203ea2:	e852                	sd	s4,16(sp)
ffffffffc0203ea4:	e456                	sd	s5,8(sp)
ffffffffc0203ea6:	dd2fc0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc0203eaa <dup_mmap>:
ffffffffc0203eaa:	7139                	addi	sp,sp,-64
ffffffffc0203eac:	fc06                	sd	ra,56(sp)
ffffffffc0203eae:	f822                	sd	s0,48(sp)
ffffffffc0203eb0:	f426                	sd	s1,40(sp)
ffffffffc0203eb2:	f04a                	sd	s2,32(sp)
ffffffffc0203eb4:	ec4e                	sd	s3,24(sp)
ffffffffc0203eb6:	e852                	sd	s4,16(sp)
ffffffffc0203eb8:	e456                	sd	s5,8(sp)
ffffffffc0203eba:	c525                	beqz	a0,ffffffffc0203f22 <dup_mmap+0x78>
ffffffffc0203ebc:	892a                	mv	s2,a0
ffffffffc0203ebe:	84ae                	mv	s1,a1
ffffffffc0203ec0:	842e                	mv	s0,a1
ffffffffc0203ec2:	c1a5                	beqz	a1,ffffffffc0203f22 <dup_mmap+0x78>
ffffffffc0203ec4:	6000                	ld	s0,0(s0)
ffffffffc0203ec6:	04848c63          	beq	s1,s0,ffffffffc0203f1e <dup_mmap+0x74>
ffffffffc0203eca:	03000513          	li	a0,48
ffffffffc0203ece:	fe843a83          	ld	s5,-24(s0)
ffffffffc0203ed2:	ff043a03          	ld	s4,-16(s0)
ffffffffc0203ed6:	ff842983          	lw	s3,-8(s0)
ffffffffc0203eda:	b13fd0ef          	jal	ffffffffc02019ec <kmalloc>
ffffffffc0203ede:	85aa                	mv	a1,a0
ffffffffc0203ee0:	c50d                	beqz	a0,ffffffffc0203f0a <dup_mmap+0x60>
ffffffffc0203ee2:	01553423          	sd	s5,8(a0)
ffffffffc0203ee6:	01453823          	sd	s4,16(a0)
ffffffffc0203eea:	01352c23          	sw	s3,24(a0)
ffffffffc0203eee:	854a                	mv	a0,s2
ffffffffc0203ef0:	dcbff0ef          	jal	ffffffffc0203cba <insert_vma_struct>
ffffffffc0203ef4:	ff043683          	ld	a3,-16(s0)
ffffffffc0203ef8:	fe843603          	ld	a2,-24(s0)
ffffffffc0203efc:	6c8c                	ld	a1,24(s1)
ffffffffc0203efe:	01893503          	ld	a0,24(s2)
ffffffffc0203f02:	4701                	li	a4,0
ffffffffc0203f04:	d9ffe0ef          	jal	ffffffffc0202ca2 <copy_range>
ffffffffc0203f08:	dd55                	beqz	a0,ffffffffc0203ec4 <dup_mmap+0x1a>
ffffffffc0203f0a:	5571                	li	a0,-4
ffffffffc0203f0c:	70e2                	ld	ra,56(sp)
ffffffffc0203f0e:	7442                	ld	s0,48(sp)
ffffffffc0203f10:	74a2                	ld	s1,40(sp)
ffffffffc0203f12:	7902                	ld	s2,32(sp)
ffffffffc0203f14:	69e2                	ld	s3,24(sp)
ffffffffc0203f16:	6a42                	ld	s4,16(sp)
ffffffffc0203f18:	6aa2                	ld	s5,8(sp)
ffffffffc0203f1a:	6121                	addi	sp,sp,64
ffffffffc0203f1c:	8082                	ret
ffffffffc0203f1e:	4501                	li	a0,0
ffffffffc0203f20:	b7f5                	j	ffffffffc0203f0c <dup_mmap+0x62>
ffffffffc0203f22:	00004697          	auipc	a3,0x4
ffffffffc0203f26:	d5e68693          	addi	a3,a3,-674 # ffffffffc0207c80 <etext+0x1976>
ffffffffc0203f2a:	00003617          	auipc	a2,0x3
ffffffffc0203f2e:	a5e60613          	addi	a2,a2,-1442 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203f32:	0c000593          	li	a1,192
ffffffffc0203f36:	00004517          	auipc	a0,0x4
ffffffffc0203f3a:	cc250513          	addi	a0,a0,-830 # ffffffffc0207bf8 <etext+0x18ee>
ffffffffc0203f3e:	d3afc0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc0203f42 <exit_mmap>:
ffffffffc0203f42:	1101                	addi	sp,sp,-32
ffffffffc0203f44:	ec06                	sd	ra,24(sp)
ffffffffc0203f46:	e822                	sd	s0,16(sp)
ffffffffc0203f48:	e426                	sd	s1,8(sp)
ffffffffc0203f4a:	e04a                	sd	s2,0(sp)
ffffffffc0203f4c:	c531                	beqz	a0,ffffffffc0203f98 <exit_mmap+0x56>
ffffffffc0203f4e:	591c                	lw	a5,48(a0)
ffffffffc0203f50:	84aa                	mv	s1,a0
ffffffffc0203f52:	e3b9                	bnez	a5,ffffffffc0203f98 <exit_mmap+0x56>
ffffffffc0203f54:	6500                	ld	s0,8(a0)
ffffffffc0203f56:	01853903          	ld	s2,24(a0)
ffffffffc0203f5a:	02850663          	beq	a0,s0,ffffffffc0203f86 <exit_mmap+0x44>
ffffffffc0203f5e:	ff043603          	ld	a2,-16(s0)
ffffffffc0203f62:	fe843583          	ld	a1,-24(s0)
ffffffffc0203f66:	854a                	mv	a0,s2
ffffffffc0203f68:	f93fd0ef          	jal	ffffffffc0201efa <unmap_range>
ffffffffc0203f6c:	6400                	ld	s0,8(s0)
ffffffffc0203f6e:	fe8498e3          	bne	s1,s0,ffffffffc0203f5e <exit_mmap+0x1c>
ffffffffc0203f72:	6400                	ld	s0,8(s0)
ffffffffc0203f74:	00848c63          	beq	s1,s0,ffffffffc0203f8c <exit_mmap+0x4a>
ffffffffc0203f78:	ff043603          	ld	a2,-16(s0)
ffffffffc0203f7c:	fe843583          	ld	a1,-24(s0)
ffffffffc0203f80:	854a                	mv	a0,s2
ffffffffc0203f82:	8a2fe0ef          	jal	ffffffffc0202024 <exit_range>
ffffffffc0203f86:	6400                	ld	s0,8(s0)
ffffffffc0203f88:	fe8498e3          	bne	s1,s0,ffffffffc0203f78 <exit_mmap+0x36>
ffffffffc0203f8c:	60e2                	ld	ra,24(sp)
ffffffffc0203f8e:	6442                	ld	s0,16(sp)
ffffffffc0203f90:	64a2                	ld	s1,8(sp)
ffffffffc0203f92:	6902                	ld	s2,0(sp)
ffffffffc0203f94:	6105                	addi	sp,sp,32
ffffffffc0203f96:	8082                	ret
ffffffffc0203f98:	00004697          	auipc	a3,0x4
ffffffffc0203f9c:	d0868693          	addi	a3,a3,-760 # ffffffffc0207ca0 <etext+0x1996>
ffffffffc0203fa0:	00003617          	auipc	a2,0x3
ffffffffc0203fa4:	9e860613          	addi	a2,a2,-1560 # ffffffffc0206988 <etext+0x67e>
ffffffffc0203fa8:	0d600593          	li	a1,214
ffffffffc0203fac:	00004517          	auipc	a0,0x4
ffffffffc0203fb0:	c4c50513          	addi	a0,a0,-948 # ffffffffc0207bf8 <etext+0x18ee>
ffffffffc0203fb4:	cc4fc0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc0203fb8 <vmm_init>:
ffffffffc0203fb8:	7139                	addi	sp,sp,-64
ffffffffc0203fba:	f822                	sd	s0,48(sp)
ffffffffc0203fbc:	f426                	sd	s1,40(sp)
ffffffffc0203fbe:	fc06                	sd	ra,56(sp)
ffffffffc0203fc0:	f04a                	sd	s2,32(sp)
ffffffffc0203fc2:	ec4e                	sd	s3,24(sp)
ffffffffc0203fc4:	e852                	sd	s4,16(sp)
ffffffffc0203fc6:	e456                	sd	s5,8(sp)
ffffffffc0203fc8:	c3dff0ef          	jal	ffffffffc0203c04 <mm_create>
ffffffffc0203fcc:	842a                	mv	s0,a0
ffffffffc0203fce:	03200493          	li	s1,50
ffffffffc0203fd2:	32050863          	beqz	a0,ffffffffc0204302 <vmm_init+0x34a>
ffffffffc0203fd6:	03000513          	li	a0,48
ffffffffc0203fda:	a13fd0ef          	jal	ffffffffc02019ec <kmalloc>
ffffffffc0203fde:	85aa                	mv	a1,a0
ffffffffc0203fe0:	22050163          	beqz	a0,ffffffffc0204202 <vmm_init+0x24a>
ffffffffc0203fe4:	00248793          	addi	a5,s1,2
ffffffffc0203fe8:	e504                	sd	s1,8(a0)
ffffffffc0203fea:	e91c                	sd	a5,16(a0)
ffffffffc0203fec:	00052c23          	sw	zero,24(a0)
ffffffffc0203ff0:	14ed                	addi	s1,s1,-5
ffffffffc0203ff2:	8522                	mv	a0,s0
ffffffffc0203ff4:	cc7ff0ef          	jal	ffffffffc0203cba <insert_vma_struct>
ffffffffc0203ff8:	fcf9                	bnez	s1,ffffffffc0203fd6 <vmm_init+0x1e>
ffffffffc0203ffa:	03700493          	li	s1,55
ffffffffc0203ffe:	1f900913          	li	s2,505
ffffffffc0204002:	03000513          	li	a0,48
ffffffffc0204006:	9e7fd0ef          	jal	ffffffffc02019ec <kmalloc>
ffffffffc020400a:	85aa                	mv	a1,a0
ffffffffc020400c:	20050b63          	beqz	a0,ffffffffc0204222 <vmm_init+0x26a>
ffffffffc0204010:	00248793          	addi	a5,s1,2
ffffffffc0204014:	e504                	sd	s1,8(a0)
ffffffffc0204016:	e91c                	sd	a5,16(a0)
ffffffffc0204018:	00052c23          	sw	zero,24(a0)
ffffffffc020401c:	0495                	addi	s1,s1,5
ffffffffc020401e:	8522                	mv	a0,s0
ffffffffc0204020:	c9bff0ef          	jal	ffffffffc0203cba <insert_vma_struct>
ffffffffc0204024:	fd249fe3          	bne	s1,s2,ffffffffc0204002 <vmm_init+0x4a>
ffffffffc0204028:	641c                	ld	a5,8(s0)
ffffffffc020402a:	2a878c63          	beq	a5,s0,ffffffffc02042e2 <vmm_init+0x32a>
ffffffffc020402e:	4715                	li	a4,5
ffffffffc0204030:	1f400593          	li	a1,500
ffffffffc0204034:	a021                	j	ffffffffc020403c <vmm_init+0x84>
ffffffffc0204036:	0715                	addi	a4,a4,5
ffffffffc0204038:	2a878563          	beq	a5,s0,ffffffffc02042e2 <vmm_init+0x32a>
ffffffffc020403c:	fe87b683          	ld	a3,-24(a5) # 1fffe8 <_binary_obj___user_matrix_out_size+0x1fd388>
ffffffffc0204040:	26e69163          	bne	a3,a4,ffffffffc02042a2 <vmm_init+0x2ea>
ffffffffc0204044:	ff07b603          	ld	a2,-16(a5)
ffffffffc0204048:	00270693          	addi	a3,a4,2
ffffffffc020404c:	24d61b63          	bne	a2,a3,ffffffffc02042a2 <vmm_init+0x2ea>
ffffffffc0204050:	679c                	ld	a5,8(a5)
ffffffffc0204052:	feb712e3          	bne	a4,a1,ffffffffc0204036 <vmm_init+0x7e>
ffffffffc0204056:	4a1d                	li	s4,7
ffffffffc0204058:	4495                	li	s1,5
ffffffffc020405a:	1f900a93          	li	s5,505
ffffffffc020405e:	85a6                	mv	a1,s1
ffffffffc0204060:	8522                	mv	a0,s0
ffffffffc0204062:	c19ff0ef          	jal	ffffffffc0203c7a <find_vma>
ffffffffc0204066:	89aa                	mv	s3,a0
ffffffffc0204068:	24050d63          	beqz	a0,ffffffffc02042c2 <vmm_init+0x30a>
ffffffffc020406c:	00148593          	addi	a1,s1,1
ffffffffc0204070:	8522                	mv	a0,s0
ffffffffc0204072:	c09ff0ef          	jal	ffffffffc0203c7a <find_vma>
ffffffffc0204076:	892a                	mv	s2,a0
ffffffffc0204078:	30050563          	beqz	a0,ffffffffc0204382 <vmm_init+0x3ca>
ffffffffc020407c:	85d2                	mv	a1,s4
ffffffffc020407e:	8522                	mv	a0,s0
ffffffffc0204080:	bfbff0ef          	jal	ffffffffc0203c7a <find_vma>
ffffffffc0204084:	2c051f63          	bnez	a0,ffffffffc0204362 <vmm_init+0x3aa>
ffffffffc0204088:	00348593          	addi	a1,s1,3
ffffffffc020408c:	8522                	mv	a0,s0
ffffffffc020408e:	bedff0ef          	jal	ffffffffc0203c7a <find_vma>
ffffffffc0204092:	2a051863          	bnez	a0,ffffffffc0204342 <vmm_init+0x38a>
ffffffffc0204096:	00448593          	addi	a1,s1,4
ffffffffc020409a:	8522                	mv	a0,s0
ffffffffc020409c:	bdfff0ef          	jal	ffffffffc0203c7a <find_vma>
ffffffffc02040a0:	28051163          	bnez	a0,ffffffffc0204322 <vmm_init+0x36a>
ffffffffc02040a4:	0089b783          	ld	a5,8(s3)
ffffffffc02040a8:	1c979d63          	bne	a5,s1,ffffffffc0204282 <vmm_init+0x2ca>
ffffffffc02040ac:	0109b783          	ld	a5,16(s3)
ffffffffc02040b0:	1d479963          	bne	a5,s4,ffffffffc0204282 <vmm_init+0x2ca>
ffffffffc02040b4:	00893783          	ld	a5,8(s2)
ffffffffc02040b8:	1a979563          	bne	a5,s1,ffffffffc0204262 <vmm_init+0x2aa>
ffffffffc02040bc:	01093783          	ld	a5,16(s2)
ffffffffc02040c0:	1b479163          	bne	a5,s4,ffffffffc0204262 <vmm_init+0x2aa>
ffffffffc02040c4:	0495                	addi	s1,s1,5
ffffffffc02040c6:	0a15                	addi	s4,s4,5
ffffffffc02040c8:	f9549be3          	bne	s1,s5,ffffffffc020405e <vmm_init+0xa6>
ffffffffc02040cc:	4491                	li	s1,4
ffffffffc02040ce:	597d                	li	s2,-1
ffffffffc02040d0:	85a6                	mv	a1,s1
ffffffffc02040d2:	8522                	mv	a0,s0
ffffffffc02040d4:	ba7ff0ef          	jal	ffffffffc0203c7a <find_vma>
ffffffffc02040d8:	30051563          	bnez	a0,ffffffffc02043e2 <vmm_init+0x42a>
ffffffffc02040dc:	14fd                	addi	s1,s1,-1
ffffffffc02040de:	ff2499e3          	bne	s1,s2,ffffffffc02040d0 <vmm_init+0x118>
ffffffffc02040e2:	8522                	mv	a0,s0
ffffffffc02040e4:	ca7ff0ef          	jal	ffffffffc0203d8a <mm_destroy>
ffffffffc02040e8:	00004517          	auipc	a0,0x4
ffffffffc02040ec:	d1850513          	addi	a0,a0,-744 # ffffffffc0207e00 <etext+0x1af6>
ffffffffc02040f0:	894fc0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02040f4:	ba1fd0ef          	jal	ffffffffc0201c94 <nr_free_pages>
ffffffffc02040f8:	892a                	mv	s2,a0
ffffffffc02040fa:	b0bff0ef          	jal	ffffffffc0203c04 <mm_create>
ffffffffc02040fe:	00039797          	auipc	a5,0x39
ffffffffc0204102:	56a7b523          	sd	a0,1386(a5) # ffffffffc023d668 <check_mm_struct>
ffffffffc0204106:	842a                	mv	s0,a0
ffffffffc0204108:	2a050d63          	beqz	a0,ffffffffc02043c2 <vmm_init+0x40a>
ffffffffc020410c:	00039997          	auipc	s3,0x39
ffffffffc0204110:	51c9b983          	ld	s3,1308(s3) # ffffffffc023d628 <boot_pgdir>
ffffffffc0204114:	0009b783          	ld	a5,0(s3)
ffffffffc0204118:	01353c23          	sd	s3,24(a0)
ffffffffc020411c:	2e079d63          	bnez	a5,ffffffffc0204416 <vmm_init+0x45e>
ffffffffc0204120:	03000513          	li	a0,48
ffffffffc0204124:	8c9fd0ef          	jal	ffffffffc02019ec <kmalloc>
ffffffffc0204128:	84aa                	mv	s1,a0
ffffffffc020412a:	10050c63          	beqz	a0,ffffffffc0204242 <vmm_init+0x28a>
ffffffffc020412e:	002007b7          	lui	a5,0x200
ffffffffc0204132:	e91c                	sd	a5,16(a0)
ffffffffc0204134:	4789                	li	a5,2
ffffffffc0204136:	cd1c                	sw	a5,24(a0)
ffffffffc0204138:	85aa                	mv	a1,a0
ffffffffc020413a:	00053423          	sd	zero,8(a0)
ffffffffc020413e:	8522                	mv	a0,s0
ffffffffc0204140:	b7bff0ef          	jal	ffffffffc0203cba <insert_vma_struct>
ffffffffc0204144:	10000593          	li	a1,256
ffffffffc0204148:	8522                	mv	a0,s0
ffffffffc020414a:	b31ff0ef          	jal	ffffffffc0203c7a <find_vma>
ffffffffc020414e:	10000793          	li	a5,256
ffffffffc0204152:	16400713          	li	a4,356
ffffffffc0204156:	24a49663          	bne	s1,a0,ffffffffc02043a2 <vmm_init+0x3ea>
ffffffffc020415a:	00f78023          	sb	a5,0(a5) # 200000 <_binary_obj___user_matrix_out_size+0x1fd3a0>
ffffffffc020415e:	0785                	addi	a5,a5,1
ffffffffc0204160:	fee79de3          	bne	a5,a4,ffffffffc020415a <vmm_init+0x1a2>
ffffffffc0204164:	6705                	lui	a4,0x1
ffffffffc0204166:	10000793          	li	a5,256
ffffffffc020416a:	35670713          	addi	a4,a4,854 # 1356 <_binary_obj___user_faultread_out_size-0xb9a>
ffffffffc020416e:	16400613          	li	a2,356
ffffffffc0204172:	0007c683          	lbu	a3,0(a5)
ffffffffc0204176:	0785                	addi	a5,a5,1
ffffffffc0204178:	9f15                	subw	a4,a4,a3
ffffffffc020417a:	fec79ce3          	bne	a5,a2,ffffffffc0204172 <vmm_init+0x1ba>
ffffffffc020417e:	2e071863          	bnez	a4,ffffffffc020446e <vmm_init+0x4b6>
ffffffffc0204182:	4581                	li	a1,0
ffffffffc0204184:	854e                	mv	a0,s3
ffffffffc0204186:	fd7fd0ef          	jal	ffffffffc020215c <page_remove>
ffffffffc020418a:	0009b783          	ld	a5,0(s3)
ffffffffc020418e:	00039717          	auipc	a4,0x39
ffffffffc0204192:	4aa73703          	ld	a4,1194(a4) # ffffffffc023d638 <npage>
ffffffffc0204196:	078a                	slli	a5,a5,0x2
ffffffffc0204198:	83b1                	srli	a5,a5,0xc
ffffffffc020419a:	2ae7fe63          	bgeu	a5,a4,ffffffffc0204456 <vmm_init+0x49e>
ffffffffc020419e:	00005717          	auipc	a4,0x5
ffffffffc02041a2:	f9273703          	ld	a4,-110(a4) # ffffffffc0209130 <nbase>
ffffffffc02041a6:	8f99                	sub	a5,a5,a4
ffffffffc02041a8:	079a                	slli	a5,a5,0x6
ffffffffc02041aa:	00039517          	auipc	a0,0x39
ffffffffc02041ae:	49653503          	ld	a0,1174(a0) # ffffffffc023d640 <pages>
ffffffffc02041b2:	953e                	add	a0,a0,a5
ffffffffc02041b4:	4585                	li	a1,1
ffffffffc02041b6:	a9ffd0ef          	jal	ffffffffc0201c54 <free_pages>
ffffffffc02041ba:	0009b023          	sd	zero,0(s3)
ffffffffc02041be:	8522                	mv	a0,s0
ffffffffc02041c0:	00043c23          	sd	zero,24(s0)
ffffffffc02041c4:	bc7ff0ef          	jal	ffffffffc0203d8a <mm_destroy>
ffffffffc02041c8:	197d                	addi	s2,s2,-1
ffffffffc02041ca:	00039797          	auipc	a5,0x39
ffffffffc02041ce:	4807bf23          	sd	zero,1182(a5) # ffffffffc023d668 <check_mm_struct>
ffffffffc02041d2:	ac3fd0ef          	jal	ffffffffc0201c94 <nr_free_pages>
ffffffffc02041d6:	26a91063          	bne	s2,a0,ffffffffc0204436 <vmm_init+0x47e>
ffffffffc02041da:	00004517          	auipc	a0,0x4
ffffffffc02041de:	cb650513          	addi	a0,a0,-842 # ffffffffc0207e90 <etext+0x1b86>
ffffffffc02041e2:	fa3fb0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02041e6:	7442                	ld	s0,48(sp)
ffffffffc02041e8:	70e2                	ld	ra,56(sp)
ffffffffc02041ea:	74a2                	ld	s1,40(sp)
ffffffffc02041ec:	7902                	ld	s2,32(sp)
ffffffffc02041ee:	69e2                	ld	s3,24(sp)
ffffffffc02041f0:	6a42                	ld	s4,16(sp)
ffffffffc02041f2:	6aa2                	ld	s5,8(sp)
ffffffffc02041f4:	00004517          	auipc	a0,0x4
ffffffffc02041f8:	cbc50513          	addi	a0,a0,-836 # ffffffffc0207eb0 <etext+0x1ba6>
ffffffffc02041fc:	6121                	addi	sp,sp,64
ffffffffc02041fe:	f87fb06f          	j	ffffffffc0200184 <cprintf>
ffffffffc0204202:	00003697          	auipc	a3,0x3
ffffffffc0204206:	51668693          	addi	a3,a3,1302 # ffffffffc0207718 <etext+0x140e>
ffffffffc020420a:	00002617          	auipc	a2,0x2
ffffffffc020420e:	77e60613          	addi	a2,a2,1918 # ffffffffc0206988 <etext+0x67e>
ffffffffc0204212:	11300593          	li	a1,275
ffffffffc0204216:	00004517          	auipc	a0,0x4
ffffffffc020421a:	9e250513          	addi	a0,a0,-1566 # ffffffffc0207bf8 <etext+0x18ee>
ffffffffc020421e:	a5afc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0204222:	00003697          	auipc	a3,0x3
ffffffffc0204226:	4f668693          	addi	a3,a3,1270 # ffffffffc0207718 <etext+0x140e>
ffffffffc020422a:	00002617          	auipc	a2,0x2
ffffffffc020422e:	75e60613          	addi	a2,a2,1886 # ffffffffc0206988 <etext+0x67e>
ffffffffc0204232:	11900593          	li	a1,281
ffffffffc0204236:	00004517          	auipc	a0,0x4
ffffffffc020423a:	9c250513          	addi	a0,a0,-1598 # ffffffffc0207bf8 <etext+0x18ee>
ffffffffc020423e:	a3afc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0204242:	00003697          	auipc	a3,0x3
ffffffffc0204246:	4d668693          	addi	a3,a3,1238 # ffffffffc0207718 <etext+0x140e>
ffffffffc020424a:	00002617          	auipc	a2,0x2
ffffffffc020424e:	73e60613          	addi	a2,a2,1854 # ffffffffc0206988 <etext+0x67e>
ffffffffc0204252:	15200593          	li	a1,338
ffffffffc0204256:	00004517          	auipc	a0,0x4
ffffffffc020425a:	9a250513          	addi	a0,a0,-1630 # ffffffffc0207bf8 <etext+0x18ee>
ffffffffc020425e:	a1afc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0204262:	00004697          	auipc	a3,0x4
ffffffffc0204266:	b2e68693          	addi	a3,a3,-1234 # ffffffffc0207d90 <etext+0x1a86>
ffffffffc020426a:	00002617          	auipc	a2,0x2
ffffffffc020426e:	71e60613          	addi	a2,a2,1822 # ffffffffc0206988 <etext+0x67e>
ffffffffc0204272:	13300593          	li	a1,307
ffffffffc0204276:	00004517          	auipc	a0,0x4
ffffffffc020427a:	98250513          	addi	a0,a0,-1662 # ffffffffc0207bf8 <etext+0x18ee>
ffffffffc020427e:	9fafc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0204282:	00004697          	auipc	a3,0x4
ffffffffc0204286:	ade68693          	addi	a3,a3,-1314 # ffffffffc0207d60 <etext+0x1a56>
ffffffffc020428a:	00002617          	auipc	a2,0x2
ffffffffc020428e:	6fe60613          	addi	a2,a2,1790 # ffffffffc0206988 <etext+0x67e>
ffffffffc0204292:	13200593          	li	a1,306
ffffffffc0204296:	00004517          	auipc	a0,0x4
ffffffffc020429a:	96250513          	addi	a0,a0,-1694 # ffffffffc0207bf8 <etext+0x18ee>
ffffffffc020429e:	9dafc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02042a2:	00004697          	auipc	a3,0x4
ffffffffc02042a6:	a3668693          	addi	a3,a3,-1482 # ffffffffc0207cd8 <etext+0x19ce>
ffffffffc02042aa:	00002617          	auipc	a2,0x2
ffffffffc02042ae:	6de60613          	addi	a2,a2,1758 # ffffffffc0206988 <etext+0x67e>
ffffffffc02042b2:	12200593          	li	a1,290
ffffffffc02042b6:	00004517          	auipc	a0,0x4
ffffffffc02042ba:	94250513          	addi	a0,a0,-1726 # ffffffffc0207bf8 <etext+0x18ee>
ffffffffc02042be:	9bafc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02042c2:	00004697          	auipc	a3,0x4
ffffffffc02042c6:	a4e68693          	addi	a3,a3,-1458 # ffffffffc0207d10 <etext+0x1a06>
ffffffffc02042ca:	00002617          	auipc	a2,0x2
ffffffffc02042ce:	6be60613          	addi	a2,a2,1726 # ffffffffc0206988 <etext+0x67e>
ffffffffc02042d2:	12800593          	li	a1,296
ffffffffc02042d6:	00004517          	auipc	a0,0x4
ffffffffc02042da:	92250513          	addi	a0,a0,-1758 # ffffffffc0207bf8 <etext+0x18ee>
ffffffffc02042de:	99afc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02042e2:	00004697          	auipc	a3,0x4
ffffffffc02042e6:	9de68693          	addi	a3,a3,-1570 # ffffffffc0207cc0 <etext+0x19b6>
ffffffffc02042ea:	00002617          	auipc	a2,0x2
ffffffffc02042ee:	69e60613          	addi	a2,a2,1694 # ffffffffc0206988 <etext+0x67e>
ffffffffc02042f2:	12000593          	li	a1,288
ffffffffc02042f6:	00004517          	auipc	a0,0x4
ffffffffc02042fa:	90250513          	addi	a0,a0,-1790 # ffffffffc0207bf8 <etext+0x18ee>
ffffffffc02042fe:	97afc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0204302:	00003697          	auipc	a3,0x3
ffffffffc0204306:	3de68693          	addi	a3,a3,990 # ffffffffc02076e0 <etext+0x13d6>
ffffffffc020430a:	00002617          	auipc	a2,0x2
ffffffffc020430e:	67e60613          	addi	a2,a2,1662 # ffffffffc0206988 <etext+0x67e>
ffffffffc0204312:	10c00593          	li	a1,268
ffffffffc0204316:	00004517          	auipc	a0,0x4
ffffffffc020431a:	8e250513          	addi	a0,a0,-1822 # ffffffffc0207bf8 <etext+0x18ee>
ffffffffc020431e:	95afc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0204322:	00004697          	auipc	a3,0x4
ffffffffc0204326:	a2e68693          	addi	a3,a3,-1490 # ffffffffc0207d50 <etext+0x1a46>
ffffffffc020432a:	00002617          	auipc	a2,0x2
ffffffffc020432e:	65e60613          	addi	a2,a2,1630 # ffffffffc0206988 <etext+0x67e>
ffffffffc0204332:	13000593          	li	a1,304
ffffffffc0204336:	00004517          	auipc	a0,0x4
ffffffffc020433a:	8c250513          	addi	a0,a0,-1854 # ffffffffc0207bf8 <etext+0x18ee>
ffffffffc020433e:	93afc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0204342:	00004697          	auipc	a3,0x4
ffffffffc0204346:	9fe68693          	addi	a3,a3,-1538 # ffffffffc0207d40 <etext+0x1a36>
ffffffffc020434a:	00002617          	auipc	a2,0x2
ffffffffc020434e:	63e60613          	addi	a2,a2,1598 # ffffffffc0206988 <etext+0x67e>
ffffffffc0204352:	12e00593          	li	a1,302
ffffffffc0204356:	00004517          	auipc	a0,0x4
ffffffffc020435a:	8a250513          	addi	a0,a0,-1886 # ffffffffc0207bf8 <etext+0x18ee>
ffffffffc020435e:	91afc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0204362:	00004697          	auipc	a3,0x4
ffffffffc0204366:	9ce68693          	addi	a3,a3,-1586 # ffffffffc0207d30 <etext+0x1a26>
ffffffffc020436a:	00002617          	auipc	a2,0x2
ffffffffc020436e:	61e60613          	addi	a2,a2,1566 # ffffffffc0206988 <etext+0x67e>
ffffffffc0204372:	12c00593          	li	a1,300
ffffffffc0204376:	00004517          	auipc	a0,0x4
ffffffffc020437a:	88250513          	addi	a0,a0,-1918 # ffffffffc0207bf8 <etext+0x18ee>
ffffffffc020437e:	8fafc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0204382:	00004697          	auipc	a3,0x4
ffffffffc0204386:	99e68693          	addi	a3,a3,-1634 # ffffffffc0207d20 <etext+0x1a16>
ffffffffc020438a:	00002617          	auipc	a2,0x2
ffffffffc020438e:	5fe60613          	addi	a2,a2,1534 # ffffffffc0206988 <etext+0x67e>
ffffffffc0204392:	12a00593          	li	a1,298
ffffffffc0204396:	00004517          	auipc	a0,0x4
ffffffffc020439a:	86250513          	addi	a0,a0,-1950 # ffffffffc0207bf8 <etext+0x18ee>
ffffffffc020439e:	8dafc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02043a2:	00004697          	auipc	a3,0x4
ffffffffc02043a6:	a9668693          	addi	a3,a3,-1386 # ffffffffc0207e38 <etext+0x1b2e>
ffffffffc02043aa:	00002617          	auipc	a2,0x2
ffffffffc02043ae:	5de60613          	addi	a2,a2,1502 # ffffffffc0206988 <etext+0x67e>
ffffffffc02043b2:	15700593          	li	a1,343
ffffffffc02043b6:	00004517          	auipc	a0,0x4
ffffffffc02043ba:	84250513          	addi	a0,a0,-1982 # ffffffffc0207bf8 <etext+0x18ee>
ffffffffc02043be:	8bafc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02043c2:	00004697          	auipc	a3,0x4
ffffffffc02043c6:	a5e68693          	addi	a3,a3,-1442 # ffffffffc0207e20 <etext+0x1b16>
ffffffffc02043ca:	00002617          	auipc	a2,0x2
ffffffffc02043ce:	5be60613          	addi	a2,a2,1470 # ffffffffc0206988 <etext+0x67e>
ffffffffc02043d2:	14b00593          	li	a1,331
ffffffffc02043d6:	00004517          	auipc	a0,0x4
ffffffffc02043da:	82250513          	addi	a0,a0,-2014 # ffffffffc0207bf8 <etext+0x18ee>
ffffffffc02043de:	89afc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02043e2:	6914                	ld	a3,16(a0)
ffffffffc02043e4:	6510                	ld	a2,8(a0)
ffffffffc02043e6:	0004859b          	sext.w	a1,s1
ffffffffc02043ea:	00004517          	auipc	a0,0x4
ffffffffc02043ee:	9d650513          	addi	a0,a0,-1578 # ffffffffc0207dc0 <etext+0x1ab6>
ffffffffc02043f2:	d93fb0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02043f6:	00004697          	auipc	a3,0x4
ffffffffc02043fa:	9f268693          	addi	a3,a3,-1550 # ffffffffc0207de8 <etext+0x1ade>
ffffffffc02043fe:	00002617          	auipc	a2,0x2
ffffffffc0204402:	58a60613          	addi	a2,a2,1418 # ffffffffc0206988 <etext+0x67e>
ffffffffc0204406:	13b00593          	li	a1,315
ffffffffc020440a:	00003517          	auipc	a0,0x3
ffffffffc020440e:	7ee50513          	addi	a0,a0,2030 # ffffffffc0207bf8 <etext+0x18ee>
ffffffffc0204412:	866fc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0204416:	00003697          	auipc	a3,0x3
ffffffffc020441a:	2f268693          	addi	a3,a3,754 # ffffffffc0207708 <etext+0x13fe>
ffffffffc020441e:	00002617          	auipc	a2,0x2
ffffffffc0204422:	56a60613          	addi	a2,a2,1386 # ffffffffc0206988 <etext+0x67e>
ffffffffc0204426:	14f00593          	li	a1,335
ffffffffc020442a:	00003517          	auipc	a0,0x3
ffffffffc020442e:	7ce50513          	addi	a0,a0,1998 # ffffffffc0207bf8 <etext+0x18ee>
ffffffffc0204432:	846fc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0204436:	00004697          	auipc	a3,0x4
ffffffffc020443a:	a3268693          	addi	a3,a3,-1486 # ffffffffc0207e68 <etext+0x1b5e>
ffffffffc020443e:	00002617          	auipc	a2,0x2
ffffffffc0204442:	54a60613          	addi	a2,a2,1354 # ffffffffc0206988 <etext+0x67e>
ffffffffc0204446:	16e00593          	li	a1,366
ffffffffc020444a:	00003517          	auipc	a0,0x3
ffffffffc020444e:	7ae50513          	addi	a0,a0,1966 # ffffffffc0207bf8 <etext+0x18ee>
ffffffffc0204452:	826fc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0204456:	00003617          	auipc	a2,0x3
ffffffffc020445a:	c2a60613          	addi	a2,a2,-982 # ffffffffc0207080 <etext+0xd76>
ffffffffc020445e:	06200593          	li	a1,98
ffffffffc0204462:	00003517          	auipc	a0,0x3
ffffffffc0204466:	b7650513          	addi	a0,a0,-1162 # ffffffffc0206fd8 <etext+0xcce>
ffffffffc020446a:	80efc0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc020446e:	00004697          	auipc	a3,0x4
ffffffffc0204472:	9ea68693          	addi	a3,a3,-1558 # ffffffffc0207e58 <etext+0x1b4e>
ffffffffc0204476:	00002617          	auipc	a2,0x2
ffffffffc020447a:	51260613          	addi	a2,a2,1298 # ffffffffc0206988 <etext+0x67e>
ffffffffc020447e:	16300593          	li	a1,355
ffffffffc0204482:	00003517          	auipc	a0,0x3
ffffffffc0204486:	77650513          	addi	a0,a0,1910 # ffffffffc0207bf8 <etext+0x18ee>
ffffffffc020448a:	feffb0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc020448e <do_pgfault>:
ffffffffc020448e:	7139                	addi	sp,sp,-64
ffffffffc0204490:	85b2                	mv	a1,a2
ffffffffc0204492:	f822                	sd	s0,48(sp)
ffffffffc0204494:	f426                	sd	s1,40(sp)
ffffffffc0204496:	fc06                	sd	ra,56(sp)
ffffffffc0204498:	f04a                	sd	s2,32(sp)
ffffffffc020449a:	8432                	mv	s0,a2
ffffffffc020449c:	84aa                	mv	s1,a0
ffffffffc020449e:	fdcff0ef          	jal	ffffffffc0203c7a <find_vma>
ffffffffc02044a2:	00039797          	auipc	a5,0x39
ffffffffc02044a6:	1be7a783          	lw	a5,446(a5) # ffffffffc023d660 <pgfault_num>
ffffffffc02044aa:	2785                	addiw	a5,a5,1
ffffffffc02044ac:	00039717          	auipc	a4,0x39
ffffffffc02044b0:	1af72a23          	sw	a5,436(a4) # ffffffffc023d660 <pgfault_num>
ffffffffc02044b4:	c555                	beqz	a0,ffffffffc0204560 <do_pgfault+0xd2>
ffffffffc02044b6:	651c                	ld	a5,8(a0)
ffffffffc02044b8:	0af46463          	bltu	s0,a5,ffffffffc0204560 <do_pgfault+0xd2>
ffffffffc02044bc:	4d1c                	lw	a5,24(a0)
ffffffffc02044be:	ec4e                	sd	s3,24(sp)
ffffffffc02044c0:	49dd                	li	s3,23
ffffffffc02044c2:	8b89                	andi	a5,a5,2
ffffffffc02044c4:	cfb9                	beqz	a5,ffffffffc0204522 <do_pgfault+0x94>
ffffffffc02044c6:	77fd                	lui	a5,0xfffff
ffffffffc02044c8:	6c88                	ld	a0,24(s1)
ffffffffc02044ca:	8c7d                	and	s0,s0,a5
ffffffffc02044cc:	4605                	li	a2,1
ffffffffc02044ce:	85a2                	mv	a1,s0
ffffffffc02044d0:	ffefd0ef          	jal	ffffffffc0201cce <get_pte>
ffffffffc02044d4:	c555                	beqz	a0,ffffffffc0204580 <do_pgfault+0xf2>
ffffffffc02044d6:	610c                	ld	a1,0(a0)
ffffffffc02044d8:	c5ad                	beqz	a1,ffffffffc0204542 <do_pgfault+0xb4>
ffffffffc02044da:	00039797          	auipc	a5,0x39
ffffffffc02044de:	16e7a783          	lw	a5,366(a5) # ffffffffc023d648 <swap_init_ok>
ffffffffc02044e2:	cbc1                	beqz	a5,ffffffffc0204572 <do_pgfault+0xe4>
ffffffffc02044e4:	0030                	addi	a2,sp,8
ffffffffc02044e6:	85a2                	mv	a1,s0
ffffffffc02044e8:	8526                	mv	a0,s1
ffffffffc02044ea:	e402                	sd	zero,8(sp)
ffffffffc02044ec:	a98ff0ef          	jal	ffffffffc0203784 <swap_in>
ffffffffc02044f0:	892a                	mv	s2,a0
ffffffffc02044f2:	e915                	bnez	a0,ffffffffc0204526 <do_pgfault+0x98>
ffffffffc02044f4:	65a2                	ld	a1,8(sp)
ffffffffc02044f6:	6c88                	ld	a0,24(s1)
ffffffffc02044f8:	86ce                	mv	a3,s3
ffffffffc02044fa:	8622                	mv	a2,s0
ffffffffc02044fc:	cfdfd0ef          	jal	ffffffffc02021f8 <page_insert>
ffffffffc0204500:	6622                	ld	a2,8(sp)
ffffffffc0204502:	4685                	li	a3,1
ffffffffc0204504:	85a2                	mv	a1,s0
ffffffffc0204506:	8526                	mv	a0,s1
ffffffffc0204508:	95aff0ef          	jal	ffffffffc0203662 <swap_map_swappable>
ffffffffc020450c:	67a2                	ld	a5,8(sp)
ffffffffc020450e:	ff80                	sd	s0,56(a5)
ffffffffc0204510:	69e2                	ld	s3,24(sp)
ffffffffc0204512:	4901                	li	s2,0
ffffffffc0204514:	70e2                	ld	ra,56(sp)
ffffffffc0204516:	7442                	ld	s0,48(sp)
ffffffffc0204518:	74a2                	ld	s1,40(sp)
ffffffffc020451a:	854a                	mv	a0,s2
ffffffffc020451c:	7902                	ld	s2,32(sp)
ffffffffc020451e:	6121                	addi	sp,sp,64
ffffffffc0204520:	8082                	ret
ffffffffc0204522:	49c1                	li	s3,16
ffffffffc0204524:	b74d                	j	ffffffffc02044c6 <do_pgfault+0x38>
ffffffffc0204526:	00004517          	auipc	a0,0x4
ffffffffc020452a:	a1a50513          	addi	a0,a0,-1510 # ffffffffc0207f40 <etext+0x1c36>
ffffffffc020452e:	c57fb0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0204532:	70e2                	ld	ra,56(sp)
ffffffffc0204534:	7442                	ld	s0,48(sp)
ffffffffc0204536:	69e2                	ld	s3,24(sp)
ffffffffc0204538:	74a2                	ld	s1,40(sp)
ffffffffc020453a:	854a                	mv	a0,s2
ffffffffc020453c:	7902                	ld	s2,32(sp)
ffffffffc020453e:	6121                	addi	sp,sp,64
ffffffffc0204540:	8082                	ret
ffffffffc0204542:	6c88                	ld	a0,24(s1)
ffffffffc0204544:	864e                	mv	a2,s3
ffffffffc0204546:	85a2                	mv	a1,s0
ffffffffc0204548:	98dfe0ef          	jal	ffffffffc0202ed4 <pgdir_alloc_page>
ffffffffc020454c:	f171                	bnez	a0,ffffffffc0204510 <do_pgfault+0x82>
ffffffffc020454e:	00004517          	auipc	a0,0x4
ffffffffc0204552:	9ca50513          	addi	a0,a0,-1590 # ffffffffc0207f18 <etext+0x1c0e>
ffffffffc0204556:	c2ffb0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc020455a:	69e2                	ld	s3,24(sp)
ffffffffc020455c:	5971                	li	s2,-4
ffffffffc020455e:	bf5d                	j	ffffffffc0204514 <do_pgfault+0x86>
ffffffffc0204560:	85a2                	mv	a1,s0
ffffffffc0204562:	00004517          	auipc	a0,0x4
ffffffffc0204566:	96650513          	addi	a0,a0,-1690 # ffffffffc0207ec8 <etext+0x1bbe>
ffffffffc020456a:	c1bfb0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc020456e:	5975                	li	s2,-3
ffffffffc0204570:	b755                	j	ffffffffc0204514 <do_pgfault+0x86>
ffffffffc0204572:	00004517          	auipc	a0,0x4
ffffffffc0204576:	9ee50513          	addi	a0,a0,-1554 # ffffffffc0207f60 <etext+0x1c56>
ffffffffc020457a:	c0bfb0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc020457e:	bff1                	j	ffffffffc020455a <do_pgfault+0xcc>
ffffffffc0204580:	00004517          	auipc	a0,0x4
ffffffffc0204584:	97850513          	addi	a0,a0,-1672 # ffffffffc0207ef8 <etext+0x1bee>
ffffffffc0204588:	bfdfb0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc020458c:	b7f9                	j	ffffffffc020455a <do_pgfault+0xcc>

ffffffffc020458e <user_mem_check>:
ffffffffc020458e:	7179                	addi	sp,sp,-48
ffffffffc0204590:	f022                	sd	s0,32(sp)
ffffffffc0204592:	f406                	sd	ra,40(sp)
ffffffffc0204594:	842e                	mv	s0,a1
ffffffffc0204596:	c535                	beqz	a0,ffffffffc0204602 <user_mem_check+0x74>
ffffffffc0204598:	002007b7          	lui	a5,0x200
ffffffffc020459c:	04f5ee63          	bltu	a1,a5,ffffffffc02045f8 <user_mem_check+0x6a>
ffffffffc02045a0:	ec26                	sd	s1,24(sp)
ffffffffc02045a2:	00c584b3          	add	s1,a1,a2
ffffffffc02045a6:	0695fc63          	bgeu	a1,s1,ffffffffc020461e <user_mem_check+0x90>
ffffffffc02045aa:	4785                	li	a5,1
ffffffffc02045ac:	07fe                	slli	a5,a5,0x1f
ffffffffc02045ae:	0697e863          	bltu	a5,s1,ffffffffc020461e <user_mem_check+0x90>
ffffffffc02045b2:	e84a                	sd	s2,16(sp)
ffffffffc02045b4:	e44e                	sd	s3,8(sp)
ffffffffc02045b6:	e052                	sd	s4,0(sp)
ffffffffc02045b8:	892a                	mv	s2,a0
ffffffffc02045ba:	89b6                	mv	s3,a3
ffffffffc02045bc:	6a05                	lui	s4,0x1
ffffffffc02045be:	a821                	j	ffffffffc02045d6 <user_mem_check+0x48>
ffffffffc02045c0:	0027f693          	andi	a3,a5,2
ffffffffc02045c4:	9752                	add	a4,a4,s4
ffffffffc02045c6:	8ba1                	andi	a5,a5,8
ffffffffc02045c8:	c685                	beqz	a3,ffffffffc02045f0 <user_mem_check+0x62>
ffffffffc02045ca:	c399                	beqz	a5,ffffffffc02045d0 <user_mem_check+0x42>
ffffffffc02045cc:	02e46263          	bltu	s0,a4,ffffffffc02045f0 <user_mem_check+0x62>
ffffffffc02045d0:	6900                	ld	s0,16(a0)
ffffffffc02045d2:	04947863          	bgeu	s0,s1,ffffffffc0204622 <user_mem_check+0x94>
ffffffffc02045d6:	85a2                	mv	a1,s0
ffffffffc02045d8:	854a                	mv	a0,s2
ffffffffc02045da:	ea0ff0ef          	jal	ffffffffc0203c7a <find_vma>
ffffffffc02045de:	c909                	beqz	a0,ffffffffc02045f0 <user_mem_check+0x62>
ffffffffc02045e0:	6518                	ld	a4,8(a0)
ffffffffc02045e2:	00e46763          	bltu	s0,a4,ffffffffc02045f0 <user_mem_check+0x62>
ffffffffc02045e6:	4d1c                	lw	a5,24(a0)
ffffffffc02045e8:	fc099ce3          	bnez	s3,ffffffffc02045c0 <user_mem_check+0x32>
ffffffffc02045ec:	8b85                	andi	a5,a5,1
ffffffffc02045ee:	f3ed                	bnez	a5,ffffffffc02045d0 <user_mem_check+0x42>
ffffffffc02045f0:	64e2                	ld	s1,24(sp)
ffffffffc02045f2:	6942                	ld	s2,16(sp)
ffffffffc02045f4:	69a2                	ld	s3,8(sp)
ffffffffc02045f6:	6a02                	ld	s4,0(sp)
ffffffffc02045f8:	4501                	li	a0,0
ffffffffc02045fa:	70a2                	ld	ra,40(sp)
ffffffffc02045fc:	7402                	ld	s0,32(sp)
ffffffffc02045fe:	6145                	addi	sp,sp,48
ffffffffc0204600:	8082                	ret
ffffffffc0204602:	c02007b7          	lui	a5,0xc0200
ffffffffc0204606:	4501                	li	a0,0
ffffffffc0204608:	fef5e9e3          	bltu	a1,a5,ffffffffc02045fa <user_mem_check+0x6c>
ffffffffc020460c:	962e                	add	a2,a2,a1
ffffffffc020460e:	fec5f6e3          	bgeu	a1,a2,ffffffffc02045fa <user_mem_check+0x6c>
ffffffffc0204612:	c8000537          	lui	a0,0xc8000
ffffffffc0204616:	0505                	addi	a0,a0,1 # ffffffffc8000001 <end+0x7dc2961>
ffffffffc0204618:	00a63533          	sltu	a0,a2,a0
ffffffffc020461c:	bff9                	j	ffffffffc02045fa <user_mem_check+0x6c>
ffffffffc020461e:	64e2                	ld	s1,24(sp)
ffffffffc0204620:	bfe1                	j	ffffffffc02045f8 <user_mem_check+0x6a>
ffffffffc0204622:	64e2                	ld	s1,24(sp)
ffffffffc0204624:	6942                	ld	s2,16(sp)
ffffffffc0204626:	69a2                	ld	s3,8(sp)
ffffffffc0204628:	6a02                	ld	s4,0(sp)
ffffffffc020462a:	4505                	li	a0,1
ffffffffc020462c:	b7f9                	j	ffffffffc02045fa <user_mem_check+0x6c>

ffffffffc020462e <swapfs_init>:
ffffffffc020462e:	1141                	addi	sp,sp,-16
ffffffffc0204630:	4505                	li	a0,1
ffffffffc0204632:	e406                	sd	ra,8(sp)
ffffffffc0204634:	fadfb0ef          	jal	ffffffffc02005e0 <ide_device_valid>
ffffffffc0204638:	cd01                	beqz	a0,ffffffffc0204650 <swapfs_init+0x22>
ffffffffc020463a:	4505                	li	a0,1
ffffffffc020463c:	fabfb0ef          	jal	ffffffffc02005e6 <ide_device_size>
ffffffffc0204640:	60a2                	ld	ra,8(sp)
ffffffffc0204642:	810d                	srli	a0,a0,0x3
ffffffffc0204644:	00039797          	auipc	a5,0x39
ffffffffc0204648:	00a7b623          	sd	a0,12(a5) # ffffffffc023d650 <max_swap_offset>
ffffffffc020464c:	0141                	addi	sp,sp,16
ffffffffc020464e:	8082                	ret
ffffffffc0204650:	00004617          	auipc	a2,0x4
ffffffffc0204654:	93860613          	addi	a2,a2,-1736 # ffffffffc0207f88 <etext+0x1c7e>
ffffffffc0204658:	45b5                	li	a1,13
ffffffffc020465a:	00004517          	auipc	a0,0x4
ffffffffc020465e:	94e50513          	addi	a0,a0,-1714 # ffffffffc0207fa8 <etext+0x1c9e>
ffffffffc0204662:	e17fb0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc0204666 <swapfs_read>:
ffffffffc0204666:	1141                	addi	sp,sp,-16
ffffffffc0204668:	e406                	sd	ra,8(sp)
ffffffffc020466a:	00855793          	srli	a5,a0,0x8
ffffffffc020466e:	cbb1                	beqz	a5,ffffffffc02046c2 <swapfs_read+0x5c>
ffffffffc0204670:	00039717          	auipc	a4,0x39
ffffffffc0204674:	fe073703          	ld	a4,-32(a4) # ffffffffc023d650 <max_swap_offset>
ffffffffc0204678:	04e7f563          	bgeu	a5,a4,ffffffffc02046c2 <swapfs_read+0x5c>
ffffffffc020467c:	00039717          	auipc	a4,0x39
ffffffffc0204680:	fc473703          	ld	a4,-60(a4) # ffffffffc023d640 <pages>
ffffffffc0204684:	8d99                	sub	a1,a1,a4
ffffffffc0204686:	4065d613          	srai	a2,a1,0x6
ffffffffc020468a:	00005717          	auipc	a4,0x5
ffffffffc020468e:	aa673703          	ld	a4,-1370(a4) # ffffffffc0209130 <nbase>
ffffffffc0204692:	963a                	add	a2,a2,a4
ffffffffc0204694:	00c61713          	slli	a4,a2,0xc
ffffffffc0204698:	8331                	srli	a4,a4,0xc
ffffffffc020469a:	00039697          	auipc	a3,0x39
ffffffffc020469e:	f9e6b683          	ld	a3,-98(a3) # ffffffffc023d638 <npage>
ffffffffc02046a2:	0037959b          	slliw	a1,a5,0x3
ffffffffc02046a6:	0632                	slli	a2,a2,0xc
ffffffffc02046a8:	02d77963          	bgeu	a4,a3,ffffffffc02046da <swapfs_read+0x74>
ffffffffc02046ac:	60a2                	ld	ra,8(sp)
ffffffffc02046ae:	00039797          	auipc	a5,0x39
ffffffffc02046b2:	f827b783          	ld	a5,-126(a5) # ffffffffc023d630 <va_pa_offset>
ffffffffc02046b6:	46a1                	li	a3,8
ffffffffc02046b8:	963e                	add	a2,a2,a5
ffffffffc02046ba:	4505                	li	a0,1
ffffffffc02046bc:	0141                	addi	sp,sp,16
ffffffffc02046be:	f2ffb06f          	j	ffffffffc02005ec <ide_read_secs>
ffffffffc02046c2:	86aa                	mv	a3,a0
ffffffffc02046c4:	00004617          	auipc	a2,0x4
ffffffffc02046c8:	8fc60613          	addi	a2,a2,-1796 # ffffffffc0207fc0 <etext+0x1cb6>
ffffffffc02046cc:	45d1                	li	a1,20
ffffffffc02046ce:	00004517          	auipc	a0,0x4
ffffffffc02046d2:	8da50513          	addi	a0,a0,-1830 # ffffffffc0207fa8 <etext+0x1c9e>
ffffffffc02046d6:	da3fb0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02046da:	86b2                	mv	a3,a2
ffffffffc02046dc:	06900593          	li	a1,105
ffffffffc02046e0:	00003617          	auipc	a2,0x3
ffffffffc02046e4:	8d060613          	addi	a2,a2,-1840 # ffffffffc0206fb0 <etext+0xca6>
ffffffffc02046e8:	00003517          	auipc	a0,0x3
ffffffffc02046ec:	8f050513          	addi	a0,a0,-1808 # ffffffffc0206fd8 <etext+0xcce>
ffffffffc02046f0:	d89fb0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc02046f4 <swapfs_write>:
ffffffffc02046f4:	1141                	addi	sp,sp,-16
ffffffffc02046f6:	e406                	sd	ra,8(sp)
ffffffffc02046f8:	00855793          	srli	a5,a0,0x8
ffffffffc02046fc:	cbb1                	beqz	a5,ffffffffc0204750 <swapfs_write+0x5c>
ffffffffc02046fe:	00039717          	auipc	a4,0x39
ffffffffc0204702:	f5273703          	ld	a4,-174(a4) # ffffffffc023d650 <max_swap_offset>
ffffffffc0204706:	04e7f563          	bgeu	a5,a4,ffffffffc0204750 <swapfs_write+0x5c>
ffffffffc020470a:	00039717          	auipc	a4,0x39
ffffffffc020470e:	f3673703          	ld	a4,-202(a4) # ffffffffc023d640 <pages>
ffffffffc0204712:	8d99                	sub	a1,a1,a4
ffffffffc0204714:	4065d613          	srai	a2,a1,0x6
ffffffffc0204718:	00005717          	auipc	a4,0x5
ffffffffc020471c:	a1873703          	ld	a4,-1512(a4) # ffffffffc0209130 <nbase>
ffffffffc0204720:	963a                	add	a2,a2,a4
ffffffffc0204722:	00c61713          	slli	a4,a2,0xc
ffffffffc0204726:	8331                	srli	a4,a4,0xc
ffffffffc0204728:	00039697          	auipc	a3,0x39
ffffffffc020472c:	f106b683          	ld	a3,-240(a3) # ffffffffc023d638 <npage>
ffffffffc0204730:	0037959b          	slliw	a1,a5,0x3
ffffffffc0204734:	0632                	slli	a2,a2,0xc
ffffffffc0204736:	02d77963          	bgeu	a4,a3,ffffffffc0204768 <swapfs_write+0x74>
ffffffffc020473a:	60a2                	ld	ra,8(sp)
ffffffffc020473c:	00039797          	auipc	a5,0x39
ffffffffc0204740:	ef47b783          	ld	a5,-268(a5) # ffffffffc023d630 <va_pa_offset>
ffffffffc0204744:	46a1                	li	a3,8
ffffffffc0204746:	963e                	add	a2,a2,a5
ffffffffc0204748:	4505                	li	a0,1
ffffffffc020474a:	0141                	addi	sp,sp,16
ffffffffc020474c:	ec5fb06f          	j	ffffffffc0200610 <ide_write_secs>
ffffffffc0204750:	86aa                	mv	a3,a0
ffffffffc0204752:	00004617          	auipc	a2,0x4
ffffffffc0204756:	86e60613          	addi	a2,a2,-1938 # ffffffffc0207fc0 <etext+0x1cb6>
ffffffffc020475a:	45e5                	li	a1,25
ffffffffc020475c:	00004517          	auipc	a0,0x4
ffffffffc0204760:	84c50513          	addi	a0,a0,-1972 # ffffffffc0207fa8 <etext+0x1c9e>
ffffffffc0204764:	d15fb0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0204768:	86b2                	mv	a3,a2
ffffffffc020476a:	06900593          	li	a1,105
ffffffffc020476e:	00003617          	auipc	a2,0x3
ffffffffc0204772:	84260613          	addi	a2,a2,-1982 # ffffffffc0206fb0 <etext+0xca6>
ffffffffc0204776:	00003517          	auipc	a0,0x3
ffffffffc020477a:	86250513          	addi	a0,a0,-1950 # ffffffffc0206fd8 <etext+0xcce>
ffffffffc020477e:	cfbfb0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc0204782 <kernel_thread_entry>:
ffffffffc0204782:	8526                	mv	a0,s1
ffffffffc0204784:	9402                	jalr	s0
ffffffffc0204786:	680000ef          	jal	ffffffffc0204e06 <do_exit>

ffffffffc020478a <alloc_proc>:
ffffffffc020478a:	1141                	addi	sp,sp,-16
ffffffffc020478c:	14800513          	li	a0,328
ffffffffc0204790:	e022                	sd	s0,0(sp)
ffffffffc0204792:	e406                	sd	ra,8(sp)
ffffffffc0204794:	a58fd0ef          	jal	ffffffffc02019ec <kmalloc>
ffffffffc0204798:	842a                	mv	s0,a0
ffffffffc020479a:	c525                	beqz	a0,ffffffffc0204802 <alloc_proc+0x78>
ffffffffc020479c:	57fd                	li	a5,-1
ffffffffc020479e:	1782                	slli	a5,a5,0x20
ffffffffc02047a0:	e11c                	sd	a5,0(a0)
ffffffffc02047a2:	00052423          	sw	zero,8(a0)
ffffffffc02047a6:	00053823          	sd	zero,16(a0)
ffffffffc02047aa:	00053c23          	sd	zero,24(a0)
ffffffffc02047ae:	02053023          	sd	zero,32(a0)
ffffffffc02047b2:	02053423          	sd	zero,40(a0)
ffffffffc02047b6:	07000613          	li	a2,112
ffffffffc02047ba:	4581                	li	a1,0
ffffffffc02047bc:	03050513          	addi	a0,a0,48
ffffffffc02047c0:	321010ef          	jal	ffffffffc02062e0 <memset>
ffffffffc02047c4:	00039797          	auipc	a5,0x39
ffffffffc02047c8:	e5c7b783          	ld	a5,-420(a5) # ffffffffc023d620 <boot_cr3>
ffffffffc02047cc:	0a043023          	sd	zero,160(s0)
ffffffffc02047d0:	f45c                	sd	a5,168(s0)
ffffffffc02047d2:	0a042823          	sw	zero,176(s0)
ffffffffc02047d6:	463d                	li	a2,15
ffffffffc02047d8:	4581                	li	a1,0
ffffffffc02047da:	0b440513          	addi	a0,s0,180
ffffffffc02047de:	303010ef          	jal	ffffffffc02062e0 <memset>
ffffffffc02047e2:	0e042623          	sw	zero,236(s0)
ffffffffc02047e6:	0e043c23          	sd	zero,248(s0)
ffffffffc02047ea:	10043023          	sd	zero,256(s0)
ffffffffc02047ee:	0e043823          	sd	zero,240(s0)
ffffffffc02047f2:	12043423          	sd	zero,296(s0)
ffffffffc02047f6:	12043c23          	sd	zero,312(s0)
ffffffffc02047fa:	12043823          	sd	zero,304(s0)
ffffffffc02047fe:	14043023          	sd	zero,320(s0)
ffffffffc0204802:	60a2                	ld	ra,8(sp)
ffffffffc0204804:	8522                	mv	a0,s0
ffffffffc0204806:	6402                	ld	s0,0(sp)
ffffffffc0204808:	0141                	addi	sp,sp,16
ffffffffc020480a:	8082                	ret

ffffffffc020480c <forkret>:
ffffffffc020480c:	00039797          	auipc	a5,0x39
ffffffffc0204810:	e6c7b783          	ld	a5,-404(a5) # ffffffffc023d678 <current>
ffffffffc0204814:	73c8                	ld	a0,160(a5)
ffffffffc0204816:	d10fc06f          	j	ffffffffc0200d26 <forkrets>

ffffffffc020481a <user_main>:
ffffffffc020481a:	00039797          	auipc	a5,0x39
ffffffffc020481e:	e5e7b783          	ld	a5,-418(a5) # ffffffffc023d678 <current>
ffffffffc0204822:	43cc                	lw	a1,4(a5)
ffffffffc0204824:	7139                	addi	sp,sp,-64
ffffffffc0204826:	00003617          	auipc	a2,0x3
ffffffffc020482a:	7ba60613          	addi	a2,a2,1978 # ffffffffc0207fe0 <etext+0x1cd6>
ffffffffc020482e:	00003517          	auipc	a0,0x3
ffffffffc0204832:	7ba50513          	addi	a0,a0,1978 # ffffffffc0207fe8 <etext+0x1cde>
ffffffffc0204836:	fc06                	sd	ra,56(sp)
ffffffffc0204838:	94dfb0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc020483c:	3fdfe797          	auipc	a5,0x3fdfe
ffffffffc0204840:	abc78793          	addi	a5,a5,-1348 # 22f8 <_binary_obj___user_badarg_out_size>
ffffffffc0204844:	e43e                	sd	a5,8(sp)
ffffffffc0204846:	00003517          	auipc	a0,0x3
ffffffffc020484a:	79a50513          	addi	a0,a0,1946 # ffffffffc0207fe0 <etext+0x1cd6>
ffffffffc020484e:	00008797          	auipc	a5,0x8
ffffffffc0204852:	7b278793          	addi	a5,a5,1970 # ffffffffc020d000 <_binary_obj___user_badarg_out_start>
ffffffffc0204856:	f03e                	sd	a5,32(sp)
ffffffffc0204858:	f42a                	sd	a0,40(sp)
ffffffffc020485a:	e802                	sd	zero,16(sp)
ffffffffc020485c:	1ef010ef          	jal	ffffffffc020624a <strlen>
ffffffffc0204860:	ec2a                	sd	a0,24(sp)
ffffffffc0204862:	4511                	li	a0,4
ffffffffc0204864:	55a2                	lw	a1,40(sp)
ffffffffc0204866:	4662                	lw	a2,24(sp)
ffffffffc0204868:	5682                	lw	a3,32(sp)
ffffffffc020486a:	4722                	lw	a4,8(sp)
ffffffffc020486c:	48a9                	li	a7,10
ffffffffc020486e:	9002                	ebreak
ffffffffc0204870:	c82a                	sw	a0,16(sp)
ffffffffc0204872:	65c2                	ld	a1,16(sp)
ffffffffc0204874:	00003517          	auipc	a0,0x3
ffffffffc0204878:	79c50513          	addi	a0,a0,1948 # ffffffffc0208010 <etext+0x1d06>
ffffffffc020487c:	909fb0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0204880:	00003617          	auipc	a2,0x3
ffffffffc0204884:	7a060613          	addi	a2,a2,1952 # ffffffffc0208020 <etext+0x1d16>
ffffffffc0204888:	34a00593          	li	a1,842
ffffffffc020488c:	00003517          	auipc	a0,0x3
ffffffffc0204890:	7b450513          	addi	a0,a0,1972 # ffffffffc0208040 <etext+0x1d36>
ffffffffc0204894:	be5fb0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc0204898 <put_pgdir>:
ffffffffc0204898:	6d14                	ld	a3,24(a0)
ffffffffc020489a:	1141                	addi	sp,sp,-16
ffffffffc020489c:	e406                	sd	ra,8(sp)
ffffffffc020489e:	c02007b7          	lui	a5,0xc0200
ffffffffc02048a2:	02f6ee63          	bltu	a3,a5,ffffffffc02048de <put_pgdir+0x46>
ffffffffc02048a6:	00039797          	auipc	a5,0x39
ffffffffc02048aa:	d8a7b783          	ld	a5,-630(a5) # ffffffffc023d630 <va_pa_offset>
ffffffffc02048ae:	8e9d                	sub	a3,a3,a5
ffffffffc02048b0:	82b1                	srli	a3,a3,0xc
ffffffffc02048b2:	00039797          	auipc	a5,0x39
ffffffffc02048b6:	d867b783          	ld	a5,-634(a5) # ffffffffc023d638 <npage>
ffffffffc02048ba:	02f6fe63          	bgeu	a3,a5,ffffffffc02048f6 <put_pgdir+0x5e>
ffffffffc02048be:	00005797          	auipc	a5,0x5
ffffffffc02048c2:	8727b783          	ld	a5,-1934(a5) # ffffffffc0209130 <nbase>
ffffffffc02048c6:	60a2                	ld	ra,8(sp)
ffffffffc02048c8:	8e9d                	sub	a3,a3,a5
ffffffffc02048ca:	00039517          	auipc	a0,0x39
ffffffffc02048ce:	d7653503          	ld	a0,-650(a0) # ffffffffc023d640 <pages>
ffffffffc02048d2:	069a                	slli	a3,a3,0x6
ffffffffc02048d4:	4585                	li	a1,1
ffffffffc02048d6:	9536                	add	a0,a0,a3
ffffffffc02048d8:	0141                	addi	sp,sp,16
ffffffffc02048da:	b7afd06f          	j	ffffffffc0201c54 <free_pages>
ffffffffc02048de:	00002617          	auipc	a2,0x2
ffffffffc02048e2:	77a60613          	addi	a2,a2,1914 # ffffffffc0207058 <etext+0xd4e>
ffffffffc02048e6:	06e00593          	li	a1,110
ffffffffc02048ea:	00002517          	auipc	a0,0x2
ffffffffc02048ee:	6ee50513          	addi	a0,a0,1774 # ffffffffc0206fd8 <etext+0xcce>
ffffffffc02048f2:	b87fb0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02048f6:	00002617          	auipc	a2,0x2
ffffffffc02048fa:	78a60613          	addi	a2,a2,1930 # ffffffffc0207080 <etext+0xd76>
ffffffffc02048fe:	06200593          	li	a1,98
ffffffffc0204902:	00002517          	auipc	a0,0x2
ffffffffc0204906:	6d650513          	addi	a0,a0,1750 # ffffffffc0206fd8 <etext+0xcce>
ffffffffc020490a:	b6ffb0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc020490e <proc_run>:
ffffffffc020490e:	7179                	addi	sp,sp,-48
ffffffffc0204910:	ec4a                	sd	s2,24(sp)
ffffffffc0204912:	00039917          	auipc	s2,0x39
ffffffffc0204916:	d6690913          	addi	s2,s2,-666 # ffffffffc023d678 <current>
ffffffffc020491a:	f026                	sd	s1,32(sp)
ffffffffc020491c:	00093483          	ld	s1,0(s2)
ffffffffc0204920:	f406                	sd	ra,40(sp)
ffffffffc0204922:	02a48a63          	beq	s1,a0,ffffffffc0204956 <proc_run+0x48>
ffffffffc0204926:	e84e                	sd	s3,16(sp)
ffffffffc0204928:	100027f3          	csrr	a5,sstatus
ffffffffc020492c:	8b89                	andi	a5,a5,2
ffffffffc020492e:	4981                	li	s3,0
ffffffffc0204930:	ef9d                	bnez	a5,ffffffffc020496e <proc_run+0x60>
ffffffffc0204932:	755c                	ld	a5,168(a0)
ffffffffc0204934:	577d                	li	a4,-1
ffffffffc0204936:	177e                	slli	a4,a4,0x3f
ffffffffc0204938:	83b1                	srli	a5,a5,0xc
ffffffffc020493a:	00a93023          	sd	a0,0(s2)
ffffffffc020493e:	8fd9                	or	a5,a5,a4
ffffffffc0204940:	18079073          	csrw	satp,a5
ffffffffc0204944:	03050593          	addi	a1,a0,48
ffffffffc0204948:	03048513          	addi	a0,s1,48
ffffffffc020494c:	14c010ef          	jal	ffffffffc0205a98 <switch_to>
ffffffffc0204950:	00099863          	bnez	s3,ffffffffc0204960 <proc_run+0x52>
ffffffffc0204954:	69c2                	ld	s3,16(sp)
ffffffffc0204956:	70a2                	ld	ra,40(sp)
ffffffffc0204958:	7482                	ld	s1,32(sp)
ffffffffc020495a:	6962                	ld	s2,24(sp)
ffffffffc020495c:	6145                	addi	sp,sp,48
ffffffffc020495e:	8082                	ret
ffffffffc0204960:	69c2                	ld	s3,16(sp)
ffffffffc0204962:	70a2                	ld	ra,40(sp)
ffffffffc0204964:	7482                	ld	s1,32(sp)
ffffffffc0204966:	6962                	ld	s2,24(sp)
ffffffffc0204968:	6145                	addi	sp,sp,48
ffffffffc020496a:	ccbfb06f          	j	ffffffffc0200634 <intr_enable>
ffffffffc020496e:	e42a                	sd	a0,8(sp)
ffffffffc0204970:	ccbfb0ef          	jal	ffffffffc020063a <intr_disable>
ffffffffc0204974:	6522                	ld	a0,8(sp)
ffffffffc0204976:	4985                	li	s3,1
ffffffffc0204978:	bf6d                	j	ffffffffc0204932 <proc_run+0x24>

ffffffffc020497a <do_fork>:
ffffffffc020497a:	7119                	addi	sp,sp,-128
ffffffffc020497c:	f0ca                	sd	s2,96(sp)
ffffffffc020497e:	00039917          	auipc	s2,0x39
ffffffffc0204982:	cf290913          	addi	s2,s2,-782 # ffffffffc023d670 <nr_process>
ffffffffc0204986:	00092703          	lw	a4,0(s2)
ffffffffc020498a:	fc86                	sd	ra,120(sp)
ffffffffc020498c:	6785                	lui	a5,0x1
ffffffffc020498e:	36f75263          	bge	a4,a5,ffffffffc0204cf2 <do_fork+0x378>
ffffffffc0204992:	f8a2                	sd	s0,112(sp)
ffffffffc0204994:	f4a6                	sd	s1,104(sp)
ffffffffc0204996:	ecce                	sd	s3,88(sp)
ffffffffc0204998:	e8d2                	sd	s4,80(sp)
ffffffffc020499a:	89ae                	mv	s3,a1
ffffffffc020499c:	8a2a                	mv	s4,a0
ffffffffc020499e:	8432                	mv	s0,a2
ffffffffc02049a0:	debff0ef          	jal	ffffffffc020478a <alloc_proc>
ffffffffc02049a4:	84aa                	mv	s1,a0
ffffffffc02049a6:	32050a63          	beqz	a0,ffffffffc0204cda <do_fork+0x360>
ffffffffc02049aa:	f862                	sd	s8,48(sp)
ffffffffc02049ac:	00039c17          	auipc	s8,0x39
ffffffffc02049b0:	cccc0c13          	addi	s8,s8,-820 # ffffffffc023d678 <current>
ffffffffc02049b4:	000c3783          	ld	a5,0(s8)
ffffffffc02049b8:	0ec7a703          	lw	a4,236(a5) # 10ec <_binary_obj___user_faultread_out_size-0xe04>
ffffffffc02049bc:	f11c                	sd	a5,32(a0)
ffffffffc02049be:	3a071a63          	bnez	a4,ffffffffc0204d72 <do_fork+0x3f8>
ffffffffc02049c2:	4509                	li	a0,2
ffffffffc02049c4:	a00fd0ef          	jal	ffffffffc0201bc4 <alloc_pages>
ffffffffc02049c8:	30050563          	beqz	a0,ffffffffc0204cd2 <do_fork+0x358>
ffffffffc02049cc:	e4d6                	sd	s5,72(sp)
ffffffffc02049ce:	00039a97          	auipc	s5,0x39
ffffffffc02049d2:	c72a8a93          	addi	s5,s5,-910 # ffffffffc023d640 <pages>
ffffffffc02049d6:	000ab703          	ld	a4,0(s5)
ffffffffc02049da:	e0da                	sd	s6,64(sp)
ffffffffc02049dc:	00004b17          	auipc	s6,0x4
ffffffffc02049e0:	754b0b13          	addi	s6,s6,1876 # ffffffffc0209130 <nbase>
ffffffffc02049e4:	000b3783          	ld	a5,0(s6)
ffffffffc02049e8:	40e506b3          	sub	a3,a0,a4
ffffffffc02049ec:	fc5e                	sd	s7,56(sp)
ffffffffc02049ee:	00039b97          	auipc	s7,0x39
ffffffffc02049f2:	c4ab8b93          	addi	s7,s7,-950 # ffffffffc023d638 <npage>
ffffffffc02049f6:	ec6e                	sd	s11,24(sp)
ffffffffc02049f8:	8699                	srai	a3,a3,0x6
ffffffffc02049fa:	5dfd                	li	s11,-1
ffffffffc02049fc:	000bb703          	ld	a4,0(s7)
ffffffffc0204a00:	96be                	add	a3,a3,a5
ffffffffc0204a02:	00cddd93          	srli	s11,s11,0xc
ffffffffc0204a06:	01b6f633          	and	a2,a3,s11
ffffffffc0204a0a:	f06a                	sd	s10,32(sp)
ffffffffc0204a0c:	06b2                	slli	a3,a3,0xc
ffffffffc0204a0e:	30e67d63          	bgeu	a2,a4,ffffffffc0204d28 <do_fork+0x3ae>
ffffffffc0204a12:	000c3603          	ld	a2,0(s8)
ffffffffc0204a16:	00039c17          	auipc	s8,0x39
ffffffffc0204a1a:	c1ac0c13          	addi	s8,s8,-998 # ffffffffc023d630 <va_pa_offset>
ffffffffc0204a1e:	000c3703          	ld	a4,0(s8)
ffffffffc0204a22:	02863d03          	ld	s10,40(a2)
ffffffffc0204a26:	e43e                	sd	a5,8(sp)
ffffffffc0204a28:	9736                	add	a4,a4,a3
ffffffffc0204a2a:	e898                	sd	a4,16(s1)
ffffffffc0204a2c:	020d0863          	beqz	s10,ffffffffc0204a5c <do_fork+0xe2>
ffffffffc0204a30:	100a7a13          	andi	s4,s4,256
ffffffffc0204a34:	1c0a0463          	beqz	s4,ffffffffc0204bfc <do_fork+0x282>
ffffffffc0204a38:	030d2783          	lw	a5,48(s10)
ffffffffc0204a3c:	018d3683          	ld	a3,24(s10)
ffffffffc0204a40:	c0200737          	lui	a4,0xc0200
ffffffffc0204a44:	2785                	addiw	a5,a5,1
ffffffffc0204a46:	02fd2823          	sw	a5,48(s10)
ffffffffc0204a4a:	03a4b423          	sd	s10,40(s1)
ffffffffc0204a4e:	2ce6e063          	bltu	a3,a4,ffffffffc0204d0e <do_fork+0x394>
ffffffffc0204a52:	000c3783          	ld	a5,0(s8)
ffffffffc0204a56:	6898                	ld	a4,16(s1)
ffffffffc0204a58:	8e9d                	sub	a3,a3,a5
ffffffffc0204a5a:	f4d4                	sd	a3,168(s1)
ffffffffc0204a5c:	6689                	lui	a3,0x2
ffffffffc0204a5e:	ee068693          	addi	a3,a3,-288 # 1ee0 <_binary_obj___user_faultread_out_size-0x10>
ffffffffc0204a62:	96ba                	add	a3,a3,a4
ffffffffc0204a64:	8622                	mv	a2,s0
ffffffffc0204a66:	f0d4                	sd	a3,160(s1)
ffffffffc0204a68:	87b6                	mv	a5,a3
ffffffffc0204a6a:	12040313          	addi	t1,s0,288
ffffffffc0204a6e:	00063883          	ld	a7,0(a2)
ffffffffc0204a72:	00863803          	ld	a6,8(a2)
ffffffffc0204a76:	6a08                	ld	a0,16(a2)
ffffffffc0204a78:	6e0c                	ld	a1,24(a2)
ffffffffc0204a7a:	0117b023          	sd	a7,0(a5)
ffffffffc0204a7e:	0107b423          	sd	a6,8(a5)
ffffffffc0204a82:	eb88                	sd	a0,16(a5)
ffffffffc0204a84:	ef8c                	sd	a1,24(a5)
ffffffffc0204a86:	02060613          	addi	a2,a2,32
ffffffffc0204a8a:	02078793          	addi	a5,a5,32
ffffffffc0204a8e:	fe6610e3          	bne	a2,t1,ffffffffc0204a6e <do_fork+0xf4>
ffffffffc0204a92:	0406b823          	sd	zero,80(a3)
ffffffffc0204a96:	12098d63          	beqz	s3,ffffffffc0204bd0 <do_fork+0x256>
ffffffffc0204a9a:	0136b823          	sd	s3,16(a3)
ffffffffc0204a9e:	00000797          	auipc	a5,0x0
ffffffffc0204aa2:	d6e78793          	addi	a5,a5,-658 # ffffffffc020480c <forkret>
ffffffffc0204aa6:	f89c                	sd	a5,48(s1)
ffffffffc0204aa8:	fc94                	sd	a3,56(s1)
ffffffffc0204aaa:	100027f3          	csrr	a5,sstatus
ffffffffc0204aae:	8b89                	andi	a5,a5,2
ffffffffc0204ab0:	4981                	li	s3,0
ffffffffc0204ab2:	14079163          	bnez	a5,ffffffffc0204bf4 <do_fork+0x27a>
ffffffffc0204ab6:	0002d817          	auipc	a6,0x2d
ffffffffc0204aba:	64e80813          	addi	a6,a6,1614 # ffffffffc0232104 <last_pid.1>
ffffffffc0204abe:	00082783          	lw	a5,0(a6)
ffffffffc0204ac2:	6709                	lui	a4,0x2
ffffffffc0204ac4:	0017851b          	addiw	a0,a5,1
ffffffffc0204ac8:	00a82023          	sw	a0,0(a6)
ffffffffc0204acc:	08e55c63          	bge	a0,a4,ffffffffc0204b64 <do_fork+0x1ea>
ffffffffc0204ad0:	0002d317          	auipc	t1,0x2d
ffffffffc0204ad4:	63030313          	addi	t1,t1,1584 # ffffffffc0232100 <next_safe.0>
ffffffffc0204ad8:	00032783          	lw	a5,0(t1)
ffffffffc0204adc:	00039417          	auipc	s0,0x39
ffffffffc0204ae0:	ae440413          	addi	s0,s0,-1308 # ffffffffc023d5c0 <proc_list>
ffffffffc0204ae4:	08f55863          	bge	a0,a5,ffffffffc0204b74 <do_fork+0x1fa>
ffffffffc0204ae8:	c0c8                	sw	a0,4(s1)
ffffffffc0204aea:	45a9                	li	a1,10
ffffffffc0204aec:	2501                	sext.w	a0,a0
ffffffffc0204aee:	35e010ef          	jal	ffffffffc0205e4c <hash32>
ffffffffc0204af2:	02051793          	slli	a5,a0,0x20
ffffffffc0204af6:	01c7d513          	srli	a0,a5,0x1c
ffffffffc0204afa:	00035797          	auipc	a5,0x35
ffffffffc0204afe:	ac678793          	addi	a5,a5,-1338 # ffffffffc02395c0 <hash_list>
ffffffffc0204b02:	953e                	add	a0,a0,a5
ffffffffc0204b04:	650c                	ld	a1,8(a0)
ffffffffc0204b06:	7094                	ld	a3,32(s1)
ffffffffc0204b08:	0d848793          	addi	a5,s1,216
ffffffffc0204b0c:	e19c                	sd	a5,0(a1)
ffffffffc0204b0e:	6410                	ld	a2,8(s0)
ffffffffc0204b10:	e51c                	sd	a5,8(a0)
ffffffffc0204b12:	7af8                	ld	a4,240(a3)
ffffffffc0204b14:	0c848793          	addi	a5,s1,200
ffffffffc0204b18:	f0ec                	sd	a1,224(s1)
ffffffffc0204b1a:	ece8                	sd	a0,216(s1)
ffffffffc0204b1c:	e21c                	sd	a5,0(a2)
ffffffffc0204b1e:	e41c                	sd	a5,8(s0)
ffffffffc0204b20:	e8f0                	sd	a2,208(s1)
ffffffffc0204b22:	e4e0                	sd	s0,200(s1)
ffffffffc0204b24:	0e04bc23          	sd	zero,248(s1)
ffffffffc0204b28:	10e4b023          	sd	a4,256(s1)
ffffffffc0204b2c:	c311                	beqz	a4,ffffffffc0204b30 <do_fork+0x1b6>
ffffffffc0204b2e:	ff64                	sd	s1,248(a4)
ffffffffc0204b30:	00092783          	lw	a5,0(s2)
ffffffffc0204b34:	fae4                	sd	s1,240(a3)
ffffffffc0204b36:	2785                	addiw	a5,a5,1
ffffffffc0204b38:	00f92023          	sw	a5,0(s2)
ffffffffc0204b3c:	14099163          	bnez	s3,ffffffffc0204c7e <do_fork+0x304>
ffffffffc0204b40:	8526                	mv	a0,s1
ffffffffc0204b42:	046010ef          	jal	ffffffffc0205b88 <wakeup_proc>
ffffffffc0204b46:	40c8                	lw	a0,4(s1)
ffffffffc0204b48:	7446                	ld	s0,112(sp)
ffffffffc0204b4a:	74a6                	ld	s1,104(sp)
ffffffffc0204b4c:	69e6                	ld	s3,88(sp)
ffffffffc0204b4e:	6a46                	ld	s4,80(sp)
ffffffffc0204b50:	6aa6                	ld	s5,72(sp)
ffffffffc0204b52:	6b06                	ld	s6,64(sp)
ffffffffc0204b54:	7be2                	ld	s7,56(sp)
ffffffffc0204b56:	7c42                	ld	s8,48(sp)
ffffffffc0204b58:	7d02                	ld	s10,32(sp)
ffffffffc0204b5a:	6de2                	ld	s11,24(sp)
ffffffffc0204b5c:	70e6                	ld	ra,120(sp)
ffffffffc0204b5e:	7906                	ld	s2,96(sp)
ffffffffc0204b60:	6109                	addi	sp,sp,128
ffffffffc0204b62:	8082                	ret
ffffffffc0204b64:	4785                	li	a5,1
ffffffffc0204b66:	00f82023          	sw	a5,0(a6)
ffffffffc0204b6a:	4505                	li	a0,1
ffffffffc0204b6c:	0002d317          	auipc	t1,0x2d
ffffffffc0204b70:	59430313          	addi	t1,t1,1428 # ffffffffc0232100 <next_safe.0>
ffffffffc0204b74:	00039417          	auipc	s0,0x39
ffffffffc0204b78:	a4c40413          	addi	s0,s0,-1460 # ffffffffc023d5c0 <proc_list>
ffffffffc0204b7c:	00843e03          	ld	t3,8(s0)
ffffffffc0204b80:	6789                	lui	a5,0x2
ffffffffc0204b82:	00f32023          	sw	a5,0(t1)
ffffffffc0204b86:	86aa                	mv	a3,a0
ffffffffc0204b88:	4581                	li	a1,0
ffffffffc0204b8a:	028e0e63          	beq	t3,s0,ffffffffc0204bc6 <do_fork+0x24c>
ffffffffc0204b8e:	88ae                	mv	a7,a1
ffffffffc0204b90:	87f2                	mv	a5,t3
ffffffffc0204b92:	6609                	lui	a2,0x2
ffffffffc0204b94:	a811                	j	ffffffffc0204ba8 <do_fork+0x22e>
ffffffffc0204b96:	00e6d663          	bge	a3,a4,ffffffffc0204ba2 <do_fork+0x228>
ffffffffc0204b9a:	00c75463          	bge	a4,a2,ffffffffc0204ba2 <do_fork+0x228>
ffffffffc0204b9e:	863a                	mv	a2,a4
ffffffffc0204ba0:	4885                	li	a7,1
ffffffffc0204ba2:	679c                	ld	a5,8(a5)
ffffffffc0204ba4:	00878d63          	beq	a5,s0,ffffffffc0204bbe <do_fork+0x244>
ffffffffc0204ba8:	f3c7a703          	lw	a4,-196(a5) # 1f3c <_binary_obj___user_faultread_out_size+0x4c>
ffffffffc0204bac:	fed715e3          	bne	a4,a3,ffffffffc0204b96 <do_fork+0x21c>
ffffffffc0204bb0:	2685                	addiw	a3,a3,1
ffffffffc0204bb2:	12c6da63          	bge	a3,a2,ffffffffc0204ce6 <do_fork+0x36c>
ffffffffc0204bb6:	679c                	ld	a5,8(a5)
ffffffffc0204bb8:	4585                	li	a1,1
ffffffffc0204bba:	fe8797e3          	bne	a5,s0,ffffffffc0204ba8 <do_fork+0x22e>
ffffffffc0204bbe:	00088463          	beqz	a7,ffffffffc0204bc6 <do_fork+0x24c>
ffffffffc0204bc2:	00c32023          	sw	a2,0(t1)
ffffffffc0204bc6:	d18d                	beqz	a1,ffffffffc0204ae8 <do_fork+0x16e>
ffffffffc0204bc8:	00d82023          	sw	a3,0(a6)
ffffffffc0204bcc:	8536                	mv	a0,a3
ffffffffc0204bce:	bf29                	j	ffffffffc0204ae8 <do_fork+0x16e>
ffffffffc0204bd0:	6989                	lui	s3,0x2
ffffffffc0204bd2:	edc98993          	addi	s3,s3,-292 # 1edc <_binary_obj___user_faultread_out_size-0x14>
ffffffffc0204bd6:	99ba                	add	s3,s3,a4
ffffffffc0204bd8:	0136b823          	sd	s3,16(a3)
ffffffffc0204bdc:	00000797          	auipc	a5,0x0
ffffffffc0204be0:	c3078793          	addi	a5,a5,-976 # ffffffffc020480c <forkret>
ffffffffc0204be4:	f89c                	sd	a5,48(s1)
ffffffffc0204be6:	fc94                	sd	a3,56(s1)
ffffffffc0204be8:	100027f3          	csrr	a5,sstatus
ffffffffc0204bec:	8b89                	andi	a5,a5,2
ffffffffc0204bee:	4981                	li	s3,0
ffffffffc0204bf0:	ec0783e3          	beqz	a5,ffffffffc0204ab6 <do_fork+0x13c>
ffffffffc0204bf4:	a47fb0ef          	jal	ffffffffc020063a <intr_disable>
ffffffffc0204bf8:	4985                	li	s3,1
ffffffffc0204bfa:	bd75                	j	ffffffffc0204ab6 <do_fork+0x13c>
ffffffffc0204bfc:	f466                	sd	s9,40(sp)
ffffffffc0204bfe:	806ff0ef          	jal	ffffffffc0203c04 <mm_create>
ffffffffc0204c02:	8caa                	mv	s9,a0
ffffffffc0204c04:	c949                	beqz	a0,ffffffffc0204c96 <do_fork+0x31c>
ffffffffc0204c06:	4505                	li	a0,1
ffffffffc0204c08:	fbdfc0ef          	jal	ffffffffc0201bc4 <alloc_pages>
ffffffffc0204c0c:	c151                	beqz	a0,ffffffffc0204c90 <do_fork+0x316>
ffffffffc0204c0e:	000ab683          	ld	a3,0(s5)
ffffffffc0204c12:	67a2                	ld	a5,8(sp)
ffffffffc0204c14:	000bb703          	ld	a4,0(s7)
ffffffffc0204c18:	40d506b3          	sub	a3,a0,a3
ffffffffc0204c1c:	8699                	srai	a3,a3,0x6
ffffffffc0204c1e:	96be                	add	a3,a3,a5
ffffffffc0204c20:	01b6fdb3          	and	s11,a3,s11
ffffffffc0204c24:	06b2                	slli	a3,a3,0xc
ffffffffc0204c26:	10edfe63          	bgeu	s11,a4,ffffffffc0204d42 <do_fork+0x3c8>
ffffffffc0204c2a:	000c3783          	ld	a5,0(s8)
ffffffffc0204c2e:	6605                	lui	a2,0x1
ffffffffc0204c30:	00039597          	auipc	a1,0x39
ffffffffc0204c34:	9f85b583          	ld	a1,-1544(a1) # ffffffffc023d628 <boot_pgdir>
ffffffffc0204c38:	00f68a33          	add	s4,a3,a5
ffffffffc0204c3c:	8552                	mv	a0,s4
ffffffffc0204c3e:	6b4010ef          	jal	ffffffffc02062f2 <memcpy>
ffffffffc0204c42:	038d0d93          	addi	s11,s10,56
ffffffffc0204c46:	014cbc23          	sd	s4,24(s9)
ffffffffc0204c4a:	4785                	li	a5,1
ffffffffc0204c4c:	40fdb7af          	amoor.d	a5,a5,(s11)
ffffffffc0204c50:	8b85                	andi	a5,a5,1
ffffffffc0204c52:	4a05                	li	s4,1
ffffffffc0204c54:	c799                	beqz	a5,ffffffffc0204c62 <do_fork+0x2e8>
ffffffffc0204c56:	036010ef          	jal	ffffffffc0205c8c <schedule>
ffffffffc0204c5a:	414db7af          	amoor.d	a5,s4,(s11)
ffffffffc0204c5e:	8b85                	andi	a5,a5,1
ffffffffc0204c60:	fbfd                	bnez	a5,ffffffffc0204c56 <do_fork+0x2dc>
ffffffffc0204c62:	85ea                	mv	a1,s10
ffffffffc0204c64:	8566                	mv	a0,s9
ffffffffc0204c66:	a44ff0ef          	jal	ffffffffc0203eaa <dup_mmap>
ffffffffc0204c6a:	57f9                	li	a5,-2
ffffffffc0204c6c:	60fdb7af          	amoand.d	a5,a5,(s11)
ffffffffc0204c70:	8b85                	andi	a5,a5,1
ffffffffc0204c72:	0e078463          	beqz	a5,ffffffffc0204d5a <do_fork+0x3e0>
ffffffffc0204c76:	8d66                	mv	s10,s9
ffffffffc0204c78:	e511                	bnez	a0,ffffffffc0204c84 <do_fork+0x30a>
ffffffffc0204c7a:	7ca2                	ld	s9,40(sp)
ffffffffc0204c7c:	bb75                	j	ffffffffc0204a38 <do_fork+0xbe>
ffffffffc0204c7e:	9b7fb0ef          	jal	ffffffffc0200634 <intr_enable>
ffffffffc0204c82:	bd7d                	j	ffffffffc0204b40 <do_fork+0x1c6>
ffffffffc0204c84:	8566                	mv	a0,s9
ffffffffc0204c86:	abcff0ef          	jal	ffffffffc0203f42 <exit_mmap>
ffffffffc0204c8a:	8566                	mv	a0,s9
ffffffffc0204c8c:	c0dff0ef          	jal	ffffffffc0204898 <put_pgdir>
ffffffffc0204c90:	8566                	mv	a0,s9
ffffffffc0204c92:	8f8ff0ef          	jal	ffffffffc0203d8a <mm_destroy>
ffffffffc0204c96:	6894                	ld	a3,16(s1)
ffffffffc0204c98:	c02007b7          	lui	a5,0xc0200
ffffffffc0204c9c:	10f6e163          	bltu	a3,a5,ffffffffc0204d9e <do_fork+0x424>
ffffffffc0204ca0:	000c3783          	ld	a5,0(s8)
ffffffffc0204ca4:	000bb703          	ld	a4,0(s7)
ffffffffc0204ca8:	40f687b3          	sub	a5,a3,a5
ffffffffc0204cac:	83b1                	srli	a5,a5,0xc
ffffffffc0204cae:	04e7f463          	bgeu	a5,a4,ffffffffc0204cf6 <do_fork+0x37c>
ffffffffc0204cb2:	000b3703          	ld	a4,0(s6)
ffffffffc0204cb6:	000ab503          	ld	a0,0(s5)
ffffffffc0204cba:	4589                	li	a1,2
ffffffffc0204cbc:	8f99                	sub	a5,a5,a4
ffffffffc0204cbe:	079a                	slli	a5,a5,0x6
ffffffffc0204cc0:	953e                	add	a0,a0,a5
ffffffffc0204cc2:	f93fc0ef          	jal	ffffffffc0201c54 <free_pages>
ffffffffc0204cc6:	6aa6                	ld	s5,72(sp)
ffffffffc0204cc8:	6b06                	ld	s6,64(sp)
ffffffffc0204cca:	7be2                	ld	s7,56(sp)
ffffffffc0204ccc:	7ca2                	ld	s9,40(sp)
ffffffffc0204cce:	7d02                	ld	s10,32(sp)
ffffffffc0204cd0:	6de2                	ld	s11,24(sp)
ffffffffc0204cd2:	8526                	mv	a0,s1
ffffffffc0204cd4:	dc3fc0ef          	jal	ffffffffc0201a96 <kfree>
ffffffffc0204cd8:	7c42                	ld	s8,48(sp)
ffffffffc0204cda:	7446                	ld	s0,112(sp)
ffffffffc0204cdc:	74a6                	ld	s1,104(sp)
ffffffffc0204cde:	69e6                	ld	s3,88(sp)
ffffffffc0204ce0:	6a46                	ld	s4,80(sp)
ffffffffc0204ce2:	5571                	li	a0,-4
ffffffffc0204ce4:	bda5                	j	ffffffffc0204b5c <do_fork+0x1e2>
ffffffffc0204ce6:	6789                	lui	a5,0x2
ffffffffc0204ce8:	00f6c363          	blt	a3,a5,ffffffffc0204cee <do_fork+0x374>
ffffffffc0204cec:	4685                	li	a3,1
ffffffffc0204cee:	4585                	li	a1,1
ffffffffc0204cf0:	bd69                	j	ffffffffc0204b8a <do_fork+0x210>
ffffffffc0204cf2:	556d                	li	a0,-5
ffffffffc0204cf4:	b5a5                	j	ffffffffc0204b5c <do_fork+0x1e2>
ffffffffc0204cf6:	00002617          	auipc	a2,0x2
ffffffffc0204cfa:	38a60613          	addi	a2,a2,906 # ffffffffc0207080 <etext+0xd76>
ffffffffc0204cfe:	06200593          	li	a1,98
ffffffffc0204d02:	00002517          	auipc	a0,0x2
ffffffffc0204d06:	2d650513          	addi	a0,a0,726 # ffffffffc0206fd8 <etext+0xcce>
ffffffffc0204d0a:	f6efb0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0204d0e:	00002617          	auipc	a2,0x2
ffffffffc0204d12:	34a60613          	addi	a2,a2,842 # ffffffffc0207058 <etext+0xd4e>
ffffffffc0204d16:	15c00593          	li	a1,348
ffffffffc0204d1a:	00003517          	auipc	a0,0x3
ffffffffc0204d1e:	32650513          	addi	a0,a0,806 # ffffffffc0208040 <etext+0x1d36>
ffffffffc0204d22:	f466                	sd	s9,40(sp)
ffffffffc0204d24:	f54fb0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0204d28:	00002617          	auipc	a2,0x2
ffffffffc0204d2c:	28860613          	addi	a2,a2,648 # ffffffffc0206fb0 <etext+0xca6>
ffffffffc0204d30:	06900593          	li	a1,105
ffffffffc0204d34:	00002517          	auipc	a0,0x2
ffffffffc0204d38:	2a450513          	addi	a0,a0,676 # ffffffffc0206fd8 <etext+0xcce>
ffffffffc0204d3c:	f466                	sd	s9,40(sp)
ffffffffc0204d3e:	f3afb0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0204d42:	00002617          	auipc	a2,0x2
ffffffffc0204d46:	26e60613          	addi	a2,a2,622 # ffffffffc0206fb0 <etext+0xca6>
ffffffffc0204d4a:	06900593          	li	a1,105
ffffffffc0204d4e:	00002517          	auipc	a0,0x2
ffffffffc0204d52:	28a50513          	addi	a0,a0,650 # ffffffffc0206fd8 <etext+0xcce>
ffffffffc0204d56:	f22fb0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0204d5a:	00003617          	auipc	a2,0x3
ffffffffc0204d5e:	31e60613          	addi	a2,a2,798 # ffffffffc0208078 <etext+0x1d6e>
ffffffffc0204d62:	03200593          	li	a1,50
ffffffffc0204d66:	00003517          	auipc	a0,0x3
ffffffffc0204d6a:	32250513          	addi	a0,a0,802 # ffffffffc0208088 <etext+0x1d7e>
ffffffffc0204d6e:	f0afb0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0204d72:	00003697          	auipc	a3,0x3
ffffffffc0204d76:	2e668693          	addi	a3,a3,742 # ffffffffc0208058 <etext+0x1d4e>
ffffffffc0204d7a:	00002617          	auipc	a2,0x2
ffffffffc0204d7e:	c0e60613          	addi	a2,a2,-1010 # ffffffffc0206988 <etext+0x67e>
ffffffffc0204d82:	1a900593          	li	a1,425
ffffffffc0204d86:	00003517          	auipc	a0,0x3
ffffffffc0204d8a:	2ba50513          	addi	a0,a0,698 # ffffffffc0208040 <etext+0x1d36>
ffffffffc0204d8e:	e4d6                	sd	s5,72(sp)
ffffffffc0204d90:	e0da                	sd	s6,64(sp)
ffffffffc0204d92:	fc5e                	sd	s7,56(sp)
ffffffffc0204d94:	f466                	sd	s9,40(sp)
ffffffffc0204d96:	f06a                	sd	s10,32(sp)
ffffffffc0204d98:	ec6e                	sd	s11,24(sp)
ffffffffc0204d9a:	edefb0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0204d9e:	00002617          	auipc	a2,0x2
ffffffffc0204da2:	2ba60613          	addi	a2,a2,698 # ffffffffc0207058 <etext+0xd4e>
ffffffffc0204da6:	06e00593          	li	a1,110
ffffffffc0204daa:	00002517          	auipc	a0,0x2
ffffffffc0204dae:	22e50513          	addi	a0,a0,558 # ffffffffc0206fd8 <etext+0xcce>
ffffffffc0204db2:	ec6fb0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc0204db6 <kernel_thread>:
ffffffffc0204db6:	7129                	addi	sp,sp,-320
ffffffffc0204db8:	fa22                	sd	s0,304(sp)
ffffffffc0204dba:	f626                	sd	s1,296(sp)
ffffffffc0204dbc:	f24a                	sd	s2,288(sp)
ffffffffc0204dbe:	84ae                	mv	s1,a1
ffffffffc0204dc0:	892a                	mv	s2,a0
ffffffffc0204dc2:	8432                	mv	s0,a2
ffffffffc0204dc4:	4581                	li	a1,0
ffffffffc0204dc6:	12000613          	li	a2,288
ffffffffc0204dca:	850a                	mv	a0,sp
ffffffffc0204dcc:	fe06                	sd	ra,312(sp)
ffffffffc0204dce:	512010ef          	jal	ffffffffc02062e0 <memset>
ffffffffc0204dd2:	e0ca                	sd	s2,64(sp)
ffffffffc0204dd4:	e4a6                	sd	s1,72(sp)
ffffffffc0204dd6:	100027f3          	csrr	a5,sstatus
ffffffffc0204dda:	edd7f793          	andi	a5,a5,-291
ffffffffc0204dde:	1207e793          	ori	a5,a5,288
ffffffffc0204de2:	e23e                	sd	a5,256(sp)
ffffffffc0204de4:	860a                	mv	a2,sp
ffffffffc0204de6:	10046513          	ori	a0,s0,256
ffffffffc0204dea:	00000797          	auipc	a5,0x0
ffffffffc0204dee:	99878793          	addi	a5,a5,-1640 # ffffffffc0204782 <kernel_thread_entry>
ffffffffc0204df2:	4581                	li	a1,0
ffffffffc0204df4:	e63e                	sd	a5,264(sp)
ffffffffc0204df6:	b85ff0ef          	jal	ffffffffc020497a <do_fork>
ffffffffc0204dfa:	70f2                	ld	ra,312(sp)
ffffffffc0204dfc:	7452                	ld	s0,304(sp)
ffffffffc0204dfe:	74b2                	ld	s1,296(sp)
ffffffffc0204e00:	7912                	ld	s2,288(sp)
ffffffffc0204e02:	6131                	addi	sp,sp,320
ffffffffc0204e04:	8082                	ret

ffffffffc0204e06 <do_exit>:
ffffffffc0204e06:	7179                	addi	sp,sp,-48
ffffffffc0204e08:	f022                	sd	s0,32(sp)
ffffffffc0204e0a:	00039417          	auipc	s0,0x39
ffffffffc0204e0e:	86e40413          	addi	s0,s0,-1938 # ffffffffc023d678 <current>
ffffffffc0204e12:	601c                	ld	a5,0(s0)
ffffffffc0204e14:	f406                	sd	ra,40(sp)
ffffffffc0204e16:	00039717          	auipc	a4,0x39
ffffffffc0204e1a:	87273703          	ld	a4,-1934(a4) # ffffffffc023d688 <idleproc>
ffffffffc0204e1e:	ec26                	sd	s1,24(sp)
ffffffffc0204e20:	0ce78f63          	beq	a5,a4,ffffffffc0204efe <do_exit+0xf8>
ffffffffc0204e24:	00039497          	auipc	s1,0x39
ffffffffc0204e28:	85c48493          	addi	s1,s1,-1956 # ffffffffc023d680 <initproc>
ffffffffc0204e2c:	6098                	ld	a4,0(s1)
ffffffffc0204e2e:	e84a                	sd	s2,16(sp)
ffffffffc0204e30:	e44e                	sd	s3,8(sp)
ffffffffc0204e32:	e052                	sd	s4,0(sp)
ffffffffc0204e34:	0ee78e63          	beq	a5,a4,ffffffffc0204f30 <do_exit+0x12a>
ffffffffc0204e38:	0287b983          	ld	s3,40(a5)
ffffffffc0204e3c:	892a                	mv	s2,a0
ffffffffc0204e3e:	02098663          	beqz	s3,ffffffffc0204e6a <do_exit+0x64>
ffffffffc0204e42:	00038797          	auipc	a5,0x38
ffffffffc0204e46:	7de7b783          	ld	a5,2014(a5) # ffffffffc023d620 <boot_cr3>
ffffffffc0204e4a:	577d                	li	a4,-1
ffffffffc0204e4c:	177e                	slli	a4,a4,0x3f
ffffffffc0204e4e:	83b1                	srli	a5,a5,0xc
ffffffffc0204e50:	8fd9                	or	a5,a5,a4
ffffffffc0204e52:	18079073          	csrw	satp,a5
ffffffffc0204e56:	0309a783          	lw	a5,48(s3)
ffffffffc0204e5a:	fff7871b          	addiw	a4,a5,-1
ffffffffc0204e5e:	02e9a823          	sw	a4,48(s3)
ffffffffc0204e62:	cf4d                	beqz	a4,ffffffffc0204f1c <do_exit+0x116>
ffffffffc0204e64:	601c                	ld	a5,0(s0)
ffffffffc0204e66:	0207b423          	sd	zero,40(a5)
ffffffffc0204e6a:	601c                	ld	a5,0(s0)
ffffffffc0204e6c:	470d                	li	a4,3
ffffffffc0204e6e:	c398                	sw	a4,0(a5)
ffffffffc0204e70:	0f27a423          	sw	s2,232(a5)
ffffffffc0204e74:	100027f3          	csrr	a5,sstatus
ffffffffc0204e78:	8b89                	andi	a5,a5,2
ffffffffc0204e7a:	4a01                	li	s4,0
ffffffffc0204e7c:	e7f1                	bnez	a5,ffffffffc0204f48 <do_exit+0x142>
ffffffffc0204e7e:	6018                	ld	a4,0(s0)
ffffffffc0204e80:	800007b7          	lui	a5,0x80000
ffffffffc0204e84:	0785                	addi	a5,a5,1 # ffffffff80000001 <_binary_obj___user_matrix_out_size+0xffffffff7fffd3a1>
ffffffffc0204e86:	7308                	ld	a0,32(a4)
ffffffffc0204e88:	0ec52703          	lw	a4,236(a0)
ffffffffc0204e8c:	0cf70263          	beq	a4,a5,ffffffffc0204f50 <do_exit+0x14a>
ffffffffc0204e90:	6018                	ld	a4,0(s0)
ffffffffc0204e92:	7b7c                	ld	a5,240(a4)
ffffffffc0204e94:	c3a1                	beqz	a5,ffffffffc0204ed4 <do_exit+0xce>
ffffffffc0204e96:	800009b7          	lui	s3,0x80000
ffffffffc0204e9a:	490d                	li	s2,3
ffffffffc0204e9c:	0985                	addi	s3,s3,1 # ffffffff80000001 <_binary_obj___user_matrix_out_size+0xffffffff7fffd3a1>
ffffffffc0204e9e:	a021                	j	ffffffffc0204ea6 <do_exit+0xa0>
ffffffffc0204ea0:	6018                	ld	a4,0(s0)
ffffffffc0204ea2:	7b7c                	ld	a5,240(a4)
ffffffffc0204ea4:	cb85                	beqz	a5,ffffffffc0204ed4 <do_exit+0xce>
ffffffffc0204ea6:	1007b683          	ld	a3,256(a5)
ffffffffc0204eaa:	6088                	ld	a0,0(s1)
ffffffffc0204eac:	fb74                	sd	a3,240(a4)
ffffffffc0204eae:	7978                	ld	a4,240(a0)
ffffffffc0204eb0:	0e07bc23          	sd	zero,248(a5)
ffffffffc0204eb4:	10e7b023          	sd	a4,256(a5)
ffffffffc0204eb8:	c311                	beqz	a4,ffffffffc0204ebc <do_exit+0xb6>
ffffffffc0204eba:	ff7c                	sd	a5,248(a4)
ffffffffc0204ebc:	4398                	lw	a4,0(a5)
ffffffffc0204ebe:	f388                	sd	a0,32(a5)
ffffffffc0204ec0:	f97c                	sd	a5,240(a0)
ffffffffc0204ec2:	fd271fe3          	bne	a4,s2,ffffffffc0204ea0 <do_exit+0x9a>
ffffffffc0204ec6:	0ec52783          	lw	a5,236(a0)
ffffffffc0204eca:	fd379be3          	bne	a5,s3,ffffffffc0204ea0 <do_exit+0x9a>
ffffffffc0204ece:	4bb000ef          	jal	ffffffffc0205b88 <wakeup_proc>
ffffffffc0204ed2:	b7f9                	j	ffffffffc0204ea0 <do_exit+0x9a>
ffffffffc0204ed4:	020a1263          	bnez	s4,ffffffffc0204ef8 <do_exit+0xf2>
ffffffffc0204ed8:	5b5000ef          	jal	ffffffffc0205c8c <schedule>
ffffffffc0204edc:	601c                	ld	a5,0(s0)
ffffffffc0204ede:	00003617          	auipc	a2,0x3
ffffffffc0204ee2:	1e260613          	addi	a2,a2,482 # ffffffffc02080c0 <etext+0x1db6>
ffffffffc0204ee6:	1fc00593          	li	a1,508
ffffffffc0204eea:	43d4                	lw	a3,4(a5)
ffffffffc0204eec:	00003517          	auipc	a0,0x3
ffffffffc0204ef0:	15450513          	addi	a0,a0,340 # ffffffffc0208040 <etext+0x1d36>
ffffffffc0204ef4:	d84fb0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0204ef8:	f3cfb0ef          	jal	ffffffffc0200634 <intr_enable>
ffffffffc0204efc:	bff1                	j	ffffffffc0204ed8 <do_exit+0xd2>
ffffffffc0204efe:	00003617          	auipc	a2,0x3
ffffffffc0204f02:	1a260613          	addi	a2,a2,418 # ffffffffc02080a0 <etext+0x1d96>
ffffffffc0204f06:	1d000593          	li	a1,464
ffffffffc0204f0a:	00003517          	auipc	a0,0x3
ffffffffc0204f0e:	13650513          	addi	a0,a0,310 # ffffffffc0208040 <etext+0x1d36>
ffffffffc0204f12:	e84a                	sd	s2,16(sp)
ffffffffc0204f14:	e44e                	sd	s3,8(sp)
ffffffffc0204f16:	e052                	sd	s4,0(sp)
ffffffffc0204f18:	d60fb0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0204f1c:	854e                	mv	a0,s3
ffffffffc0204f1e:	824ff0ef          	jal	ffffffffc0203f42 <exit_mmap>
ffffffffc0204f22:	854e                	mv	a0,s3
ffffffffc0204f24:	975ff0ef          	jal	ffffffffc0204898 <put_pgdir>
ffffffffc0204f28:	854e                	mv	a0,s3
ffffffffc0204f2a:	e61fe0ef          	jal	ffffffffc0203d8a <mm_destroy>
ffffffffc0204f2e:	bf1d                	j	ffffffffc0204e64 <do_exit+0x5e>
ffffffffc0204f30:	00003617          	auipc	a2,0x3
ffffffffc0204f34:	18060613          	addi	a2,a2,384 # ffffffffc02080b0 <etext+0x1da6>
ffffffffc0204f38:	1d300593          	li	a1,467
ffffffffc0204f3c:	00003517          	auipc	a0,0x3
ffffffffc0204f40:	10450513          	addi	a0,a0,260 # ffffffffc0208040 <etext+0x1d36>
ffffffffc0204f44:	d34fb0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0204f48:	ef2fb0ef          	jal	ffffffffc020063a <intr_disable>
ffffffffc0204f4c:	4a05                	li	s4,1
ffffffffc0204f4e:	bf05                	j	ffffffffc0204e7e <do_exit+0x78>
ffffffffc0204f50:	439000ef          	jal	ffffffffc0205b88 <wakeup_proc>
ffffffffc0204f54:	bf35                	j	ffffffffc0204e90 <do_exit+0x8a>

ffffffffc0204f56 <do_wait.part.0>:
ffffffffc0204f56:	7179                	addi	sp,sp,-48
ffffffffc0204f58:	ec26                	sd	s1,24(sp)
ffffffffc0204f5a:	e84a                	sd	s2,16(sp)
ffffffffc0204f5c:	e44e                	sd	s3,8(sp)
ffffffffc0204f5e:	f406                	sd	ra,40(sp)
ffffffffc0204f60:	f022                	sd	s0,32(sp)
ffffffffc0204f62:	84aa                	mv	s1,a0
ffffffffc0204f64:	892e                	mv	s2,a1
ffffffffc0204f66:	00038997          	auipc	s3,0x38
ffffffffc0204f6a:	71298993          	addi	s3,s3,1810 # ffffffffc023d678 <current>
ffffffffc0204f6e:	c105                	beqz	a0,ffffffffc0204f8e <do_wait.part.0+0x38>
ffffffffc0204f70:	6789                	lui	a5,0x2
ffffffffc0204f72:	fff5071b          	addiw	a4,a0,-1
ffffffffc0204f76:	17f9                	addi	a5,a5,-2 # 1ffe <_binary_obj___user_hello_out_size+0x36>
ffffffffc0204f78:	2501                	sext.w	a0,a0
ffffffffc0204f7a:	12e7f363          	bgeu	a5,a4,ffffffffc02050a0 <do_wait.part.0+0x14a>
ffffffffc0204f7e:	5579                	li	a0,-2
ffffffffc0204f80:	70a2                	ld	ra,40(sp)
ffffffffc0204f82:	7402                	ld	s0,32(sp)
ffffffffc0204f84:	64e2                	ld	s1,24(sp)
ffffffffc0204f86:	6942                	ld	s2,16(sp)
ffffffffc0204f88:	69a2                	ld	s3,8(sp)
ffffffffc0204f8a:	6145                	addi	sp,sp,48
ffffffffc0204f8c:	8082                	ret
ffffffffc0204f8e:	0009b683          	ld	a3,0(s3)
ffffffffc0204f92:	7ae0                	ld	s0,240(a3)
ffffffffc0204f94:	d46d                	beqz	s0,ffffffffc0204f7e <do_wait.part.0+0x28>
ffffffffc0204f96:	470d                	li	a4,3
ffffffffc0204f98:	a021                	j	ffffffffc0204fa0 <do_wait.part.0+0x4a>
ffffffffc0204f9a:	10043403          	ld	s0,256(s0)
ffffffffc0204f9e:	cc71                	beqz	s0,ffffffffc020507a <do_wait.part.0+0x124>
ffffffffc0204fa0:	401c                	lw	a5,0(s0)
ffffffffc0204fa2:	fee79ce3          	bne	a5,a4,ffffffffc0204f9a <do_wait.part.0+0x44>
ffffffffc0204fa6:	00038797          	auipc	a5,0x38
ffffffffc0204faa:	6e27b783          	ld	a5,1762(a5) # ffffffffc023d688 <idleproc>
ffffffffc0204fae:	14878c63          	beq	a5,s0,ffffffffc0205106 <do_wait.part.0+0x1b0>
ffffffffc0204fb2:	00038797          	auipc	a5,0x38
ffffffffc0204fb6:	6ce7b783          	ld	a5,1742(a5) # ffffffffc023d680 <initproc>
ffffffffc0204fba:	14f40663          	beq	s0,a5,ffffffffc0205106 <do_wait.part.0+0x1b0>
ffffffffc0204fbe:	00090663          	beqz	s2,ffffffffc0204fca <do_wait.part.0+0x74>
ffffffffc0204fc2:	0e842783          	lw	a5,232(s0)
ffffffffc0204fc6:	00f92023          	sw	a5,0(s2)
ffffffffc0204fca:	100027f3          	csrr	a5,sstatus
ffffffffc0204fce:	8b89                	andi	a5,a5,2
ffffffffc0204fd0:	4601                	li	a2,0
ffffffffc0204fd2:	10079463          	bnez	a5,ffffffffc02050da <do_wait.part.0+0x184>
ffffffffc0204fd6:	6c74                	ld	a3,216(s0)
ffffffffc0204fd8:	7078                	ld	a4,224(s0)
ffffffffc0204fda:	10043783          	ld	a5,256(s0)
ffffffffc0204fde:	e698                	sd	a4,8(a3)
ffffffffc0204fe0:	e314                	sd	a3,0(a4)
ffffffffc0204fe2:	6474                	ld	a3,200(s0)
ffffffffc0204fe4:	6878                	ld	a4,208(s0)
ffffffffc0204fe6:	e698                	sd	a4,8(a3)
ffffffffc0204fe8:	e314                	sd	a3,0(a4)
ffffffffc0204fea:	c399                	beqz	a5,ffffffffc0204ff0 <do_wait.part.0+0x9a>
ffffffffc0204fec:	7c78                	ld	a4,248(s0)
ffffffffc0204fee:	fff8                	sd	a4,248(a5)
ffffffffc0204ff0:	7c78                	ld	a4,248(s0)
ffffffffc0204ff2:	c36d                	beqz	a4,ffffffffc02050d4 <do_wait.part.0+0x17e>
ffffffffc0204ff4:	10f73023          	sd	a5,256(a4)
ffffffffc0204ff8:	00038717          	auipc	a4,0x38
ffffffffc0204ffc:	67870713          	addi	a4,a4,1656 # ffffffffc023d670 <nr_process>
ffffffffc0205000:	431c                	lw	a5,0(a4)
ffffffffc0205002:	37fd                	addiw	a5,a5,-1
ffffffffc0205004:	c31c                	sw	a5,0(a4)
ffffffffc0205006:	e661                	bnez	a2,ffffffffc02050ce <do_wait.part.0+0x178>
ffffffffc0205008:	6814                	ld	a3,16(s0)
ffffffffc020500a:	c02007b7          	lui	a5,0xc0200
ffffffffc020500e:	0ef6e063          	bltu	a3,a5,ffffffffc02050ee <do_wait.part.0+0x198>
ffffffffc0205012:	00038797          	auipc	a5,0x38
ffffffffc0205016:	61e7b783          	ld	a5,1566(a5) # ffffffffc023d630 <va_pa_offset>
ffffffffc020501a:	8e9d                	sub	a3,a3,a5
ffffffffc020501c:	82b1                	srli	a3,a3,0xc
ffffffffc020501e:	00038797          	auipc	a5,0x38
ffffffffc0205022:	61a7b783          	ld	a5,1562(a5) # ffffffffc023d638 <npage>
ffffffffc0205026:	0ef6fc63          	bgeu	a3,a5,ffffffffc020511e <do_wait.part.0+0x1c8>
ffffffffc020502a:	00004797          	auipc	a5,0x4
ffffffffc020502e:	1067b783          	ld	a5,262(a5) # ffffffffc0209130 <nbase>
ffffffffc0205032:	8e9d                	sub	a3,a3,a5
ffffffffc0205034:	069a                	slli	a3,a3,0x6
ffffffffc0205036:	00038517          	auipc	a0,0x38
ffffffffc020503a:	60a53503          	ld	a0,1546(a0) # ffffffffc023d640 <pages>
ffffffffc020503e:	9536                	add	a0,a0,a3
ffffffffc0205040:	4589                	li	a1,2
ffffffffc0205042:	c13fc0ef          	jal	ffffffffc0201c54 <free_pages>
ffffffffc0205046:	8522                	mv	a0,s0
ffffffffc0205048:	a4ffc0ef          	jal	ffffffffc0201a96 <kfree>
ffffffffc020504c:	70a2                	ld	ra,40(sp)
ffffffffc020504e:	7402                	ld	s0,32(sp)
ffffffffc0205050:	64e2                	ld	s1,24(sp)
ffffffffc0205052:	6942                	ld	s2,16(sp)
ffffffffc0205054:	69a2                	ld	s3,8(sp)
ffffffffc0205056:	4501                	li	a0,0
ffffffffc0205058:	6145                	addi	sp,sp,48
ffffffffc020505a:	8082                	ret
ffffffffc020505c:	00038997          	auipc	s3,0x38
ffffffffc0205060:	61c98993          	addi	s3,s3,1564 # ffffffffc023d678 <current>
ffffffffc0205064:	0009b683          	ld	a3,0(s3)
ffffffffc0205068:	f4843783          	ld	a5,-184(s0)
ffffffffc020506c:	f0d799e3          	bne	a5,a3,ffffffffc0204f7e <do_wait.part.0+0x28>
ffffffffc0205070:	f2842703          	lw	a4,-216(s0)
ffffffffc0205074:	478d                	li	a5,3
ffffffffc0205076:	06f70663          	beq	a4,a5,ffffffffc02050e2 <do_wait.part.0+0x18c>
ffffffffc020507a:	800007b7          	lui	a5,0x80000
ffffffffc020507e:	0785                	addi	a5,a5,1 # ffffffff80000001 <_binary_obj___user_matrix_out_size+0xffffffff7fffd3a1>
ffffffffc0205080:	4705                	li	a4,1
ffffffffc0205082:	0ef6a623          	sw	a5,236(a3)
ffffffffc0205086:	c298                	sw	a4,0(a3)
ffffffffc0205088:	405000ef          	jal	ffffffffc0205c8c <schedule>
ffffffffc020508c:	0009b783          	ld	a5,0(s3)
ffffffffc0205090:	0b07a783          	lw	a5,176(a5)
ffffffffc0205094:	8b85                	andi	a5,a5,1
ffffffffc0205096:	eba9                	bnez	a5,ffffffffc02050e8 <do_wait.part.0+0x192>
ffffffffc0205098:	0004851b          	sext.w	a0,s1
ffffffffc020509c:	ee0489e3          	beqz	s1,ffffffffc0204f8e <do_wait.part.0+0x38>
ffffffffc02050a0:	45a9                	li	a1,10
ffffffffc02050a2:	5ab000ef          	jal	ffffffffc0205e4c <hash32>
ffffffffc02050a6:	02051793          	slli	a5,a0,0x20
ffffffffc02050aa:	01c7d513          	srli	a0,a5,0x1c
ffffffffc02050ae:	00034797          	auipc	a5,0x34
ffffffffc02050b2:	51278793          	addi	a5,a5,1298 # ffffffffc02395c0 <hash_list>
ffffffffc02050b6:	953e                	add	a0,a0,a5
ffffffffc02050b8:	842a                	mv	s0,a0
ffffffffc02050ba:	a029                	j	ffffffffc02050c4 <do_wait.part.0+0x16e>
ffffffffc02050bc:	f2c42783          	lw	a5,-212(s0)
ffffffffc02050c0:	f8978ee3          	beq	a5,s1,ffffffffc020505c <do_wait.part.0+0x106>
ffffffffc02050c4:	6400                	ld	s0,8(s0)
ffffffffc02050c6:	fe851be3          	bne	a0,s0,ffffffffc02050bc <do_wait.part.0+0x166>
ffffffffc02050ca:	5579                	li	a0,-2
ffffffffc02050cc:	bd55                	j	ffffffffc0204f80 <do_wait.part.0+0x2a>
ffffffffc02050ce:	d66fb0ef          	jal	ffffffffc0200634 <intr_enable>
ffffffffc02050d2:	bf1d                	j	ffffffffc0205008 <do_wait.part.0+0xb2>
ffffffffc02050d4:	7018                	ld	a4,32(s0)
ffffffffc02050d6:	fb7c                	sd	a5,240(a4)
ffffffffc02050d8:	b705                	j	ffffffffc0204ff8 <do_wait.part.0+0xa2>
ffffffffc02050da:	d60fb0ef          	jal	ffffffffc020063a <intr_disable>
ffffffffc02050de:	4605                	li	a2,1
ffffffffc02050e0:	bddd                	j	ffffffffc0204fd6 <do_wait.part.0+0x80>
ffffffffc02050e2:	f2840413          	addi	s0,s0,-216
ffffffffc02050e6:	b5c1                	j	ffffffffc0204fa6 <do_wait.part.0+0x50>
ffffffffc02050e8:	555d                	li	a0,-9
ffffffffc02050ea:	d1dff0ef          	jal	ffffffffc0204e06 <do_exit>
ffffffffc02050ee:	00002617          	auipc	a2,0x2
ffffffffc02050f2:	f6a60613          	addi	a2,a2,-150 # ffffffffc0207058 <etext+0xd4e>
ffffffffc02050f6:	06e00593          	li	a1,110
ffffffffc02050fa:	00002517          	auipc	a0,0x2
ffffffffc02050fe:	ede50513          	addi	a0,a0,-290 # ffffffffc0206fd8 <etext+0xcce>
ffffffffc0205102:	b76fb0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0205106:	00003617          	auipc	a2,0x3
ffffffffc020510a:	fda60613          	addi	a2,a2,-38 # ffffffffc02080e0 <etext+0x1dd6>
ffffffffc020510e:	2f900593          	li	a1,761
ffffffffc0205112:	00003517          	auipc	a0,0x3
ffffffffc0205116:	f2e50513          	addi	a0,a0,-210 # ffffffffc0208040 <etext+0x1d36>
ffffffffc020511a:	b5efb0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc020511e:	00002617          	auipc	a2,0x2
ffffffffc0205122:	f6260613          	addi	a2,a2,-158 # ffffffffc0207080 <etext+0xd76>
ffffffffc0205126:	06200593          	li	a1,98
ffffffffc020512a:	00002517          	auipc	a0,0x2
ffffffffc020512e:	eae50513          	addi	a0,a0,-338 # ffffffffc0206fd8 <etext+0xcce>
ffffffffc0205132:	b46fb0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc0205136 <init_main>:
ffffffffc0205136:	1141                	addi	sp,sp,-16
ffffffffc0205138:	e406                	sd	ra,8(sp)
ffffffffc020513a:	b5bfc0ef          	jal	ffffffffc0201c94 <nr_free_pages>
ffffffffc020513e:	8abfc0ef          	jal	ffffffffc02019e8 <kallocated>
ffffffffc0205142:	4601                	li	a2,0
ffffffffc0205144:	4581                	li	a1,0
ffffffffc0205146:	fffff517          	auipc	a0,0xfffff
ffffffffc020514a:	6d450513          	addi	a0,a0,1748 # ffffffffc020481a <user_main>
ffffffffc020514e:	c69ff0ef          	jal	ffffffffc0204db6 <kernel_thread>
ffffffffc0205152:	00a04563          	bgtz	a0,ffffffffc020515c <init_main+0x26>
ffffffffc0205156:	a071                	j	ffffffffc02051e2 <init_main+0xac>
ffffffffc0205158:	335000ef          	jal	ffffffffc0205c8c <schedule>
ffffffffc020515c:	4581                	li	a1,0
ffffffffc020515e:	4501                	li	a0,0
ffffffffc0205160:	df7ff0ef          	jal	ffffffffc0204f56 <do_wait.part.0>
ffffffffc0205164:	d975                	beqz	a0,ffffffffc0205158 <init_main+0x22>
ffffffffc0205166:	00003517          	auipc	a0,0x3
ffffffffc020516a:	fba50513          	addi	a0,a0,-70 # ffffffffc0208120 <etext+0x1e16>
ffffffffc020516e:	816fb0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0205172:	00038797          	auipc	a5,0x38
ffffffffc0205176:	50e7b783          	ld	a5,1294(a5) # ffffffffc023d680 <initproc>
ffffffffc020517a:	7bf8                	ld	a4,240(a5)
ffffffffc020517c:	e339                	bnez	a4,ffffffffc02051c2 <init_main+0x8c>
ffffffffc020517e:	7ff8                	ld	a4,248(a5)
ffffffffc0205180:	e329                	bnez	a4,ffffffffc02051c2 <init_main+0x8c>
ffffffffc0205182:	1007b703          	ld	a4,256(a5)
ffffffffc0205186:	ef15                	bnez	a4,ffffffffc02051c2 <init_main+0x8c>
ffffffffc0205188:	00038697          	auipc	a3,0x38
ffffffffc020518c:	4e86a683          	lw	a3,1256(a3) # ffffffffc023d670 <nr_process>
ffffffffc0205190:	4709                	li	a4,2
ffffffffc0205192:	0ae69463          	bne	a3,a4,ffffffffc020523a <init_main+0x104>
ffffffffc0205196:	00038697          	auipc	a3,0x38
ffffffffc020519a:	42a68693          	addi	a3,a3,1066 # ffffffffc023d5c0 <proc_list>
ffffffffc020519e:	6698                	ld	a4,8(a3)
ffffffffc02051a0:	0c878793          	addi	a5,a5,200
ffffffffc02051a4:	06f71b63          	bne	a4,a5,ffffffffc020521a <init_main+0xe4>
ffffffffc02051a8:	629c                	ld	a5,0(a3)
ffffffffc02051aa:	04f71863          	bne	a4,a5,ffffffffc02051fa <init_main+0xc4>
ffffffffc02051ae:	00003517          	auipc	a0,0x3
ffffffffc02051b2:	05a50513          	addi	a0,a0,90 # ffffffffc0208208 <etext+0x1efe>
ffffffffc02051b6:	fcffa0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc02051ba:	60a2                	ld	ra,8(sp)
ffffffffc02051bc:	4501                	li	a0,0
ffffffffc02051be:	0141                	addi	sp,sp,16
ffffffffc02051c0:	8082                	ret
ffffffffc02051c2:	00003697          	auipc	a3,0x3
ffffffffc02051c6:	f8668693          	addi	a3,a3,-122 # ffffffffc0208148 <etext+0x1e3e>
ffffffffc02051ca:	00001617          	auipc	a2,0x1
ffffffffc02051ce:	7be60613          	addi	a2,a2,1982 # ffffffffc0206988 <etext+0x67e>
ffffffffc02051d2:	35d00593          	li	a1,861
ffffffffc02051d6:	00003517          	auipc	a0,0x3
ffffffffc02051da:	e6a50513          	addi	a0,a0,-406 # ffffffffc0208040 <etext+0x1d36>
ffffffffc02051de:	a9afb0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02051e2:	00003617          	auipc	a2,0x3
ffffffffc02051e6:	f1e60613          	addi	a2,a2,-226 # ffffffffc0208100 <etext+0x1df6>
ffffffffc02051ea:	35500593          	li	a1,853
ffffffffc02051ee:	00003517          	auipc	a0,0x3
ffffffffc02051f2:	e5250513          	addi	a0,a0,-430 # ffffffffc0208040 <etext+0x1d36>
ffffffffc02051f6:	a82fb0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02051fa:	00003697          	auipc	a3,0x3
ffffffffc02051fe:	fde68693          	addi	a3,a3,-34 # ffffffffc02081d8 <etext+0x1ece>
ffffffffc0205202:	00001617          	auipc	a2,0x1
ffffffffc0205206:	78660613          	addi	a2,a2,1926 # ffffffffc0206988 <etext+0x67e>
ffffffffc020520a:	36000593          	li	a1,864
ffffffffc020520e:	00003517          	auipc	a0,0x3
ffffffffc0205212:	e3250513          	addi	a0,a0,-462 # ffffffffc0208040 <etext+0x1d36>
ffffffffc0205216:	a62fb0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc020521a:	00003697          	auipc	a3,0x3
ffffffffc020521e:	f8e68693          	addi	a3,a3,-114 # ffffffffc02081a8 <etext+0x1e9e>
ffffffffc0205222:	00001617          	auipc	a2,0x1
ffffffffc0205226:	76660613          	addi	a2,a2,1894 # ffffffffc0206988 <etext+0x67e>
ffffffffc020522a:	35f00593          	li	a1,863
ffffffffc020522e:	00003517          	auipc	a0,0x3
ffffffffc0205232:	e1250513          	addi	a0,a0,-494 # ffffffffc0208040 <etext+0x1d36>
ffffffffc0205236:	a42fb0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc020523a:	00003697          	auipc	a3,0x3
ffffffffc020523e:	f5e68693          	addi	a3,a3,-162 # ffffffffc0208198 <etext+0x1e8e>
ffffffffc0205242:	00001617          	auipc	a2,0x1
ffffffffc0205246:	74660613          	addi	a2,a2,1862 # ffffffffc0206988 <etext+0x67e>
ffffffffc020524a:	35e00593          	li	a1,862
ffffffffc020524e:	00003517          	auipc	a0,0x3
ffffffffc0205252:	df250513          	addi	a0,a0,-526 # ffffffffc0208040 <etext+0x1d36>
ffffffffc0205256:	a22fb0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc020525a <do_execve>:
ffffffffc020525a:	7171                	addi	sp,sp,-176
ffffffffc020525c:	e4ee                	sd	s11,72(sp)
ffffffffc020525e:	00038d97          	auipc	s11,0x38
ffffffffc0205262:	41ad8d93          	addi	s11,s11,1050 # ffffffffc023d678 <current>
ffffffffc0205266:	000db783          	ld	a5,0(s11)
ffffffffc020526a:	e54e                	sd	s3,136(sp)
ffffffffc020526c:	ed26                	sd	s1,152(sp)
ffffffffc020526e:	0287b983          	ld	s3,40(a5)
ffffffffc0205272:	e94a                	sd	s2,144(sp)
ffffffffc0205274:	fcd6                	sd	s5,120(sp)
ffffffffc0205276:	892a                	mv	s2,a0
ffffffffc0205278:	84ae                	mv	s1,a1
ffffffffc020527a:	8ab2                	mv	s5,a2
ffffffffc020527c:	4681                	li	a3,0
ffffffffc020527e:	862e                	mv	a2,a1
ffffffffc0205280:	85aa                	mv	a1,a0
ffffffffc0205282:	854e                	mv	a0,s3
ffffffffc0205284:	f506                	sd	ra,168(sp)
ffffffffc0205286:	b08ff0ef          	jal	ffffffffc020458e <user_mem_check>
ffffffffc020528a:	46050163          	beqz	a0,ffffffffc02056ec <do_execve+0x492>
ffffffffc020528e:	4641                	li	a2,16
ffffffffc0205290:	4581                	li	a1,0
ffffffffc0205292:	1808                	addi	a0,sp,48
ffffffffc0205294:	04c010ef          	jal	ffffffffc02062e0 <memset>
ffffffffc0205298:	47bd                	li	a5,15
ffffffffc020529a:	8626                	mv	a2,s1
ffffffffc020529c:	1097e263          	bltu	a5,s1,ffffffffc02053a0 <do_execve+0x146>
ffffffffc02052a0:	85ca                	mv	a1,s2
ffffffffc02052a2:	1808                	addi	a0,sp,48
ffffffffc02052a4:	04e010ef          	jal	ffffffffc02062f2 <memcpy>
ffffffffc02052a8:	10098363          	beqz	s3,ffffffffc02053ae <do_execve+0x154>
ffffffffc02052ac:	00002517          	auipc	a0,0x2
ffffffffc02052b0:	43450513          	addi	a0,a0,1076 # ffffffffc02076e0 <etext+0x13d6>
ffffffffc02052b4:	f07fa0ef          	jal	ffffffffc02001ba <cputs>
ffffffffc02052b8:	00038797          	auipc	a5,0x38
ffffffffc02052bc:	3687b783          	ld	a5,872(a5) # ffffffffc023d620 <boot_cr3>
ffffffffc02052c0:	577d                	li	a4,-1
ffffffffc02052c2:	177e                	slli	a4,a4,0x3f
ffffffffc02052c4:	83b1                	srli	a5,a5,0xc
ffffffffc02052c6:	8fd9                	or	a5,a5,a4
ffffffffc02052c8:	18079073          	csrw	satp,a5
ffffffffc02052cc:	0309a783          	lw	a5,48(s3)
ffffffffc02052d0:	fff7871b          	addiw	a4,a5,-1
ffffffffc02052d4:	02e9a823          	sw	a4,48(s3)
ffffffffc02052d8:	2e070663          	beqz	a4,ffffffffc02055c4 <do_execve+0x36a>
ffffffffc02052dc:	000db783          	ld	a5,0(s11)
ffffffffc02052e0:	0207b423          	sd	zero,40(a5)
ffffffffc02052e4:	921fe0ef          	jal	ffffffffc0203c04 <mm_create>
ffffffffc02052e8:	84aa                	mv	s1,a0
ffffffffc02052ea:	20050463          	beqz	a0,ffffffffc02054f2 <do_execve+0x298>
ffffffffc02052ee:	4505                	li	a0,1
ffffffffc02052f0:	8d5fc0ef          	jal	ffffffffc0201bc4 <alloc_pages>
ffffffffc02052f4:	40050063          	beqz	a0,ffffffffc02056f4 <do_execve+0x49a>
ffffffffc02052f8:	e8ea                	sd	s10,80(sp)
ffffffffc02052fa:	00038d17          	auipc	s10,0x38
ffffffffc02052fe:	346d0d13          	addi	s10,s10,838 # ffffffffc023d640 <pages>
ffffffffc0205302:	000d3783          	ld	a5,0(s10)
ffffffffc0205306:	ece6                	sd	s9,88(sp)
ffffffffc0205308:	00038c97          	auipc	s9,0x38
ffffffffc020530c:	330c8c93          	addi	s9,s9,816 # ffffffffc023d638 <npage>
ffffffffc0205310:	40f506b3          	sub	a3,a0,a5
ffffffffc0205314:	00004717          	auipc	a4,0x4
ffffffffc0205318:	e1c73703          	ld	a4,-484(a4) # ffffffffc0209130 <nbase>
ffffffffc020531c:	f4de                	sd	s7,104(sp)
ffffffffc020531e:	8699                	srai	a3,a3,0x6
ffffffffc0205320:	5bfd                	li	s7,-1
ffffffffc0205322:	000cb783          	ld	a5,0(s9)
ffffffffc0205326:	96ba                	add	a3,a3,a4
ffffffffc0205328:	e83a                	sd	a4,16(sp)
ffffffffc020532a:	00cbd713          	srli	a4,s7,0xc
ffffffffc020532e:	f03a                	sd	a4,32(sp)
ffffffffc0205330:	8f75                	and	a4,a4,a3
ffffffffc0205332:	06b2                	slli	a3,a3,0xc
ffffffffc0205334:	3ef77363          	bgeu	a4,a5,ffffffffc020571a <do_execve+0x4c0>
ffffffffc0205338:	f8da                	sd	s6,112(sp)
ffffffffc020533a:	00038b17          	auipc	s6,0x38
ffffffffc020533e:	2f6b0b13          	addi	s6,s6,758 # ffffffffc023d630 <va_pa_offset>
ffffffffc0205342:	000b3783          	ld	a5,0(s6)
ffffffffc0205346:	6605                	lui	a2,0x1
ffffffffc0205348:	00038597          	auipc	a1,0x38
ffffffffc020534c:	2e05b583          	ld	a1,736(a1) # ffffffffc023d628 <boot_pgdir>
ffffffffc0205350:	00f68933          	add	s2,a3,a5
ffffffffc0205354:	854a                	mv	a0,s2
ffffffffc0205356:	e152                	sd	s4,128(sp)
ffffffffc0205358:	79b000ef          	jal	ffffffffc02062f2 <memcpy>
ffffffffc020535c:	000aa703          	lw	a4,0(s5)
ffffffffc0205360:	464c47b7          	lui	a5,0x464c4
ffffffffc0205364:	0124bc23          	sd	s2,24(s1)
ffffffffc0205368:	57f78793          	addi	a5,a5,1407 # 464c457f <_binary_obj___user_matrix_out_size+0x464c191f>
ffffffffc020536c:	020aba03          	ld	s4,32(s5)
ffffffffc0205370:	06f70663          	beq	a4,a5,ffffffffc02053dc <do_execve+0x182>
ffffffffc0205374:	5961                	li	s2,-8
ffffffffc0205376:	8526                	mv	a0,s1
ffffffffc0205378:	d20ff0ef          	jal	ffffffffc0204898 <put_pgdir>
ffffffffc020537c:	6a0a                	ld	s4,128(sp)
ffffffffc020537e:	7b46                	ld	s6,112(sp)
ffffffffc0205380:	7ba6                	ld	s7,104(sp)
ffffffffc0205382:	6ce6                	ld	s9,88(sp)
ffffffffc0205384:	6d46                	ld	s10,80(sp)
ffffffffc0205386:	8526                	mv	a0,s1
ffffffffc0205388:	a03fe0ef          	jal	ffffffffc0203d8a <mm_destroy>
ffffffffc020538c:	854a                	mv	a0,s2
ffffffffc020538e:	f122                	sd	s0,160(sp)
ffffffffc0205390:	e152                	sd	s4,128(sp)
ffffffffc0205392:	f8da                	sd	s6,112(sp)
ffffffffc0205394:	f4de                	sd	s7,104(sp)
ffffffffc0205396:	f0e2                	sd	s8,96(sp)
ffffffffc0205398:	ece6                	sd	s9,88(sp)
ffffffffc020539a:	e8ea                	sd	s10,80(sp)
ffffffffc020539c:	a6bff0ef          	jal	ffffffffc0204e06 <do_exit>
ffffffffc02053a0:	463d                	li	a2,15
ffffffffc02053a2:	85ca                	mv	a1,s2
ffffffffc02053a4:	1808                	addi	a0,sp,48
ffffffffc02053a6:	74d000ef          	jal	ffffffffc02062f2 <memcpy>
ffffffffc02053aa:	f00991e3          	bnez	s3,ffffffffc02052ac <do_execve+0x52>
ffffffffc02053ae:	000db783          	ld	a5,0(s11)
ffffffffc02053b2:	779c                	ld	a5,40(a5)
ffffffffc02053b4:	db85                	beqz	a5,ffffffffc02052e4 <do_execve+0x8a>
ffffffffc02053b6:	00003617          	auipc	a2,0x3
ffffffffc02053ba:	e7260613          	addi	a2,a2,-398 # ffffffffc0208228 <etext+0x1f1e>
ffffffffc02053be:	20600593          	li	a1,518
ffffffffc02053c2:	00003517          	auipc	a0,0x3
ffffffffc02053c6:	c7e50513          	addi	a0,a0,-898 # ffffffffc0208040 <etext+0x1d36>
ffffffffc02053ca:	f122                	sd	s0,160(sp)
ffffffffc02053cc:	e152                	sd	s4,128(sp)
ffffffffc02053ce:	f8da                	sd	s6,112(sp)
ffffffffc02053d0:	f4de                	sd	s7,104(sp)
ffffffffc02053d2:	f0e2                	sd	s8,96(sp)
ffffffffc02053d4:	ece6                	sd	s9,88(sp)
ffffffffc02053d6:	e8ea                	sd	s10,80(sp)
ffffffffc02053d8:	8a0fb0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02053dc:	038ad703          	lhu	a4,56(s5)
ffffffffc02053e0:	9a56                	add	s4,s4,s5
ffffffffc02053e2:	f122                	sd	s0,160(sp)
ffffffffc02053e4:	00371793          	slli	a5,a4,0x3
ffffffffc02053e8:	8f99                	sub	a5,a5,a4
ffffffffc02053ea:	078e                	slli	a5,a5,0x3
ffffffffc02053ec:	97d2                	add	a5,a5,s4
ffffffffc02053ee:	f43e                	sd	a5,40(sp)
ffffffffc02053f0:	00fa7e63          	bgeu	s4,a5,ffffffffc020540c <do_execve+0x1b2>
ffffffffc02053f4:	f0e2                	sd	s8,96(sp)
ffffffffc02053f6:	000a2783          	lw	a5,0(s4) # 1000 <_binary_obj___user_faultread_out_size-0xef0>
ffffffffc02053fa:	4705                	li	a4,1
ffffffffc02053fc:	0ee78d63          	beq	a5,a4,ffffffffc02054f6 <do_execve+0x29c>
ffffffffc0205400:	77a2                	ld	a5,40(sp)
ffffffffc0205402:	038a0a13          	addi	s4,s4,56
ffffffffc0205406:	fefa68e3          	bltu	s4,a5,ffffffffc02053f6 <do_execve+0x19c>
ffffffffc020540a:	7c06                	ld	s8,96(sp)
ffffffffc020540c:	4701                	li	a4,0
ffffffffc020540e:	46ad                	li	a3,11
ffffffffc0205410:	00100637          	lui	a2,0x100
ffffffffc0205414:	7ff005b7          	lui	a1,0x7ff00
ffffffffc0205418:	8526                	mv	a0,s1
ffffffffc020541a:	9c3fe0ef          	jal	ffffffffc0203ddc <mm_map>
ffffffffc020541e:	892a                	mv	s2,a0
ffffffffc0205420:	18051d63          	bnez	a0,ffffffffc02055ba <do_execve+0x360>
ffffffffc0205424:	6c88                	ld	a0,24(s1)
ffffffffc0205426:	467d                	li	a2,31
ffffffffc0205428:	7ffff5b7          	lui	a1,0x7ffff
ffffffffc020542c:	aa9fd0ef          	jal	ffffffffc0202ed4 <pgdir_alloc_page>
ffffffffc0205430:	38050563          	beqz	a0,ffffffffc02057ba <do_execve+0x560>
ffffffffc0205434:	6c88                	ld	a0,24(s1)
ffffffffc0205436:	467d                	li	a2,31
ffffffffc0205438:	7fffe5b7          	lui	a1,0x7fffe
ffffffffc020543c:	a99fd0ef          	jal	ffffffffc0202ed4 <pgdir_alloc_page>
ffffffffc0205440:	34050c63          	beqz	a0,ffffffffc0205798 <do_execve+0x53e>
ffffffffc0205444:	6c88                	ld	a0,24(s1)
ffffffffc0205446:	467d                	li	a2,31
ffffffffc0205448:	7fffd5b7          	lui	a1,0x7fffd
ffffffffc020544c:	a89fd0ef          	jal	ffffffffc0202ed4 <pgdir_alloc_page>
ffffffffc0205450:	32050363          	beqz	a0,ffffffffc0205776 <do_execve+0x51c>
ffffffffc0205454:	6c88                	ld	a0,24(s1)
ffffffffc0205456:	467d                	li	a2,31
ffffffffc0205458:	7fffc5b7          	lui	a1,0x7fffc
ffffffffc020545c:	a79fd0ef          	jal	ffffffffc0202ed4 <pgdir_alloc_page>
ffffffffc0205460:	2e050a63          	beqz	a0,ffffffffc0205754 <do_execve+0x4fa>
ffffffffc0205464:	589c                	lw	a5,48(s1)
ffffffffc0205466:	000db603          	ld	a2,0(s11)
ffffffffc020546a:	6c94                	ld	a3,24(s1)
ffffffffc020546c:	2785                	addiw	a5,a5,1
ffffffffc020546e:	d89c                	sw	a5,48(s1)
ffffffffc0205470:	f604                	sd	s1,40(a2)
ffffffffc0205472:	c02007b7          	lui	a5,0xc0200
ffffffffc0205476:	2cf6e263          	bltu	a3,a5,ffffffffc020573a <do_execve+0x4e0>
ffffffffc020547a:	000b3783          	ld	a5,0(s6)
ffffffffc020547e:	577d                	li	a4,-1
ffffffffc0205480:	177e                	slli	a4,a4,0x3f
ffffffffc0205482:	8e9d                	sub	a3,a3,a5
ffffffffc0205484:	00c6d793          	srli	a5,a3,0xc
ffffffffc0205488:	f654                	sd	a3,168(a2)
ffffffffc020548a:	8fd9                	or	a5,a5,a4
ffffffffc020548c:	18079073          	csrw	satp,a5
ffffffffc0205490:	7240                	ld	s0,160(a2)
ffffffffc0205492:	4581                	li	a1,0
ffffffffc0205494:	12000613          	li	a2,288
ffffffffc0205498:	8522                	mv	a0,s0
ffffffffc020549a:	10043983          	ld	s3,256(s0)
ffffffffc020549e:	643000ef          	jal	ffffffffc02062e0 <memset>
ffffffffc02054a2:	000db483          	ld	s1,0(s11)
ffffffffc02054a6:	018ab703          	ld	a4,24(s5)
ffffffffc02054aa:	4785                	li	a5,1
ffffffffc02054ac:	07fe                	slli	a5,a5,0x1f
ffffffffc02054ae:	0b448493          	addi	s1,s1,180
ffffffffc02054b2:	edf9f993          	andi	s3,s3,-289
ffffffffc02054b6:	e81c                	sd	a5,16(s0)
ffffffffc02054b8:	10e43423          	sd	a4,264(s0)
ffffffffc02054bc:	11343023          	sd	s3,256(s0)
ffffffffc02054c0:	4641                	li	a2,16
ffffffffc02054c2:	4581                	li	a1,0
ffffffffc02054c4:	8526                	mv	a0,s1
ffffffffc02054c6:	61b000ef          	jal	ffffffffc02062e0 <memset>
ffffffffc02054ca:	463d                	li	a2,15
ffffffffc02054cc:	180c                	addi	a1,sp,48
ffffffffc02054ce:	8526                	mv	a0,s1
ffffffffc02054d0:	623000ef          	jal	ffffffffc02062f2 <memcpy>
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
ffffffffc02054f4:	bd61                	j	ffffffffc020538c <do_execve+0x132>
ffffffffc02054f6:	028a3603          	ld	a2,40(s4)
ffffffffc02054fa:	020a3783          	ld	a5,32(s4)
ffffffffc02054fe:	1ef66f63          	bltu	a2,a5,ffffffffc02056fc <do_execve+0x4a2>
ffffffffc0205502:	004a2783          	lw	a5,4(s4)
ffffffffc0205506:	0017f693          	andi	a3,a5,1
ffffffffc020550a:	0027f593          	andi	a1,a5,2
ffffffffc020550e:	0026971b          	slliw	a4,a3,0x2
ffffffffc0205512:	8b91                	andi	a5,a5,4
ffffffffc0205514:	068a                	slli	a3,a3,0x2
ffffffffc0205516:	e1e9                	bnez	a1,ffffffffc02055d8 <do_execve+0x37e>
ffffffffc0205518:	1a079b63          	bnez	a5,ffffffffc02056ce <do_execve+0x474>
ffffffffc020551c:	47c5                	li	a5,17
ffffffffc020551e:	ec3e                	sd	a5,24(sp)
ffffffffc0205520:	0046f793          	andi	a5,a3,4
ffffffffc0205524:	c789                	beqz	a5,ffffffffc020552e <do_execve+0x2d4>
ffffffffc0205526:	67e2                	ld	a5,24(sp)
ffffffffc0205528:	0087e793          	ori	a5,a5,8
ffffffffc020552c:	ec3e                	sd	a5,24(sp)
ffffffffc020552e:	010a3583          	ld	a1,16(s4)
ffffffffc0205532:	4701                	li	a4,0
ffffffffc0205534:	8526                	mv	a0,s1
ffffffffc0205536:	8a7fe0ef          	jal	ffffffffc0203ddc <mm_map>
ffffffffc020553a:	892a                	mv	s2,a0
ffffffffc020553c:	1a051e63          	bnez	a0,ffffffffc02056f8 <do_execve+0x49e>
ffffffffc0205540:	010a3c03          	ld	s8,16(s4)
ffffffffc0205544:	020a3903          	ld	s2,32(s4)
ffffffffc0205548:	008a3983          	ld	s3,8(s4)
ffffffffc020554c:	77fd                	lui	a5,0xfffff
ffffffffc020554e:	9962                	add	s2,s2,s8
ffffffffc0205550:	00fc7bb3          	and	s7,s8,a5
ffffffffc0205554:	99d6                	add	s3,s3,s5
ffffffffc0205556:	052c6963          	bltu	s8,s2,ffffffffc02055a8 <do_execve+0x34e>
ffffffffc020555a:	aa59                	j	ffffffffc02056f0 <do_execve+0x496>
ffffffffc020555c:	6785                	lui	a5,0x1
ffffffffc020555e:	417c0533          	sub	a0,s8,s7
ffffffffc0205562:	9bbe                	add	s7,s7,a5
ffffffffc0205564:	41890633          	sub	a2,s2,s8
ffffffffc0205568:	01796463          	bltu	s2,s7,ffffffffc0205570 <do_execve+0x316>
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
ffffffffc020558a:	16b87c63          	bgeu	a6,a1,ffffffffc0205702 <do_execve+0x4a8>
ffffffffc020558e:	000b3803          	ld	a6,0(s6)
ffffffffc0205592:	85ce                	mv	a1,s3
ffffffffc0205594:	e432                	sd	a2,8(sp)
ffffffffc0205596:	96c2                	add	a3,a3,a6
ffffffffc0205598:	9536                	add	a0,a0,a3
ffffffffc020559a:	559000ef          	jal	ffffffffc02062f2 <memcpy>
ffffffffc020559e:	6622                	ld	a2,8(sp)
ffffffffc02055a0:	9c32                	add	s8,s8,a2
ffffffffc02055a2:	99b2                	add	s3,s3,a2
ffffffffc02055a4:	052c7363          	bgeu	s8,s2,ffffffffc02055ea <do_execve+0x390>
ffffffffc02055a8:	6c88                	ld	a0,24(s1)
ffffffffc02055aa:	6662                	ld	a2,24(sp)
ffffffffc02055ac:	85de                	mv	a1,s7
ffffffffc02055ae:	927fd0ef          	jal	ffffffffc0202ed4 <pgdir_alloc_page>
ffffffffc02055b2:	842a                	mv	s0,a0
ffffffffc02055b4:	f545                	bnez	a0,ffffffffc020555c <do_execve+0x302>
ffffffffc02055b6:	7c06                	ld	s8,96(sp)
ffffffffc02055b8:	5971                	li	s2,-4
ffffffffc02055ba:	8526                	mv	a0,s1
ffffffffc02055bc:	987fe0ef          	jal	ffffffffc0203f42 <exit_mmap>
ffffffffc02055c0:	740a                	ld	s0,160(sp)
ffffffffc02055c2:	bb55                	j	ffffffffc0205376 <do_execve+0x11c>
ffffffffc02055c4:	854e                	mv	a0,s3
ffffffffc02055c6:	97dfe0ef          	jal	ffffffffc0203f42 <exit_mmap>
ffffffffc02055ca:	854e                	mv	a0,s3
ffffffffc02055cc:	accff0ef          	jal	ffffffffc0204898 <put_pgdir>
ffffffffc02055d0:	854e                	mv	a0,s3
ffffffffc02055d2:	fb8fe0ef          	jal	ffffffffc0203d8a <mm_destroy>
ffffffffc02055d6:	b319                	j	ffffffffc02052dc <do_execve+0x82>
ffffffffc02055d8:	10079263          	bnez	a5,ffffffffc02056dc <do_execve+0x482>
ffffffffc02055dc:	00276713          	ori	a4,a4,2
ffffffffc02055e0:	0007069b          	sext.w	a3,a4
ffffffffc02055e4:	47dd                	li	a5,23
ffffffffc02055e6:	ec3e                	sd	a5,24(sp)
ffffffffc02055e8:	bf25                	j	ffffffffc0205520 <do_execve+0x2c6>
ffffffffc02055ea:	010a3903          	ld	s2,16(s4)
ffffffffc02055ee:	028a3683          	ld	a3,40(s4)
ffffffffc02055f2:	9936                	add	s2,s2,a3
ffffffffc02055f4:	077c7a63          	bgeu	s8,s7,ffffffffc0205668 <do_execve+0x40e>
ffffffffc02055f8:	e18904e3          	beq	s2,s8,ffffffffc0205400 <do_execve+0x1a6>
ffffffffc02055fc:	6505                	lui	a0,0x1
ffffffffc02055fe:	9562                	add	a0,a0,s8
ffffffffc0205600:	41750533          	sub	a0,a0,s7
ffffffffc0205604:	418909b3          	sub	s3,s2,s8
ffffffffc0205608:	0d797f63          	bgeu	s2,s7,ffffffffc02056e6 <do_execve+0x48c>
ffffffffc020560c:	000d3683          	ld	a3,0(s10)
ffffffffc0205610:	67c2                	ld	a5,16(sp)
ffffffffc0205612:	000cb603          	ld	a2,0(s9)
ffffffffc0205616:	40d406b3          	sub	a3,s0,a3
ffffffffc020561a:	8699                	srai	a3,a3,0x6
ffffffffc020561c:	96be                	add	a3,a3,a5
ffffffffc020561e:	00c69593          	slli	a1,a3,0xc
ffffffffc0205622:	81b1                	srli	a1,a1,0xc
ffffffffc0205624:	06b2                	slli	a3,a3,0xc
ffffffffc0205626:	0cc5fe63          	bgeu	a1,a2,ffffffffc0205702 <do_execve+0x4a8>
ffffffffc020562a:	000b3803          	ld	a6,0(s6)
ffffffffc020562e:	864e                	mv	a2,s3
ffffffffc0205630:	4581                	li	a1,0
ffffffffc0205632:	96c2                	add	a3,a3,a6
ffffffffc0205634:	9536                	add	a0,a0,a3
ffffffffc0205636:	4ab000ef          	jal	ffffffffc02062e0 <memset>
ffffffffc020563a:	9c4e                	add	s8,s8,s3
ffffffffc020563c:	03797463          	bgeu	s2,s7,ffffffffc0205664 <do_execve+0x40a>
ffffffffc0205640:	dd8900e3          	beq	s2,s8,ffffffffc0205400 <do_execve+0x1a6>
ffffffffc0205644:	00003697          	auipc	a3,0x3
ffffffffc0205648:	c0c68693          	addi	a3,a3,-1012 # ffffffffc0208250 <etext+0x1f46>
ffffffffc020564c:	00001617          	auipc	a2,0x1
ffffffffc0205650:	33c60613          	addi	a2,a2,828 # ffffffffc0206988 <etext+0x67e>
ffffffffc0205654:	25b00593          	li	a1,603
ffffffffc0205658:	00003517          	auipc	a0,0x3
ffffffffc020565c:	9e850513          	addi	a0,a0,-1560 # ffffffffc0208040 <etext+0x1d36>
ffffffffc0205660:	e19fa0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0205664:	ff8b90e3          	bne	s7,s8,ffffffffc0205644 <do_execve+0x3ea>
ffffffffc0205668:	d92c7ce3          	bgeu	s8,s2,ffffffffc0205400 <do_execve+0x1a6>
ffffffffc020566c:	56fd                	li	a3,-1
ffffffffc020566e:	00c6d793          	srli	a5,a3,0xc
ffffffffc0205672:	e43e                	sd	a5,8(sp)
ffffffffc0205674:	a0a9                	j	ffffffffc02056be <do_execve+0x464>
ffffffffc0205676:	6785                	lui	a5,0x1
ffffffffc0205678:	417c0533          	sub	a0,s8,s7
ffffffffc020567c:	9bbe                	add	s7,s7,a5
ffffffffc020567e:	418909b3          	sub	s3,s2,s8
ffffffffc0205682:	01796463          	bltu	s2,s7,ffffffffc020568a <do_execve+0x430>
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
ffffffffc02056a4:	04b87f63          	bgeu	a6,a1,ffffffffc0205702 <do_execve+0x4a8>
ffffffffc02056a8:	000b3803          	ld	a6,0(s6)
ffffffffc02056ac:	864e                	mv	a2,s3
ffffffffc02056ae:	4581                	li	a1,0
ffffffffc02056b0:	96c2                	add	a3,a3,a6
ffffffffc02056b2:	9536                	add	a0,a0,a3
ffffffffc02056b4:	9c4e                	add	s8,s8,s3
ffffffffc02056b6:	42b000ef          	jal	ffffffffc02062e0 <memset>
ffffffffc02056ba:	d52c73e3          	bgeu	s8,s2,ffffffffc0205400 <do_execve+0x1a6>
ffffffffc02056be:	6c88                	ld	a0,24(s1)
ffffffffc02056c0:	6662                	ld	a2,24(sp)
ffffffffc02056c2:	85de                	mv	a1,s7
ffffffffc02056c4:	811fd0ef          	jal	ffffffffc0202ed4 <pgdir_alloc_page>
ffffffffc02056c8:	842a                	mv	s0,a0
ffffffffc02056ca:	f555                	bnez	a0,ffffffffc0205676 <do_execve+0x41c>
ffffffffc02056cc:	b5ed                	j	ffffffffc02055b6 <do_execve+0x35c>
ffffffffc02056ce:	00176713          	ori	a4,a4,1
ffffffffc02056d2:	47cd                	li	a5,19
ffffffffc02056d4:	0007069b          	sext.w	a3,a4
ffffffffc02056d8:	ec3e                	sd	a5,24(sp)
ffffffffc02056da:	b599                	j	ffffffffc0205520 <do_execve+0x2c6>
ffffffffc02056dc:	00376713          	ori	a4,a4,3
ffffffffc02056e0:	0007069b          	sext.w	a3,a4
ffffffffc02056e4:	b701                	j	ffffffffc02055e4 <do_execve+0x38a>
ffffffffc02056e6:	418b89b3          	sub	s3,s7,s8
ffffffffc02056ea:	b70d                	j	ffffffffc020560c <do_execve+0x3b2>
ffffffffc02056ec:	5975                	li	s2,-3
ffffffffc02056ee:	bbcd                	j	ffffffffc02054e0 <do_execve+0x286>
ffffffffc02056f0:	8962                	mv	s2,s8
ffffffffc02056f2:	bdf5                	j	ffffffffc02055ee <do_execve+0x394>
ffffffffc02056f4:	5971                	li	s2,-4
ffffffffc02056f6:	b941                	j	ffffffffc0205386 <do_execve+0x12c>
ffffffffc02056f8:	7c06                	ld	s8,96(sp)
ffffffffc02056fa:	b5c1                	j	ffffffffc02055ba <do_execve+0x360>
ffffffffc02056fc:	7c06                	ld	s8,96(sp)
ffffffffc02056fe:	5961                	li	s2,-8
ffffffffc0205700:	bd6d                	j	ffffffffc02055ba <do_execve+0x360>
ffffffffc0205702:	00002617          	auipc	a2,0x2
ffffffffc0205706:	8ae60613          	addi	a2,a2,-1874 # ffffffffc0206fb0 <etext+0xca6>
ffffffffc020570a:	06900593          	li	a1,105
ffffffffc020570e:	00002517          	auipc	a0,0x2
ffffffffc0205712:	8ca50513          	addi	a0,a0,-1846 # ffffffffc0206fd8 <etext+0xcce>
ffffffffc0205716:	d63fa0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc020571a:	00002617          	auipc	a2,0x2
ffffffffc020571e:	89660613          	addi	a2,a2,-1898 # ffffffffc0206fb0 <etext+0xca6>
ffffffffc0205722:	06900593          	li	a1,105
ffffffffc0205726:	00002517          	auipc	a0,0x2
ffffffffc020572a:	8b250513          	addi	a0,a0,-1870 # ffffffffc0206fd8 <etext+0xcce>
ffffffffc020572e:	f122                	sd	s0,160(sp)
ffffffffc0205730:	e152                	sd	s4,128(sp)
ffffffffc0205732:	f8da                	sd	s6,112(sp)
ffffffffc0205734:	f0e2                	sd	s8,96(sp)
ffffffffc0205736:	d43fa0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc020573a:	00002617          	auipc	a2,0x2
ffffffffc020573e:	91e60613          	addi	a2,a2,-1762 # ffffffffc0207058 <etext+0xd4e>
ffffffffc0205742:	27600593          	li	a1,630
ffffffffc0205746:	00003517          	auipc	a0,0x3
ffffffffc020574a:	8fa50513          	addi	a0,a0,-1798 # ffffffffc0208040 <etext+0x1d36>
ffffffffc020574e:	f0e2                	sd	s8,96(sp)
ffffffffc0205750:	d29fa0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0205754:	00003697          	auipc	a3,0x3
ffffffffc0205758:	c1468693          	addi	a3,a3,-1004 # ffffffffc0208368 <etext+0x205e>
ffffffffc020575c:	00001617          	auipc	a2,0x1
ffffffffc0205760:	22c60613          	addi	a2,a2,556 # ffffffffc0206988 <etext+0x67e>
ffffffffc0205764:	27100593          	li	a1,625
ffffffffc0205768:	00003517          	auipc	a0,0x3
ffffffffc020576c:	8d850513          	addi	a0,a0,-1832 # ffffffffc0208040 <etext+0x1d36>
ffffffffc0205770:	f0e2                	sd	s8,96(sp)
ffffffffc0205772:	d07fa0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0205776:	00003697          	auipc	a3,0x3
ffffffffc020577a:	baa68693          	addi	a3,a3,-1110 # ffffffffc0208320 <etext+0x2016>
ffffffffc020577e:	00001617          	auipc	a2,0x1
ffffffffc0205782:	20a60613          	addi	a2,a2,522 # ffffffffc0206988 <etext+0x67e>
ffffffffc0205786:	27000593          	li	a1,624
ffffffffc020578a:	00003517          	auipc	a0,0x3
ffffffffc020578e:	8b650513          	addi	a0,a0,-1866 # ffffffffc0208040 <etext+0x1d36>
ffffffffc0205792:	f0e2                	sd	s8,96(sp)
ffffffffc0205794:	ce5fa0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0205798:	00003697          	auipc	a3,0x3
ffffffffc020579c:	b4068693          	addi	a3,a3,-1216 # ffffffffc02082d8 <etext+0x1fce>
ffffffffc02057a0:	00001617          	auipc	a2,0x1
ffffffffc02057a4:	1e860613          	addi	a2,a2,488 # ffffffffc0206988 <etext+0x67e>
ffffffffc02057a8:	26f00593          	li	a1,623
ffffffffc02057ac:	00003517          	auipc	a0,0x3
ffffffffc02057b0:	89450513          	addi	a0,a0,-1900 # ffffffffc0208040 <etext+0x1d36>
ffffffffc02057b4:	f0e2                	sd	s8,96(sp)
ffffffffc02057b6:	cc3fa0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02057ba:	00003697          	auipc	a3,0x3
ffffffffc02057be:	ad668693          	addi	a3,a3,-1322 # ffffffffc0208290 <etext+0x1f86>
ffffffffc02057c2:	00001617          	auipc	a2,0x1
ffffffffc02057c6:	1c660613          	addi	a2,a2,454 # ffffffffc0206988 <etext+0x67e>
ffffffffc02057ca:	26e00593          	li	a1,622
ffffffffc02057ce:	00003517          	auipc	a0,0x3
ffffffffc02057d2:	87250513          	addi	a0,a0,-1934 # ffffffffc0208040 <etext+0x1d36>
ffffffffc02057d6:	f0e2                	sd	s8,96(sp)
ffffffffc02057d8:	ca1fa0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc02057dc <do_yield>:
ffffffffc02057dc:	00038797          	auipc	a5,0x38
ffffffffc02057e0:	e9c7b783          	ld	a5,-356(a5) # ffffffffc023d678 <current>
ffffffffc02057e4:	4705                	li	a4,1
ffffffffc02057e6:	ef98                	sd	a4,24(a5)
ffffffffc02057e8:	4501                	li	a0,0
ffffffffc02057ea:	8082                	ret

ffffffffc02057ec <do_wait>:
ffffffffc02057ec:	1101                	addi	sp,sp,-32
ffffffffc02057ee:	e822                	sd	s0,16(sp)
ffffffffc02057f0:	e426                	sd	s1,8(sp)
ffffffffc02057f2:	00038797          	auipc	a5,0x38
ffffffffc02057f6:	e867b783          	ld	a5,-378(a5) # ffffffffc023d678 <current>
ffffffffc02057fa:	ec06                	sd	ra,24(sp)
ffffffffc02057fc:	779c                	ld	a5,40(a5)
ffffffffc02057fe:	842e                	mv	s0,a1
ffffffffc0205800:	84aa                	mv	s1,a0
ffffffffc0205802:	c599                	beqz	a1,ffffffffc0205810 <do_wait+0x24>
ffffffffc0205804:	4685                	li	a3,1
ffffffffc0205806:	4611                	li	a2,4
ffffffffc0205808:	853e                	mv	a0,a5
ffffffffc020580a:	d85fe0ef          	jal	ffffffffc020458e <user_mem_check>
ffffffffc020580e:	c909                	beqz	a0,ffffffffc0205820 <do_wait+0x34>
ffffffffc0205810:	85a2                	mv	a1,s0
ffffffffc0205812:	6442                	ld	s0,16(sp)
ffffffffc0205814:	60e2                	ld	ra,24(sp)
ffffffffc0205816:	8526                	mv	a0,s1
ffffffffc0205818:	64a2                	ld	s1,8(sp)
ffffffffc020581a:	6105                	addi	sp,sp,32
ffffffffc020581c:	f3aff06f          	j	ffffffffc0204f56 <do_wait.part.0>
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
ffffffffc0205844:	608000ef          	jal	ffffffffc0205e4c <hash32>
ffffffffc0205848:	02051793          	slli	a5,a0,0x20
ffffffffc020584c:	01c7d513          	srli	a0,a5,0x1c
ffffffffc0205850:	00034797          	auipc	a5,0x34
ffffffffc0205854:	d7078793          	addi	a5,a5,-656 # ffffffffc02395c0 <hash_list>
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
ffffffffc020589e:	2ea000ef          	jal	ffffffffc0205b88 <wakeup_proc>
ffffffffc02058a2:	4501                	li	a0,0
ffffffffc02058a4:	b7fd                	j	ffffffffc0205892 <do_kill+0x66>
ffffffffc02058a6:	5575                	li	a0,-3
ffffffffc02058a8:	8082                	ret

ffffffffc02058aa <proc_init>:
ffffffffc02058aa:	1101                	addi	sp,sp,-32
ffffffffc02058ac:	e426                	sd	s1,8(sp)
ffffffffc02058ae:	00038797          	auipc	a5,0x38
ffffffffc02058b2:	d1278793          	addi	a5,a5,-750 # ffffffffc023d5c0 <proc_list>
ffffffffc02058b6:	ec06                	sd	ra,24(sp)
ffffffffc02058b8:	e822                	sd	s0,16(sp)
ffffffffc02058ba:	e04a                	sd	s2,0(sp)
ffffffffc02058bc:	00034497          	auipc	s1,0x34
ffffffffc02058c0:	d0448493          	addi	s1,s1,-764 # ffffffffc02395c0 <hash_list>
ffffffffc02058c4:	e79c                	sd	a5,8(a5)
ffffffffc02058c6:	e39c                	sd	a5,0(a5)
ffffffffc02058c8:	00038717          	auipc	a4,0x38
ffffffffc02058cc:	cf870713          	addi	a4,a4,-776 # ffffffffc023d5c0 <proc_list>
ffffffffc02058d0:	87a6                	mv	a5,s1
ffffffffc02058d2:	e79c                	sd	a5,8(a5)
ffffffffc02058d4:	e39c                	sd	a5,0(a5)
ffffffffc02058d6:	07c1                	addi	a5,a5,16
ffffffffc02058d8:	fee79de3          	bne	a5,a4,ffffffffc02058d2 <proc_init+0x28>
ffffffffc02058dc:	eaffe0ef          	jal	ffffffffc020478a <alloc_proc>
ffffffffc02058e0:	00038917          	auipc	s2,0x38
ffffffffc02058e4:	da890913          	addi	s2,s2,-600 # ffffffffc023d688 <idleproc>
ffffffffc02058e8:	00a93023          	sd	a0,0(s2)
ffffffffc02058ec:	10050063          	beqz	a0,ffffffffc02059ec <proc_init+0x142>
ffffffffc02058f0:	4789                	li	a5,2
ffffffffc02058f2:	e11c                	sd	a5,0(a0)
ffffffffc02058f4:	00004797          	auipc	a5,0x4
ffffffffc02058f8:	70c78793          	addi	a5,a5,1804 # ffffffffc020a000 <bootstack>
ffffffffc02058fc:	0b450413          	addi	s0,a0,180
ffffffffc0205900:	e91c                	sd	a5,16(a0)
ffffffffc0205902:	4785                	li	a5,1
ffffffffc0205904:	ed1c                	sd	a5,24(a0)
ffffffffc0205906:	4641                	li	a2,16
ffffffffc0205908:	4581                	li	a1,0
ffffffffc020590a:	8522                	mv	a0,s0
ffffffffc020590c:	1d5000ef          	jal	ffffffffc02062e0 <memset>
ffffffffc0205910:	463d                	li	a2,15
ffffffffc0205912:	00003597          	auipc	a1,0x3
ffffffffc0205916:	ab658593          	addi	a1,a1,-1354 # ffffffffc02083c8 <etext+0x20be>
ffffffffc020591a:	8522                	mv	a0,s0
ffffffffc020591c:	1d7000ef          	jal	ffffffffc02062f2 <memcpy>
ffffffffc0205920:	00038717          	auipc	a4,0x38
ffffffffc0205924:	d5070713          	addi	a4,a4,-688 # ffffffffc023d670 <nr_process>
ffffffffc0205928:	431c                	lw	a5,0(a4)
ffffffffc020592a:	00093683          	ld	a3,0(s2)
ffffffffc020592e:	4601                	li	a2,0
ffffffffc0205930:	2785                	addiw	a5,a5,1
ffffffffc0205932:	4581                	li	a1,0
ffffffffc0205934:	00000517          	auipc	a0,0x0
ffffffffc0205938:	80250513          	addi	a0,a0,-2046 # ffffffffc0205136 <init_main>
ffffffffc020593c:	c31c                	sw	a5,0(a4)
ffffffffc020593e:	00038797          	auipc	a5,0x38
ffffffffc0205942:	d2d7bd23          	sd	a3,-710(a5) # ffffffffc023d678 <current>
ffffffffc0205946:	c70ff0ef          	jal	ffffffffc0204db6 <kernel_thread>
ffffffffc020594a:	842a                	mv	s0,a0
ffffffffc020594c:	08a05463          	blez	a0,ffffffffc02059d4 <proc_init+0x12a>
ffffffffc0205950:	6789                	lui	a5,0x2
ffffffffc0205952:	fff5071b          	addiw	a4,a0,-1
ffffffffc0205956:	17f9                	addi	a5,a5,-2 # 1ffe <_binary_obj___user_hello_out_size+0x36>
ffffffffc0205958:	2501                	sext.w	a0,a0
ffffffffc020595a:	02e7e463          	bltu	a5,a4,ffffffffc0205982 <proc_init+0xd8>
ffffffffc020595e:	45a9                	li	a1,10
ffffffffc0205960:	4ec000ef          	jal	ffffffffc0205e4c <hash32>
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
ffffffffc020598c:	00038417          	auipc	s0,0x38
ffffffffc0205990:	cf440413          	addi	s0,s0,-780 # ffffffffc023d680 <initproc>
ffffffffc0205994:	8526                	mv	a0,s1
ffffffffc0205996:	e01c                	sd	a5,0(s0)
ffffffffc0205998:	149000ef          	jal	ffffffffc02062e0 <memset>
ffffffffc020599c:	463d                	li	a2,15
ffffffffc020599e:	00003597          	auipc	a1,0x3
ffffffffc02059a2:	a5258593          	addi	a1,a1,-1454 # ffffffffc02083f0 <etext+0x20e6>
ffffffffc02059a6:	8526                	mv	a0,s1
ffffffffc02059a8:	14b000ef          	jal	ffffffffc02062f2 <memcpy>
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
ffffffffc02059d8:	9fc60613          	addi	a2,a2,-1540 # ffffffffc02083d0 <etext+0x20c6>
ffffffffc02059dc:	38000593          	li	a1,896
ffffffffc02059e0:	00002517          	auipc	a0,0x2
ffffffffc02059e4:	66050513          	addi	a0,a0,1632 # ffffffffc0208040 <etext+0x1d36>
ffffffffc02059e8:	a91fa0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc02059ec:	00003617          	auipc	a2,0x3
ffffffffc02059f0:	9c460613          	addi	a2,a2,-1596 # ffffffffc02083b0 <etext+0x20a6>
ffffffffc02059f4:	37200593          	li	a1,882
ffffffffc02059f8:	00002517          	auipc	a0,0x2
ffffffffc02059fc:	64850513          	addi	a0,a0,1608 # ffffffffc0208040 <etext+0x1d36>
ffffffffc0205a00:	a79fa0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0205a04:	00003697          	auipc	a3,0x3
ffffffffc0205a08:	a1c68693          	addi	a3,a3,-1508 # ffffffffc0208420 <etext+0x2116>
ffffffffc0205a0c:	00001617          	auipc	a2,0x1
ffffffffc0205a10:	f7c60613          	addi	a2,a2,-132 # ffffffffc0206988 <etext+0x67e>
ffffffffc0205a14:	38700593          	li	a1,903
ffffffffc0205a18:	00002517          	auipc	a0,0x2
ffffffffc0205a1c:	62850513          	addi	a0,a0,1576 # ffffffffc0208040 <etext+0x1d36>
ffffffffc0205a20:	a59fa0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0205a24:	00003697          	auipc	a3,0x3
ffffffffc0205a28:	9d468693          	addi	a3,a3,-1580 # ffffffffc02083f8 <etext+0x20ee>
ffffffffc0205a2c:	00001617          	auipc	a2,0x1
ffffffffc0205a30:	f5c60613          	addi	a2,a2,-164 # ffffffffc0206988 <etext+0x67e>
ffffffffc0205a34:	38600593          	li	a1,902
ffffffffc0205a38:	00002517          	auipc	a0,0x2
ffffffffc0205a3c:	60850513          	addi	a0,a0,1544 # ffffffffc0208040 <etext+0x1d36>
ffffffffc0205a40:	a39fa0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc0205a44 <cpu_idle>:
ffffffffc0205a44:	1141                	addi	sp,sp,-16
ffffffffc0205a46:	e022                	sd	s0,0(sp)
ffffffffc0205a48:	e406                	sd	ra,8(sp)
ffffffffc0205a4a:	00038417          	auipc	s0,0x38
ffffffffc0205a4e:	c2e40413          	addi	s0,s0,-978 # ffffffffc023d678 <current>
ffffffffc0205a52:	6018                	ld	a4,0(s0)
ffffffffc0205a54:	6f1c                	ld	a5,24(a4)
ffffffffc0205a56:	dffd                	beqz	a5,ffffffffc0205a54 <cpu_idle+0x10>
ffffffffc0205a58:	234000ef          	jal	ffffffffc0205c8c <schedule>
ffffffffc0205a5c:	bfdd                	j	ffffffffc0205a52 <cpu_idle+0xe>

ffffffffc0205a5e <lab6_set_priority>:
ffffffffc0205a5e:	1141                	addi	sp,sp,-16
ffffffffc0205a60:	e022                	sd	s0,0(sp)
ffffffffc0205a62:	85aa                	mv	a1,a0
ffffffffc0205a64:	842a                	mv	s0,a0
ffffffffc0205a66:	00003517          	auipc	a0,0x3
ffffffffc0205a6a:	9e250513          	addi	a0,a0,-1566 # ffffffffc0208448 <etext+0x213e>
ffffffffc0205a6e:	e406                	sd	ra,8(sp)
ffffffffc0205a70:	f14fa0ef          	jal	ffffffffc0200184 <cprintf>
ffffffffc0205a74:	00038797          	auipc	a5,0x38
ffffffffc0205a78:	c047b783          	ld	a5,-1020(a5) # ffffffffc023d678 <current>
ffffffffc0205a7c:	e801                	bnez	s0,ffffffffc0205a8c <lab6_set_priority+0x2e>
ffffffffc0205a7e:	60a2                	ld	ra,8(sp)
ffffffffc0205a80:	6402                	ld	s0,0(sp)
ffffffffc0205a82:	4705                	li	a4,1
ffffffffc0205a84:	14e7a223          	sw	a4,324(a5)
ffffffffc0205a88:	0141                	addi	sp,sp,16
ffffffffc0205a8a:	8082                	ret
ffffffffc0205a8c:	60a2                	ld	ra,8(sp)
ffffffffc0205a8e:	1487a223          	sw	s0,324(a5)
ffffffffc0205a92:	6402                	ld	s0,0(sp)
ffffffffc0205a94:	0141                	addi	sp,sp,16
ffffffffc0205a96:	8082                	ret

ffffffffc0205a98 <switch_to>:
ffffffffc0205a98:	00153023          	sd	ra,0(a0)
ffffffffc0205a9c:	00253423          	sd	sp,8(a0)
ffffffffc0205aa0:	e900                	sd	s0,16(a0)
ffffffffc0205aa2:	ed04                	sd	s1,24(a0)
ffffffffc0205aa4:	03253023          	sd	s2,32(a0)
ffffffffc0205aa8:	03353423          	sd	s3,40(a0)
ffffffffc0205aac:	03453823          	sd	s4,48(a0)
ffffffffc0205ab0:	03553c23          	sd	s5,56(a0)
ffffffffc0205ab4:	05653023          	sd	s6,64(a0)
ffffffffc0205ab8:	05753423          	sd	s7,72(a0)
ffffffffc0205abc:	05853823          	sd	s8,80(a0)
ffffffffc0205ac0:	05953c23          	sd	s9,88(a0)
ffffffffc0205ac4:	07a53023          	sd	s10,96(a0)
ffffffffc0205ac8:	07b53423          	sd	s11,104(a0)
ffffffffc0205acc:	0005b083          	ld	ra,0(a1)
ffffffffc0205ad0:	0085b103          	ld	sp,8(a1)
ffffffffc0205ad4:	6980                	ld	s0,16(a1)
ffffffffc0205ad6:	6d84                	ld	s1,24(a1)
ffffffffc0205ad8:	0205b903          	ld	s2,32(a1)
ffffffffc0205adc:	0285b983          	ld	s3,40(a1)
ffffffffc0205ae0:	0305ba03          	ld	s4,48(a1)
ffffffffc0205ae4:	0385ba83          	ld	s5,56(a1)
ffffffffc0205ae8:	0405bb03          	ld	s6,64(a1)
ffffffffc0205aec:	0485bb83          	ld	s7,72(a1)
ffffffffc0205af0:	0505bc03          	ld	s8,80(a1)
ffffffffc0205af4:	0585bc83          	ld	s9,88(a1)
ffffffffc0205af8:	0605bd03          	ld	s10,96(a1)
ffffffffc0205afc:	0685bd83          	ld	s11,104(a1)
ffffffffc0205b00:	8082                	ret

ffffffffc0205b02 <stride_init>:
ffffffffc0205b02:	8082                	ret

ffffffffc0205b04 <stride_enqueue>:
ffffffffc0205b04:	8082                	ret

ffffffffc0205b06 <stride_pick_next>:
ffffffffc0205b06:	8082                	ret

ffffffffc0205b08 <stride_dequeue>:
ffffffffc0205b08:	8082                	ret

ffffffffc0205b0a <stride_proc_tick>:
ffffffffc0205b0a:	8082                	ret

ffffffffc0205b0c <sched_class_proc_tick>:
ffffffffc0205b0c:	00038797          	auipc	a5,0x38
ffffffffc0205b10:	b7c7b783          	ld	a5,-1156(a5) # ffffffffc023d688 <idleproc>
ffffffffc0205b14:	85aa                	mv	a1,a0
ffffffffc0205b16:	00a78c63          	beq	a5,a0,ffffffffc0205b2e <sched_class_proc_tick+0x22>
ffffffffc0205b1a:	00038797          	auipc	a5,0x38
ffffffffc0205b1e:	b7e7b783          	ld	a5,-1154(a5) # ffffffffc023d698 <sched_class>
ffffffffc0205b22:	779c                	ld	a5,40(a5)
ffffffffc0205b24:	00038517          	auipc	a0,0x38
ffffffffc0205b28:	b6c53503          	ld	a0,-1172(a0) # ffffffffc023d690 <rq>
ffffffffc0205b2c:	8782                	jr	a5
ffffffffc0205b2e:	4705                	li	a4,1
ffffffffc0205b30:	ef98                	sd	a4,24(a5)
ffffffffc0205b32:	8082                	ret

ffffffffc0205b34 <sched_init>:
ffffffffc0205b34:	1141                	addi	sp,sp,-16
ffffffffc0205b36:	0002c697          	auipc	a3,0x2c
ffffffffc0205b3a:	59268693          	addi	a3,a3,1426 # ffffffffc02320c8 <default_sched_class>
ffffffffc0205b3e:	e022                	sd	s0,0(sp)
ffffffffc0205b40:	e406                	sd	ra,8(sp)
ffffffffc0205b42:	00038797          	auipc	a5,0x38
ffffffffc0205b46:	aae78793          	addi	a5,a5,-1362 # ffffffffc023d5f0 <timer_list>
ffffffffc0205b4a:	6690                	ld	a2,8(a3)
ffffffffc0205b4c:	00038717          	auipc	a4,0x38
ffffffffc0205b50:	a8470713          	addi	a4,a4,-1404 # ffffffffc023d5d0 <__rq>
ffffffffc0205b54:	e79c                	sd	a5,8(a5)
ffffffffc0205b56:	e39c                	sd	a5,0(a5)
ffffffffc0205b58:	4795                	li	a5,5
ffffffffc0205b5a:	00038417          	auipc	s0,0x38
ffffffffc0205b5e:	b3e40413          	addi	s0,s0,-1218 # ffffffffc023d698 <sched_class>
ffffffffc0205b62:	cb5c                	sw	a5,20(a4)
ffffffffc0205b64:	853a                	mv	a0,a4
ffffffffc0205b66:	e014                	sd	a3,0(s0)
ffffffffc0205b68:	00038797          	auipc	a5,0x38
ffffffffc0205b6c:	b2e7b423          	sd	a4,-1240(a5) # ffffffffc023d690 <rq>
ffffffffc0205b70:	9602                	jalr	a2
ffffffffc0205b72:	601c                	ld	a5,0(s0)
ffffffffc0205b74:	6402                	ld	s0,0(sp)
ffffffffc0205b76:	60a2                	ld	ra,8(sp)
ffffffffc0205b78:	638c                	ld	a1,0(a5)
ffffffffc0205b7a:	00003517          	auipc	a0,0x3
ffffffffc0205b7e:	8fe50513          	addi	a0,a0,-1794 # ffffffffc0208478 <etext+0x216e>
ffffffffc0205b82:	0141                	addi	sp,sp,16
ffffffffc0205b84:	e00fa06f          	j	ffffffffc0200184 <cprintf>

ffffffffc0205b88 <wakeup_proc>:
ffffffffc0205b88:	4118                	lw	a4,0(a0)
ffffffffc0205b8a:	1141                	addi	sp,sp,-16
ffffffffc0205b8c:	e406                	sd	ra,8(sp)
ffffffffc0205b8e:	e022                	sd	s0,0(sp)
ffffffffc0205b90:	478d                	li	a5,3
ffffffffc0205b92:	0cf70163          	beq	a4,a5,ffffffffc0205c54 <wakeup_proc+0xcc>
ffffffffc0205b96:	842a                	mv	s0,a0
ffffffffc0205b98:	100027f3          	csrr	a5,sstatus
ffffffffc0205b9c:	8b89                	andi	a5,a5,2
ffffffffc0205b9e:	e7a9                	bnez	a5,ffffffffc0205be8 <wakeup_proc+0x60>
ffffffffc0205ba0:	4789                	li	a5,2
ffffffffc0205ba2:	06f70d63          	beq	a4,a5,ffffffffc0205c1c <wakeup_proc+0x94>
ffffffffc0205ba6:	c11c                	sw	a5,0(a0)
ffffffffc0205ba8:	0e052623          	sw	zero,236(a0)
ffffffffc0205bac:	00038797          	auipc	a5,0x38
ffffffffc0205bb0:	acc7b783          	ld	a5,-1332(a5) # ffffffffc023d678 <current>
ffffffffc0205bb4:	02f50663          	beq	a0,a5,ffffffffc0205be0 <wakeup_proc+0x58>
ffffffffc0205bb8:	00038797          	auipc	a5,0x38
ffffffffc0205bbc:	ad07b783          	ld	a5,-1328(a5) # ffffffffc023d688 <idleproc>
ffffffffc0205bc0:	02f50063          	beq	a0,a5,ffffffffc0205be0 <wakeup_proc+0x58>
ffffffffc0205bc4:	6402                	ld	s0,0(sp)
ffffffffc0205bc6:	00038797          	auipc	a5,0x38
ffffffffc0205bca:	ad27b783          	ld	a5,-1326(a5) # ffffffffc023d698 <sched_class>
ffffffffc0205bce:	60a2                	ld	ra,8(sp)
ffffffffc0205bd0:	6b9c                	ld	a5,16(a5)
ffffffffc0205bd2:	85aa                	mv	a1,a0
ffffffffc0205bd4:	00038517          	auipc	a0,0x38
ffffffffc0205bd8:	abc53503          	ld	a0,-1348(a0) # ffffffffc023d690 <rq>
ffffffffc0205bdc:	0141                	addi	sp,sp,16
ffffffffc0205bde:	8782                	jr	a5
ffffffffc0205be0:	60a2                	ld	ra,8(sp)
ffffffffc0205be2:	6402                	ld	s0,0(sp)
ffffffffc0205be4:	0141                	addi	sp,sp,16
ffffffffc0205be6:	8082                	ret
ffffffffc0205be8:	a53fa0ef          	jal	ffffffffc020063a <intr_disable>
ffffffffc0205bec:	4018                	lw	a4,0(s0)
ffffffffc0205bee:	4789                	li	a5,2
ffffffffc0205bf0:	04f70563          	beq	a4,a5,ffffffffc0205c3a <wakeup_proc+0xb2>
ffffffffc0205bf4:	c01c                	sw	a5,0(s0)
ffffffffc0205bf6:	0e042623          	sw	zero,236(s0)
ffffffffc0205bfa:	00038797          	auipc	a5,0x38
ffffffffc0205bfe:	a7e7b783          	ld	a5,-1410(a5) # ffffffffc023d678 <current>
ffffffffc0205c02:	00f40863          	beq	s0,a5,ffffffffc0205c12 <wakeup_proc+0x8a>
ffffffffc0205c06:	00038797          	auipc	a5,0x38
ffffffffc0205c0a:	a827b783          	ld	a5,-1406(a5) # ffffffffc023d688 <idleproc>
ffffffffc0205c0e:	06f41363          	bne	s0,a5,ffffffffc0205c74 <wakeup_proc+0xec>
ffffffffc0205c12:	6402                	ld	s0,0(sp)
ffffffffc0205c14:	60a2                	ld	ra,8(sp)
ffffffffc0205c16:	0141                	addi	sp,sp,16
ffffffffc0205c18:	a1dfa06f          	j	ffffffffc0200634 <intr_enable>
ffffffffc0205c1c:	6402                	ld	s0,0(sp)
ffffffffc0205c1e:	60a2                	ld	ra,8(sp)
ffffffffc0205c20:	00003617          	auipc	a2,0x3
ffffffffc0205c24:	8a860613          	addi	a2,a2,-1880 # ffffffffc02084c8 <etext+0x21be>
ffffffffc0205c28:	04800593          	li	a1,72
ffffffffc0205c2c:	00003517          	auipc	a0,0x3
ffffffffc0205c30:	88450513          	addi	a0,a0,-1916 # ffffffffc02084b0 <etext+0x21a6>
ffffffffc0205c34:	0141                	addi	sp,sp,16
ffffffffc0205c36:	8adfa06f          	j	ffffffffc02004e2 <__warn>
ffffffffc0205c3a:	00003617          	auipc	a2,0x3
ffffffffc0205c3e:	88e60613          	addi	a2,a2,-1906 # ffffffffc02084c8 <etext+0x21be>
ffffffffc0205c42:	04800593          	li	a1,72
ffffffffc0205c46:	00003517          	auipc	a0,0x3
ffffffffc0205c4a:	86a50513          	addi	a0,a0,-1942 # ffffffffc02084b0 <etext+0x21a6>
ffffffffc0205c4e:	895fa0ef          	jal	ffffffffc02004e2 <__warn>
ffffffffc0205c52:	b7c1                	j	ffffffffc0205c12 <wakeup_proc+0x8a>
ffffffffc0205c54:	00003697          	auipc	a3,0x3
ffffffffc0205c58:	83c68693          	addi	a3,a3,-1988 # ffffffffc0208490 <etext+0x2186>
ffffffffc0205c5c:	00001617          	auipc	a2,0x1
ffffffffc0205c60:	d2c60613          	addi	a2,a2,-724 # ffffffffc0206988 <etext+0x67e>
ffffffffc0205c64:	03c00593          	li	a1,60
ffffffffc0205c68:	00003517          	auipc	a0,0x3
ffffffffc0205c6c:	84850513          	addi	a0,a0,-1976 # ffffffffc02084b0 <etext+0x21a6>
ffffffffc0205c70:	809fa0ef          	jal	ffffffffc0200478 <__panic>
ffffffffc0205c74:	00038797          	auipc	a5,0x38
ffffffffc0205c78:	a247b783          	ld	a5,-1500(a5) # ffffffffc023d698 <sched_class>
ffffffffc0205c7c:	6b9c                	ld	a5,16(a5)
ffffffffc0205c7e:	85a2                	mv	a1,s0
ffffffffc0205c80:	00038517          	auipc	a0,0x38
ffffffffc0205c84:	a1053503          	ld	a0,-1520(a0) # ffffffffc023d690 <rq>
ffffffffc0205c88:	9782                	jalr	a5
ffffffffc0205c8a:	b761                	j	ffffffffc0205c12 <wakeup_proc+0x8a>

ffffffffc0205c8c <schedule>:
ffffffffc0205c8c:	7179                	addi	sp,sp,-48
ffffffffc0205c8e:	f406                	sd	ra,40(sp)
ffffffffc0205c90:	f022                	sd	s0,32(sp)
ffffffffc0205c92:	ec26                	sd	s1,24(sp)
ffffffffc0205c94:	e84a                	sd	s2,16(sp)
ffffffffc0205c96:	e44e                	sd	s3,8(sp)
ffffffffc0205c98:	e052                	sd	s4,0(sp)
ffffffffc0205c9a:	100027f3          	csrr	a5,sstatus
ffffffffc0205c9e:	8b89                	andi	a5,a5,2
ffffffffc0205ca0:	4a01                	li	s4,0
ffffffffc0205ca2:	e3cd                	bnez	a5,ffffffffc0205d44 <schedule+0xb8>
ffffffffc0205ca4:	00038497          	auipc	s1,0x38
ffffffffc0205ca8:	9d448493          	addi	s1,s1,-1580 # ffffffffc023d678 <current>
ffffffffc0205cac:	608c                	ld	a1,0(s1)
ffffffffc0205cae:	4789                	li	a5,2
ffffffffc0205cb0:	00038917          	auipc	s2,0x38
ffffffffc0205cb4:	9e090913          	addi	s2,s2,-1568 # ffffffffc023d690 <rq>
ffffffffc0205cb8:	4198                	lw	a4,0(a1)
ffffffffc0205cba:	0005bc23          	sd	zero,24(a1)
ffffffffc0205cbe:	00038997          	auipc	s3,0x38
ffffffffc0205cc2:	9da98993          	addi	s3,s3,-1574 # ffffffffc023d698 <sched_class>
ffffffffc0205cc6:	06f70263          	beq	a4,a5,ffffffffc0205d2a <schedule+0x9e>
ffffffffc0205cca:	0009b783          	ld	a5,0(s3)
ffffffffc0205cce:	00093503          	ld	a0,0(s2)
ffffffffc0205cd2:	739c                	ld	a5,32(a5)
ffffffffc0205cd4:	9782                	jalr	a5
ffffffffc0205cd6:	842a                	mv	s0,a0
ffffffffc0205cd8:	c521                	beqz	a0,ffffffffc0205d20 <schedule+0x94>
ffffffffc0205cda:	0009b783          	ld	a5,0(s3)
ffffffffc0205cde:	00093503          	ld	a0,0(s2)
ffffffffc0205ce2:	85a2                	mv	a1,s0
ffffffffc0205ce4:	6f9c                	ld	a5,24(a5)
ffffffffc0205ce6:	9782                	jalr	a5
ffffffffc0205ce8:	441c                	lw	a5,8(s0)
ffffffffc0205cea:	6098                	ld	a4,0(s1)
ffffffffc0205cec:	2785                	addiw	a5,a5,1
ffffffffc0205cee:	c41c                	sw	a5,8(s0)
ffffffffc0205cf0:	00870563          	beq	a4,s0,ffffffffc0205cfa <schedule+0x6e>
ffffffffc0205cf4:	8522                	mv	a0,s0
ffffffffc0205cf6:	c19fe0ef          	jal	ffffffffc020490e <proc_run>
ffffffffc0205cfa:	000a1a63          	bnez	s4,ffffffffc0205d0e <schedule+0x82>
ffffffffc0205cfe:	70a2                	ld	ra,40(sp)
ffffffffc0205d00:	7402                	ld	s0,32(sp)
ffffffffc0205d02:	64e2                	ld	s1,24(sp)
ffffffffc0205d04:	6942                	ld	s2,16(sp)
ffffffffc0205d06:	69a2                	ld	s3,8(sp)
ffffffffc0205d08:	6a02                	ld	s4,0(sp)
ffffffffc0205d0a:	6145                	addi	sp,sp,48
ffffffffc0205d0c:	8082                	ret
ffffffffc0205d0e:	7402                	ld	s0,32(sp)
ffffffffc0205d10:	70a2                	ld	ra,40(sp)
ffffffffc0205d12:	64e2                	ld	s1,24(sp)
ffffffffc0205d14:	6942                	ld	s2,16(sp)
ffffffffc0205d16:	69a2                	ld	s3,8(sp)
ffffffffc0205d18:	6a02                	ld	s4,0(sp)
ffffffffc0205d1a:	6145                	addi	sp,sp,48
ffffffffc0205d1c:	919fa06f          	j	ffffffffc0200634 <intr_enable>
ffffffffc0205d20:	00038417          	auipc	s0,0x38
ffffffffc0205d24:	96843403          	ld	s0,-1688(s0) # ffffffffc023d688 <idleproc>
ffffffffc0205d28:	b7c1                	j	ffffffffc0205ce8 <schedule+0x5c>
ffffffffc0205d2a:	00038797          	auipc	a5,0x38
ffffffffc0205d2e:	95e7b783          	ld	a5,-1698(a5) # ffffffffc023d688 <idleproc>
ffffffffc0205d32:	f8f58ce3          	beq	a1,a5,ffffffffc0205cca <schedule+0x3e>
ffffffffc0205d36:	0009b783          	ld	a5,0(s3)
ffffffffc0205d3a:	00093503          	ld	a0,0(s2)
ffffffffc0205d3e:	6b9c                	ld	a5,16(a5)
ffffffffc0205d40:	9782                	jalr	a5
ffffffffc0205d42:	b761                	j	ffffffffc0205cca <schedule+0x3e>
ffffffffc0205d44:	8f7fa0ef          	jal	ffffffffc020063a <intr_disable>
ffffffffc0205d48:	4a05                	li	s4,1
ffffffffc0205d4a:	bfa9                	j	ffffffffc0205ca4 <schedule+0x18>

ffffffffc0205d4c <sys_getpid>:
ffffffffc0205d4c:	00038797          	auipc	a5,0x38
ffffffffc0205d50:	92c7b783          	ld	a5,-1748(a5) # ffffffffc023d678 <current>
ffffffffc0205d54:	43c8                	lw	a0,4(a5)
ffffffffc0205d56:	8082                	ret

ffffffffc0205d58 <sys_pgdir>:
ffffffffc0205d58:	4501                	li	a0,0
ffffffffc0205d5a:	8082                	ret

ffffffffc0205d5c <sys_gettime>:
ffffffffc0205d5c:	00038797          	auipc	a5,0x38
ffffffffc0205d60:	8ac7b783          	ld	a5,-1876(a5) # ffffffffc023d608 <ticks>
ffffffffc0205d64:	0027951b          	slliw	a0,a5,0x2
ffffffffc0205d68:	9d3d                	addw	a0,a0,a5
ffffffffc0205d6a:	0015151b          	slliw	a0,a0,0x1
ffffffffc0205d6e:	8082                	ret

ffffffffc0205d70 <sys_lab6_set_priority>:
ffffffffc0205d70:	4108                	lw	a0,0(a0)
ffffffffc0205d72:	1141                	addi	sp,sp,-16
ffffffffc0205d74:	e406                	sd	ra,8(sp)
ffffffffc0205d76:	ce9ff0ef          	jal	ffffffffc0205a5e <lab6_set_priority>
ffffffffc0205d7a:	60a2                	ld	ra,8(sp)
ffffffffc0205d7c:	4501                	li	a0,0
ffffffffc0205d7e:	0141                	addi	sp,sp,16
ffffffffc0205d80:	8082                	ret

ffffffffc0205d82 <sys_putc>:
ffffffffc0205d82:	4108                	lw	a0,0(a0)
ffffffffc0205d84:	1141                	addi	sp,sp,-16
ffffffffc0205d86:	e406                	sd	ra,8(sp)
ffffffffc0205d88:	c30fa0ef          	jal	ffffffffc02001b8 <cputchar>
ffffffffc0205d8c:	60a2                	ld	ra,8(sp)
ffffffffc0205d8e:	4501                	li	a0,0
ffffffffc0205d90:	0141                	addi	sp,sp,16
ffffffffc0205d92:	8082                	ret

ffffffffc0205d94 <sys_kill>:
ffffffffc0205d94:	4108                	lw	a0,0(a0)
ffffffffc0205d96:	a97ff06f          	j	ffffffffc020582c <do_kill>

ffffffffc0205d9a <sys_yield>:
ffffffffc0205d9a:	a43ff06f          	j	ffffffffc02057dc <do_yield>

ffffffffc0205d9e <sys_exec>:
ffffffffc0205d9e:	6d14                	ld	a3,24(a0)
ffffffffc0205da0:	6910                	ld	a2,16(a0)
ffffffffc0205da2:	650c                	ld	a1,8(a0)
ffffffffc0205da4:	6108                	ld	a0,0(a0)
ffffffffc0205da6:	cb4ff06f          	j	ffffffffc020525a <do_execve>

ffffffffc0205daa <sys_wait>:
ffffffffc0205daa:	650c                	ld	a1,8(a0)
ffffffffc0205dac:	4108                	lw	a0,0(a0)
ffffffffc0205dae:	a3fff06f          	j	ffffffffc02057ec <do_wait>

ffffffffc0205db2 <sys_fork>:
ffffffffc0205db2:	00038797          	auipc	a5,0x38
ffffffffc0205db6:	8c67b783          	ld	a5,-1850(a5) # ffffffffc023d678 <current>
ffffffffc0205dba:	73d0                	ld	a2,160(a5)
ffffffffc0205dbc:	4501                	li	a0,0
ffffffffc0205dbe:	6a0c                	ld	a1,16(a2)
ffffffffc0205dc0:	bbbfe06f          	j	ffffffffc020497a <do_fork>

ffffffffc0205dc4 <sys_exit>:
ffffffffc0205dc4:	4108                	lw	a0,0(a0)
ffffffffc0205dc6:	840ff06f          	j	ffffffffc0204e06 <do_exit>

ffffffffc0205dca <syscall>:
ffffffffc0205dca:	715d                	addi	sp,sp,-80
ffffffffc0205dcc:	fc26                	sd	s1,56(sp)
ffffffffc0205dce:	00038497          	auipc	s1,0x38
ffffffffc0205dd2:	8aa48493          	addi	s1,s1,-1878 # ffffffffc023d678 <current>
ffffffffc0205dd6:	6098                	ld	a4,0(s1)
ffffffffc0205dd8:	e0a2                	sd	s0,64(sp)
ffffffffc0205dda:	f84a                	sd	s2,48(sp)
ffffffffc0205ddc:	7340                	ld	s0,160(a4)
ffffffffc0205dde:	e486                	sd	ra,72(sp)
ffffffffc0205de0:	0ff00793          	li	a5,255
ffffffffc0205de4:	05042903          	lw	s2,80(s0)
ffffffffc0205de8:	0327ee63          	bltu	a5,s2,ffffffffc0205e24 <syscall+0x5a>
ffffffffc0205dec:	00391713          	slli	a4,s2,0x3
ffffffffc0205df0:	00003797          	auipc	a5,0x3
ffffffffc0205df4:	92078793          	addi	a5,a5,-1760 # ffffffffc0208710 <syscalls>
ffffffffc0205df8:	97ba                	add	a5,a5,a4
ffffffffc0205dfa:	639c                	ld	a5,0(a5)
ffffffffc0205dfc:	c785                	beqz	a5,ffffffffc0205e24 <syscall+0x5a>
ffffffffc0205dfe:	7028                	ld	a0,96(s0)
ffffffffc0205e00:	742c                	ld	a1,104(s0)
ffffffffc0205e02:	7834                	ld	a3,112(s0)
ffffffffc0205e04:	7c38                	ld	a4,120(s0)
ffffffffc0205e06:	6c30                	ld	a2,88(s0)
ffffffffc0205e08:	e82a                	sd	a0,16(sp)
ffffffffc0205e0a:	ec2e                	sd	a1,24(sp)
ffffffffc0205e0c:	e432                	sd	a2,8(sp)
ffffffffc0205e0e:	f036                	sd	a3,32(sp)
ffffffffc0205e10:	f43a                	sd	a4,40(sp)
ffffffffc0205e12:	0028                	addi	a0,sp,8
ffffffffc0205e14:	9782                	jalr	a5
ffffffffc0205e16:	60a6                	ld	ra,72(sp)
ffffffffc0205e18:	e828                	sd	a0,80(s0)
ffffffffc0205e1a:	6406                	ld	s0,64(sp)
ffffffffc0205e1c:	74e2                	ld	s1,56(sp)
ffffffffc0205e1e:	7942                	ld	s2,48(sp)
ffffffffc0205e20:	6161                	addi	sp,sp,80
ffffffffc0205e22:	8082                	ret
ffffffffc0205e24:	8522                	mv	a0,s0
ffffffffc0205e26:	a05fa0ef          	jal	ffffffffc020082a <print_trapframe>
ffffffffc0205e2a:	609c                	ld	a5,0(s1)
ffffffffc0205e2c:	86ca                	mv	a3,s2
ffffffffc0205e2e:	00002617          	auipc	a2,0x2
ffffffffc0205e32:	6ba60613          	addi	a2,a2,1722 # ffffffffc02084e8 <etext+0x21de>
ffffffffc0205e36:	43d8                	lw	a4,4(a5)
ffffffffc0205e38:	06c00593          	li	a1,108
ffffffffc0205e3c:	0b478793          	addi	a5,a5,180
ffffffffc0205e40:	00002517          	auipc	a0,0x2
ffffffffc0205e44:	6d850513          	addi	a0,a0,1752 # ffffffffc0208518 <etext+0x220e>
ffffffffc0205e48:	e30fa0ef          	jal	ffffffffc0200478 <__panic>

ffffffffc0205e4c <hash32>:
ffffffffc0205e4c:	9e3707b7          	lui	a5,0x9e370
ffffffffc0205e50:	2785                	addiw	a5,a5,1 # ffffffff9e370001 <_binary_obj___user_matrix_out_size+0xffffffff9e36d3a1>
ffffffffc0205e52:	02a787bb          	mulw	a5,a5,a0
ffffffffc0205e56:	02000513          	li	a0,32
ffffffffc0205e5a:	9d0d                	subw	a0,a0,a1
ffffffffc0205e5c:	00a7d53b          	srlw	a0,a5,a0
ffffffffc0205e60:	8082                	ret

ffffffffc0205e62 <printnum>:
ffffffffc0205e62:	02069813          	slli	a6,a3,0x20
ffffffffc0205e66:	7179                	addi	sp,sp,-48
ffffffffc0205e68:	02085813          	srli	a6,a6,0x20
ffffffffc0205e6c:	e052                	sd	s4,0(sp)
ffffffffc0205e6e:	03067a33          	remu	s4,a2,a6
ffffffffc0205e72:	f022                	sd	s0,32(sp)
ffffffffc0205e74:	ec26                	sd	s1,24(sp)
ffffffffc0205e76:	e84a                	sd	s2,16(sp)
ffffffffc0205e78:	f406                	sd	ra,40(sp)
ffffffffc0205e7a:	84aa                	mv	s1,a0
ffffffffc0205e7c:	892e                	mv	s2,a1
ffffffffc0205e7e:	fff7041b          	addiw	s0,a4,-1
ffffffffc0205e82:	2a01                	sext.w	s4,s4
ffffffffc0205e84:	05067063          	bgeu	a2,a6,ffffffffc0205ec4 <printnum+0x62>
ffffffffc0205e88:	e44e                	sd	s3,8(sp)
ffffffffc0205e8a:	89be                	mv	s3,a5
ffffffffc0205e8c:	4785                	li	a5,1
ffffffffc0205e8e:	00e7d763          	bge	a5,a4,ffffffffc0205e9c <printnum+0x3a>
ffffffffc0205e92:	85ca                	mv	a1,s2
ffffffffc0205e94:	854e                	mv	a0,s3
ffffffffc0205e96:	347d                	addiw	s0,s0,-1
ffffffffc0205e98:	9482                	jalr	s1
ffffffffc0205e9a:	fc65                	bnez	s0,ffffffffc0205e92 <printnum+0x30>
ffffffffc0205e9c:	69a2                	ld	s3,8(sp)
ffffffffc0205e9e:	1a02                	slli	s4,s4,0x20
ffffffffc0205ea0:	020a5a13          	srli	s4,s4,0x20
ffffffffc0205ea4:	00002797          	auipc	a5,0x2
ffffffffc0205ea8:	68c78793          	addi	a5,a5,1676 # ffffffffc0208530 <etext+0x2226>
ffffffffc0205eac:	97d2                	add	a5,a5,s4
ffffffffc0205eae:	7402                	ld	s0,32(sp)
ffffffffc0205eb0:	0007c503          	lbu	a0,0(a5)
ffffffffc0205eb4:	70a2                	ld	ra,40(sp)
ffffffffc0205eb6:	6a02                	ld	s4,0(sp)
ffffffffc0205eb8:	85ca                	mv	a1,s2
ffffffffc0205eba:	87a6                	mv	a5,s1
ffffffffc0205ebc:	6942                	ld	s2,16(sp)
ffffffffc0205ebe:	64e2                	ld	s1,24(sp)
ffffffffc0205ec0:	6145                	addi	sp,sp,48
ffffffffc0205ec2:	8782                	jr	a5
ffffffffc0205ec4:	03065633          	divu	a2,a2,a6
ffffffffc0205ec8:	8722                	mv	a4,s0
ffffffffc0205eca:	f99ff0ef          	jal	ffffffffc0205e62 <printnum>
ffffffffc0205ece:	bfc1                	j	ffffffffc0205e9e <printnum+0x3c>

ffffffffc0205ed0 <vprintfmt>:
ffffffffc0205ed0:	7119                	addi	sp,sp,-128
ffffffffc0205ed2:	f4a6                	sd	s1,104(sp)
ffffffffc0205ed4:	f0ca                	sd	s2,96(sp)
ffffffffc0205ed6:	ecce                	sd	s3,88(sp)
ffffffffc0205ed8:	e8d2                	sd	s4,80(sp)
ffffffffc0205eda:	e4d6                	sd	s5,72(sp)
ffffffffc0205edc:	e0da                	sd	s6,64(sp)
ffffffffc0205ede:	f862                	sd	s8,48(sp)
ffffffffc0205ee0:	fc86                	sd	ra,120(sp)
ffffffffc0205ee2:	f8a2                	sd	s0,112(sp)
ffffffffc0205ee4:	fc5e                	sd	s7,56(sp)
ffffffffc0205ee6:	f466                	sd	s9,40(sp)
ffffffffc0205ee8:	f06a                	sd	s10,32(sp)
ffffffffc0205eea:	ec6e                	sd	s11,24(sp)
ffffffffc0205eec:	892a                	mv	s2,a0
ffffffffc0205eee:	84ae                	mv	s1,a1
ffffffffc0205ef0:	8c32                	mv	s8,a2
ffffffffc0205ef2:	8a36                	mv	s4,a3
ffffffffc0205ef4:	02500993          	li	s3,37
ffffffffc0205ef8:	05500b13          	li	s6,85
ffffffffc0205efc:	00003a97          	auipc	s5,0x3
ffffffffc0205f00:	014a8a93          	addi	s5,s5,20 # ffffffffc0208f10 <syscalls+0x800>
ffffffffc0205f04:	000c4503          	lbu	a0,0(s8)
ffffffffc0205f08:	001c0413          	addi	s0,s8,1
ffffffffc0205f0c:	01350a63          	beq	a0,s3,ffffffffc0205f20 <vprintfmt+0x50>
ffffffffc0205f10:	cd0d                	beqz	a0,ffffffffc0205f4a <vprintfmt+0x7a>
ffffffffc0205f12:	85a6                	mv	a1,s1
ffffffffc0205f14:	9902                	jalr	s2
ffffffffc0205f16:	00044503          	lbu	a0,0(s0)
ffffffffc0205f1a:	0405                	addi	s0,s0,1
ffffffffc0205f1c:	ff351ae3          	bne	a0,s3,ffffffffc0205f10 <vprintfmt+0x40>
ffffffffc0205f20:	02000d93          	li	s11,32
ffffffffc0205f24:	4b81                	li	s7,0
ffffffffc0205f26:	4601                	li	a2,0
ffffffffc0205f28:	5d7d                	li	s10,-1
ffffffffc0205f2a:	5cfd                	li	s9,-1
ffffffffc0205f2c:	00044683          	lbu	a3,0(s0)
ffffffffc0205f30:	00140c13          	addi	s8,s0,1
ffffffffc0205f34:	fdd6859b          	addiw	a1,a3,-35
ffffffffc0205f38:	0ff5f593          	zext.b	a1,a1
ffffffffc0205f3c:	02bb6663          	bltu	s6,a1,ffffffffc0205f68 <vprintfmt+0x98>
ffffffffc0205f40:	058a                	slli	a1,a1,0x2
ffffffffc0205f42:	95d6                	add	a1,a1,s5
ffffffffc0205f44:	4198                	lw	a4,0(a1)
ffffffffc0205f46:	9756                	add	a4,a4,s5
ffffffffc0205f48:	8702                	jr	a4
ffffffffc0205f4a:	70e6                	ld	ra,120(sp)
ffffffffc0205f4c:	7446                	ld	s0,112(sp)
ffffffffc0205f4e:	74a6                	ld	s1,104(sp)
ffffffffc0205f50:	7906                	ld	s2,96(sp)
ffffffffc0205f52:	69e6                	ld	s3,88(sp)
ffffffffc0205f54:	6a46                	ld	s4,80(sp)
ffffffffc0205f56:	6aa6                	ld	s5,72(sp)
ffffffffc0205f58:	6b06                	ld	s6,64(sp)
ffffffffc0205f5a:	7be2                	ld	s7,56(sp)
ffffffffc0205f5c:	7c42                	ld	s8,48(sp)
ffffffffc0205f5e:	7ca2                	ld	s9,40(sp)
ffffffffc0205f60:	7d02                	ld	s10,32(sp)
ffffffffc0205f62:	6de2                	ld	s11,24(sp)
ffffffffc0205f64:	6109                	addi	sp,sp,128
ffffffffc0205f66:	8082                	ret
ffffffffc0205f68:	85a6                	mv	a1,s1
ffffffffc0205f6a:	02500513          	li	a0,37
ffffffffc0205f6e:	9902                	jalr	s2
ffffffffc0205f70:	fff44703          	lbu	a4,-1(s0)
ffffffffc0205f74:	02500793          	li	a5,37
ffffffffc0205f78:	8c22                	mv	s8,s0
ffffffffc0205f7a:	f8f705e3          	beq	a4,a5,ffffffffc0205f04 <vprintfmt+0x34>
ffffffffc0205f7e:	02500713          	li	a4,37
ffffffffc0205f82:	ffec4783          	lbu	a5,-2(s8)
ffffffffc0205f86:	1c7d                	addi	s8,s8,-1
ffffffffc0205f88:	fee79de3          	bne	a5,a4,ffffffffc0205f82 <vprintfmt+0xb2>
ffffffffc0205f8c:	bfa5                	j	ffffffffc0205f04 <vprintfmt+0x34>
ffffffffc0205f8e:	00144783          	lbu	a5,1(s0)
ffffffffc0205f92:	4725                	li	a4,9
ffffffffc0205f94:	fd068d1b          	addiw	s10,a3,-48
ffffffffc0205f98:	fd07859b          	addiw	a1,a5,-48
ffffffffc0205f9c:	0007869b          	sext.w	a3,a5
ffffffffc0205fa0:	8462                	mv	s0,s8
ffffffffc0205fa2:	02b76563          	bltu	a4,a1,ffffffffc0205fcc <vprintfmt+0xfc>
ffffffffc0205fa6:	4525                	li	a0,9
ffffffffc0205fa8:	00144783          	lbu	a5,1(s0)
ffffffffc0205fac:	002d171b          	slliw	a4,s10,0x2
ffffffffc0205fb0:	01a7073b          	addw	a4,a4,s10
ffffffffc0205fb4:	0017171b          	slliw	a4,a4,0x1
ffffffffc0205fb8:	9f35                	addw	a4,a4,a3
ffffffffc0205fba:	fd07859b          	addiw	a1,a5,-48
ffffffffc0205fbe:	0405                	addi	s0,s0,1
ffffffffc0205fc0:	fd070d1b          	addiw	s10,a4,-48
ffffffffc0205fc4:	0007869b          	sext.w	a3,a5
ffffffffc0205fc8:	feb570e3          	bgeu	a0,a1,ffffffffc0205fa8 <vprintfmt+0xd8>
ffffffffc0205fcc:	f60cd0e3          	bgez	s9,ffffffffc0205f2c <vprintfmt+0x5c>
ffffffffc0205fd0:	8cea                	mv	s9,s10
ffffffffc0205fd2:	5d7d                	li	s10,-1
ffffffffc0205fd4:	bfa1                	j	ffffffffc0205f2c <vprintfmt+0x5c>
ffffffffc0205fd6:	8db6                	mv	s11,a3
ffffffffc0205fd8:	8462                	mv	s0,s8
ffffffffc0205fda:	bf89                	j	ffffffffc0205f2c <vprintfmt+0x5c>
ffffffffc0205fdc:	8462                	mv	s0,s8
ffffffffc0205fde:	4b85                	li	s7,1
ffffffffc0205fe0:	b7b1                	j	ffffffffc0205f2c <vprintfmt+0x5c>
ffffffffc0205fe2:	4785                	li	a5,1
ffffffffc0205fe4:	008a0713          	addi	a4,s4,8
ffffffffc0205fe8:	00c7c463          	blt	a5,a2,ffffffffc0205ff0 <vprintfmt+0x120>
ffffffffc0205fec:	1a060163          	beqz	a2,ffffffffc020618e <vprintfmt+0x2be>
ffffffffc0205ff0:	000a3603          	ld	a2,0(s4)
ffffffffc0205ff4:	46c1                	li	a3,16
ffffffffc0205ff6:	8a3a                	mv	s4,a4
ffffffffc0205ff8:	000d879b          	sext.w	a5,s11
ffffffffc0205ffc:	8766                	mv	a4,s9
ffffffffc0205ffe:	85a6                	mv	a1,s1
ffffffffc0206000:	854a                	mv	a0,s2
ffffffffc0206002:	e61ff0ef          	jal	ffffffffc0205e62 <printnum>
ffffffffc0206006:	bdfd                	j	ffffffffc0205f04 <vprintfmt+0x34>
ffffffffc0206008:	000a2503          	lw	a0,0(s4)
ffffffffc020600c:	85a6                	mv	a1,s1
ffffffffc020600e:	0a21                	addi	s4,s4,8
ffffffffc0206010:	9902                	jalr	s2
ffffffffc0206012:	bdcd                	j	ffffffffc0205f04 <vprintfmt+0x34>
ffffffffc0206014:	4785                	li	a5,1
ffffffffc0206016:	008a0713          	addi	a4,s4,8
ffffffffc020601a:	00c7c463          	blt	a5,a2,ffffffffc0206022 <vprintfmt+0x152>
ffffffffc020601e:	16060363          	beqz	a2,ffffffffc0206184 <vprintfmt+0x2b4>
ffffffffc0206022:	000a3603          	ld	a2,0(s4)
ffffffffc0206026:	46a9                	li	a3,10
ffffffffc0206028:	8a3a                	mv	s4,a4
ffffffffc020602a:	b7f9                	j	ffffffffc0205ff8 <vprintfmt+0x128>
ffffffffc020602c:	85a6                	mv	a1,s1
ffffffffc020602e:	03000513          	li	a0,48
ffffffffc0206032:	9902                	jalr	s2
ffffffffc0206034:	85a6                	mv	a1,s1
ffffffffc0206036:	07800513          	li	a0,120
ffffffffc020603a:	9902                	jalr	s2
ffffffffc020603c:	000a3603          	ld	a2,0(s4)
ffffffffc0206040:	46c1                	li	a3,16
ffffffffc0206042:	0a21                	addi	s4,s4,8
ffffffffc0206044:	bf55                	j	ffffffffc0205ff8 <vprintfmt+0x128>
ffffffffc0206046:	85a6                	mv	a1,s1
ffffffffc0206048:	02500513          	li	a0,37
ffffffffc020604c:	9902                	jalr	s2
ffffffffc020604e:	bd5d                	j	ffffffffc0205f04 <vprintfmt+0x34>
ffffffffc0206050:	000a2d03          	lw	s10,0(s4)
ffffffffc0206054:	8462                	mv	s0,s8
ffffffffc0206056:	0a21                	addi	s4,s4,8
ffffffffc0206058:	bf95                	j	ffffffffc0205fcc <vprintfmt+0xfc>
ffffffffc020605a:	4785                	li	a5,1
ffffffffc020605c:	008a0713          	addi	a4,s4,8
ffffffffc0206060:	00c7c463          	blt	a5,a2,ffffffffc0206068 <vprintfmt+0x198>
ffffffffc0206064:	10060b63          	beqz	a2,ffffffffc020617a <vprintfmt+0x2aa>
ffffffffc0206068:	000a3603          	ld	a2,0(s4)
ffffffffc020606c:	46a1                	li	a3,8
ffffffffc020606e:	8a3a                	mv	s4,a4
ffffffffc0206070:	b761                	j	ffffffffc0205ff8 <vprintfmt+0x128>
ffffffffc0206072:	fffcc793          	not	a5,s9
ffffffffc0206076:	97fd                	srai	a5,a5,0x3f
ffffffffc0206078:	00fcf7b3          	and	a5,s9,a5
ffffffffc020607c:	00078c9b          	sext.w	s9,a5
ffffffffc0206080:	8462                	mv	s0,s8
ffffffffc0206082:	b56d                	j	ffffffffc0205f2c <vprintfmt+0x5c>
ffffffffc0206084:	000a3403          	ld	s0,0(s4)
ffffffffc0206088:	008a0793          	addi	a5,s4,8
ffffffffc020608c:	e43e                	sd	a5,8(sp)
ffffffffc020608e:	12040063          	beqz	s0,ffffffffc02061ae <vprintfmt+0x2de>
ffffffffc0206092:	0d905963          	blez	s9,ffffffffc0206164 <vprintfmt+0x294>
ffffffffc0206096:	02d00793          	li	a5,45
ffffffffc020609a:	00140a13          	addi	s4,s0,1
ffffffffc020609e:	12fd9763          	bne	s11,a5,ffffffffc02061cc <vprintfmt+0x2fc>
ffffffffc02060a2:	00044783          	lbu	a5,0(s0)
ffffffffc02060a6:	0007851b          	sext.w	a0,a5
ffffffffc02060aa:	cb9d                	beqz	a5,ffffffffc02060e0 <vprintfmt+0x210>
ffffffffc02060ac:	547d                	li	s0,-1
ffffffffc02060ae:	05e00d93          	li	s11,94
ffffffffc02060b2:	000d4563          	bltz	s10,ffffffffc02060bc <vprintfmt+0x1ec>
ffffffffc02060b6:	3d7d                	addiw	s10,s10,-1
ffffffffc02060b8:	028d0263          	beq	s10,s0,ffffffffc02060dc <vprintfmt+0x20c>
ffffffffc02060bc:	85a6                	mv	a1,s1
ffffffffc02060be:	0c0b8d63          	beqz	s7,ffffffffc0206198 <vprintfmt+0x2c8>
ffffffffc02060c2:	3781                	addiw	a5,a5,-32
ffffffffc02060c4:	0cfdfa63          	bgeu	s11,a5,ffffffffc0206198 <vprintfmt+0x2c8>
ffffffffc02060c8:	03f00513          	li	a0,63
ffffffffc02060cc:	9902                	jalr	s2
ffffffffc02060ce:	000a4783          	lbu	a5,0(s4)
ffffffffc02060d2:	3cfd                	addiw	s9,s9,-1
ffffffffc02060d4:	0a05                	addi	s4,s4,1
ffffffffc02060d6:	0007851b          	sext.w	a0,a5
ffffffffc02060da:	ffe1                	bnez	a5,ffffffffc02060b2 <vprintfmt+0x1e2>
ffffffffc02060dc:	01905963          	blez	s9,ffffffffc02060ee <vprintfmt+0x21e>
ffffffffc02060e0:	85a6                	mv	a1,s1
ffffffffc02060e2:	02000513          	li	a0,32
ffffffffc02060e6:	3cfd                	addiw	s9,s9,-1
ffffffffc02060e8:	9902                	jalr	s2
ffffffffc02060ea:	fe0c9be3          	bnez	s9,ffffffffc02060e0 <vprintfmt+0x210>
ffffffffc02060ee:	6a22                	ld	s4,8(sp)
ffffffffc02060f0:	bd11                	j	ffffffffc0205f04 <vprintfmt+0x34>
ffffffffc02060f2:	4785                	li	a5,1
ffffffffc02060f4:	008a0b93          	addi	s7,s4,8
ffffffffc02060f8:	00c7c363          	blt	a5,a2,ffffffffc02060fe <vprintfmt+0x22e>
ffffffffc02060fc:	ce25                	beqz	a2,ffffffffc0206174 <vprintfmt+0x2a4>
ffffffffc02060fe:	000a3403          	ld	s0,0(s4)
ffffffffc0206102:	08044d63          	bltz	s0,ffffffffc020619c <vprintfmt+0x2cc>
ffffffffc0206106:	8622                	mv	a2,s0
ffffffffc0206108:	8a5e                	mv	s4,s7
ffffffffc020610a:	46a9                	li	a3,10
ffffffffc020610c:	b5f5                	j	ffffffffc0205ff8 <vprintfmt+0x128>
ffffffffc020610e:	000a2783          	lw	a5,0(s4)
ffffffffc0206112:	4661                	li	a2,24
ffffffffc0206114:	41f7d71b          	sraiw	a4,a5,0x1f
ffffffffc0206118:	8fb9                	xor	a5,a5,a4
ffffffffc020611a:	40e786bb          	subw	a3,a5,a4
ffffffffc020611e:	02d64663          	blt	a2,a3,ffffffffc020614a <vprintfmt+0x27a>
ffffffffc0206122:	00369713          	slli	a4,a3,0x3
ffffffffc0206126:	00003797          	auipc	a5,0x3
ffffffffc020612a:	f4278793          	addi	a5,a5,-190 # ffffffffc0209068 <error_string>
ffffffffc020612e:	97ba                	add	a5,a5,a4
ffffffffc0206130:	639c                	ld	a5,0(a5)
ffffffffc0206132:	cf81                	beqz	a5,ffffffffc020614a <vprintfmt+0x27a>
ffffffffc0206134:	86be                	mv	a3,a5
ffffffffc0206136:	00000617          	auipc	a2,0x0
ffffffffc020613a:	20260613          	addi	a2,a2,514 # ffffffffc0206338 <etext+0x2e>
ffffffffc020613e:	85a6                	mv	a1,s1
ffffffffc0206140:	854a                	mv	a0,s2
ffffffffc0206142:	0e8000ef          	jal	ffffffffc020622a <printfmt>
ffffffffc0206146:	0a21                	addi	s4,s4,8
ffffffffc0206148:	bb75                	j	ffffffffc0205f04 <vprintfmt+0x34>
ffffffffc020614a:	00002617          	auipc	a2,0x2
ffffffffc020614e:	40660613          	addi	a2,a2,1030 # ffffffffc0208550 <etext+0x2246>
ffffffffc0206152:	85a6                	mv	a1,s1
ffffffffc0206154:	854a                	mv	a0,s2
ffffffffc0206156:	0d4000ef          	jal	ffffffffc020622a <printfmt>
ffffffffc020615a:	0a21                	addi	s4,s4,8
ffffffffc020615c:	b365                	j	ffffffffc0205f04 <vprintfmt+0x34>
ffffffffc020615e:	2605                	addiw	a2,a2,1
ffffffffc0206160:	8462                	mv	s0,s8
ffffffffc0206162:	b3e9                	j	ffffffffc0205f2c <vprintfmt+0x5c>
ffffffffc0206164:	00044783          	lbu	a5,0(s0)
ffffffffc0206168:	0007851b          	sext.w	a0,a5
ffffffffc020616c:	d3c9                	beqz	a5,ffffffffc02060ee <vprintfmt+0x21e>
ffffffffc020616e:	00140a13          	addi	s4,s0,1
ffffffffc0206172:	bf2d                	j	ffffffffc02060ac <vprintfmt+0x1dc>
ffffffffc0206174:	000a2403          	lw	s0,0(s4)
ffffffffc0206178:	b769                	j	ffffffffc0206102 <vprintfmt+0x232>
ffffffffc020617a:	000a6603          	lwu	a2,0(s4)
ffffffffc020617e:	46a1                	li	a3,8
ffffffffc0206180:	8a3a                	mv	s4,a4
ffffffffc0206182:	bd9d                	j	ffffffffc0205ff8 <vprintfmt+0x128>
ffffffffc0206184:	000a6603          	lwu	a2,0(s4)
ffffffffc0206188:	46a9                	li	a3,10
ffffffffc020618a:	8a3a                	mv	s4,a4
ffffffffc020618c:	b5b5                	j	ffffffffc0205ff8 <vprintfmt+0x128>
ffffffffc020618e:	000a6603          	lwu	a2,0(s4)
ffffffffc0206192:	46c1                	li	a3,16
ffffffffc0206194:	8a3a                	mv	s4,a4
ffffffffc0206196:	b58d                	j	ffffffffc0205ff8 <vprintfmt+0x128>
ffffffffc0206198:	9902                	jalr	s2
ffffffffc020619a:	bf15                	j	ffffffffc02060ce <vprintfmt+0x1fe>
ffffffffc020619c:	85a6                	mv	a1,s1
ffffffffc020619e:	02d00513          	li	a0,45
ffffffffc02061a2:	9902                	jalr	s2
ffffffffc02061a4:	40800633          	neg	a2,s0
ffffffffc02061a8:	8a5e                	mv	s4,s7
ffffffffc02061aa:	46a9                	li	a3,10
ffffffffc02061ac:	b5b1                	j	ffffffffc0205ff8 <vprintfmt+0x128>
ffffffffc02061ae:	01905663          	blez	s9,ffffffffc02061ba <vprintfmt+0x2ea>
ffffffffc02061b2:	02d00793          	li	a5,45
ffffffffc02061b6:	04fd9263          	bne	s11,a5,ffffffffc02061fa <vprintfmt+0x32a>
ffffffffc02061ba:	02800793          	li	a5,40
ffffffffc02061be:	00002a17          	auipc	s4,0x2
ffffffffc02061c2:	38ba0a13          	addi	s4,s4,907 # ffffffffc0208549 <etext+0x223f>
ffffffffc02061c6:	02800513          	li	a0,40
ffffffffc02061ca:	b5cd                	j	ffffffffc02060ac <vprintfmt+0x1dc>
ffffffffc02061cc:	85ea                	mv	a1,s10
ffffffffc02061ce:	8522                	mv	a0,s0
ffffffffc02061d0:	094000ef          	jal	ffffffffc0206264 <strnlen>
ffffffffc02061d4:	40ac8cbb          	subw	s9,s9,a0
ffffffffc02061d8:	01905963          	blez	s9,ffffffffc02061ea <vprintfmt+0x31a>
ffffffffc02061dc:	2d81                	sext.w	s11,s11
ffffffffc02061de:	85a6                	mv	a1,s1
ffffffffc02061e0:	856e                	mv	a0,s11
ffffffffc02061e2:	3cfd                	addiw	s9,s9,-1
ffffffffc02061e4:	9902                	jalr	s2
ffffffffc02061e6:	fe0c9ce3          	bnez	s9,ffffffffc02061de <vprintfmt+0x30e>
ffffffffc02061ea:	00044783          	lbu	a5,0(s0)
ffffffffc02061ee:	0007851b          	sext.w	a0,a5
ffffffffc02061f2:	ea079de3          	bnez	a5,ffffffffc02060ac <vprintfmt+0x1dc>
ffffffffc02061f6:	6a22                	ld	s4,8(sp)
ffffffffc02061f8:	b331                	j	ffffffffc0205f04 <vprintfmt+0x34>
ffffffffc02061fa:	85ea                	mv	a1,s10
ffffffffc02061fc:	00002517          	auipc	a0,0x2
ffffffffc0206200:	34c50513          	addi	a0,a0,844 # ffffffffc0208548 <etext+0x223e>
ffffffffc0206204:	060000ef          	jal	ffffffffc0206264 <strnlen>
ffffffffc0206208:	40ac8cbb          	subw	s9,s9,a0
ffffffffc020620c:	00002417          	auipc	s0,0x2
ffffffffc0206210:	33c40413          	addi	s0,s0,828 # ffffffffc0208548 <etext+0x223e>
ffffffffc0206214:	00002a17          	auipc	s4,0x2
ffffffffc0206218:	335a0a13          	addi	s4,s4,821 # ffffffffc0208549 <etext+0x223f>
ffffffffc020621c:	02800793          	li	a5,40
ffffffffc0206220:	02800513          	li	a0,40
ffffffffc0206224:	fb904ce3          	bgtz	s9,ffffffffc02061dc <vprintfmt+0x30c>
ffffffffc0206228:	b551                	j	ffffffffc02060ac <vprintfmt+0x1dc>

ffffffffc020622a <printfmt>:
ffffffffc020622a:	715d                	addi	sp,sp,-80
ffffffffc020622c:	02810313          	addi	t1,sp,40
ffffffffc0206230:	f436                	sd	a3,40(sp)
ffffffffc0206232:	869a                	mv	a3,t1
ffffffffc0206234:	ec06                	sd	ra,24(sp)
ffffffffc0206236:	f83a                	sd	a4,48(sp)
ffffffffc0206238:	fc3e                	sd	a5,56(sp)
ffffffffc020623a:	e0c2                	sd	a6,64(sp)
ffffffffc020623c:	e4c6                	sd	a7,72(sp)
ffffffffc020623e:	e41a                	sd	t1,8(sp)
ffffffffc0206240:	c91ff0ef          	jal	ffffffffc0205ed0 <vprintfmt>
ffffffffc0206244:	60e2                	ld	ra,24(sp)
ffffffffc0206246:	6161                	addi	sp,sp,80
ffffffffc0206248:	8082                	ret

ffffffffc020624a <strlen>:
ffffffffc020624a:	00054783          	lbu	a5,0(a0)
ffffffffc020624e:	872a                	mv	a4,a0
ffffffffc0206250:	4501                	li	a0,0
ffffffffc0206252:	cb81                	beqz	a5,ffffffffc0206262 <strlen+0x18>
ffffffffc0206254:	0505                	addi	a0,a0,1
ffffffffc0206256:	00a707b3          	add	a5,a4,a0
ffffffffc020625a:	0007c783          	lbu	a5,0(a5)
ffffffffc020625e:	fbfd                	bnez	a5,ffffffffc0206254 <strlen+0xa>
ffffffffc0206260:	8082                	ret
ffffffffc0206262:	8082                	ret

ffffffffc0206264 <strnlen>:
ffffffffc0206264:	4781                	li	a5,0
ffffffffc0206266:	e589                	bnez	a1,ffffffffc0206270 <strnlen+0xc>
ffffffffc0206268:	a811                	j	ffffffffc020627c <strnlen+0x18>
ffffffffc020626a:	0785                	addi	a5,a5,1
ffffffffc020626c:	00f58863          	beq	a1,a5,ffffffffc020627c <strnlen+0x18>
ffffffffc0206270:	00f50733          	add	a4,a0,a5
ffffffffc0206274:	00074703          	lbu	a4,0(a4)
ffffffffc0206278:	fb6d                	bnez	a4,ffffffffc020626a <strnlen+0x6>
ffffffffc020627a:	85be                	mv	a1,a5
ffffffffc020627c:	852e                	mv	a0,a1
ffffffffc020627e:	8082                	ret

ffffffffc0206280 <strcpy>:
ffffffffc0206280:	87aa                	mv	a5,a0
ffffffffc0206282:	0005c703          	lbu	a4,0(a1)
ffffffffc0206286:	0785                	addi	a5,a5,1
ffffffffc0206288:	0585                	addi	a1,a1,1
ffffffffc020628a:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020628e:	fb75                	bnez	a4,ffffffffc0206282 <strcpy+0x2>
ffffffffc0206290:	8082                	ret

ffffffffc0206292 <strcmp>:
ffffffffc0206292:	00054783          	lbu	a5,0(a0)
ffffffffc0206296:	e791                	bnez	a5,ffffffffc02062a2 <strcmp+0x10>
ffffffffc0206298:	a02d                	j	ffffffffc02062c2 <strcmp+0x30>
ffffffffc020629a:	00054783          	lbu	a5,0(a0)
ffffffffc020629e:	cf89                	beqz	a5,ffffffffc02062b8 <strcmp+0x26>
ffffffffc02062a0:	85b6                	mv	a1,a3
ffffffffc02062a2:	0005c703          	lbu	a4,0(a1)
ffffffffc02062a6:	0505                	addi	a0,a0,1
ffffffffc02062a8:	00158693          	addi	a3,a1,1
ffffffffc02062ac:	fef707e3          	beq	a4,a5,ffffffffc020629a <strcmp+0x8>
ffffffffc02062b0:	0007851b          	sext.w	a0,a5
ffffffffc02062b4:	9d19                	subw	a0,a0,a4
ffffffffc02062b6:	8082                	ret
ffffffffc02062b8:	0015c703          	lbu	a4,1(a1)
ffffffffc02062bc:	4501                	li	a0,0
ffffffffc02062be:	9d19                	subw	a0,a0,a4
ffffffffc02062c0:	8082                	ret
ffffffffc02062c2:	0005c703          	lbu	a4,0(a1)
ffffffffc02062c6:	4501                	li	a0,0
ffffffffc02062c8:	b7f5                	j	ffffffffc02062b4 <strcmp+0x22>

ffffffffc02062ca <strchr>:
ffffffffc02062ca:	00054783          	lbu	a5,0(a0)
ffffffffc02062ce:	c799                	beqz	a5,ffffffffc02062dc <strchr+0x12>
ffffffffc02062d0:	00f58763          	beq	a1,a5,ffffffffc02062de <strchr+0x14>
ffffffffc02062d4:	00154783          	lbu	a5,1(a0)
ffffffffc02062d8:	0505                	addi	a0,a0,1
ffffffffc02062da:	fbfd                	bnez	a5,ffffffffc02062d0 <strchr+0x6>
ffffffffc02062dc:	4501                	li	a0,0
ffffffffc02062de:	8082                	ret

ffffffffc02062e0 <memset>:
ffffffffc02062e0:	ca01                	beqz	a2,ffffffffc02062f0 <memset+0x10>
ffffffffc02062e2:	962a                	add	a2,a2,a0
ffffffffc02062e4:	87aa                	mv	a5,a0
ffffffffc02062e6:	0785                	addi	a5,a5,1
ffffffffc02062e8:	feb78fa3          	sb	a1,-1(a5)
ffffffffc02062ec:	fef61de3          	bne	a2,a5,ffffffffc02062e6 <memset+0x6>
ffffffffc02062f0:	8082                	ret

ffffffffc02062f2 <memcpy>:
ffffffffc02062f2:	ca19                	beqz	a2,ffffffffc0206308 <memcpy+0x16>
ffffffffc02062f4:	962e                	add	a2,a2,a1
ffffffffc02062f6:	87aa                	mv	a5,a0
ffffffffc02062f8:	0005c703          	lbu	a4,0(a1)
ffffffffc02062fc:	0585                	addi	a1,a1,1
ffffffffc02062fe:	0785                	addi	a5,a5,1
ffffffffc0206300:	fee78fa3          	sb	a4,-1(a5)
ffffffffc0206304:	feb61ae3          	bne	a2,a1,ffffffffc02062f8 <memcpy+0x6>
ffffffffc0206308:	8082                	ret
