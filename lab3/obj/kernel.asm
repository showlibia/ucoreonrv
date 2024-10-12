
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
ffffffffc020003a:	00a50513          	addi	a0,a0,10 # ffffffffc020a040 <edata>
ffffffffc020003e:	00011617          	auipc	a2,0x11
ffffffffc0200042:	56260613          	addi	a2,a2,1378 # ffffffffc02115a0 <end>
ffffffffc0200046:	1141                	addi	sp,sp,-16
ffffffffc0200048:	8e09                	sub	a2,a2,a0
ffffffffc020004a:	4581                	li	a1,0
ffffffffc020004c:	e406                	sd	ra,8(sp)
ffffffffc020004e:	4b1030ef          	jal	ra,ffffffffc0203cfe <memset>
ffffffffc0200052:	00004597          	auipc	a1,0x4
ffffffffc0200056:	18658593          	addi	a1,a1,390 # ffffffffc02041d8 <etext+0x6>
ffffffffc020005a:	00004517          	auipc	a0,0x4
ffffffffc020005e:	19e50513          	addi	a0,a0,414 # ffffffffc02041f8 <etext+0x26>
ffffffffc0200062:	05c000ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0200066:	0fe000ef          	jal	ra,ffffffffc0200164 <print_kerninfo>
ffffffffc020006a:	6b5020ef          	jal	ra,ffffffffc0202f1e <pmm_init>
ffffffffc020006e:	4fc000ef          	jal	ra,ffffffffc020056a <idt_init>
ffffffffc0200072:	41f000ef          	jal	ra,ffffffffc0200c90 <vmm_init>
ffffffffc0200076:	35a000ef          	jal	ra,ffffffffc02003d0 <ide_init>
ffffffffc020007a:	228010ef          	jal	ra,ffffffffc02012a2 <swap_init>
ffffffffc020007e:	3aa000ef          	jal	ra,ffffffffc0200428 <clock_init>
ffffffffc0200082:	a001                	j	ffffffffc0200082 <kern_init+0x4c>

ffffffffc0200084 <cputch>:
ffffffffc0200084:	1141                	addi	sp,sp,-16
ffffffffc0200086:	e022                	sd	s0,0(sp)
ffffffffc0200088:	e406                	sd	ra,8(sp)
ffffffffc020008a:	842e                	mv	s0,a1
ffffffffc020008c:	3f0000ef          	jal	ra,ffffffffc020047c <cons_putc>
ffffffffc0200090:	401c                	lw	a5,0(s0)
ffffffffc0200092:	60a2                	ld	ra,8(sp)
ffffffffc0200094:	2785                	addiw	a5,a5,1
ffffffffc0200096:	c01c                	sw	a5,0(s0)
ffffffffc0200098:	6402                	ld	s0,0(sp)
ffffffffc020009a:	0141                	addi	sp,sp,16
ffffffffc020009c:	8082                	ret

ffffffffc020009e <vcprintf>:
ffffffffc020009e:	1101                	addi	sp,sp,-32
ffffffffc02000a0:	86ae                	mv	a3,a1
ffffffffc02000a2:	862a                	mv	a2,a0
ffffffffc02000a4:	006c                	addi	a1,sp,12
ffffffffc02000a6:	00000517          	auipc	a0,0x0
ffffffffc02000aa:	fde50513          	addi	a0,a0,-34 # ffffffffc0200084 <cputch>
ffffffffc02000ae:	ec06                	sd	ra,24(sp)
ffffffffc02000b0:	c602                	sw	zero,12(sp)
ffffffffc02000b2:	4e3030ef          	jal	ra,ffffffffc0203d94 <vprintfmt>
ffffffffc02000b6:	60e2                	ld	ra,24(sp)
ffffffffc02000b8:	4532                	lw	a0,12(sp)
ffffffffc02000ba:	6105                	addi	sp,sp,32
ffffffffc02000bc:	8082                	ret

ffffffffc02000be <cprintf>:
ffffffffc02000be:	711d                	addi	sp,sp,-96
ffffffffc02000c0:	02810313          	addi	t1,sp,40 # ffffffffc0209028 <boot_page_table_sv39+0x28>
ffffffffc02000c4:	f42e                	sd	a1,40(sp)
ffffffffc02000c6:	f832                	sd	a2,48(sp)
ffffffffc02000c8:	fc36                	sd	a3,56(sp)
ffffffffc02000ca:	862a                	mv	a2,a0
ffffffffc02000cc:	004c                	addi	a1,sp,4
ffffffffc02000ce:	00000517          	auipc	a0,0x0
ffffffffc02000d2:	fb650513          	addi	a0,a0,-74 # ffffffffc0200084 <cputch>
ffffffffc02000d6:	869a                	mv	a3,t1
ffffffffc02000d8:	ec06                	sd	ra,24(sp)
ffffffffc02000da:	e0ba                	sd	a4,64(sp)
ffffffffc02000dc:	e4be                	sd	a5,72(sp)
ffffffffc02000de:	e8c2                	sd	a6,80(sp)
ffffffffc02000e0:	ecc6                	sd	a7,88(sp)
ffffffffc02000e2:	e41a                	sd	t1,8(sp)
ffffffffc02000e4:	c202                	sw	zero,4(sp)
ffffffffc02000e6:	4af030ef          	jal	ra,ffffffffc0203d94 <vprintfmt>
ffffffffc02000ea:	60e2                	ld	ra,24(sp)
ffffffffc02000ec:	4512                	lw	a0,4(sp)
ffffffffc02000ee:	6125                	addi	sp,sp,96
ffffffffc02000f0:	8082                	ret

ffffffffc02000f2 <cputchar>:
ffffffffc02000f2:	a669                	j	ffffffffc020047c <cons_putc>

ffffffffc02000f4 <getchar>:
ffffffffc02000f4:	1141                	addi	sp,sp,-16
ffffffffc02000f6:	e406                	sd	ra,8(sp)
ffffffffc02000f8:	3b8000ef          	jal	ra,ffffffffc02004b0 <cons_getc>
ffffffffc02000fc:	dd75                	beqz	a0,ffffffffc02000f8 <getchar+0x4>
ffffffffc02000fe:	60a2                	ld	ra,8(sp)
ffffffffc0200100:	0141                	addi	sp,sp,16
ffffffffc0200102:	8082                	ret

ffffffffc0200104 <__panic>:
ffffffffc0200104:	00011317          	auipc	t1,0x11
ffffffffc0200108:	33c30313          	addi	t1,t1,828 # ffffffffc0211440 <is_panic>
ffffffffc020010c:	00032303          	lw	t1,0(t1)
ffffffffc0200110:	715d                	addi	sp,sp,-80
ffffffffc0200112:	ec06                	sd	ra,24(sp)
ffffffffc0200114:	e822                	sd	s0,16(sp)
ffffffffc0200116:	f436                	sd	a3,40(sp)
ffffffffc0200118:	f83a                	sd	a4,48(sp)
ffffffffc020011a:	fc3e                	sd	a5,56(sp)
ffffffffc020011c:	e0c2                	sd	a6,64(sp)
ffffffffc020011e:	e4c6                	sd	a7,72(sp)
ffffffffc0200120:	02031c63          	bnez	t1,ffffffffc0200158 <__panic+0x54>
ffffffffc0200124:	4785                	li	a5,1
ffffffffc0200126:	8432                	mv	s0,a2
ffffffffc0200128:	00011717          	auipc	a4,0x11
ffffffffc020012c:	30f72c23          	sw	a5,792(a4) # ffffffffc0211440 <is_panic>
ffffffffc0200130:	862e                	mv	a2,a1
ffffffffc0200132:	103c                	addi	a5,sp,40
ffffffffc0200134:	85aa                	mv	a1,a0
ffffffffc0200136:	00004517          	auipc	a0,0x4
ffffffffc020013a:	0ca50513          	addi	a0,a0,202 # ffffffffc0204200 <etext+0x2e>
ffffffffc020013e:	e43e                	sd	a5,8(sp)
ffffffffc0200140:	f7fff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0200144:	65a2                	ld	a1,8(sp)
ffffffffc0200146:	8522                	mv	a0,s0
ffffffffc0200148:	f57ff0ef          	jal	ra,ffffffffc020009e <vcprintf>
ffffffffc020014c:	00006517          	auipc	a0,0x6
ffffffffc0200150:	a5c50513          	addi	a0,a0,-1444 # ffffffffc0205ba8 <default_pmm_manager+0x598>
ffffffffc0200154:	f6bff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0200158:	39a000ef          	jal	ra,ffffffffc02004f2 <intr_disable>
ffffffffc020015c:	4501                	li	a0,0
ffffffffc020015e:	130000ef          	jal	ra,ffffffffc020028e <kmonitor>
ffffffffc0200162:	bfed                	j	ffffffffc020015c <__panic+0x58>

ffffffffc0200164 <print_kerninfo>:
ffffffffc0200164:	1141                	addi	sp,sp,-16
ffffffffc0200166:	00004517          	auipc	a0,0x4
ffffffffc020016a:	0ea50513          	addi	a0,a0,234 # ffffffffc0204250 <etext+0x7e>
ffffffffc020016e:	e406                	sd	ra,8(sp)
ffffffffc0200170:	f4fff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0200174:	00000597          	auipc	a1,0x0
ffffffffc0200178:	ec258593          	addi	a1,a1,-318 # ffffffffc0200036 <kern_init>
ffffffffc020017c:	00004517          	auipc	a0,0x4
ffffffffc0200180:	0f450513          	addi	a0,a0,244 # ffffffffc0204270 <etext+0x9e>
ffffffffc0200184:	f3bff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0200188:	00004597          	auipc	a1,0x4
ffffffffc020018c:	04a58593          	addi	a1,a1,74 # ffffffffc02041d2 <etext>
ffffffffc0200190:	00004517          	auipc	a0,0x4
ffffffffc0200194:	10050513          	addi	a0,a0,256 # ffffffffc0204290 <etext+0xbe>
ffffffffc0200198:	f27ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc020019c:	0000a597          	auipc	a1,0xa
ffffffffc02001a0:	ea458593          	addi	a1,a1,-348 # ffffffffc020a040 <edata>
ffffffffc02001a4:	00004517          	auipc	a0,0x4
ffffffffc02001a8:	10c50513          	addi	a0,a0,268 # ffffffffc02042b0 <etext+0xde>
ffffffffc02001ac:	f13ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc02001b0:	00011597          	auipc	a1,0x11
ffffffffc02001b4:	3f058593          	addi	a1,a1,1008 # ffffffffc02115a0 <end>
ffffffffc02001b8:	00004517          	auipc	a0,0x4
ffffffffc02001bc:	11850513          	addi	a0,a0,280 # ffffffffc02042d0 <etext+0xfe>
ffffffffc02001c0:	effff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc02001c4:	00011597          	auipc	a1,0x11
ffffffffc02001c8:	7db58593          	addi	a1,a1,2011 # ffffffffc021199f <end+0x3ff>
ffffffffc02001cc:	00000797          	auipc	a5,0x0
ffffffffc02001d0:	e6a78793          	addi	a5,a5,-406 # ffffffffc0200036 <kern_init>
ffffffffc02001d4:	40f587b3          	sub	a5,a1,a5
ffffffffc02001d8:	43f7d593          	srai	a1,a5,0x3f
ffffffffc02001dc:	60a2                	ld	ra,8(sp)
ffffffffc02001de:	3ff5f593          	andi	a1,a1,1023
ffffffffc02001e2:	95be                	add	a1,a1,a5
ffffffffc02001e4:	85a9                	srai	a1,a1,0xa
ffffffffc02001e6:	00004517          	auipc	a0,0x4
ffffffffc02001ea:	10a50513          	addi	a0,a0,266 # ffffffffc02042f0 <etext+0x11e>
ffffffffc02001ee:	0141                	addi	sp,sp,16
ffffffffc02001f0:	b5f9                	j	ffffffffc02000be <cprintf>

ffffffffc02001f2 <print_stackframe>:
ffffffffc02001f2:	1141                	addi	sp,sp,-16
ffffffffc02001f4:	00004617          	auipc	a2,0x4
ffffffffc02001f8:	02c60613          	addi	a2,a2,44 # ffffffffc0204220 <etext+0x4e>
ffffffffc02001fc:	05b00593          	li	a1,91
ffffffffc0200200:	00004517          	auipc	a0,0x4
ffffffffc0200204:	03850513          	addi	a0,a0,56 # ffffffffc0204238 <etext+0x66>
ffffffffc0200208:	e406                	sd	ra,8(sp)
ffffffffc020020a:	efbff0ef          	jal	ra,ffffffffc0200104 <__panic>

ffffffffc020020e <mon_help>:
ffffffffc020020e:	1141                	addi	sp,sp,-16
ffffffffc0200210:	00004617          	auipc	a2,0x4
ffffffffc0200214:	1e860613          	addi	a2,a2,488 # ffffffffc02043f8 <commands+0xd8>
ffffffffc0200218:	00004597          	auipc	a1,0x4
ffffffffc020021c:	20058593          	addi	a1,a1,512 # ffffffffc0204418 <commands+0xf8>
ffffffffc0200220:	00004517          	auipc	a0,0x4
ffffffffc0200224:	20050513          	addi	a0,a0,512 # ffffffffc0204420 <commands+0x100>
ffffffffc0200228:	e406                	sd	ra,8(sp)
ffffffffc020022a:	e95ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc020022e:	00004617          	auipc	a2,0x4
ffffffffc0200232:	20260613          	addi	a2,a2,514 # ffffffffc0204430 <commands+0x110>
ffffffffc0200236:	00004597          	auipc	a1,0x4
ffffffffc020023a:	22258593          	addi	a1,a1,546 # ffffffffc0204458 <commands+0x138>
ffffffffc020023e:	00004517          	auipc	a0,0x4
ffffffffc0200242:	1e250513          	addi	a0,a0,482 # ffffffffc0204420 <commands+0x100>
ffffffffc0200246:	e79ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc020024a:	00004617          	auipc	a2,0x4
ffffffffc020024e:	21e60613          	addi	a2,a2,542 # ffffffffc0204468 <commands+0x148>
ffffffffc0200252:	00004597          	auipc	a1,0x4
ffffffffc0200256:	23658593          	addi	a1,a1,566 # ffffffffc0204488 <commands+0x168>
ffffffffc020025a:	00004517          	auipc	a0,0x4
ffffffffc020025e:	1c650513          	addi	a0,a0,454 # ffffffffc0204420 <commands+0x100>
ffffffffc0200262:	e5dff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0200266:	60a2                	ld	ra,8(sp)
ffffffffc0200268:	4501                	li	a0,0
ffffffffc020026a:	0141                	addi	sp,sp,16
ffffffffc020026c:	8082                	ret

ffffffffc020026e <mon_kerninfo>:
ffffffffc020026e:	1141                	addi	sp,sp,-16
ffffffffc0200270:	e406                	sd	ra,8(sp)
ffffffffc0200272:	ef3ff0ef          	jal	ra,ffffffffc0200164 <print_kerninfo>
ffffffffc0200276:	60a2                	ld	ra,8(sp)
ffffffffc0200278:	4501                	li	a0,0
ffffffffc020027a:	0141                	addi	sp,sp,16
ffffffffc020027c:	8082                	ret

ffffffffc020027e <mon_backtrace>:
ffffffffc020027e:	1141                	addi	sp,sp,-16
ffffffffc0200280:	e406                	sd	ra,8(sp)
ffffffffc0200282:	f71ff0ef          	jal	ra,ffffffffc02001f2 <print_stackframe>
ffffffffc0200286:	60a2                	ld	ra,8(sp)
ffffffffc0200288:	4501                	li	a0,0
ffffffffc020028a:	0141                	addi	sp,sp,16
ffffffffc020028c:	8082                	ret

ffffffffc020028e <kmonitor>:
ffffffffc020028e:	7115                	addi	sp,sp,-224
ffffffffc0200290:	e962                	sd	s8,144(sp)
ffffffffc0200292:	8c2a                	mv	s8,a0
ffffffffc0200294:	00004517          	auipc	a0,0x4
ffffffffc0200298:	0d450513          	addi	a0,a0,212 # ffffffffc0204368 <commands+0x48>
ffffffffc020029c:	ed86                	sd	ra,216(sp)
ffffffffc020029e:	e9a2                	sd	s0,208(sp)
ffffffffc02002a0:	e5a6                	sd	s1,200(sp)
ffffffffc02002a2:	e1ca                	sd	s2,192(sp)
ffffffffc02002a4:	fd4e                	sd	s3,184(sp)
ffffffffc02002a6:	f952                	sd	s4,176(sp)
ffffffffc02002a8:	f556                	sd	s5,168(sp)
ffffffffc02002aa:	f15a                	sd	s6,160(sp)
ffffffffc02002ac:	ed5e                	sd	s7,152(sp)
ffffffffc02002ae:	e566                	sd	s9,136(sp)
ffffffffc02002b0:	e16a                	sd	s10,128(sp)
ffffffffc02002b2:	e0dff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc02002b6:	00004517          	auipc	a0,0x4
ffffffffc02002ba:	0da50513          	addi	a0,a0,218 # ffffffffc0204390 <commands+0x70>
ffffffffc02002be:	e01ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc02002c2:	000c0563          	beqz	s8,ffffffffc02002cc <kmonitor+0x3e>
ffffffffc02002c6:	8562                	mv	a0,s8
ffffffffc02002c8:	48c000ef          	jal	ra,ffffffffc0200754 <print_trapframe>
ffffffffc02002cc:	00004c97          	auipc	s9,0x4
ffffffffc02002d0:	054c8c93          	addi	s9,s9,84 # ffffffffc0204320 <commands>
ffffffffc02002d4:	00005997          	auipc	s3,0x5
ffffffffc02002d8:	f3c98993          	addi	s3,s3,-196 # ffffffffc0205210 <commands+0xef0>
ffffffffc02002dc:	00004917          	auipc	s2,0x4
ffffffffc02002e0:	0dc90913          	addi	s2,s2,220 # ffffffffc02043b8 <commands+0x98>
ffffffffc02002e4:	4a3d                	li	s4,15
ffffffffc02002e6:	00004b17          	auipc	s6,0x4
ffffffffc02002ea:	0dab0b13          	addi	s6,s6,218 # ffffffffc02043c0 <commands+0xa0>
ffffffffc02002ee:	00004a97          	auipc	s5,0x4
ffffffffc02002f2:	12aa8a93          	addi	s5,s5,298 # ffffffffc0204418 <commands+0xf8>
ffffffffc02002f6:	4b8d                	li	s7,3
ffffffffc02002f8:	854e                	mv	a0,s3
ffffffffc02002fa:	61b030ef          	jal	ra,ffffffffc0204114 <readline>
ffffffffc02002fe:	842a                	mv	s0,a0
ffffffffc0200300:	dd65                	beqz	a0,ffffffffc02002f8 <kmonitor+0x6a>
ffffffffc0200302:	00054583          	lbu	a1,0(a0)
ffffffffc0200306:	4481                	li	s1,0
ffffffffc0200308:	c999                	beqz	a1,ffffffffc020031e <kmonitor+0x90>
ffffffffc020030a:	854a                	mv	a0,s2
ffffffffc020030c:	1d5030ef          	jal	ra,ffffffffc0203ce0 <strchr>
ffffffffc0200310:	c925                	beqz	a0,ffffffffc0200380 <kmonitor+0xf2>
ffffffffc0200312:	00144583          	lbu	a1,1(s0)
ffffffffc0200316:	00040023          	sb	zero,0(s0)
ffffffffc020031a:	0405                	addi	s0,s0,1
ffffffffc020031c:	f5fd                	bnez	a1,ffffffffc020030a <kmonitor+0x7c>
ffffffffc020031e:	dce9                	beqz	s1,ffffffffc02002f8 <kmonitor+0x6a>
ffffffffc0200320:	6582                	ld	a1,0(sp)
ffffffffc0200322:	00004d17          	auipc	s10,0x4
ffffffffc0200326:	ffed0d13          	addi	s10,s10,-2 # ffffffffc0204320 <commands>
ffffffffc020032a:	8556                	mv	a0,s5
ffffffffc020032c:	4401                	li	s0,0
ffffffffc020032e:	0d61                	addi	s10,s10,24
ffffffffc0200330:	187030ef          	jal	ra,ffffffffc0203cb6 <strcmp>
ffffffffc0200334:	c919                	beqz	a0,ffffffffc020034a <kmonitor+0xbc>
ffffffffc0200336:	2405                	addiw	s0,s0,1
ffffffffc0200338:	09740463          	beq	s0,s7,ffffffffc02003c0 <kmonitor+0x132>
ffffffffc020033c:	000d3503          	ld	a0,0(s10)
ffffffffc0200340:	6582                	ld	a1,0(sp)
ffffffffc0200342:	0d61                	addi	s10,s10,24
ffffffffc0200344:	173030ef          	jal	ra,ffffffffc0203cb6 <strcmp>
ffffffffc0200348:	f57d                	bnez	a0,ffffffffc0200336 <kmonitor+0xa8>
ffffffffc020034a:	00141793          	slli	a5,s0,0x1
ffffffffc020034e:	97a2                	add	a5,a5,s0
ffffffffc0200350:	078e                	slli	a5,a5,0x3
ffffffffc0200352:	97e6                	add	a5,a5,s9
ffffffffc0200354:	6b9c                	ld	a5,16(a5)
ffffffffc0200356:	8662                	mv	a2,s8
ffffffffc0200358:	002c                	addi	a1,sp,8
ffffffffc020035a:	fff4851b          	addiw	a0,s1,-1
ffffffffc020035e:	9782                	jalr	a5
ffffffffc0200360:	f8055ce3          	bgez	a0,ffffffffc02002f8 <kmonitor+0x6a>
ffffffffc0200364:	60ee                	ld	ra,216(sp)
ffffffffc0200366:	644e                	ld	s0,208(sp)
ffffffffc0200368:	64ae                	ld	s1,200(sp)
ffffffffc020036a:	690e                	ld	s2,192(sp)
ffffffffc020036c:	79ea                	ld	s3,184(sp)
ffffffffc020036e:	7a4a                	ld	s4,176(sp)
ffffffffc0200370:	7aaa                	ld	s5,168(sp)
ffffffffc0200372:	7b0a                	ld	s6,160(sp)
ffffffffc0200374:	6bea                	ld	s7,152(sp)
ffffffffc0200376:	6c4a                	ld	s8,144(sp)
ffffffffc0200378:	6caa                	ld	s9,136(sp)
ffffffffc020037a:	6d0a                	ld	s10,128(sp)
ffffffffc020037c:	612d                	addi	sp,sp,224
ffffffffc020037e:	8082                	ret
ffffffffc0200380:	00044783          	lbu	a5,0(s0)
ffffffffc0200384:	dfc9                	beqz	a5,ffffffffc020031e <kmonitor+0x90>
ffffffffc0200386:	03448863          	beq	s1,s4,ffffffffc02003b6 <kmonitor+0x128>
ffffffffc020038a:	00349793          	slli	a5,s1,0x3
ffffffffc020038e:	0118                	addi	a4,sp,128
ffffffffc0200390:	97ba                	add	a5,a5,a4
ffffffffc0200392:	f887b023          	sd	s0,-128(a5)
ffffffffc0200396:	00044583          	lbu	a1,0(s0)
ffffffffc020039a:	2485                	addiw	s1,s1,1
ffffffffc020039c:	e591                	bnez	a1,ffffffffc02003a8 <kmonitor+0x11a>
ffffffffc020039e:	b749                	j	ffffffffc0200320 <kmonitor+0x92>
ffffffffc02003a0:	0405                	addi	s0,s0,1
ffffffffc02003a2:	00044583          	lbu	a1,0(s0)
ffffffffc02003a6:	ddad                	beqz	a1,ffffffffc0200320 <kmonitor+0x92>
ffffffffc02003a8:	854a                	mv	a0,s2
ffffffffc02003aa:	137030ef          	jal	ra,ffffffffc0203ce0 <strchr>
ffffffffc02003ae:	d96d                	beqz	a0,ffffffffc02003a0 <kmonitor+0x112>
ffffffffc02003b0:	00044583          	lbu	a1,0(s0)
ffffffffc02003b4:	bf91                	j	ffffffffc0200308 <kmonitor+0x7a>
ffffffffc02003b6:	45c1                	li	a1,16
ffffffffc02003b8:	855a                	mv	a0,s6
ffffffffc02003ba:	d05ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc02003be:	b7f1                	j	ffffffffc020038a <kmonitor+0xfc>
ffffffffc02003c0:	6582                	ld	a1,0(sp)
ffffffffc02003c2:	00004517          	auipc	a0,0x4
ffffffffc02003c6:	01e50513          	addi	a0,a0,30 # ffffffffc02043e0 <commands+0xc0>
ffffffffc02003ca:	cf5ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc02003ce:	b72d                	j	ffffffffc02002f8 <kmonitor+0x6a>

ffffffffc02003d0 <ide_init>:
ffffffffc02003d0:	8082                	ret

ffffffffc02003d2 <ide_device_valid>:
ffffffffc02003d2:	00253513          	sltiu	a0,a0,2
ffffffffc02003d6:	8082                	ret

ffffffffc02003d8 <ide_device_size>:
ffffffffc02003d8:	03800513          	li	a0,56
ffffffffc02003dc:	8082                	ret

ffffffffc02003de <ide_read_secs>:
ffffffffc02003de:	0000a797          	auipc	a5,0xa
ffffffffc02003e2:	c6278793          	addi	a5,a5,-926 # ffffffffc020a040 <edata>
ffffffffc02003e6:	0095959b          	slliw	a1,a1,0x9
ffffffffc02003ea:	1141                	addi	sp,sp,-16
ffffffffc02003ec:	8532                	mv	a0,a2
ffffffffc02003ee:	95be                	add	a1,a1,a5
ffffffffc02003f0:	00969613          	slli	a2,a3,0x9
ffffffffc02003f4:	e406                	sd	ra,8(sp)
ffffffffc02003f6:	11b030ef          	jal	ra,ffffffffc0203d10 <memcpy>
ffffffffc02003fa:	60a2                	ld	ra,8(sp)
ffffffffc02003fc:	4501                	li	a0,0
ffffffffc02003fe:	0141                	addi	sp,sp,16
ffffffffc0200400:	8082                	ret

ffffffffc0200402 <ide_write_secs>:
ffffffffc0200402:	8732                	mv	a4,a2
ffffffffc0200404:	0095979b          	slliw	a5,a1,0x9
ffffffffc0200408:	0000a517          	auipc	a0,0xa
ffffffffc020040c:	c3850513          	addi	a0,a0,-968 # ffffffffc020a040 <edata>
ffffffffc0200410:	1141                	addi	sp,sp,-16
ffffffffc0200412:	00969613          	slli	a2,a3,0x9
ffffffffc0200416:	85ba                	mv	a1,a4
ffffffffc0200418:	953e                	add	a0,a0,a5
ffffffffc020041a:	e406                	sd	ra,8(sp)
ffffffffc020041c:	0f5030ef          	jal	ra,ffffffffc0203d10 <memcpy>
ffffffffc0200420:	60a2                	ld	ra,8(sp)
ffffffffc0200422:	4501                	li	a0,0
ffffffffc0200424:	0141                	addi	sp,sp,16
ffffffffc0200426:	8082                	ret

ffffffffc0200428 <clock_init>:
ffffffffc0200428:	67e1                	lui	a5,0x18
ffffffffc020042a:	6a078793          	addi	a5,a5,1696 # 186a0 <BASE_ADDRESS-0xffffffffc01e7960>
ffffffffc020042e:	00011717          	auipc	a4,0x11
ffffffffc0200432:	00f73d23          	sd	a5,26(a4) # ffffffffc0211448 <timebase>
ffffffffc0200436:	c0102573          	rdtime	a0
ffffffffc020043a:	4581                	li	a1,0
ffffffffc020043c:	953e                	add	a0,a0,a5
ffffffffc020043e:	4601                	li	a2,0
ffffffffc0200440:	4881                	li	a7,0
ffffffffc0200442:	00000073          	ecall
ffffffffc0200446:	02000793          	li	a5,32
ffffffffc020044a:	1047a7f3          	csrrs	a5,sie,a5
ffffffffc020044e:	00004517          	auipc	a0,0x4
ffffffffc0200452:	04a50513          	addi	a0,a0,74 # ffffffffc0204498 <commands+0x178>
ffffffffc0200456:	00011797          	auipc	a5,0x11
ffffffffc020045a:	0207b123          	sd	zero,34(a5) # ffffffffc0211478 <ticks>
ffffffffc020045e:	b185                	j	ffffffffc02000be <cprintf>

ffffffffc0200460 <clock_set_next_event>:
ffffffffc0200460:	c0102573          	rdtime	a0
ffffffffc0200464:	00011797          	auipc	a5,0x11
ffffffffc0200468:	fe478793          	addi	a5,a5,-28 # ffffffffc0211448 <timebase>
ffffffffc020046c:	639c                	ld	a5,0(a5)
ffffffffc020046e:	4581                	li	a1,0
ffffffffc0200470:	4601                	li	a2,0
ffffffffc0200472:	953e                	add	a0,a0,a5
ffffffffc0200474:	4881                	li	a7,0
ffffffffc0200476:	00000073          	ecall
ffffffffc020047a:	8082                	ret

ffffffffc020047c <cons_putc>:
ffffffffc020047c:	100027f3          	csrr	a5,sstatus
ffffffffc0200480:	8b89                	andi	a5,a5,2
ffffffffc0200482:	0ff57513          	andi	a0,a0,255
ffffffffc0200486:	e799                	bnez	a5,ffffffffc0200494 <cons_putc+0x18>
ffffffffc0200488:	4581                	li	a1,0
ffffffffc020048a:	4601                	li	a2,0
ffffffffc020048c:	4885                	li	a7,1
ffffffffc020048e:	00000073          	ecall
ffffffffc0200492:	8082                	ret
ffffffffc0200494:	1101                	addi	sp,sp,-32
ffffffffc0200496:	ec06                	sd	ra,24(sp)
ffffffffc0200498:	e42a                	sd	a0,8(sp)
ffffffffc020049a:	058000ef          	jal	ra,ffffffffc02004f2 <intr_disable>
ffffffffc020049e:	6522                	ld	a0,8(sp)
ffffffffc02004a0:	4581                	li	a1,0
ffffffffc02004a2:	4601                	li	a2,0
ffffffffc02004a4:	4885                	li	a7,1
ffffffffc02004a6:	00000073          	ecall
ffffffffc02004aa:	60e2                	ld	ra,24(sp)
ffffffffc02004ac:	6105                	addi	sp,sp,32
ffffffffc02004ae:	a83d                	j	ffffffffc02004ec <intr_enable>

ffffffffc02004b0 <cons_getc>:
ffffffffc02004b0:	100027f3          	csrr	a5,sstatus
ffffffffc02004b4:	8b89                	andi	a5,a5,2
ffffffffc02004b6:	eb89                	bnez	a5,ffffffffc02004c8 <cons_getc+0x18>
ffffffffc02004b8:	4501                	li	a0,0
ffffffffc02004ba:	4581                	li	a1,0
ffffffffc02004bc:	4601                	li	a2,0
ffffffffc02004be:	4889                	li	a7,2
ffffffffc02004c0:	00000073          	ecall
ffffffffc02004c4:	2501                	sext.w	a0,a0
ffffffffc02004c6:	8082                	ret
ffffffffc02004c8:	1101                	addi	sp,sp,-32
ffffffffc02004ca:	ec06                	sd	ra,24(sp)
ffffffffc02004cc:	026000ef          	jal	ra,ffffffffc02004f2 <intr_disable>
ffffffffc02004d0:	4501                	li	a0,0
ffffffffc02004d2:	4581                	li	a1,0
ffffffffc02004d4:	4601                	li	a2,0
ffffffffc02004d6:	4889                	li	a7,2
ffffffffc02004d8:	00000073          	ecall
ffffffffc02004dc:	2501                	sext.w	a0,a0
ffffffffc02004de:	e42a                	sd	a0,8(sp)
ffffffffc02004e0:	00c000ef          	jal	ra,ffffffffc02004ec <intr_enable>
ffffffffc02004e4:	60e2                	ld	ra,24(sp)
ffffffffc02004e6:	6522                	ld	a0,8(sp)
ffffffffc02004e8:	6105                	addi	sp,sp,32
ffffffffc02004ea:	8082                	ret

ffffffffc02004ec <intr_enable>:
ffffffffc02004ec:	100167f3          	csrrsi	a5,sstatus,2
ffffffffc02004f0:	8082                	ret

ffffffffc02004f2 <intr_disable>:
ffffffffc02004f2:	100177f3          	csrrci	a5,sstatus,2
ffffffffc02004f6:	8082                	ret

ffffffffc02004f8 <pgfault_handler>:
ffffffffc02004f8:	10053783          	ld	a5,256(a0)
ffffffffc02004fc:	1141                	addi	sp,sp,-16
ffffffffc02004fe:	e022                	sd	s0,0(sp)
ffffffffc0200500:	e406                	sd	ra,8(sp)
ffffffffc0200502:	1007f793          	andi	a5,a5,256
ffffffffc0200506:	842a                	mv	s0,a0
ffffffffc0200508:	11053583          	ld	a1,272(a0)
ffffffffc020050c:	05500613          	li	a2,85
ffffffffc0200510:	c399                	beqz	a5,ffffffffc0200516 <pgfault_handler+0x1e>
ffffffffc0200512:	04b00613          	li	a2,75
ffffffffc0200516:	11843703          	ld	a4,280(s0)
ffffffffc020051a:	47bd                	li	a5,15
ffffffffc020051c:	05700693          	li	a3,87
ffffffffc0200520:	00f70463          	beq	a4,a5,ffffffffc0200528 <pgfault_handler+0x30>
ffffffffc0200524:	05200693          	li	a3,82
ffffffffc0200528:	00004517          	auipc	a0,0x4
ffffffffc020052c:	26850513          	addi	a0,a0,616 # ffffffffc0204790 <commands+0x470>
ffffffffc0200530:	b8fff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0200534:	00011797          	auipc	a5,0x11
ffffffffc0200538:	f4c78793          	addi	a5,a5,-180 # ffffffffc0211480 <check_mm_struct>
ffffffffc020053c:	6388                	ld	a0,0(a5)
ffffffffc020053e:	c911                	beqz	a0,ffffffffc0200552 <pgfault_handler+0x5a>
ffffffffc0200540:	11043603          	ld	a2,272(s0)
ffffffffc0200544:	11843583          	ld	a1,280(s0)
ffffffffc0200548:	6402                	ld	s0,0(sp)
ffffffffc020054a:	60a2                	ld	ra,8(sp)
ffffffffc020054c:	0141                	addi	sp,sp,16
ffffffffc020054e:	4810006f          	j	ffffffffc02011ce <do_pgfault>
ffffffffc0200552:	00004617          	auipc	a2,0x4
ffffffffc0200556:	25e60613          	addi	a2,a2,606 # ffffffffc02047b0 <commands+0x490>
ffffffffc020055a:	07700593          	li	a1,119
ffffffffc020055e:	00004517          	auipc	a0,0x4
ffffffffc0200562:	26a50513          	addi	a0,a0,618 # ffffffffc02047c8 <commands+0x4a8>
ffffffffc0200566:	b9fff0ef          	jal	ra,ffffffffc0200104 <__panic>

ffffffffc020056a <idt_init>:
ffffffffc020056a:	14005073          	csrwi	sscratch,0
ffffffffc020056e:	00000797          	auipc	a5,0x0
ffffffffc0200572:	48278793          	addi	a5,a5,1154 # ffffffffc02009f0 <__alltraps>
ffffffffc0200576:	10579073          	csrw	stvec,a5
ffffffffc020057a:	100167f3          	csrrsi	a5,sstatus,2
ffffffffc020057e:	000407b7          	lui	a5,0x40
ffffffffc0200582:	1007a7f3          	csrrs	a5,sstatus,a5
ffffffffc0200586:	8082                	ret

ffffffffc0200588 <print_regs>:
ffffffffc0200588:	610c                	ld	a1,0(a0)
ffffffffc020058a:	1141                	addi	sp,sp,-16
ffffffffc020058c:	e022                	sd	s0,0(sp)
ffffffffc020058e:	842a                	mv	s0,a0
ffffffffc0200590:	00004517          	auipc	a0,0x4
ffffffffc0200594:	25050513          	addi	a0,a0,592 # ffffffffc02047e0 <commands+0x4c0>
ffffffffc0200598:	e406                	sd	ra,8(sp)
ffffffffc020059a:	b25ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc020059e:	640c                	ld	a1,8(s0)
ffffffffc02005a0:	00004517          	auipc	a0,0x4
ffffffffc02005a4:	25850513          	addi	a0,a0,600 # ffffffffc02047f8 <commands+0x4d8>
ffffffffc02005a8:	b17ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc02005ac:	680c                	ld	a1,16(s0)
ffffffffc02005ae:	00004517          	auipc	a0,0x4
ffffffffc02005b2:	26250513          	addi	a0,a0,610 # ffffffffc0204810 <commands+0x4f0>
ffffffffc02005b6:	b09ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc02005ba:	6c0c                	ld	a1,24(s0)
ffffffffc02005bc:	00004517          	auipc	a0,0x4
ffffffffc02005c0:	26c50513          	addi	a0,a0,620 # ffffffffc0204828 <commands+0x508>
ffffffffc02005c4:	afbff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc02005c8:	700c                	ld	a1,32(s0)
ffffffffc02005ca:	00004517          	auipc	a0,0x4
ffffffffc02005ce:	27650513          	addi	a0,a0,630 # ffffffffc0204840 <commands+0x520>
ffffffffc02005d2:	aedff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc02005d6:	740c                	ld	a1,40(s0)
ffffffffc02005d8:	00004517          	auipc	a0,0x4
ffffffffc02005dc:	28050513          	addi	a0,a0,640 # ffffffffc0204858 <commands+0x538>
ffffffffc02005e0:	adfff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc02005e4:	780c                	ld	a1,48(s0)
ffffffffc02005e6:	00004517          	auipc	a0,0x4
ffffffffc02005ea:	28a50513          	addi	a0,a0,650 # ffffffffc0204870 <commands+0x550>
ffffffffc02005ee:	ad1ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc02005f2:	7c0c                	ld	a1,56(s0)
ffffffffc02005f4:	00004517          	auipc	a0,0x4
ffffffffc02005f8:	29450513          	addi	a0,a0,660 # ffffffffc0204888 <commands+0x568>
ffffffffc02005fc:	ac3ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0200600:	602c                	ld	a1,64(s0)
ffffffffc0200602:	00004517          	auipc	a0,0x4
ffffffffc0200606:	29e50513          	addi	a0,a0,670 # ffffffffc02048a0 <commands+0x580>
ffffffffc020060a:	ab5ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc020060e:	642c                	ld	a1,72(s0)
ffffffffc0200610:	00004517          	auipc	a0,0x4
ffffffffc0200614:	2a850513          	addi	a0,a0,680 # ffffffffc02048b8 <commands+0x598>
ffffffffc0200618:	aa7ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc020061c:	682c                	ld	a1,80(s0)
ffffffffc020061e:	00004517          	auipc	a0,0x4
ffffffffc0200622:	2b250513          	addi	a0,a0,690 # ffffffffc02048d0 <commands+0x5b0>
ffffffffc0200626:	a99ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc020062a:	6c2c                	ld	a1,88(s0)
ffffffffc020062c:	00004517          	auipc	a0,0x4
ffffffffc0200630:	2bc50513          	addi	a0,a0,700 # ffffffffc02048e8 <commands+0x5c8>
ffffffffc0200634:	a8bff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0200638:	702c                	ld	a1,96(s0)
ffffffffc020063a:	00004517          	auipc	a0,0x4
ffffffffc020063e:	2c650513          	addi	a0,a0,710 # ffffffffc0204900 <commands+0x5e0>
ffffffffc0200642:	a7dff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0200646:	742c                	ld	a1,104(s0)
ffffffffc0200648:	00004517          	auipc	a0,0x4
ffffffffc020064c:	2d050513          	addi	a0,a0,720 # ffffffffc0204918 <commands+0x5f8>
ffffffffc0200650:	a6fff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0200654:	782c                	ld	a1,112(s0)
ffffffffc0200656:	00004517          	auipc	a0,0x4
ffffffffc020065a:	2da50513          	addi	a0,a0,730 # ffffffffc0204930 <commands+0x610>
ffffffffc020065e:	a61ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0200662:	7c2c                	ld	a1,120(s0)
ffffffffc0200664:	00004517          	auipc	a0,0x4
ffffffffc0200668:	2e450513          	addi	a0,a0,740 # ffffffffc0204948 <commands+0x628>
ffffffffc020066c:	a53ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0200670:	604c                	ld	a1,128(s0)
ffffffffc0200672:	00004517          	auipc	a0,0x4
ffffffffc0200676:	2ee50513          	addi	a0,a0,750 # ffffffffc0204960 <commands+0x640>
ffffffffc020067a:	a45ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc020067e:	644c                	ld	a1,136(s0)
ffffffffc0200680:	00004517          	auipc	a0,0x4
ffffffffc0200684:	2f850513          	addi	a0,a0,760 # ffffffffc0204978 <commands+0x658>
ffffffffc0200688:	a37ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc020068c:	684c                	ld	a1,144(s0)
ffffffffc020068e:	00004517          	auipc	a0,0x4
ffffffffc0200692:	30250513          	addi	a0,a0,770 # ffffffffc0204990 <commands+0x670>
ffffffffc0200696:	a29ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc020069a:	6c4c                	ld	a1,152(s0)
ffffffffc020069c:	00004517          	auipc	a0,0x4
ffffffffc02006a0:	30c50513          	addi	a0,a0,780 # ffffffffc02049a8 <commands+0x688>
ffffffffc02006a4:	a1bff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc02006a8:	704c                	ld	a1,160(s0)
ffffffffc02006aa:	00004517          	auipc	a0,0x4
ffffffffc02006ae:	31650513          	addi	a0,a0,790 # ffffffffc02049c0 <commands+0x6a0>
ffffffffc02006b2:	a0dff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc02006b6:	744c                	ld	a1,168(s0)
ffffffffc02006b8:	00004517          	auipc	a0,0x4
ffffffffc02006bc:	32050513          	addi	a0,a0,800 # ffffffffc02049d8 <commands+0x6b8>
ffffffffc02006c0:	9ffff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc02006c4:	784c                	ld	a1,176(s0)
ffffffffc02006c6:	00004517          	auipc	a0,0x4
ffffffffc02006ca:	32a50513          	addi	a0,a0,810 # ffffffffc02049f0 <commands+0x6d0>
ffffffffc02006ce:	9f1ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc02006d2:	7c4c                	ld	a1,184(s0)
ffffffffc02006d4:	00004517          	auipc	a0,0x4
ffffffffc02006d8:	33450513          	addi	a0,a0,820 # ffffffffc0204a08 <commands+0x6e8>
ffffffffc02006dc:	9e3ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc02006e0:	606c                	ld	a1,192(s0)
ffffffffc02006e2:	00004517          	auipc	a0,0x4
ffffffffc02006e6:	33e50513          	addi	a0,a0,830 # ffffffffc0204a20 <commands+0x700>
ffffffffc02006ea:	9d5ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc02006ee:	646c                	ld	a1,200(s0)
ffffffffc02006f0:	00004517          	auipc	a0,0x4
ffffffffc02006f4:	34850513          	addi	a0,a0,840 # ffffffffc0204a38 <commands+0x718>
ffffffffc02006f8:	9c7ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc02006fc:	686c                	ld	a1,208(s0)
ffffffffc02006fe:	00004517          	auipc	a0,0x4
ffffffffc0200702:	35250513          	addi	a0,a0,850 # ffffffffc0204a50 <commands+0x730>
ffffffffc0200706:	9b9ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc020070a:	6c6c                	ld	a1,216(s0)
ffffffffc020070c:	00004517          	auipc	a0,0x4
ffffffffc0200710:	35c50513          	addi	a0,a0,860 # ffffffffc0204a68 <commands+0x748>
ffffffffc0200714:	9abff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0200718:	706c                	ld	a1,224(s0)
ffffffffc020071a:	00004517          	auipc	a0,0x4
ffffffffc020071e:	36650513          	addi	a0,a0,870 # ffffffffc0204a80 <commands+0x760>
ffffffffc0200722:	99dff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0200726:	746c                	ld	a1,232(s0)
ffffffffc0200728:	00004517          	auipc	a0,0x4
ffffffffc020072c:	37050513          	addi	a0,a0,880 # ffffffffc0204a98 <commands+0x778>
ffffffffc0200730:	98fff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0200734:	786c                	ld	a1,240(s0)
ffffffffc0200736:	00004517          	auipc	a0,0x4
ffffffffc020073a:	37a50513          	addi	a0,a0,890 # ffffffffc0204ab0 <commands+0x790>
ffffffffc020073e:	981ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0200742:	7c6c                	ld	a1,248(s0)
ffffffffc0200744:	6402                	ld	s0,0(sp)
ffffffffc0200746:	60a2                	ld	ra,8(sp)
ffffffffc0200748:	00004517          	auipc	a0,0x4
ffffffffc020074c:	38050513          	addi	a0,a0,896 # ffffffffc0204ac8 <commands+0x7a8>
ffffffffc0200750:	0141                	addi	sp,sp,16
ffffffffc0200752:	b2b5                	j	ffffffffc02000be <cprintf>

ffffffffc0200754 <print_trapframe>:
ffffffffc0200754:	1141                	addi	sp,sp,-16
ffffffffc0200756:	e022                	sd	s0,0(sp)
ffffffffc0200758:	85aa                	mv	a1,a0
ffffffffc020075a:	842a                	mv	s0,a0
ffffffffc020075c:	00004517          	auipc	a0,0x4
ffffffffc0200760:	38450513          	addi	a0,a0,900 # ffffffffc0204ae0 <commands+0x7c0>
ffffffffc0200764:	e406                	sd	ra,8(sp)
ffffffffc0200766:	959ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc020076a:	8522                	mv	a0,s0
ffffffffc020076c:	e1dff0ef          	jal	ra,ffffffffc0200588 <print_regs>
ffffffffc0200770:	10043583          	ld	a1,256(s0)
ffffffffc0200774:	00004517          	auipc	a0,0x4
ffffffffc0200778:	38450513          	addi	a0,a0,900 # ffffffffc0204af8 <commands+0x7d8>
ffffffffc020077c:	943ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0200780:	10843583          	ld	a1,264(s0)
ffffffffc0200784:	00004517          	auipc	a0,0x4
ffffffffc0200788:	38c50513          	addi	a0,a0,908 # ffffffffc0204b10 <commands+0x7f0>
ffffffffc020078c:	933ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0200790:	11043583          	ld	a1,272(s0)
ffffffffc0200794:	00004517          	auipc	a0,0x4
ffffffffc0200798:	39450513          	addi	a0,a0,916 # ffffffffc0204b28 <commands+0x808>
ffffffffc020079c:	923ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc02007a0:	11843583          	ld	a1,280(s0)
ffffffffc02007a4:	6402                	ld	s0,0(sp)
ffffffffc02007a6:	60a2                	ld	ra,8(sp)
ffffffffc02007a8:	00004517          	auipc	a0,0x4
ffffffffc02007ac:	39850513          	addi	a0,a0,920 # ffffffffc0204b40 <commands+0x820>
ffffffffc02007b0:	0141                	addi	sp,sp,16
ffffffffc02007b2:	90dff06f          	j	ffffffffc02000be <cprintf>

ffffffffc02007b6 <interrupt_handler>:
ffffffffc02007b6:	11853783          	ld	a5,280(a0)
ffffffffc02007ba:	472d                	li	a4,11
ffffffffc02007bc:	0786                	slli	a5,a5,0x1
ffffffffc02007be:	8385                	srli	a5,a5,0x1
ffffffffc02007c0:	06f76f63          	bltu	a4,a5,ffffffffc020083e <interrupt_handler+0x88>
ffffffffc02007c4:	00004717          	auipc	a4,0x4
ffffffffc02007c8:	cf070713          	addi	a4,a4,-784 # ffffffffc02044b4 <commands+0x194>
ffffffffc02007cc:	078a                	slli	a5,a5,0x2
ffffffffc02007ce:	97ba                	add	a5,a5,a4
ffffffffc02007d0:	439c                	lw	a5,0(a5)
ffffffffc02007d2:	97ba                	add	a5,a5,a4
ffffffffc02007d4:	8782                	jr	a5
ffffffffc02007d6:	00004517          	auipc	a0,0x4
ffffffffc02007da:	f6a50513          	addi	a0,a0,-150 # ffffffffc0204740 <commands+0x420>
ffffffffc02007de:	8e1ff06f          	j	ffffffffc02000be <cprintf>
ffffffffc02007e2:	00004517          	auipc	a0,0x4
ffffffffc02007e6:	f3e50513          	addi	a0,a0,-194 # ffffffffc0204720 <commands+0x400>
ffffffffc02007ea:	8d5ff06f          	j	ffffffffc02000be <cprintf>
ffffffffc02007ee:	00004517          	auipc	a0,0x4
ffffffffc02007f2:	ef250513          	addi	a0,a0,-270 # ffffffffc02046e0 <commands+0x3c0>
ffffffffc02007f6:	8c9ff06f          	j	ffffffffc02000be <cprintf>
ffffffffc02007fa:	00004517          	auipc	a0,0x4
ffffffffc02007fe:	f0650513          	addi	a0,a0,-250 # ffffffffc0204700 <commands+0x3e0>
ffffffffc0200802:	8bdff06f          	j	ffffffffc02000be <cprintf>
ffffffffc0200806:	00004517          	auipc	a0,0x4
ffffffffc020080a:	f6a50513          	addi	a0,a0,-150 # ffffffffc0204770 <commands+0x450>
ffffffffc020080e:	8b1ff06f          	j	ffffffffc02000be <cprintf>
ffffffffc0200812:	1141                	addi	sp,sp,-16
ffffffffc0200814:	e406                	sd	ra,8(sp)
ffffffffc0200816:	c4bff0ef          	jal	ra,ffffffffc0200460 <clock_set_next_event>
ffffffffc020081a:	00011797          	auipc	a5,0x11
ffffffffc020081e:	c5e78793          	addi	a5,a5,-930 # ffffffffc0211478 <ticks>
ffffffffc0200822:	639c                	ld	a5,0(a5)
ffffffffc0200824:	06400713          	li	a4,100
ffffffffc0200828:	0785                	addi	a5,a5,1
ffffffffc020082a:	02e7f733          	remu	a4,a5,a4
ffffffffc020082e:	00011697          	auipc	a3,0x11
ffffffffc0200832:	c4f6b523          	sd	a5,-950(a3) # ffffffffc0211478 <ticks>
ffffffffc0200836:	c709                	beqz	a4,ffffffffc0200840 <interrupt_handler+0x8a>
ffffffffc0200838:	60a2                	ld	ra,8(sp)
ffffffffc020083a:	0141                	addi	sp,sp,16
ffffffffc020083c:	8082                	ret
ffffffffc020083e:	bf19                	j	ffffffffc0200754 <print_trapframe>
ffffffffc0200840:	60a2                	ld	ra,8(sp)
ffffffffc0200842:	06400593          	li	a1,100
ffffffffc0200846:	00004517          	auipc	a0,0x4
ffffffffc020084a:	f1a50513          	addi	a0,a0,-230 # ffffffffc0204760 <commands+0x440>
ffffffffc020084e:	0141                	addi	sp,sp,16
ffffffffc0200850:	86fff06f          	j	ffffffffc02000be <cprintf>

ffffffffc0200854 <exception_handler>:
ffffffffc0200854:	11853783          	ld	a5,280(a0)
ffffffffc0200858:	473d                	li	a4,15
ffffffffc020085a:	16f76463          	bltu	a4,a5,ffffffffc02009c2 <exception_handler+0x16e>
ffffffffc020085e:	00004717          	auipc	a4,0x4
ffffffffc0200862:	c8670713          	addi	a4,a4,-890 # ffffffffc02044e4 <commands+0x1c4>
ffffffffc0200866:	078a                	slli	a5,a5,0x2
ffffffffc0200868:	97ba                	add	a5,a5,a4
ffffffffc020086a:	439c                	lw	a5,0(a5)
ffffffffc020086c:	1101                	addi	sp,sp,-32
ffffffffc020086e:	e822                	sd	s0,16(sp)
ffffffffc0200870:	ec06                	sd	ra,24(sp)
ffffffffc0200872:	e426                	sd	s1,8(sp)
ffffffffc0200874:	97ba                	add	a5,a5,a4
ffffffffc0200876:	842a                	mv	s0,a0
ffffffffc0200878:	8782                	jr	a5
ffffffffc020087a:	00004517          	auipc	a0,0x4
ffffffffc020087e:	e4e50513          	addi	a0,a0,-434 # ffffffffc02046c8 <commands+0x3a8>
ffffffffc0200882:	83dff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0200886:	8522                	mv	a0,s0
ffffffffc0200888:	c71ff0ef          	jal	ra,ffffffffc02004f8 <pgfault_handler>
ffffffffc020088c:	84aa                	mv	s1,a0
ffffffffc020088e:	12051b63          	bnez	a0,ffffffffc02009c4 <exception_handler+0x170>
ffffffffc0200892:	60e2                	ld	ra,24(sp)
ffffffffc0200894:	6442                	ld	s0,16(sp)
ffffffffc0200896:	64a2                	ld	s1,8(sp)
ffffffffc0200898:	6105                	addi	sp,sp,32
ffffffffc020089a:	8082                	ret
ffffffffc020089c:	00004517          	auipc	a0,0x4
ffffffffc02008a0:	c8c50513          	addi	a0,a0,-884 # ffffffffc0204528 <commands+0x208>
ffffffffc02008a4:	6442                	ld	s0,16(sp)
ffffffffc02008a6:	60e2                	ld	ra,24(sp)
ffffffffc02008a8:	64a2                	ld	s1,8(sp)
ffffffffc02008aa:	6105                	addi	sp,sp,32
ffffffffc02008ac:	813ff06f          	j	ffffffffc02000be <cprintf>
ffffffffc02008b0:	00004517          	auipc	a0,0x4
ffffffffc02008b4:	c9850513          	addi	a0,a0,-872 # ffffffffc0204548 <commands+0x228>
ffffffffc02008b8:	b7f5                	j	ffffffffc02008a4 <exception_handler+0x50>
ffffffffc02008ba:	00004517          	auipc	a0,0x4
ffffffffc02008be:	cae50513          	addi	a0,a0,-850 # ffffffffc0204568 <commands+0x248>
ffffffffc02008c2:	b7cd                	j	ffffffffc02008a4 <exception_handler+0x50>
ffffffffc02008c4:	00004517          	auipc	a0,0x4
ffffffffc02008c8:	cbc50513          	addi	a0,a0,-836 # ffffffffc0204580 <commands+0x260>
ffffffffc02008cc:	bfe1                	j	ffffffffc02008a4 <exception_handler+0x50>
ffffffffc02008ce:	00004517          	auipc	a0,0x4
ffffffffc02008d2:	cc250513          	addi	a0,a0,-830 # ffffffffc0204590 <commands+0x270>
ffffffffc02008d6:	b7f9                	j	ffffffffc02008a4 <exception_handler+0x50>
ffffffffc02008d8:	00004517          	auipc	a0,0x4
ffffffffc02008dc:	cd850513          	addi	a0,a0,-808 # ffffffffc02045b0 <commands+0x290>
ffffffffc02008e0:	fdeff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc02008e4:	8522                	mv	a0,s0
ffffffffc02008e6:	c13ff0ef          	jal	ra,ffffffffc02004f8 <pgfault_handler>
ffffffffc02008ea:	84aa                	mv	s1,a0
ffffffffc02008ec:	d15d                	beqz	a0,ffffffffc0200892 <exception_handler+0x3e>
ffffffffc02008ee:	8522                	mv	a0,s0
ffffffffc02008f0:	e65ff0ef          	jal	ra,ffffffffc0200754 <print_trapframe>
ffffffffc02008f4:	86a6                	mv	a3,s1
ffffffffc02008f6:	00004617          	auipc	a2,0x4
ffffffffc02008fa:	cd260613          	addi	a2,a2,-814 # ffffffffc02045c8 <commands+0x2a8>
ffffffffc02008fe:	0c800593          	li	a1,200
ffffffffc0200902:	00004517          	auipc	a0,0x4
ffffffffc0200906:	ec650513          	addi	a0,a0,-314 # ffffffffc02047c8 <commands+0x4a8>
ffffffffc020090a:	ffaff0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc020090e:	00004517          	auipc	a0,0x4
ffffffffc0200912:	cda50513          	addi	a0,a0,-806 # ffffffffc02045e8 <commands+0x2c8>
ffffffffc0200916:	b779                	j	ffffffffc02008a4 <exception_handler+0x50>
ffffffffc0200918:	00004517          	auipc	a0,0x4
ffffffffc020091c:	ce850513          	addi	a0,a0,-792 # ffffffffc0204600 <commands+0x2e0>
ffffffffc0200920:	f9eff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0200924:	8522                	mv	a0,s0
ffffffffc0200926:	bd3ff0ef          	jal	ra,ffffffffc02004f8 <pgfault_handler>
ffffffffc020092a:	84aa                	mv	s1,a0
ffffffffc020092c:	d13d                	beqz	a0,ffffffffc0200892 <exception_handler+0x3e>
ffffffffc020092e:	8522                	mv	a0,s0
ffffffffc0200930:	e25ff0ef          	jal	ra,ffffffffc0200754 <print_trapframe>
ffffffffc0200934:	86a6                	mv	a3,s1
ffffffffc0200936:	00004617          	auipc	a2,0x4
ffffffffc020093a:	c9260613          	addi	a2,a2,-878 # ffffffffc02045c8 <commands+0x2a8>
ffffffffc020093e:	0d200593          	li	a1,210
ffffffffc0200942:	00004517          	auipc	a0,0x4
ffffffffc0200946:	e8650513          	addi	a0,a0,-378 # ffffffffc02047c8 <commands+0x4a8>
ffffffffc020094a:	fbaff0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc020094e:	00004517          	auipc	a0,0x4
ffffffffc0200952:	cca50513          	addi	a0,a0,-822 # ffffffffc0204618 <commands+0x2f8>
ffffffffc0200956:	b7b9                	j	ffffffffc02008a4 <exception_handler+0x50>
ffffffffc0200958:	00004517          	auipc	a0,0x4
ffffffffc020095c:	ce050513          	addi	a0,a0,-800 # ffffffffc0204638 <commands+0x318>
ffffffffc0200960:	b791                	j	ffffffffc02008a4 <exception_handler+0x50>
ffffffffc0200962:	00004517          	auipc	a0,0x4
ffffffffc0200966:	cf650513          	addi	a0,a0,-778 # ffffffffc0204658 <commands+0x338>
ffffffffc020096a:	bf2d                	j	ffffffffc02008a4 <exception_handler+0x50>
ffffffffc020096c:	00004517          	auipc	a0,0x4
ffffffffc0200970:	d0c50513          	addi	a0,a0,-756 # ffffffffc0204678 <commands+0x358>
ffffffffc0200974:	bf05                	j	ffffffffc02008a4 <exception_handler+0x50>
ffffffffc0200976:	00004517          	auipc	a0,0x4
ffffffffc020097a:	d2250513          	addi	a0,a0,-734 # ffffffffc0204698 <commands+0x378>
ffffffffc020097e:	b71d                	j	ffffffffc02008a4 <exception_handler+0x50>
ffffffffc0200980:	00004517          	auipc	a0,0x4
ffffffffc0200984:	d3050513          	addi	a0,a0,-720 # ffffffffc02046b0 <commands+0x390>
ffffffffc0200988:	f36ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc020098c:	8522                	mv	a0,s0
ffffffffc020098e:	b6bff0ef          	jal	ra,ffffffffc02004f8 <pgfault_handler>
ffffffffc0200992:	84aa                	mv	s1,a0
ffffffffc0200994:	ee050fe3          	beqz	a0,ffffffffc0200892 <exception_handler+0x3e>
ffffffffc0200998:	8522                	mv	a0,s0
ffffffffc020099a:	dbbff0ef          	jal	ra,ffffffffc0200754 <print_trapframe>
ffffffffc020099e:	86a6                	mv	a3,s1
ffffffffc02009a0:	00004617          	auipc	a2,0x4
ffffffffc02009a4:	c2860613          	addi	a2,a2,-984 # ffffffffc02045c8 <commands+0x2a8>
ffffffffc02009a8:	0e800593          	li	a1,232
ffffffffc02009ac:	00004517          	auipc	a0,0x4
ffffffffc02009b0:	e1c50513          	addi	a0,a0,-484 # ffffffffc02047c8 <commands+0x4a8>
ffffffffc02009b4:	f50ff0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02009b8:	6442                	ld	s0,16(sp)
ffffffffc02009ba:	60e2                	ld	ra,24(sp)
ffffffffc02009bc:	64a2                	ld	s1,8(sp)
ffffffffc02009be:	6105                	addi	sp,sp,32
ffffffffc02009c0:	bb51                	j	ffffffffc0200754 <print_trapframe>
ffffffffc02009c2:	bb49                	j	ffffffffc0200754 <print_trapframe>
ffffffffc02009c4:	8522                	mv	a0,s0
ffffffffc02009c6:	d8fff0ef          	jal	ra,ffffffffc0200754 <print_trapframe>
ffffffffc02009ca:	86a6                	mv	a3,s1
ffffffffc02009cc:	00004617          	auipc	a2,0x4
ffffffffc02009d0:	bfc60613          	addi	a2,a2,-1028 # ffffffffc02045c8 <commands+0x2a8>
ffffffffc02009d4:	0ef00593          	li	a1,239
ffffffffc02009d8:	00004517          	auipc	a0,0x4
ffffffffc02009dc:	df050513          	addi	a0,a0,-528 # ffffffffc02047c8 <commands+0x4a8>
ffffffffc02009e0:	f24ff0ef          	jal	ra,ffffffffc0200104 <__panic>

ffffffffc02009e4 <trap>:
ffffffffc02009e4:	11853783          	ld	a5,280(a0)
ffffffffc02009e8:	0007c363          	bltz	a5,ffffffffc02009ee <trap+0xa>
ffffffffc02009ec:	b5a5                	j	ffffffffc0200854 <exception_handler>
ffffffffc02009ee:	b3e1                	j	ffffffffc02007b6 <interrupt_handler>

ffffffffc02009f0 <__alltraps>:
ffffffffc02009f0:	14011073          	csrw	sscratch,sp
ffffffffc02009f4:	712d                	addi	sp,sp,-288
ffffffffc02009f6:	e406                	sd	ra,8(sp)
ffffffffc02009f8:	ec0e                	sd	gp,24(sp)
ffffffffc02009fa:	f012                	sd	tp,32(sp)
ffffffffc02009fc:	f416                	sd	t0,40(sp)
ffffffffc02009fe:	f81a                	sd	t1,48(sp)
ffffffffc0200a00:	fc1e                	sd	t2,56(sp)
ffffffffc0200a02:	e0a2                	sd	s0,64(sp)
ffffffffc0200a04:	e4a6                	sd	s1,72(sp)
ffffffffc0200a06:	e8aa                	sd	a0,80(sp)
ffffffffc0200a08:	ecae                	sd	a1,88(sp)
ffffffffc0200a0a:	f0b2                	sd	a2,96(sp)
ffffffffc0200a0c:	f4b6                	sd	a3,104(sp)
ffffffffc0200a0e:	f8ba                	sd	a4,112(sp)
ffffffffc0200a10:	fcbe                	sd	a5,120(sp)
ffffffffc0200a12:	e142                	sd	a6,128(sp)
ffffffffc0200a14:	e546                	sd	a7,136(sp)
ffffffffc0200a16:	e94a                	sd	s2,144(sp)
ffffffffc0200a18:	ed4e                	sd	s3,152(sp)
ffffffffc0200a1a:	f152                	sd	s4,160(sp)
ffffffffc0200a1c:	f556                	sd	s5,168(sp)
ffffffffc0200a1e:	f95a                	sd	s6,176(sp)
ffffffffc0200a20:	fd5e                	sd	s7,184(sp)
ffffffffc0200a22:	e1e2                	sd	s8,192(sp)
ffffffffc0200a24:	e5e6                	sd	s9,200(sp)
ffffffffc0200a26:	e9ea                	sd	s10,208(sp)
ffffffffc0200a28:	edee                	sd	s11,216(sp)
ffffffffc0200a2a:	f1f2                	sd	t3,224(sp)
ffffffffc0200a2c:	f5f6                	sd	t4,232(sp)
ffffffffc0200a2e:	f9fa                	sd	t5,240(sp)
ffffffffc0200a30:	fdfe                	sd	t6,248(sp)
ffffffffc0200a32:	14002473          	csrr	s0,sscratch
ffffffffc0200a36:	100024f3          	csrr	s1,sstatus
ffffffffc0200a3a:	14102973          	csrr	s2,sepc
ffffffffc0200a3e:	143029f3          	csrr	s3,stval
ffffffffc0200a42:	14202a73          	csrr	s4,scause
ffffffffc0200a46:	e822                	sd	s0,16(sp)
ffffffffc0200a48:	e226                	sd	s1,256(sp)
ffffffffc0200a4a:	e64a                	sd	s2,264(sp)
ffffffffc0200a4c:	ea4e                	sd	s3,272(sp)
ffffffffc0200a4e:	ee52                	sd	s4,280(sp)
ffffffffc0200a50:	850a                	mv	a0,sp
ffffffffc0200a52:	f93ff0ef          	jal	ra,ffffffffc02009e4 <trap>

ffffffffc0200a56 <__trapret>:
ffffffffc0200a56:	6492                	ld	s1,256(sp)
ffffffffc0200a58:	6932                	ld	s2,264(sp)
ffffffffc0200a5a:	10049073          	csrw	sstatus,s1
ffffffffc0200a5e:	14191073          	csrw	sepc,s2
ffffffffc0200a62:	60a2                	ld	ra,8(sp)
ffffffffc0200a64:	61e2                	ld	gp,24(sp)
ffffffffc0200a66:	7202                	ld	tp,32(sp)
ffffffffc0200a68:	72a2                	ld	t0,40(sp)
ffffffffc0200a6a:	7342                	ld	t1,48(sp)
ffffffffc0200a6c:	73e2                	ld	t2,56(sp)
ffffffffc0200a6e:	6406                	ld	s0,64(sp)
ffffffffc0200a70:	64a6                	ld	s1,72(sp)
ffffffffc0200a72:	6546                	ld	a0,80(sp)
ffffffffc0200a74:	65e6                	ld	a1,88(sp)
ffffffffc0200a76:	7606                	ld	a2,96(sp)
ffffffffc0200a78:	76a6                	ld	a3,104(sp)
ffffffffc0200a7a:	7746                	ld	a4,112(sp)
ffffffffc0200a7c:	77e6                	ld	a5,120(sp)
ffffffffc0200a7e:	680a                	ld	a6,128(sp)
ffffffffc0200a80:	68aa                	ld	a7,136(sp)
ffffffffc0200a82:	694a                	ld	s2,144(sp)
ffffffffc0200a84:	69ea                	ld	s3,152(sp)
ffffffffc0200a86:	7a0a                	ld	s4,160(sp)
ffffffffc0200a88:	7aaa                	ld	s5,168(sp)
ffffffffc0200a8a:	7b4a                	ld	s6,176(sp)
ffffffffc0200a8c:	7bea                	ld	s7,184(sp)
ffffffffc0200a8e:	6c0e                	ld	s8,192(sp)
ffffffffc0200a90:	6cae                	ld	s9,200(sp)
ffffffffc0200a92:	6d4e                	ld	s10,208(sp)
ffffffffc0200a94:	6dee                	ld	s11,216(sp)
ffffffffc0200a96:	7e0e                	ld	t3,224(sp)
ffffffffc0200a98:	7eae                	ld	t4,232(sp)
ffffffffc0200a9a:	7f4e                	ld	t5,240(sp)
ffffffffc0200a9c:	7fee                	ld	t6,248(sp)
ffffffffc0200a9e:	6142                	ld	sp,16(sp)
ffffffffc0200aa0:	10200073          	sret
	...

ffffffffc0200ab0 <check_vma_overlap.isra.0.part.1>:
ffffffffc0200ab0:	1141                	addi	sp,sp,-16
ffffffffc0200ab2:	00004697          	auipc	a3,0x4
ffffffffc0200ab6:	0a668693          	addi	a3,a3,166 # ffffffffc0204b58 <commands+0x838>
ffffffffc0200aba:	00004617          	auipc	a2,0x4
ffffffffc0200abe:	0be60613          	addi	a2,a2,190 # ffffffffc0204b78 <commands+0x858>
ffffffffc0200ac2:	07d00593          	li	a1,125
ffffffffc0200ac6:	00004517          	auipc	a0,0x4
ffffffffc0200aca:	0ca50513          	addi	a0,a0,202 # ffffffffc0204b90 <commands+0x870>
ffffffffc0200ace:	e406                	sd	ra,8(sp)
ffffffffc0200ad0:	e34ff0ef          	jal	ra,ffffffffc0200104 <__panic>

ffffffffc0200ad4 <mm_create>:
ffffffffc0200ad4:	1141                	addi	sp,sp,-16
ffffffffc0200ad6:	03000513          	li	a0,48
ffffffffc0200ada:	e022                	sd	s0,0(sp)
ffffffffc0200adc:	e406                	sd	ra,8(sp)
ffffffffc0200ade:	67d020ef          	jal	ra,ffffffffc020395a <kmalloc>
ffffffffc0200ae2:	842a                	mv	s0,a0
ffffffffc0200ae4:	c115                	beqz	a0,ffffffffc0200b08 <mm_create+0x34>
ffffffffc0200ae6:	00011797          	auipc	a5,0x11
ffffffffc0200aea:	97a78793          	addi	a5,a5,-1670 # ffffffffc0211460 <swap_init_ok>
ffffffffc0200aee:	439c                	lw	a5,0(a5)
ffffffffc0200af0:	e408                	sd	a0,8(s0)
ffffffffc0200af2:	e008                	sd	a0,0(s0)
ffffffffc0200af4:	00053823          	sd	zero,16(a0)
ffffffffc0200af8:	00053c23          	sd	zero,24(a0)
ffffffffc0200afc:	02052023          	sw	zero,32(a0)
ffffffffc0200b00:	2781                	sext.w	a5,a5
ffffffffc0200b02:	eb81                	bnez	a5,ffffffffc0200b12 <mm_create+0x3e>
ffffffffc0200b04:	02053423          	sd	zero,40(a0)
ffffffffc0200b08:	8522                	mv	a0,s0
ffffffffc0200b0a:	60a2                	ld	ra,8(sp)
ffffffffc0200b0c:	6402                	ld	s0,0(sp)
ffffffffc0200b0e:	0141                	addi	sp,sp,16
ffffffffc0200b10:	8082                	ret
ffffffffc0200b12:	631000ef          	jal	ra,ffffffffc0201942 <swap_init_mm>
ffffffffc0200b16:	8522                	mv	a0,s0
ffffffffc0200b18:	60a2                	ld	ra,8(sp)
ffffffffc0200b1a:	6402                	ld	s0,0(sp)
ffffffffc0200b1c:	0141                	addi	sp,sp,16
ffffffffc0200b1e:	8082                	ret

ffffffffc0200b20 <vma_create>:
ffffffffc0200b20:	1101                	addi	sp,sp,-32
ffffffffc0200b22:	e04a                	sd	s2,0(sp)
ffffffffc0200b24:	892a                	mv	s2,a0
ffffffffc0200b26:	03000513          	li	a0,48
ffffffffc0200b2a:	e822                	sd	s0,16(sp)
ffffffffc0200b2c:	e426                	sd	s1,8(sp)
ffffffffc0200b2e:	ec06                	sd	ra,24(sp)
ffffffffc0200b30:	84ae                	mv	s1,a1
ffffffffc0200b32:	8432                	mv	s0,a2
ffffffffc0200b34:	627020ef          	jal	ra,ffffffffc020395a <kmalloc>
ffffffffc0200b38:	c509                	beqz	a0,ffffffffc0200b42 <vma_create+0x22>
ffffffffc0200b3a:	01253423          	sd	s2,8(a0)
ffffffffc0200b3e:	e904                	sd	s1,16(a0)
ffffffffc0200b40:	ed00                	sd	s0,24(a0)
ffffffffc0200b42:	60e2                	ld	ra,24(sp)
ffffffffc0200b44:	6442                	ld	s0,16(sp)
ffffffffc0200b46:	64a2                	ld	s1,8(sp)
ffffffffc0200b48:	6902                	ld	s2,0(sp)
ffffffffc0200b4a:	6105                	addi	sp,sp,32
ffffffffc0200b4c:	8082                	ret

ffffffffc0200b4e <find_vma>:
ffffffffc0200b4e:	c51d                	beqz	a0,ffffffffc0200b7c <find_vma+0x2e>
ffffffffc0200b50:	691c                	ld	a5,16(a0)
ffffffffc0200b52:	c781                	beqz	a5,ffffffffc0200b5a <find_vma+0xc>
ffffffffc0200b54:	6798                	ld	a4,8(a5)
ffffffffc0200b56:	02e5f663          	bgeu	a1,a4,ffffffffc0200b82 <find_vma+0x34>
ffffffffc0200b5a:	87aa                	mv	a5,a0
ffffffffc0200b5c:	679c                	ld	a5,8(a5)
ffffffffc0200b5e:	00f50f63          	beq	a0,a5,ffffffffc0200b7c <find_vma+0x2e>
ffffffffc0200b62:	fe87b703          	ld	a4,-24(a5)
ffffffffc0200b66:	fee5ebe3          	bltu	a1,a4,ffffffffc0200b5c <find_vma+0xe>
ffffffffc0200b6a:	ff07b703          	ld	a4,-16(a5)
ffffffffc0200b6e:	fee5f7e3          	bgeu	a1,a4,ffffffffc0200b5c <find_vma+0xe>
ffffffffc0200b72:	1781                	addi	a5,a5,-32
ffffffffc0200b74:	c781                	beqz	a5,ffffffffc0200b7c <find_vma+0x2e>
ffffffffc0200b76:	e91c                	sd	a5,16(a0)
ffffffffc0200b78:	853e                	mv	a0,a5
ffffffffc0200b7a:	8082                	ret
ffffffffc0200b7c:	4781                	li	a5,0
ffffffffc0200b7e:	853e                	mv	a0,a5
ffffffffc0200b80:	8082                	ret
ffffffffc0200b82:	6b98                	ld	a4,16(a5)
ffffffffc0200b84:	fce5fbe3          	bgeu	a1,a4,ffffffffc0200b5a <find_vma+0xc>
ffffffffc0200b88:	e91c                	sd	a5,16(a0)
ffffffffc0200b8a:	b7fd                	j	ffffffffc0200b78 <find_vma+0x2a>

ffffffffc0200b8c <insert_vma_struct>:
ffffffffc0200b8c:	6590                	ld	a2,8(a1)
ffffffffc0200b8e:	0105b803          	ld	a6,16(a1)
ffffffffc0200b92:	1141                	addi	sp,sp,-16
ffffffffc0200b94:	e406                	sd	ra,8(sp)
ffffffffc0200b96:	872a                	mv	a4,a0
ffffffffc0200b98:	01066863          	bltu	a2,a6,ffffffffc0200ba8 <insert_vma_struct+0x1c>
ffffffffc0200b9c:	a8b9                	j	ffffffffc0200bfa <insert_vma_struct+0x6e>
ffffffffc0200b9e:	fe87b683          	ld	a3,-24(a5)
ffffffffc0200ba2:	04d66763          	bltu	a2,a3,ffffffffc0200bf0 <insert_vma_struct+0x64>
ffffffffc0200ba6:	873e                	mv	a4,a5
ffffffffc0200ba8:	671c                	ld	a5,8(a4)
ffffffffc0200baa:	fef51ae3          	bne	a0,a5,ffffffffc0200b9e <insert_vma_struct+0x12>
ffffffffc0200bae:	02a70463          	beq	a4,a0,ffffffffc0200bd6 <insert_vma_struct+0x4a>
ffffffffc0200bb2:	ff073683          	ld	a3,-16(a4)
ffffffffc0200bb6:	fe873883          	ld	a7,-24(a4)
ffffffffc0200bba:	08d8f063          	bgeu	a7,a3,ffffffffc0200c3a <insert_vma_struct+0xae>
ffffffffc0200bbe:	04d66e63          	bltu	a2,a3,ffffffffc0200c1a <insert_vma_struct+0x8e>
ffffffffc0200bc2:	00f50a63          	beq	a0,a5,ffffffffc0200bd6 <insert_vma_struct+0x4a>
ffffffffc0200bc6:	fe87b683          	ld	a3,-24(a5)
ffffffffc0200bca:	0506e863          	bltu	a3,a6,ffffffffc0200c1a <insert_vma_struct+0x8e>
ffffffffc0200bce:	ff07b603          	ld	a2,-16(a5)
ffffffffc0200bd2:	02c6f263          	bgeu	a3,a2,ffffffffc0200bf6 <insert_vma_struct+0x6a>
ffffffffc0200bd6:	5114                	lw	a3,32(a0)
ffffffffc0200bd8:	e188                	sd	a0,0(a1)
ffffffffc0200bda:	02058613          	addi	a2,a1,32
ffffffffc0200bde:	e390                	sd	a2,0(a5)
ffffffffc0200be0:	e710                	sd	a2,8(a4)
ffffffffc0200be2:	60a2                	ld	ra,8(sp)
ffffffffc0200be4:	f59c                	sd	a5,40(a1)
ffffffffc0200be6:	f198                	sd	a4,32(a1)
ffffffffc0200be8:	2685                	addiw	a3,a3,1
ffffffffc0200bea:	d114                	sw	a3,32(a0)
ffffffffc0200bec:	0141                	addi	sp,sp,16
ffffffffc0200bee:	8082                	ret
ffffffffc0200bf0:	fca711e3          	bne	a4,a0,ffffffffc0200bb2 <insert_vma_struct+0x26>
ffffffffc0200bf4:	bfd9                	j	ffffffffc0200bca <insert_vma_struct+0x3e>
ffffffffc0200bf6:	ebbff0ef          	jal	ra,ffffffffc0200ab0 <check_vma_overlap.isra.0.part.1>
ffffffffc0200bfa:	00004697          	auipc	a3,0x4
ffffffffc0200bfe:	02668693          	addi	a3,a3,38 # ffffffffc0204c20 <commands+0x900>
ffffffffc0200c02:	00004617          	auipc	a2,0x4
ffffffffc0200c06:	f7660613          	addi	a2,a2,-138 # ffffffffc0204b78 <commands+0x858>
ffffffffc0200c0a:	08400593          	li	a1,132
ffffffffc0200c0e:	00004517          	auipc	a0,0x4
ffffffffc0200c12:	f8250513          	addi	a0,a0,-126 # ffffffffc0204b90 <commands+0x870>
ffffffffc0200c16:	ceeff0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0200c1a:	00004697          	auipc	a3,0x4
ffffffffc0200c1e:	04668693          	addi	a3,a3,70 # ffffffffc0204c60 <commands+0x940>
ffffffffc0200c22:	00004617          	auipc	a2,0x4
ffffffffc0200c26:	f5660613          	addi	a2,a2,-170 # ffffffffc0204b78 <commands+0x858>
ffffffffc0200c2a:	07c00593          	li	a1,124
ffffffffc0200c2e:	00004517          	auipc	a0,0x4
ffffffffc0200c32:	f6250513          	addi	a0,a0,-158 # ffffffffc0204b90 <commands+0x870>
ffffffffc0200c36:	cceff0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0200c3a:	00004697          	auipc	a3,0x4
ffffffffc0200c3e:	00668693          	addi	a3,a3,6 # ffffffffc0204c40 <commands+0x920>
ffffffffc0200c42:	00004617          	auipc	a2,0x4
ffffffffc0200c46:	f3660613          	addi	a2,a2,-202 # ffffffffc0204b78 <commands+0x858>
ffffffffc0200c4a:	07b00593          	li	a1,123
ffffffffc0200c4e:	00004517          	auipc	a0,0x4
ffffffffc0200c52:	f4250513          	addi	a0,a0,-190 # ffffffffc0204b90 <commands+0x870>
ffffffffc0200c56:	caeff0ef          	jal	ra,ffffffffc0200104 <__panic>

ffffffffc0200c5a <mm_destroy>:
ffffffffc0200c5a:	1141                	addi	sp,sp,-16
ffffffffc0200c5c:	e022                	sd	s0,0(sp)
ffffffffc0200c5e:	842a                	mv	s0,a0
ffffffffc0200c60:	6508                	ld	a0,8(a0)
ffffffffc0200c62:	e406                	sd	ra,8(sp)
ffffffffc0200c64:	00a40e63          	beq	s0,a0,ffffffffc0200c80 <mm_destroy+0x26>
ffffffffc0200c68:	6118                	ld	a4,0(a0)
ffffffffc0200c6a:	651c                	ld	a5,8(a0)
ffffffffc0200c6c:	03000593          	li	a1,48
ffffffffc0200c70:	1501                	addi	a0,a0,-32
ffffffffc0200c72:	e71c                	sd	a5,8(a4)
ffffffffc0200c74:	e398                	sd	a4,0(a5)
ffffffffc0200c76:	5a7020ef          	jal	ra,ffffffffc0203a1c <kfree>
ffffffffc0200c7a:	6408                	ld	a0,8(s0)
ffffffffc0200c7c:	fea416e3          	bne	s0,a0,ffffffffc0200c68 <mm_destroy+0xe>
ffffffffc0200c80:	8522                	mv	a0,s0
ffffffffc0200c82:	6402                	ld	s0,0(sp)
ffffffffc0200c84:	60a2                	ld	ra,8(sp)
ffffffffc0200c86:	03000593          	li	a1,48
ffffffffc0200c8a:	0141                	addi	sp,sp,16
ffffffffc0200c8c:	5910206f          	j	ffffffffc0203a1c <kfree>

ffffffffc0200c90 <vmm_init>:
ffffffffc0200c90:	715d                	addi	sp,sp,-80
ffffffffc0200c92:	e486                	sd	ra,72(sp)
ffffffffc0200c94:	e0a2                	sd	s0,64(sp)
ffffffffc0200c96:	fc26                	sd	s1,56(sp)
ffffffffc0200c98:	f84a                	sd	s2,48(sp)
ffffffffc0200c9a:	f052                	sd	s4,32(sp)
ffffffffc0200c9c:	f44e                	sd	s3,40(sp)
ffffffffc0200c9e:	ec56                	sd	s5,24(sp)
ffffffffc0200ca0:	e85a                	sd	s6,16(sp)
ffffffffc0200ca2:	e45e                	sd	s7,8(sp)
ffffffffc0200ca4:	69b010ef          	jal	ra,ffffffffc0202b3e <nr_free_pages>
ffffffffc0200ca8:	892a                	mv	s2,a0
ffffffffc0200caa:	695010ef          	jal	ra,ffffffffc0202b3e <nr_free_pages>
ffffffffc0200cae:	8a2a                	mv	s4,a0
ffffffffc0200cb0:	e25ff0ef          	jal	ra,ffffffffc0200ad4 <mm_create>
ffffffffc0200cb4:	842a                	mv	s0,a0
ffffffffc0200cb6:	03200493          	li	s1,50
ffffffffc0200cba:	e919                	bnez	a0,ffffffffc0200cd0 <vmm_init+0x40>
ffffffffc0200cbc:	aeed                	j	ffffffffc02010b6 <vmm_init+0x426>
ffffffffc0200cbe:	e504                	sd	s1,8(a0)
ffffffffc0200cc0:	e91c                	sd	a5,16(a0)
ffffffffc0200cc2:	00053c23          	sd	zero,24(a0)
ffffffffc0200cc6:	14ed                	addi	s1,s1,-5
ffffffffc0200cc8:	8522                	mv	a0,s0
ffffffffc0200cca:	ec3ff0ef          	jal	ra,ffffffffc0200b8c <insert_vma_struct>
ffffffffc0200cce:	c88d                	beqz	s1,ffffffffc0200d00 <vmm_init+0x70>
ffffffffc0200cd0:	03000513          	li	a0,48
ffffffffc0200cd4:	487020ef          	jal	ra,ffffffffc020395a <kmalloc>
ffffffffc0200cd8:	85aa                	mv	a1,a0
ffffffffc0200cda:	00248793          	addi	a5,s1,2
ffffffffc0200cde:	f165                	bnez	a0,ffffffffc0200cbe <vmm_init+0x2e>
ffffffffc0200ce0:	00004697          	auipc	a3,0x4
ffffffffc0200ce4:	1f868693          	addi	a3,a3,504 # ffffffffc0204ed8 <commands+0xbb8>
ffffffffc0200ce8:	00004617          	auipc	a2,0x4
ffffffffc0200cec:	e9060613          	addi	a2,a2,-368 # ffffffffc0204b78 <commands+0x858>
ffffffffc0200cf0:	0ce00593          	li	a1,206
ffffffffc0200cf4:	00004517          	auipc	a0,0x4
ffffffffc0200cf8:	e9c50513          	addi	a0,a0,-356 # ffffffffc0204b90 <commands+0x870>
ffffffffc0200cfc:	c08ff0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0200d00:	03700493          	li	s1,55
ffffffffc0200d04:	1f900993          	li	s3,505
ffffffffc0200d08:	a819                	j	ffffffffc0200d1e <vmm_init+0x8e>
ffffffffc0200d0a:	e504                	sd	s1,8(a0)
ffffffffc0200d0c:	e91c                	sd	a5,16(a0)
ffffffffc0200d0e:	00053c23          	sd	zero,24(a0)
ffffffffc0200d12:	0495                	addi	s1,s1,5
ffffffffc0200d14:	8522                	mv	a0,s0
ffffffffc0200d16:	e77ff0ef          	jal	ra,ffffffffc0200b8c <insert_vma_struct>
ffffffffc0200d1a:	03348a63          	beq	s1,s3,ffffffffc0200d4e <vmm_init+0xbe>
ffffffffc0200d1e:	03000513          	li	a0,48
ffffffffc0200d22:	439020ef          	jal	ra,ffffffffc020395a <kmalloc>
ffffffffc0200d26:	85aa                	mv	a1,a0
ffffffffc0200d28:	00248793          	addi	a5,s1,2
ffffffffc0200d2c:	fd79                	bnez	a0,ffffffffc0200d0a <vmm_init+0x7a>
ffffffffc0200d2e:	00004697          	auipc	a3,0x4
ffffffffc0200d32:	1aa68693          	addi	a3,a3,426 # ffffffffc0204ed8 <commands+0xbb8>
ffffffffc0200d36:	00004617          	auipc	a2,0x4
ffffffffc0200d3a:	e4260613          	addi	a2,a2,-446 # ffffffffc0204b78 <commands+0x858>
ffffffffc0200d3e:	0d400593          	li	a1,212
ffffffffc0200d42:	00004517          	auipc	a0,0x4
ffffffffc0200d46:	e4e50513          	addi	a0,a0,-434 # ffffffffc0204b90 <commands+0x870>
ffffffffc0200d4a:	bbaff0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0200d4e:	6418                	ld	a4,8(s0)
ffffffffc0200d50:	479d                	li	a5,7
ffffffffc0200d52:	1fb00593          	li	a1,507
ffffffffc0200d56:	2ae40063          	beq	s0,a4,ffffffffc0200ff6 <vmm_init+0x366>
ffffffffc0200d5a:	fe873603          	ld	a2,-24(a4)
ffffffffc0200d5e:	ffe78693          	addi	a3,a5,-2
ffffffffc0200d62:	20d61a63          	bne	a2,a3,ffffffffc0200f76 <vmm_init+0x2e6>
ffffffffc0200d66:	ff073683          	ld	a3,-16(a4)
ffffffffc0200d6a:	20d79663          	bne	a5,a3,ffffffffc0200f76 <vmm_init+0x2e6>
ffffffffc0200d6e:	0795                	addi	a5,a5,5
ffffffffc0200d70:	6718                	ld	a4,8(a4)
ffffffffc0200d72:	feb792e3          	bne	a5,a1,ffffffffc0200d56 <vmm_init+0xc6>
ffffffffc0200d76:	499d                	li	s3,7
ffffffffc0200d78:	4495                	li	s1,5
ffffffffc0200d7a:	1f900b93          	li	s7,505
ffffffffc0200d7e:	85a6                	mv	a1,s1
ffffffffc0200d80:	8522                	mv	a0,s0
ffffffffc0200d82:	dcdff0ef          	jal	ra,ffffffffc0200b4e <find_vma>
ffffffffc0200d86:	8b2a                	mv	s6,a0
ffffffffc0200d88:	2e050763          	beqz	a0,ffffffffc0201076 <vmm_init+0x3e6>
ffffffffc0200d8c:	00148593          	addi	a1,s1,1
ffffffffc0200d90:	8522                	mv	a0,s0
ffffffffc0200d92:	dbdff0ef          	jal	ra,ffffffffc0200b4e <find_vma>
ffffffffc0200d96:	8aaa                	mv	s5,a0
ffffffffc0200d98:	2a050f63          	beqz	a0,ffffffffc0201056 <vmm_init+0x3c6>
ffffffffc0200d9c:	85ce                	mv	a1,s3
ffffffffc0200d9e:	8522                	mv	a0,s0
ffffffffc0200da0:	dafff0ef          	jal	ra,ffffffffc0200b4e <find_vma>
ffffffffc0200da4:	28051963          	bnez	a0,ffffffffc0201036 <vmm_init+0x3a6>
ffffffffc0200da8:	00348593          	addi	a1,s1,3
ffffffffc0200dac:	8522                	mv	a0,s0
ffffffffc0200dae:	da1ff0ef          	jal	ra,ffffffffc0200b4e <find_vma>
ffffffffc0200db2:	26051263          	bnez	a0,ffffffffc0201016 <vmm_init+0x386>
ffffffffc0200db6:	00448593          	addi	a1,s1,4
ffffffffc0200dba:	8522                	mv	a0,s0
ffffffffc0200dbc:	d93ff0ef          	jal	ra,ffffffffc0200b4e <find_vma>
ffffffffc0200dc0:	2c051b63          	bnez	a0,ffffffffc0201096 <vmm_init+0x406>
ffffffffc0200dc4:	008b3783          	ld	a5,8(s6)
ffffffffc0200dc8:	1c979763          	bne	a5,s1,ffffffffc0200f96 <vmm_init+0x306>
ffffffffc0200dcc:	010b3783          	ld	a5,16(s6)
ffffffffc0200dd0:	1d379363          	bne	a5,s3,ffffffffc0200f96 <vmm_init+0x306>
ffffffffc0200dd4:	008ab783          	ld	a5,8(s5)
ffffffffc0200dd8:	1c979f63          	bne	a5,s1,ffffffffc0200fb6 <vmm_init+0x326>
ffffffffc0200ddc:	010ab783          	ld	a5,16(s5)
ffffffffc0200de0:	1d379b63          	bne	a5,s3,ffffffffc0200fb6 <vmm_init+0x326>
ffffffffc0200de4:	0495                	addi	s1,s1,5
ffffffffc0200de6:	0995                	addi	s3,s3,5
ffffffffc0200de8:	f9749be3          	bne	s1,s7,ffffffffc0200d7e <vmm_init+0xee>
ffffffffc0200dec:	4491                	li	s1,4
ffffffffc0200dee:	59fd                	li	s3,-1
ffffffffc0200df0:	85a6                	mv	a1,s1
ffffffffc0200df2:	8522                	mv	a0,s0
ffffffffc0200df4:	d5bff0ef          	jal	ra,ffffffffc0200b4e <find_vma>
ffffffffc0200df8:	0004859b          	sext.w	a1,s1
ffffffffc0200dfc:	c90d                	beqz	a0,ffffffffc0200e2e <vmm_init+0x19e>
ffffffffc0200dfe:	6914                	ld	a3,16(a0)
ffffffffc0200e00:	6510                	ld	a2,8(a0)
ffffffffc0200e02:	00004517          	auipc	a0,0x4
ffffffffc0200e06:	f8e50513          	addi	a0,a0,-114 # ffffffffc0204d90 <commands+0xa70>
ffffffffc0200e0a:	ab4ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0200e0e:	00004697          	auipc	a3,0x4
ffffffffc0200e12:	faa68693          	addi	a3,a3,-86 # ffffffffc0204db8 <commands+0xa98>
ffffffffc0200e16:	00004617          	auipc	a2,0x4
ffffffffc0200e1a:	d6260613          	addi	a2,a2,-670 # ffffffffc0204b78 <commands+0x858>
ffffffffc0200e1e:	0f600593          	li	a1,246
ffffffffc0200e22:	00004517          	auipc	a0,0x4
ffffffffc0200e26:	d6e50513          	addi	a0,a0,-658 # ffffffffc0204b90 <commands+0x870>
ffffffffc0200e2a:	adaff0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0200e2e:	14fd                	addi	s1,s1,-1
ffffffffc0200e30:	fd3490e3          	bne	s1,s3,ffffffffc0200df0 <vmm_init+0x160>
ffffffffc0200e34:	8522                	mv	a0,s0
ffffffffc0200e36:	e25ff0ef          	jal	ra,ffffffffc0200c5a <mm_destroy>
ffffffffc0200e3a:	505010ef          	jal	ra,ffffffffc0202b3e <nr_free_pages>
ffffffffc0200e3e:	28aa1c63          	bne	s4,a0,ffffffffc02010d6 <vmm_init+0x446>
ffffffffc0200e42:	00004517          	auipc	a0,0x4
ffffffffc0200e46:	fb650513          	addi	a0,a0,-74 # ffffffffc0204df8 <commands+0xad8>
ffffffffc0200e4a:	a74ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0200e4e:	4f1010ef          	jal	ra,ffffffffc0202b3e <nr_free_pages>
ffffffffc0200e52:	89aa                	mv	s3,a0
ffffffffc0200e54:	c81ff0ef          	jal	ra,ffffffffc0200ad4 <mm_create>
ffffffffc0200e58:	00010797          	auipc	a5,0x10
ffffffffc0200e5c:	62a7b423          	sd	a0,1576(a5) # ffffffffc0211480 <check_mm_struct>
ffffffffc0200e60:	842a                	mv	s0,a0
ffffffffc0200e62:	2a050a63          	beqz	a0,ffffffffc0201116 <vmm_init+0x486>
ffffffffc0200e66:	00010797          	auipc	a5,0x10
ffffffffc0200e6a:	60278793          	addi	a5,a5,1538 # ffffffffc0211468 <boot_pgdir>
ffffffffc0200e6e:	6384                	ld	s1,0(a5)
ffffffffc0200e70:	609c                	ld	a5,0(s1)
ffffffffc0200e72:	ed04                	sd	s1,24(a0)
ffffffffc0200e74:	32079d63          	bnez	a5,ffffffffc02011ae <vmm_init+0x51e>
ffffffffc0200e78:	03000513          	li	a0,48
ffffffffc0200e7c:	2df020ef          	jal	ra,ffffffffc020395a <kmalloc>
ffffffffc0200e80:	8a2a                	mv	s4,a0
ffffffffc0200e82:	14050a63          	beqz	a0,ffffffffc0200fd6 <vmm_init+0x346>
ffffffffc0200e86:	002007b7          	lui	a5,0x200
ffffffffc0200e8a:	00fa3823          	sd	a5,16(s4)
ffffffffc0200e8e:	4789                	li	a5,2
ffffffffc0200e90:	85aa                	mv	a1,a0
ffffffffc0200e92:	00fa3c23          	sd	a5,24(s4)
ffffffffc0200e96:	8522                	mv	a0,s0
ffffffffc0200e98:	000a3423          	sd	zero,8(s4)
ffffffffc0200e9c:	cf1ff0ef          	jal	ra,ffffffffc0200b8c <insert_vma_struct>
ffffffffc0200ea0:	10000593          	li	a1,256
ffffffffc0200ea4:	8522                	mv	a0,s0
ffffffffc0200ea6:	ca9ff0ef          	jal	ra,ffffffffc0200b4e <find_vma>
ffffffffc0200eaa:	10000793          	li	a5,256
ffffffffc0200eae:	16400713          	li	a4,356
ffffffffc0200eb2:	2aaa1263          	bne	s4,a0,ffffffffc0201156 <vmm_init+0x4c6>
ffffffffc0200eb6:	00f78023          	sb	a5,0(a5) # 200000 <BASE_ADDRESS-0xffffffffc0000000>
ffffffffc0200eba:	0785                	addi	a5,a5,1
ffffffffc0200ebc:	fee79de3          	bne	a5,a4,ffffffffc0200eb6 <vmm_init+0x226>
ffffffffc0200ec0:	6705                	lui	a4,0x1
ffffffffc0200ec2:	10000793          	li	a5,256
ffffffffc0200ec6:	35670713          	addi	a4,a4,854 # 1356 <BASE_ADDRESS-0xffffffffc01fecaa>
ffffffffc0200eca:	16400613          	li	a2,356
ffffffffc0200ece:	0007c683          	lbu	a3,0(a5)
ffffffffc0200ed2:	0785                	addi	a5,a5,1
ffffffffc0200ed4:	9f15                	subw	a4,a4,a3
ffffffffc0200ed6:	fec79ce3          	bne	a5,a2,ffffffffc0200ece <vmm_init+0x23e>
ffffffffc0200eda:	2a071a63          	bnez	a4,ffffffffc020118e <vmm_init+0x4fe>
ffffffffc0200ede:	4581                	li	a1,0
ffffffffc0200ee0:	8526                	mv	a0,s1
ffffffffc0200ee2:	6f9010ef          	jal	ra,ffffffffc0202dda <page_remove>
ffffffffc0200ee6:	609c                	ld	a5,0(s1)
ffffffffc0200ee8:	00010717          	auipc	a4,0x10
ffffffffc0200eec:	58870713          	addi	a4,a4,1416 # ffffffffc0211470 <npage>
ffffffffc0200ef0:	6318                	ld	a4,0(a4)
ffffffffc0200ef2:	078a                	slli	a5,a5,0x2
ffffffffc0200ef4:	83b1                	srli	a5,a5,0xc
ffffffffc0200ef6:	28e7f063          	bgeu	a5,a4,ffffffffc0201176 <vmm_init+0x4e6>
ffffffffc0200efa:	00005717          	auipc	a4,0x5
ffffffffc0200efe:	10670713          	addi	a4,a4,262 # ffffffffc0206000 <nbase>
ffffffffc0200f02:	6318                	ld	a4,0(a4)
ffffffffc0200f04:	00010697          	auipc	a3,0x10
ffffffffc0200f08:	69468693          	addi	a3,a3,1684 # ffffffffc0211598 <pages>
ffffffffc0200f0c:	6288                	ld	a0,0(a3)
ffffffffc0200f0e:	8f99                	sub	a5,a5,a4
ffffffffc0200f10:	00379713          	slli	a4,a5,0x3
ffffffffc0200f14:	97ba                	add	a5,a5,a4
ffffffffc0200f16:	078e                	slli	a5,a5,0x3
ffffffffc0200f18:	953e                	add	a0,a0,a5
ffffffffc0200f1a:	4585                	li	a1,1
ffffffffc0200f1c:	3dd010ef          	jal	ra,ffffffffc0202af8 <free_pages>
ffffffffc0200f20:	0004b023          	sd	zero,0(s1)
ffffffffc0200f24:	8522                	mv	a0,s0
ffffffffc0200f26:	00043c23          	sd	zero,24(s0)
ffffffffc0200f2a:	d31ff0ef          	jal	ra,ffffffffc0200c5a <mm_destroy>
ffffffffc0200f2e:	19fd                	addi	s3,s3,-1
ffffffffc0200f30:	00010797          	auipc	a5,0x10
ffffffffc0200f34:	5407b823          	sd	zero,1360(a5) # ffffffffc0211480 <check_mm_struct>
ffffffffc0200f38:	407010ef          	jal	ra,ffffffffc0202b3e <nr_free_pages>
ffffffffc0200f3c:	1aa99d63          	bne	s3,a0,ffffffffc02010f6 <vmm_init+0x466>
ffffffffc0200f40:	00004517          	auipc	a0,0x4
ffffffffc0200f44:	f6050513          	addi	a0,a0,-160 # ffffffffc0204ea0 <commands+0xb80>
ffffffffc0200f48:	976ff0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0200f4c:	3f3010ef          	jal	ra,ffffffffc0202b3e <nr_free_pages>
ffffffffc0200f50:	197d                	addi	s2,s2,-1
ffffffffc0200f52:	1ea91263          	bne	s2,a0,ffffffffc0201136 <vmm_init+0x4a6>
ffffffffc0200f56:	6406                	ld	s0,64(sp)
ffffffffc0200f58:	60a6                	ld	ra,72(sp)
ffffffffc0200f5a:	74e2                	ld	s1,56(sp)
ffffffffc0200f5c:	7942                	ld	s2,48(sp)
ffffffffc0200f5e:	79a2                	ld	s3,40(sp)
ffffffffc0200f60:	7a02                	ld	s4,32(sp)
ffffffffc0200f62:	6ae2                	ld	s5,24(sp)
ffffffffc0200f64:	6b42                	ld	s6,16(sp)
ffffffffc0200f66:	6ba2                	ld	s7,8(sp)
ffffffffc0200f68:	00004517          	auipc	a0,0x4
ffffffffc0200f6c:	f5850513          	addi	a0,a0,-168 # ffffffffc0204ec0 <commands+0xba0>
ffffffffc0200f70:	6161                	addi	sp,sp,80
ffffffffc0200f72:	94cff06f          	j	ffffffffc02000be <cprintf>
ffffffffc0200f76:	00004697          	auipc	a3,0x4
ffffffffc0200f7a:	d3268693          	addi	a3,a3,-718 # ffffffffc0204ca8 <commands+0x988>
ffffffffc0200f7e:	00004617          	auipc	a2,0x4
ffffffffc0200f82:	bfa60613          	addi	a2,a2,-1030 # ffffffffc0204b78 <commands+0x858>
ffffffffc0200f86:	0dd00593          	li	a1,221
ffffffffc0200f8a:	00004517          	auipc	a0,0x4
ffffffffc0200f8e:	c0650513          	addi	a0,a0,-1018 # ffffffffc0204b90 <commands+0x870>
ffffffffc0200f92:	972ff0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0200f96:	00004697          	auipc	a3,0x4
ffffffffc0200f9a:	d9a68693          	addi	a3,a3,-614 # ffffffffc0204d30 <commands+0xa10>
ffffffffc0200f9e:	00004617          	auipc	a2,0x4
ffffffffc0200fa2:	bda60613          	addi	a2,a2,-1062 # ffffffffc0204b78 <commands+0x858>
ffffffffc0200fa6:	0ed00593          	li	a1,237
ffffffffc0200faa:	00004517          	auipc	a0,0x4
ffffffffc0200fae:	be650513          	addi	a0,a0,-1050 # ffffffffc0204b90 <commands+0x870>
ffffffffc0200fb2:	952ff0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0200fb6:	00004697          	auipc	a3,0x4
ffffffffc0200fba:	daa68693          	addi	a3,a3,-598 # ffffffffc0204d60 <commands+0xa40>
ffffffffc0200fbe:	00004617          	auipc	a2,0x4
ffffffffc0200fc2:	bba60613          	addi	a2,a2,-1094 # ffffffffc0204b78 <commands+0x858>
ffffffffc0200fc6:	0ee00593          	li	a1,238
ffffffffc0200fca:	00004517          	auipc	a0,0x4
ffffffffc0200fce:	bc650513          	addi	a0,a0,-1082 # ffffffffc0204b90 <commands+0x870>
ffffffffc0200fd2:	932ff0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0200fd6:	00004697          	auipc	a3,0x4
ffffffffc0200fda:	f0268693          	addi	a3,a3,-254 # ffffffffc0204ed8 <commands+0xbb8>
ffffffffc0200fde:	00004617          	auipc	a2,0x4
ffffffffc0200fe2:	b9a60613          	addi	a2,a2,-1126 # ffffffffc0204b78 <commands+0x858>
ffffffffc0200fe6:	11100593          	li	a1,273
ffffffffc0200fea:	00004517          	auipc	a0,0x4
ffffffffc0200fee:	ba650513          	addi	a0,a0,-1114 # ffffffffc0204b90 <commands+0x870>
ffffffffc0200ff2:	912ff0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0200ff6:	00004697          	auipc	a3,0x4
ffffffffc0200ffa:	c9a68693          	addi	a3,a3,-870 # ffffffffc0204c90 <commands+0x970>
ffffffffc0200ffe:	00004617          	auipc	a2,0x4
ffffffffc0201002:	b7a60613          	addi	a2,a2,-1158 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201006:	0db00593          	li	a1,219
ffffffffc020100a:	00004517          	auipc	a0,0x4
ffffffffc020100e:	b8650513          	addi	a0,a0,-1146 # ffffffffc0204b90 <commands+0x870>
ffffffffc0201012:	8f2ff0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201016:	00004697          	auipc	a3,0x4
ffffffffc020101a:	cfa68693          	addi	a3,a3,-774 # ffffffffc0204d10 <commands+0x9f0>
ffffffffc020101e:	00004617          	auipc	a2,0x4
ffffffffc0201022:	b5a60613          	addi	a2,a2,-1190 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201026:	0e900593          	li	a1,233
ffffffffc020102a:	00004517          	auipc	a0,0x4
ffffffffc020102e:	b6650513          	addi	a0,a0,-1178 # ffffffffc0204b90 <commands+0x870>
ffffffffc0201032:	8d2ff0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201036:	00004697          	auipc	a3,0x4
ffffffffc020103a:	cca68693          	addi	a3,a3,-822 # ffffffffc0204d00 <commands+0x9e0>
ffffffffc020103e:	00004617          	auipc	a2,0x4
ffffffffc0201042:	b3a60613          	addi	a2,a2,-1222 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201046:	0e700593          	li	a1,231
ffffffffc020104a:	00004517          	auipc	a0,0x4
ffffffffc020104e:	b4650513          	addi	a0,a0,-1210 # ffffffffc0204b90 <commands+0x870>
ffffffffc0201052:	8b2ff0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201056:	00004697          	auipc	a3,0x4
ffffffffc020105a:	c9a68693          	addi	a3,a3,-870 # ffffffffc0204cf0 <commands+0x9d0>
ffffffffc020105e:	00004617          	auipc	a2,0x4
ffffffffc0201062:	b1a60613          	addi	a2,a2,-1254 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201066:	0e500593          	li	a1,229
ffffffffc020106a:	00004517          	auipc	a0,0x4
ffffffffc020106e:	b2650513          	addi	a0,a0,-1242 # ffffffffc0204b90 <commands+0x870>
ffffffffc0201072:	892ff0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201076:	00004697          	auipc	a3,0x4
ffffffffc020107a:	c6a68693          	addi	a3,a3,-918 # ffffffffc0204ce0 <commands+0x9c0>
ffffffffc020107e:	00004617          	auipc	a2,0x4
ffffffffc0201082:	afa60613          	addi	a2,a2,-1286 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201086:	0e300593          	li	a1,227
ffffffffc020108a:	00004517          	auipc	a0,0x4
ffffffffc020108e:	b0650513          	addi	a0,a0,-1274 # ffffffffc0204b90 <commands+0x870>
ffffffffc0201092:	872ff0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201096:	00004697          	auipc	a3,0x4
ffffffffc020109a:	c8a68693          	addi	a3,a3,-886 # ffffffffc0204d20 <commands+0xa00>
ffffffffc020109e:	00004617          	auipc	a2,0x4
ffffffffc02010a2:	ada60613          	addi	a2,a2,-1318 # ffffffffc0204b78 <commands+0x858>
ffffffffc02010a6:	0eb00593          	li	a1,235
ffffffffc02010aa:	00004517          	auipc	a0,0x4
ffffffffc02010ae:	ae650513          	addi	a0,a0,-1306 # ffffffffc0204b90 <commands+0x870>
ffffffffc02010b2:	852ff0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02010b6:	00004697          	auipc	a3,0x4
ffffffffc02010ba:	bca68693          	addi	a3,a3,-1078 # ffffffffc0204c80 <commands+0x960>
ffffffffc02010be:	00004617          	auipc	a2,0x4
ffffffffc02010c2:	aba60613          	addi	a2,a2,-1350 # ffffffffc0204b78 <commands+0x858>
ffffffffc02010c6:	0c700593          	li	a1,199
ffffffffc02010ca:	00004517          	auipc	a0,0x4
ffffffffc02010ce:	ac650513          	addi	a0,a0,-1338 # ffffffffc0204b90 <commands+0x870>
ffffffffc02010d2:	832ff0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02010d6:	00004697          	auipc	a3,0x4
ffffffffc02010da:	cfa68693          	addi	a3,a3,-774 # ffffffffc0204dd0 <commands+0xab0>
ffffffffc02010de:	00004617          	auipc	a2,0x4
ffffffffc02010e2:	a9a60613          	addi	a2,a2,-1382 # ffffffffc0204b78 <commands+0x858>
ffffffffc02010e6:	0fb00593          	li	a1,251
ffffffffc02010ea:	00004517          	auipc	a0,0x4
ffffffffc02010ee:	aa650513          	addi	a0,a0,-1370 # ffffffffc0204b90 <commands+0x870>
ffffffffc02010f2:	812ff0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02010f6:	00004697          	auipc	a3,0x4
ffffffffc02010fa:	cda68693          	addi	a3,a3,-806 # ffffffffc0204dd0 <commands+0xab0>
ffffffffc02010fe:	00004617          	auipc	a2,0x4
ffffffffc0201102:	a7a60613          	addi	a2,a2,-1414 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201106:	12e00593          	li	a1,302
ffffffffc020110a:	00004517          	auipc	a0,0x4
ffffffffc020110e:	a8650513          	addi	a0,a0,-1402 # ffffffffc0204b90 <commands+0x870>
ffffffffc0201112:	ff3fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201116:	00004697          	auipc	a3,0x4
ffffffffc020111a:	d0268693          	addi	a3,a3,-766 # ffffffffc0204e18 <commands+0xaf8>
ffffffffc020111e:	00004617          	auipc	a2,0x4
ffffffffc0201122:	a5a60613          	addi	a2,a2,-1446 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201126:	10a00593          	li	a1,266
ffffffffc020112a:	00004517          	auipc	a0,0x4
ffffffffc020112e:	a6650513          	addi	a0,a0,-1434 # ffffffffc0204b90 <commands+0x870>
ffffffffc0201132:	fd3fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201136:	00004697          	auipc	a3,0x4
ffffffffc020113a:	c9a68693          	addi	a3,a3,-870 # ffffffffc0204dd0 <commands+0xab0>
ffffffffc020113e:	00004617          	auipc	a2,0x4
ffffffffc0201142:	a3a60613          	addi	a2,a2,-1478 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201146:	0bd00593          	li	a1,189
ffffffffc020114a:	00004517          	auipc	a0,0x4
ffffffffc020114e:	a4650513          	addi	a0,a0,-1466 # ffffffffc0204b90 <commands+0x870>
ffffffffc0201152:	fb3fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201156:	00004697          	auipc	a3,0x4
ffffffffc020115a:	cea68693          	addi	a3,a3,-790 # ffffffffc0204e40 <commands+0xb20>
ffffffffc020115e:	00004617          	auipc	a2,0x4
ffffffffc0201162:	a1a60613          	addi	a2,a2,-1510 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201166:	11600593          	li	a1,278
ffffffffc020116a:	00004517          	auipc	a0,0x4
ffffffffc020116e:	a2650513          	addi	a0,a0,-1498 # ffffffffc0204b90 <commands+0x870>
ffffffffc0201172:	f93fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201176:	00004617          	auipc	a2,0x4
ffffffffc020117a:	cfa60613          	addi	a2,a2,-774 # ffffffffc0204e70 <commands+0xb50>
ffffffffc020117e:	06500593          	li	a1,101
ffffffffc0201182:	00004517          	auipc	a0,0x4
ffffffffc0201186:	d0e50513          	addi	a0,a0,-754 # ffffffffc0204e90 <commands+0xb70>
ffffffffc020118a:	f7bfe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc020118e:	00004697          	auipc	a3,0x4
ffffffffc0201192:	cd268693          	addi	a3,a3,-814 # ffffffffc0204e60 <commands+0xb40>
ffffffffc0201196:	00004617          	auipc	a2,0x4
ffffffffc020119a:	9e260613          	addi	a2,a2,-1566 # ffffffffc0204b78 <commands+0x858>
ffffffffc020119e:	12000593          	li	a1,288
ffffffffc02011a2:	00004517          	auipc	a0,0x4
ffffffffc02011a6:	9ee50513          	addi	a0,a0,-1554 # ffffffffc0204b90 <commands+0x870>
ffffffffc02011aa:	f5bfe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02011ae:	00004697          	auipc	a3,0x4
ffffffffc02011b2:	c8268693          	addi	a3,a3,-894 # ffffffffc0204e30 <commands+0xb10>
ffffffffc02011b6:	00004617          	auipc	a2,0x4
ffffffffc02011ba:	9c260613          	addi	a2,a2,-1598 # ffffffffc0204b78 <commands+0x858>
ffffffffc02011be:	10d00593          	li	a1,269
ffffffffc02011c2:	00004517          	auipc	a0,0x4
ffffffffc02011c6:	9ce50513          	addi	a0,a0,-1586 # ffffffffc0204b90 <commands+0x870>
ffffffffc02011ca:	f3bfe0ef          	jal	ra,ffffffffc0200104 <__panic>

ffffffffc02011ce <do_pgfault>:
ffffffffc02011ce:	7179                	addi	sp,sp,-48
ffffffffc02011d0:	85b2                	mv	a1,a2
ffffffffc02011d2:	f022                	sd	s0,32(sp)
ffffffffc02011d4:	ec26                	sd	s1,24(sp)
ffffffffc02011d6:	f406                	sd	ra,40(sp)
ffffffffc02011d8:	e84a                	sd	s2,16(sp)
ffffffffc02011da:	8432                	mv	s0,a2
ffffffffc02011dc:	84aa                	mv	s1,a0
ffffffffc02011de:	971ff0ef          	jal	ra,ffffffffc0200b4e <find_vma>
ffffffffc02011e2:	00010797          	auipc	a5,0x10
ffffffffc02011e6:	26e78793          	addi	a5,a5,622 # ffffffffc0211450 <pgfault_num>
ffffffffc02011ea:	439c                	lw	a5,0(a5)
ffffffffc02011ec:	2785                	addiw	a5,a5,1
ffffffffc02011ee:	00010717          	auipc	a4,0x10
ffffffffc02011f2:	26f72123          	sw	a5,610(a4) # ffffffffc0211450 <pgfault_num>
ffffffffc02011f6:	c549                	beqz	a0,ffffffffc0201280 <do_pgfault+0xb2>
ffffffffc02011f8:	651c                	ld	a5,8(a0)
ffffffffc02011fa:	08f46363          	bltu	s0,a5,ffffffffc0201280 <do_pgfault+0xb2>
ffffffffc02011fe:	6d1c                	ld	a5,24(a0)
ffffffffc0201200:	4941                	li	s2,16
ffffffffc0201202:	8b89                	andi	a5,a5,2
ffffffffc0201204:	efa9                	bnez	a5,ffffffffc020125e <do_pgfault+0x90>
ffffffffc0201206:	767d                	lui	a2,0xfffff
ffffffffc0201208:	6c88                	ld	a0,24(s1)
ffffffffc020120a:	8c71                	and	s0,s0,a2
ffffffffc020120c:	85a2                	mv	a1,s0
ffffffffc020120e:	4605                	li	a2,1
ffffffffc0201210:	16f010ef          	jal	ra,ffffffffc0202b7e <get_pte>
ffffffffc0201214:	610c                	ld	a1,0(a0)
ffffffffc0201216:	c5b1                	beqz	a1,ffffffffc0201262 <do_pgfault+0x94>
ffffffffc0201218:	00010797          	auipc	a5,0x10
ffffffffc020121c:	24878793          	addi	a5,a5,584 # ffffffffc0211460 <swap_init_ok>
ffffffffc0201220:	439c                	lw	a5,0(a5)
ffffffffc0201222:	2781                	sext.w	a5,a5
ffffffffc0201224:	c7bd                	beqz	a5,ffffffffc0201292 <do_pgfault+0xc4>
ffffffffc0201226:	85a2                	mv	a1,s0
ffffffffc0201228:	0030                	addi	a2,sp,8
ffffffffc020122a:	8526                	mv	a0,s1
ffffffffc020122c:	e402                	sd	zero,8(sp)
ffffffffc020122e:	049000ef          	jal	ra,ffffffffc0201a76 <swap_in>
ffffffffc0201232:	65a2                	ld	a1,8(sp)
ffffffffc0201234:	6c88                	ld	a0,24(s1)
ffffffffc0201236:	86ca                	mv	a3,s2
ffffffffc0201238:	8622                	mv	a2,s0
ffffffffc020123a:	413010ef          	jal	ra,ffffffffc0202e4c <page_insert>
ffffffffc020123e:	6622                	ld	a2,8(sp)
ffffffffc0201240:	4685                	li	a3,1
ffffffffc0201242:	85a2                	mv	a1,s0
ffffffffc0201244:	8526                	mv	a0,s1
ffffffffc0201246:	70c000ef          	jal	ra,ffffffffc0201952 <swap_map_swappable>
ffffffffc020124a:	6722                	ld	a4,8(sp)
ffffffffc020124c:	4781                	li	a5,0
ffffffffc020124e:	e320                	sd	s0,64(a4)
ffffffffc0201250:	70a2                	ld	ra,40(sp)
ffffffffc0201252:	7402                	ld	s0,32(sp)
ffffffffc0201254:	64e2                	ld	s1,24(sp)
ffffffffc0201256:	6942                	ld	s2,16(sp)
ffffffffc0201258:	853e                	mv	a0,a5
ffffffffc020125a:	6145                	addi	sp,sp,48
ffffffffc020125c:	8082                	ret
ffffffffc020125e:	4959                	li	s2,22
ffffffffc0201260:	b75d                	j	ffffffffc0201206 <do_pgfault+0x38>
ffffffffc0201262:	6c88                	ld	a0,24(s1)
ffffffffc0201264:	864a                	mv	a2,s2
ffffffffc0201266:	85a2                	mv	a1,s0
ffffffffc0201268:	660020ef          	jal	ra,ffffffffc02038c8 <pgdir_alloc_page>
ffffffffc020126c:	4781                	li	a5,0
ffffffffc020126e:	f16d                	bnez	a0,ffffffffc0201250 <do_pgfault+0x82>
ffffffffc0201270:	00004517          	auipc	a0,0x4
ffffffffc0201274:	96050513          	addi	a0,a0,-1696 # ffffffffc0204bd0 <commands+0x8b0>
ffffffffc0201278:	e47fe0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc020127c:	57f1                	li	a5,-4
ffffffffc020127e:	bfc9                	j	ffffffffc0201250 <do_pgfault+0x82>
ffffffffc0201280:	85a2                	mv	a1,s0
ffffffffc0201282:	00004517          	auipc	a0,0x4
ffffffffc0201286:	91e50513          	addi	a0,a0,-1762 # ffffffffc0204ba0 <commands+0x880>
ffffffffc020128a:	e35fe0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc020128e:	57f5                	li	a5,-3
ffffffffc0201290:	b7c1                	j	ffffffffc0201250 <do_pgfault+0x82>
ffffffffc0201292:	00004517          	auipc	a0,0x4
ffffffffc0201296:	96650513          	addi	a0,a0,-1690 # ffffffffc0204bf8 <commands+0x8d8>
ffffffffc020129a:	e25fe0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc020129e:	57f1                	li	a5,-4
ffffffffc02012a0:	bf45                	j	ffffffffc0201250 <do_pgfault+0x82>

ffffffffc02012a2 <swap_init>:
ffffffffc02012a2:	7135                	addi	sp,sp,-160
ffffffffc02012a4:	ed06                	sd	ra,152(sp)
ffffffffc02012a6:	e922                	sd	s0,144(sp)
ffffffffc02012a8:	e526                	sd	s1,136(sp)
ffffffffc02012aa:	e14a                	sd	s2,128(sp)
ffffffffc02012ac:	fcce                	sd	s3,120(sp)
ffffffffc02012ae:	f8d2                	sd	s4,112(sp)
ffffffffc02012b0:	f4d6                	sd	s5,104(sp)
ffffffffc02012b2:	f0da                	sd	s6,96(sp)
ffffffffc02012b4:	ecde                	sd	s7,88(sp)
ffffffffc02012b6:	e8e2                	sd	s8,80(sp)
ffffffffc02012b8:	e4e6                	sd	s9,72(sp)
ffffffffc02012ba:	e0ea                	sd	s10,64(sp)
ffffffffc02012bc:	fc6e                	sd	s11,56(sp)
ffffffffc02012be:	01f020ef          	jal	ra,ffffffffc0203adc <swapfs_init>
ffffffffc02012c2:	00010797          	auipc	a5,0x10
ffffffffc02012c6:	25e78793          	addi	a5,a5,606 # ffffffffc0211520 <max_swap_offset>
ffffffffc02012ca:	6394                	ld	a3,0(a5)
ffffffffc02012cc:	010007b7          	lui	a5,0x1000
ffffffffc02012d0:	17e1                	addi	a5,a5,-8
ffffffffc02012d2:	ff968713          	addi	a4,a3,-7
ffffffffc02012d6:	42e7ea63          	bltu	a5,a4,ffffffffc020170a <swap_init+0x468>
ffffffffc02012da:	00009797          	auipc	a5,0x9
ffffffffc02012de:	d2678793          	addi	a5,a5,-730 # ffffffffc020a000 <swap_manager_clock>
ffffffffc02012e2:	6798                	ld	a4,8(a5)
ffffffffc02012e4:	00010697          	auipc	a3,0x10
ffffffffc02012e8:	16f6ba23          	sd	a5,372(a3) # ffffffffc0211458 <sm>
ffffffffc02012ec:	9702                	jalr	a4
ffffffffc02012ee:	8b2a                	mv	s6,a0
ffffffffc02012f0:	c10d                	beqz	a0,ffffffffc0201312 <swap_init+0x70>
ffffffffc02012f2:	60ea                	ld	ra,152(sp)
ffffffffc02012f4:	644a                	ld	s0,144(sp)
ffffffffc02012f6:	855a                	mv	a0,s6
ffffffffc02012f8:	64aa                	ld	s1,136(sp)
ffffffffc02012fa:	690a                	ld	s2,128(sp)
ffffffffc02012fc:	79e6                	ld	s3,120(sp)
ffffffffc02012fe:	7a46                	ld	s4,112(sp)
ffffffffc0201300:	7aa6                	ld	s5,104(sp)
ffffffffc0201302:	7b06                	ld	s6,96(sp)
ffffffffc0201304:	6be6                	ld	s7,88(sp)
ffffffffc0201306:	6c46                	ld	s8,80(sp)
ffffffffc0201308:	6ca6                	ld	s9,72(sp)
ffffffffc020130a:	6d06                	ld	s10,64(sp)
ffffffffc020130c:	7de2                	ld	s11,56(sp)
ffffffffc020130e:	610d                	addi	sp,sp,160
ffffffffc0201310:	8082                	ret
ffffffffc0201312:	00010797          	auipc	a5,0x10
ffffffffc0201316:	14678793          	addi	a5,a5,326 # ffffffffc0211458 <sm>
ffffffffc020131a:	639c                	ld	a5,0(a5)
ffffffffc020131c:	00004517          	auipc	a0,0x4
ffffffffc0201320:	c4c50513          	addi	a0,a0,-948 # ffffffffc0204f68 <commands+0xc48>
ffffffffc0201324:	00010417          	auipc	s0,0x10
ffffffffc0201328:	23c40413          	addi	s0,s0,572 # ffffffffc0211560 <free_area>
ffffffffc020132c:	638c                	ld	a1,0(a5)
ffffffffc020132e:	4785                	li	a5,1
ffffffffc0201330:	00010717          	auipc	a4,0x10
ffffffffc0201334:	12f72823          	sw	a5,304(a4) # ffffffffc0211460 <swap_init_ok>
ffffffffc0201338:	d87fe0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc020133c:	641c                	ld	a5,8(s0)
ffffffffc020133e:	2e878a63          	beq	a5,s0,ffffffffc0201632 <swap_init+0x390>
ffffffffc0201342:	fe87b703          	ld	a4,-24(a5)
ffffffffc0201346:	8305                	srli	a4,a4,0x1
ffffffffc0201348:	8b05                	andi	a4,a4,1
ffffffffc020134a:	2e070863          	beqz	a4,ffffffffc020163a <swap_init+0x398>
ffffffffc020134e:	4481                	li	s1,0
ffffffffc0201350:	4901                	li	s2,0
ffffffffc0201352:	a031                	j	ffffffffc020135e <swap_init+0xbc>
ffffffffc0201354:	fe87b703          	ld	a4,-24(a5)
ffffffffc0201358:	8b09                	andi	a4,a4,2
ffffffffc020135a:	2e070063          	beqz	a4,ffffffffc020163a <swap_init+0x398>
ffffffffc020135e:	ff87a703          	lw	a4,-8(a5)
ffffffffc0201362:	679c                	ld	a5,8(a5)
ffffffffc0201364:	2905                	addiw	s2,s2,1
ffffffffc0201366:	9cb9                	addw	s1,s1,a4
ffffffffc0201368:	fe8796e3          	bne	a5,s0,ffffffffc0201354 <swap_init+0xb2>
ffffffffc020136c:	89a6                	mv	s3,s1
ffffffffc020136e:	7d0010ef          	jal	ra,ffffffffc0202b3e <nr_free_pages>
ffffffffc0201372:	5b351863          	bne	a0,s3,ffffffffc0201922 <swap_init+0x680>
ffffffffc0201376:	8626                	mv	a2,s1
ffffffffc0201378:	85ca                	mv	a1,s2
ffffffffc020137a:	00004517          	auipc	a0,0x4
ffffffffc020137e:	c3650513          	addi	a0,a0,-970 # ffffffffc0204fb0 <commands+0xc90>
ffffffffc0201382:	d3dfe0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0201386:	f4eff0ef          	jal	ra,ffffffffc0200ad4 <mm_create>
ffffffffc020138a:	8baa                	mv	s7,a0
ffffffffc020138c:	50050b63          	beqz	a0,ffffffffc02018a2 <swap_init+0x600>
ffffffffc0201390:	00010797          	auipc	a5,0x10
ffffffffc0201394:	0f078793          	addi	a5,a5,240 # ffffffffc0211480 <check_mm_struct>
ffffffffc0201398:	639c                	ld	a5,0(a5)
ffffffffc020139a:	52079463          	bnez	a5,ffffffffc02018c2 <swap_init+0x620>
ffffffffc020139e:	00010797          	auipc	a5,0x10
ffffffffc02013a2:	0ca78793          	addi	a5,a5,202 # ffffffffc0211468 <boot_pgdir>
ffffffffc02013a6:	6398                	ld	a4,0(a5)
ffffffffc02013a8:	00010797          	auipc	a5,0x10
ffffffffc02013ac:	0ca7bc23          	sd	a0,216(a5) # ffffffffc0211480 <check_mm_struct>
ffffffffc02013b0:	631c                	ld	a5,0(a4)
ffffffffc02013b2:	ec3a                	sd	a4,24(sp)
ffffffffc02013b4:	ed18                	sd	a4,24(a0)
ffffffffc02013b6:	52079663          	bnez	a5,ffffffffc02018e2 <swap_init+0x640>
ffffffffc02013ba:	6599                	lui	a1,0x6
ffffffffc02013bc:	460d                	li	a2,3
ffffffffc02013be:	6505                	lui	a0,0x1
ffffffffc02013c0:	f60ff0ef          	jal	ra,ffffffffc0200b20 <vma_create>
ffffffffc02013c4:	85aa                	mv	a1,a0
ffffffffc02013c6:	52050e63          	beqz	a0,ffffffffc0201902 <swap_init+0x660>
ffffffffc02013ca:	855e                	mv	a0,s7
ffffffffc02013cc:	fc0ff0ef          	jal	ra,ffffffffc0200b8c <insert_vma_struct>
ffffffffc02013d0:	00004517          	auipc	a0,0x4
ffffffffc02013d4:	c2050513          	addi	a0,a0,-992 # ffffffffc0204ff0 <commands+0xcd0>
ffffffffc02013d8:	ce7fe0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc02013dc:	018bb503          	ld	a0,24(s7)
ffffffffc02013e0:	4605                	li	a2,1
ffffffffc02013e2:	6585                	lui	a1,0x1
ffffffffc02013e4:	79a010ef          	jal	ra,ffffffffc0202b7e <get_pte>
ffffffffc02013e8:	40050d63          	beqz	a0,ffffffffc0201802 <swap_init+0x560>
ffffffffc02013ec:	00004517          	auipc	a0,0x4
ffffffffc02013f0:	c5450513          	addi	a0,a0,-940 # ffffffffc0205040 <commands+0xd20>
ffffffffc02013f4:	00010a17          	auipc	s4,0x10
ffffffffc02013f8:	0a4a0a13          	addi	s4,s4,164 # ffffffffc0211498 <check_rp>
ffffffffc02013fc:	cc3fe0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0201400:	00010a97          	auipc	s5,0x10
ffffffffc0201404:	0b8a8a93          	addi	s5,s5,184 # ffffffffc02114b8 <swap_in_seq_no>
ffffffffc0201408:	89d2                	mv	s3,s4
ffffffffc020140a:	4505                	li	a0,1
ffffffffc020140c:	664010ef          	jal	ra,ffffffffc0202a70 <alloc_pages>
ffffffffc0201410:	00a9b023          	sd	a0,0(s3)
ffffffffc0201414:	2a050b63          	beqz	a0,ffffffffc02016ca <swap_init+0x428>
ffffffffc0201418:	651c                	ld	a5,8(a0)
ffffffffc020141a:	8b89                	andi	a5,a5,2
ffffffffc020141c:	28079763          	bnez	a5,ffffffffc02016aa <swap_init+0x408>
ffffffffc0201420:	09a1                	addi	s3,s3,8
ffffffffc0201422:	ff5994e3          	bne	s3,s5,ffffffffc020140a <swap_init+0x168>
ffffffffc0201426:	601c                	ld	a5,0(s0)
ffffffffc0201428:	00843983          	ld	s3,8(s0)
ffffffffc020142c:	00010d17          	auipc	s10,0x10
ffffffffc0201430:	06cd0d13          	addi	s10,s10,108 # ffffffffc0211498 <check_rp>
ffffffffc0201434:	f03e                	sd	a5,32(sp)
ffffffffc0201436:	481c                	lw	a5,16(s0)
ffffffffc0201438:	f43e                	sd	a5,40(sp)
ffffffffc020143a:	00010797          	auipc	a5,0x10
ffffffffc020143e:	1287b723          	sd	s0,302(a5) # ffffffffc0211568 <free_area+0x8>
ffffffffc0201442:	00010797          	auipc	a5,0x10
ffffffffc0201446:	1087bf23          	sd	s0,286(a5) # ffffffffc0211560 <free_area>
ffffffffc020144a:	00010797          	auipc	a5,0x10
ffffffffc020144e:	1207a323          	sw	zero,294(a5) # ffffffffc0211570 <free_area+0x10>
ffffffffc0201452:	000d3503          	ld	a0,0(s10)
ffffffffc0201456:	4585                	li	a1,1
ffffffffc0201458:	0d21                	addi	s10,s10,8
ffffffffc020145a:	69e010ef          	jal	ra,ffffffffc0202af8 <free_pages>
ffffffffc020145e:	ff5d1ae3          	bne	s10,s5,ffffffffc0201452 <swap_init+0x1b0>
ffffffffc0201462:	01042d03          	lw	s10,16(s0)
ffffffffc0201466:	4791                	li	a5,4
ffffffffc0201468:	36fd1d63          	bne	s10,a5,ffffffffc02017e2 <swap_init+0x540>
ffffffffc020146c:	00004517          	auipc	a0,0x4
ffffffffc0201470:	c5c50513          	addi	a0,a0,-932 # ffffffffc02050c8 <commands+0xda8>
ffffffffc0201474:	c4bfe0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0201478:	6685                	lui	a3,0x1
ffffffffc020147a:	00010797          	auipc	a5,0x10
ffffffffc020147e:	fc07ab23          	sw	zero,-42(a5) # ffffffffc0211450 <pgfault_num>
ffffffffc0201482:	4629                	li	a2,10
ffffffffc0201484:	00010797          	auipc	a5,0x10
ffffffffc0201488:	fcc78793          	addi	a5,a5,-52 # ffffffffc0211450 <pgfault_num>
ffffffffc020148c:	00c68023          	sb	a2,0(a3) # 1000 <BASE_ADDRESS-0xffffffffc01ff000>
ffffffffc0201490:	4398                	lw	a4,0(a5)
ffffffffc0201492:	4585                	li	a1,1
ffffffffc0201494:	2701                	sext.w	a4,a4
ffffffffc0201496:	30b71663          	bne	a4,a1,ffffffffc02017a2 <swap_init+0x500>
ffffffffc020149a:	00c68823          	sb	a2,16(a3)
ffffffffc020149e:	4394                	lw	a3,0(a5)
ffffffffc02014a0:	2681                	sext.w	a3,a3
ffffffffc02014a2:	32e69063          	bne	a3,a4,ffffffffc02017c2 <swap_init+0x520>
ffffffffc02014a6:	6689                	lui	a3,0x2
ffffffffc02014a8:	462d                	li	a2,11
ffffffffc02014aa:	00c68023          	sb	a2,0(a3) # 2000 <BASE_ADDRESS-0xffffffffc01fe000>
ffffffffc02014ae:	4398                	lw	a4,0(a5)
ffffffffc02014b0:	4589                	li	a1,2
ffffffffc02014b2:	2701                	sext.w	a4,a4
ffffffffc02014b4:	26b71763          	bne	a4,a1,ffffffffc0201722 <swap_init+0x480>
ffffffffc02014b8:	00c68823          	sb	a2,16(a3)
ffffffffc02014bc:	4394                	lw	a3,0(a5)
ffffffffc02014be:	2681                	sext.w	a3,a3
ffffffffc02014c0:	28e69163          	bne	a3,a4,ffffffffc0201742 <swap_init+0x4a0>
ffffffffc02014c4:	668d                	lui	a3,0x3
ffffffffc02014c6:	4631                	li	a2,12
ffffffffc02014c8:	00c68023          	sb	a2,0(a3) # 3000 <BASE_ADDRESS-0xffffffffc01fd000>
ffffffffc02014cc:	4398                	lw	a4,0(a5)
ffffffffc02014ce:	458d                	li	a1,3
ffffffffc02014d0:	2701                	sext.w	a4,a4
ffffffffc02014d2:	28b71863          	bne	a4,a1,ffffffffc0201762 <swap_init+0x4c0>
ffffffffc02014d6:	00c68823          	sb	a2,16(a3)
ffffffffc02014da:	4394                	lw	a3,0(a5)
ffffffffc02014dc:	2681                	sext.w	a3,a3
ffffffffc02014de:	2ae69263          	bne	a3,a4,ffffffffc0201782 <swap_init+0x4e0>
ffffffffc02014e2:	6691                	lui	a3,0x4
ffffffffc02014e4:	4635                	li	a2,13
ffffffffc02014e6:	00c68023          	sb	a2,0(a3) # 4000 <BASE_ADDRESS-0xffffffffc01fc000>
ffffffffc02014ea:	4398                	lw	a4,0(a5)
ffffffffc02014ec:	2701                	sext.w	a4,a4
ffffffffc02014ee:	33a71a63          	bne	a4,s10,ffffffffc0201822 <swap_init+0x580>
ffffffffc02014f2:	00c68823          	sb	a2,16(a3)
ffffffffc02014f6:	439c                	lw	a5,0(a5)
ffffffffc02014f8:	2781                	sext.w	a5,a5
ffffffffc02014fa:	34e79463          	bne	a5,a4,ffffffffc0201842 <swap_init+0x5a0>
ffffffffc02014fe:	481c                	lw	a5,16(s0)
ffffffffc0201500:	36079163          	bnez	a5,ffffffffc0201862 <swap_init+0x5c0>
ffffffffc0201504:	00010797          	auipc	a5,0x10
ffffffffc0201508:	fb478793          	addi	a5,a5,-76 # ffffffffc02114b8 <swap_in_seq_no>
ffffffffc020150c:	00010717          	auipc	a4,0x10
ffffffffc0201510:	fd470713          	addi	a4,a4,-44 # ffffffffc02114e0 <swap_out_seq_no>
ffffffffc0201514:	00010617          	auipc	a2,0x10
ffffffffc0201518:	fcc60613          	addi	a2,a2,-52 # ffffffffc02114e0 <swap_out_seq_no>
ffffffffc020151c:	56fd                	li	a3,-1
ffffffffc020151e:	c394                	sw	a3,0(a5)
ffffffffc0201520:	c314                	sw	a3,0(a4)
ffffffffc0201522:	0791                	addi	a5,a5,4
ffffffffc0201524:	0711                	addi	a4,a4,4
ffffffffc0201526:	fec79ce3          	bne	a5,a2,ffffffffc020151e <swap_init+0x27c>
ffffffffc020152a:	00010697          	auipc	a3,0x10
ffffffffc020152e:	01668693          	addi	a3,a3,22 # ffffffffc0211540 <check_ptep>
ffffffffc0201532:	00010817          	auipc	a6,0x10
ffffffffc0201536:	f6680813          	addi	a6,a6,-154 # ffffffffc0211498 <check_rp>
ffffffffc020153a:	6c05                	lui	s8,0x1
ffffffffc020153c:	00010c97          	auipc	s9,0x10
ffffffffc0201540:	f34c8c93          	addi	s9,s9,-204 # ffffffffc0211470 <npage>
ffffffffc0201544:	00010d97          	auipc	s11,0x10
ffffffffc0201548:	054d8d93          	addi	s11,s11,84 # ffffffffc0211598 <pages>
ffffffffc020154c:	00005d17          	auipc	s10,0x5
ffffffffc0201550:	ab4d0d13          	addi	s10,s10,-1356 # ffffffffc0206000 <nbase>
ffffffffc0201554:	6562                	ld	a0,24(sp)
ffffffffc0201556:	0006b023          	sd	zero,0(a3)
ffffffffc020155a:	4601                	li	a2,0
ffffffffc020155c:	85e2                	mv	a1,s8
ffffffffc020155e:	e842                	sd	a6,16(sp)
ffffffffc0201560:	e436                	sd	a3,8(sp)
ffffffffc0201562:	61c010ef          	jal	ra,ffffffffc0202b7e <get_pte>
ffffffffc0201566:	66a2                	ld	a3,8(sp)
ffffffffc0201568:	6842                	ld	a6,16(sp)
ffffffffc020156a:	e288                	sd	a0,0(a3)
ffffffffc020156c:	16050f63          	beqz	a0,ffffffffc02016ea <swap_init+0x448>
ffffffffc0201570:	611c                	ld	a5,0(a0)
ffffffffc0201572:	0017f613          	andi	a2,a5,1
ffffffffc0201576:	10060263          	beqz	a2,ffffffffc020167a <swap_init+0x3d8>
ffffffffc020157a:	000cb603          	ld	a2,0(s9)
ffffffffc020157e:	078a                	slli	a5,a5,0x2
ffffffffc0201580:	83b1                	srli	a5,a5,0xc
ffffffffc0201582:	10c7f863          	bgeu	a5,a2,ffffffffc0201692 <swap_init+0x3f0>
ffffffffc0201586:	000d3603          	ld	a2,0(s10)
ffffffffc020158a:	000db583          	ld	a1,0(s11)
ffffffffc020158e:	00083503          	ld	a0,0(a6)
ffffffffc0201592:	8f91                	sub	a5,a5,a2
ffffffffc0201594:	00379613          	slli	a2,a5,0x3
ffffffffc0201598:	97b2                	add	a5,a5,a2
ffffffffc020159a:	078e                	slli	a5,a5,0x3
ffffffffc020159c:	97ae                	add	a5,a5,a1
ffffffffc020159e:	0af51e63          	bne	a0,a5,ffffffffc020165a <swap_init+0x3b8>
ffffffffc02015a2:	6785                	lui	a5,0x1
ffffffffc02015a4:	9c3e                	add	s8,s8,a5
ffffffffc02015a6:	6795                	lui	a5,0x5
ffffffffc02015a8:	06a1                	addi	a3,a3,8
ffffffffc02015aa:	0821                	addi	a6,a6,8
ffffffffc02015ac:	fafc14e3          	bne	s8,a5,ffffffffc0201554 <swap_init+0x2b2>
ffffffffc02015b0:	00004517          	auipc	a0,0x4
ffffffffc02015b4:	bf850513          	addi	a0,a0,-1032 # ffffffffc02051a8 <commands+0xe88>
ffffffffc02015b8:	b07fe0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc02015bc:	00010797          	auipc	a5,0x10
ffffffffc02015c0:	e9c78793          	addi	a5,a5,-356 # ffffffffc0211458 <sm>
ffffffffc02015c4:	639c                	ld	a5,0(a5)
ffffffffc02015c6:	7f9c                	ld	a5,56(a5)
ffffffffc02015c8:	9782                	jalr	a5
ffffffffc02015ca:	2a051c63          	bnez	a0,ffffffffc0201882 <swap_init+0x5e0>
ffffffffc02015ce:	000a3503          	ld	a0,0(s4)
ffffffffc02015d2:	4585                	li	a1,1
ffffffffc02015d4:	0a21                	addi	s4,s4,8
ffffffffc02015d6:	522010ef          	jal	ra,ffffffffc0202af8 <free_pages>
ffffffffc02015da:	ff5a1ae3          	bne	s4,s5,ffffffffc02015ce <swap_init+0x32c>
ffffffffc02015de:	855e                	mv	a0,s7
ffffffffc02015e0:	e7aff0ef          	jal	ra,ffffffffc0200c5a <mm_destroy>
ffffffffc02015e4:	77a2                	ld	a5,40(sp)
ffffffffc02015e6:	00010717          	auipc	a4,0x10
ffffffffc02015ea:	f8f72523          	sw	a5,-118(a4) # ffffffffc0211570 <free_area+0x10>
ffffffffc02015ee:	7782                	ld	a5,32(sp)
ffffffffc02015f0:	00010717          	auipc	a4,0x10
ffffffffc02015f4:	f6f73823          	sd	a5,-144(a4) # ffffffffc0211560 <free_area>
ffffffffc02015f8:	00010797          	auipc	a5,0x10
ffffffffc02015fc:	f737b823          	sd	s3,-144(a5) # ffffffffc0211568 <free_area+0x8>
ffffffffc0201600:	00898a63          	beq	s3,s0,ffffffffc0201614 <swap_init+0x372>
ffffffffc0201604:	ff89a783          	lw	a5,-8(s3)
ffffffffc0201608:	0089b983          	ld	s3,8(s3)
ffffffffc020160c:	397d                	addiw	s2,s2,-1
ffffffffc020160e:	9c9d                	subw	s1,s1,a5
ffffffffc0201610:	fe899ae3          	bne	s3,s0,ffffffffc0201604 <swap_init+0x362>
ffffffffc0201614:	8626                	mv	a2,s1
ffffffffc0201616:	85ca                	mv	a1,s2
ffffffffc0201618:	00004517          	auipc	a0,0x4
ffffffffc020161c:	bc050513          	addi	a0,a0,-1088 # ffffffffc02051d8 <commands+0xeb8>
ffffffffc0201620:	a9ffe0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0201624:	00004517          	auipc	a0,0x4
ffffffffc0201628:	bd450513          	addi	a0,a0,-1068 # ffffffffc02051f8 <commands+0xed8>
ffffffffc020162c:	a93fe0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0201630:	b1c9                	j	ffffffffc02012f2 <swap_init+0x50>
ffffffffc0201632:	4481                	li	s1,0
ffffffffc0201634:	4901                	li	s2,0
ffffffffc0201636:	4981                	li	s3,0
ffffffffc0201638:	bb1d                	j	ffffffffc020136e <swap_init+0xcc>
ffffffffc020163a:	00004697          	auipc	a3,0x4
ffffffffc020163e:	94668693          	addi	a3,a3,-1722 # ffffffffc0204f80 <commands+0xc60>
ffffffffc0201642:	00003617          	auipc	a2,0x3
ffffffffc0201646:	53660613          	addi	a2,a2,1334 # ffffffffc0204b78 <commands+0x858>
ffffffffc020164a:	0ba00593          	li	a1,186
ffffffffc020164e:	00004517          	auipc	a0,0x4
ffffffffc0201652:	90a50513          	addi	a0,a0,-1782 # ffffffffc0204f58 <commands+0xc38>
ffffffffc0201656:	aaffe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc020165a:	00004697          	auipc	a3,0x4
ffffffffc020165e:	b2668693          	addi	a3,a3,-1242 # ffffffffc0205180 <commands+0xe60>
ffffffffc0201662:	00003617          	auipc	a2,0x3
ffffffffc0201666:	51660613          	addi	a2,a2,1302 # ffffffffc0204b78 <commands+0x858>
ffffffffc020166a:	0fa00593          	li	a1,250
ffffffffc020166e:	00004517          	auipc	a0,0x4
ffffffffc0201672:	8ea50513          	addi	a0,a0,-1814 # ffffffffc0204f58 <commands+0xc38>
ffffffffc0201676:	a8ffe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc020167a:	00004617          	auipc	a2,0x4
ffffffffc020167e:	ade60613          	addi	a2,a2,-1314 # ffffffffc0205158 <commands+0xe38>
ffffffffc0201682:	07000593          	li	a1,112
ffffffffc0201686:	00004517          	auipc	a0,0x4
ffffffffc020168a:	80a50513          	addi	a0,a0,-2038 # ffffffffc0204e90 <commands+0xb70>
ffffffffc020168e:	a77fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201692:	00003617          	auipc	a2,0x3
ffffffffc0201696:	7de60613          	addi	a2,a2,2014 # ffffffffc0204e70 <commands+0xb50>
ffffffffc020169a:	06500593          	li	a1,101
ffffffffc020169e:	00003517          	auipc	a0,0x3
ffffffffc02016a2:	7f250513          	addi	a0,a0,2034 # ffffffffc0204e90 <commands+0xb70>
ffffffffc02016a6:	a5ffe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02016aa:	00004697          	auipc	a3,0x4
ffffffffc02016ae:	9d668693          	addi	a3,a3,-1578 # ffffffffc0205080 <commands+0xd60>
ffffffffc02016b2:	00003617          	auipc	a2,0x3
ffffffffc02016b6:	4c660613          	addi	a2,a2,1222 # ffffffffc0204b78 <commands+0x858>
ffffffffc02016ba:	0db00593          	li	a1,219
ffffffffc02016be:	00004517          	auipc	a0,0x4
ffffffffc02016c2:	89a50513          	addi	a0,a0,-1894 # ffffffffc0204f58 <commands+0xc38>
ffffffffc02016c6:	a3ffe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02016ca:	00004697          	auipc	a3,0x4
ffffffffc02016ce:	99e68693          	addi	a3,a3,-1634 # ffffffffc0205068 <commands+0xd48>
ffffffffc02016d2:	00003617          	auipc	a2,0x3
ffffffffc02016d6:	4a660613          	addi	a2,a2,1190 # ffffffffc0204b78 <commands+0x858>
ffffffffc02016da:	0da00593          	li	a1,218
ffffffffc02016de:	00004517          	auipc	a0,0x4
ffffffffc02016e2:	87a50513          	addi	a0,a0,-1926 # ffffffffc0204f58 <commands+0xc38>
ffffffffc02016e6:	a1ffe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02016ea:	00004697          	auipc	a3,0x4
ffffffffc02016ee:	a5668693          	addi	a3,a3,-1450 # ffffffffc0205140 <commands+0xe20>
ffffffffc02016f2:	00003617          	auipc	a2,0x3
ffffffffc02016f6:	48660613          	addi	a2,a2,1158 # ffffffffc0204b78 <commands+0x858>
ffffffffc02016fa:	0f900593          	li	a1,249
ffffffffc02016fe:	00004517          	auipc	a0,0x4
ffffffffc0201702:	85a50513          	addi	a0,a0,-1958 # ffffffffc0204f58 <commands+0xc38>
ffffffffc0201706:	9fffe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc020170a:	00004617          	auipc	a2,0x4
ffffffffc020170e:	82e60613          	addi	a2,a2,-2002 # ffffffffc0204f38 <commands+0xc18>
ffffffffc0201712:	02700593          	li	a1,39
ffffffffc0201716:	00004517          	auipc	a0,0x4
ffffffffc020171a:	84250513          	addi	a0,a0,-1982 # ffffffffc0204f58 <commands+0xc38>
ffffffffc020171e:	9e7fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201722:	00004697          	auipc	a3,0x4
ffffffffc0201726:	9de68693          	addi	a3,a3,-1570 # ffffffffc0205100 <commands+0xde0>
ffffffffc020172a:	00003617          	auipc	a2,0x3
ffffffffc020172e:	44e60613          	addi	a2,a2,1102 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201732:	09500593          	li	a1,149
ffffffffc0201736:	00004517          	auipc	a0,0x4
ffffffffc020173a:	82250513          	addi	a0,a0,-2014 # ffffffffc0204f58 <commands+0xc38>
ffffffffc020173e:	9c7fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201742:	00004697          	auipc	a3,0x4
ffffffffc0201746:	9be68693          	addi	a3,a3,-1602 # ffffffffc0205100 <commands+0xde0>
ffffffffc020174a:	00003617          	auipc	a2,0x3
ffffffffc020174e:	42e60613          	addi	a2,a2,1070 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201752:	09700593          	li	a1,151
ffffffffc0201756:	00004517          	auipc	a0,0x4
ffffffffc020175a:	80250513          	addi	a0,a0,-2046 # ffffffffc0204f58 <commands+0xc38>
ffffffffc020175e:	9a7fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201762:	00004697          	auipc	a3,0x4
ffffffffc0201766:	9ae68693          	addi	a3,a3,-1618 # ffffffffc0205110 <commands+0xdf0>
ffffffffc020176a:	00003617          	auipc	a2,0x3
ffffffffc020176e:	40e60613          	addi	a2,a2,1038 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201772:	09900593          	li	a1,153
ffffffffc0201776:	00003517          	auipc	a0,0x3
ffffffffc020177a:	7e250513          	addi	a0,a0,2018 # ffffffffc0204f58 <commands+0xc38>
ffffffffc020177e:	987fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201782:	00004697          	auipc	a3,0x4
ffffffffc0201786:	98e68693          	addi	a3,a3,-1650 # ffffffffc0205110 <commands+0xdf0>
ffffffffc020178a:	00003617          	auipc	a2,0x3
ffffffffc020178e:	3ee60613          	addi	a2,a2,1006 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201792:	09b00593          	li	a1,155
ffffffffc0201796:	00003517          	auipc	a0,0x3
ffffffffc020179a:	7c250513          	addi	a0,a0,1986 # ffffffffc0204f58 <commands+0xc38>
ffffffffc020179e:	967fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02017a2:	00004697          	auipc	a3,0x4
ffffffffc02017a6:	94e68693          	addi	a3,a3,-1714 # ffffffffc02050f0 <commands+0xdd0>
ffffffffc02017aa:	00003617          	auipc	a2,0x3
ffffffffc02017ae:	3ce60613          	addi	a2,a2,974 # ffffffffc0204b78 <commands+0x858>
ffffffffc02017b2:	09100593          	li	a1,145
ffffffffc02017b6:	00003517          	auipc	a0,0x3
ffffffffc02017ba:	7a250513          	addi	a0,a0,1954 # ffffffffc0204f58 <commands+0xc38>
ffffffffc02017be:	947fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02017c2:	00004697          	auipc	a3,0x4
ffffffffc02017c6:	92e68693          	addi	a3,a3,-1746 # ffffffffc02050f0 <commands+0xdd0>
ffffffffc02017ca:	00003617          	auipc	a2,0x3
ffffffffc02017ce:	3ae60613          	addi	a2,a2,942 # ffffffffc0204b78 <commands+0x858>
ffffffffc02017d2:	09300593          	li	a1,147
ffffffffc02017d6:	00003517          	auipc	a0,0x3
ffffffffc02017da:	78250513          	addi	a0,a0,1922 # ffffffffc0204f58 <commands+0xc38>
ffffffffc02017de:	927fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02017e2:	00004697          	auipc	a3,0x4
ffffffffc02017e6:	8be68693          	addi	a3,a3,-1858 # ffffffffc02050a0 <commands+0xd80>
ffffffffc02017ea:	00003617          	auipc	a2,0x3
ffffffffc02017ee:	38e60613          	addi	a2,a2,910 # ffffffffc0204b78 <commands+0x858>
ffffffffc02017f2:	0e800593          	li	a1,232
ffffffffc02017f6:	00003517          	auipc	a0,0x3
ffffffffc02017fa:	76250513          	addi	a0,a0,1890 # ffffffffc0204f58 <commands+0xc38>
ffffffffc02017fe:	907fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201802:	00004697          	auipc	a3,0x4
ffffffffc0201806:	82668693          	addi	a3,a3,-2010 # ffffffffc0205028 <commands+0xd08>
ffffffffc020180a:	00003617          	auipc	a2,0x3
ffffffffc020180e:	36e60613          	addi	a2,a2,878 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201812:	0d500593          	li	a1,213
ffffffffc0201816:	00003517          	auipc	a0,0x3
ffffffffc020181a:	74250513          	addi	a0,a0,1858 # ffffffffc0204f58 <commands+0xc38>
ffffffffc020181e:	8e7fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201822:	00004697          	auipc	a3,0x4
ffffffffc0201826:	8fe68693          	addi	a3,a3,-1794 # ffffffffc0205120 <commands+0xe00>
ffffffffc020182a:	00003617          	auipc	a2,0x3
ffffffffc020182e:	34e60613          	addi	a2,a2,846 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201832:	09d00593          	li	a1,157
ffffffffc0201836:	00003517          	auipc	a0,0x3
ffffffffc020183a:	72250513          	addi	a0,a0,1826 # ffffffffc0204f58 <commands+0xc38>
ffffffffc020183e:	8c7fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201842:	00004697          	auipc	a3,0x4
ffffffffc0201846:	8de68693          	addi	a3,a3,-1826 # ffffffffc0205120 <commands+0xe00>
ffffffffc020184a:	00003617          	auipc	a2,0x3
ffffffffc020184e:	32e60613          	addi	a2,a2,814 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201852:	09f00593          	li	a1,159
ffffffffc0201856:	00003517          	auipc	a0,0x3
ffffffffc020185a:	70250513          	addi	a0,a0,1794 # ffffffffc0204f58 <commands+0xc38>
ffffffffc020185e:	8a7fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201862:	00004697          	auipc	a3,0x4
ffffffffc0201866:	8ce68693          	addi	a3,a3,-1842 # ffffffffc0205130 <commands+0xe10>
ffffffffc020186a:	00003617          	auipc	a2,0x3
ffffffffc020186e:	30e60613          	addi	a2,a2,782 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201872:	0f100593          	li	a1,241
ffffffffc0201876:	00003517          	auipc	a0,0x3
ffffffffc020187a:	6e250513          	addi	a0,a0,1762 # ffffffffc0204f58 <commands+0xc38>
ffffffffc020187e:	887fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201882:	00004697          	auipc	a3,0x4
ffffffffc0201886:	94e68693          	addi	a3,a3,-1714 # ffffffffc02051d0 <commands+0xeb0>
ffffffffc020188a:	00003617          	auipc	a2,0x3
ffffffffc020188e:	2ee60613          	addi	a2,a2,750 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201892:	10000593          	li	a1,256
ffffffffc0201896:	00003517          	auipc	a0,0x3
ffffffffc020189a:	6c250513          	addi	a0,a0,1730 # ffffffffc0204f58 <commands+0xc38>
ffffffffc020189e:	867fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02018a2:	00003697          	auipc	a3,0x3
ffffffffc02018a6:	3de68693          	addi	a3,a3,990 # ffffffffc0204c80 <commands+0x960>
ffffffffc02018aa:	00003617          	auipc	a2,0x3
ffffffffc02018ae:	2ce60613          	addi	a2,a2,718 # ffffffffc0204b78 <commands+0x858>
ffffffffc02018b2:	0c200593          	li	a1,194
ffffffffc02018b6:	00003517          	auipc	a0,0x3
ffffffffc02018ba:	6a250513          	addi	a0,a0,1698 # ffffffffc0204f58 <commands+0xc38>
ffffffffc02018be:	847fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02018c2:	00003697          	auipc	a3,0x3
ffffffffc02018c6:	71668693          	addi	a3,a3,1814 # ffffffffc0204fd8 <commands+0xcb8>
ffffffffc02018ca:	00003617          	auipc	a2,0x3
ffffffffc02018ce:	2ae60613          	addi	a2,a2,686 # ffffffffc0204b78 <commands+0x858>
ffffffffc02018d2:	0c500593          	li	a1,197
ffffffffc02018d6:	00003517          	auipc	a0,0x3
ffffffffc02018da:	68250513          	addi	a0,a0,1666 # ffffffffc0204f58 <commands+0xc38>
ffffffffc02018de:	827fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02018e2:	00003697          	auipc	a3,0x3
ffffffffc02018e6:	54e68693          	addi	a3,a3,1358 # ffffffffc0204e30 <commands+0xb10>
ffffffffc02018ea:	00003617          	auipc	a2,0x3
ffffffffc02018ee:	28e60613          	addi	a2,a2,654 # ffffffffc0204b78 <commands+0x858>
ffffffffc02018f2:	0ca00593          	li	a1,202
ffffffffc02018f6:	00003517          	auipc	a0,0x3
ffffffffc02018fa:	66250513          	addi	a0,a0,1634 # ffffffffc0204f58 <commands+0xc38>
ffffffffc02018fe:	807fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201902:	00003697          	auipc	a3,0x3
ffffffffc0201906:	5d668693          	addi	a3,a3,1494 # ffffffffc0204ed8 <commands+0xbb8>
ffffffffc020190a:	00003617          	auipc	a2,0x3
ffffffffc020190e:	26e60613          	addi	a2,a2,622 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201912:	0cd00593          	li	a1,205
ffffffffc0201916:	00003517          	auipc	a0,0x3
ffffffffc020191a:	64250513          	addi	a0,a0,1602 # ffffffffc0204f58 <commands+0xc38>
ffffffffc020191e:	fe6fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201922:	00003697          	auipc	a3,0x3
ffffffffc0201926:	66e68693          	addi	a3,a3,1646 # ffffffffc0204f90 <commands+0xc70>
ffffffffc020192a:	00003617          	auipc	a2,0x3
ffffffffc020192e:	24e60613          	addi	a2,a2,590 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201932:	0bd00593          	li	a1,189
ffffffffc0201936:	00003517          	auipc	a0,0x3
ffffffffc020193a:	62250513          	addi	a0,a0,1570 # ffffffffc0204f58 <commands+0xc38>
ffffffffc020193e:	fc6fe0ef          	jal	ra,ffffffffc0200104 <__panic>

ffffffffc0201942 <swap_init_mm>:
ffffffffc0201942:	00010797          	auipc	a5,0x10
ffffffffc0201946:	b1678793          	addi	a5,a5,-1258 # ffffffffc0211458 <sm>
ffffffffc020194a:	639c                	ld	a5,0(a5)
ffffffffc020194c:	0107b303          	ld	t1,16(a5)
ffffffffc0201950:	8302                	jr	t1

ffffffffc0201952 <swap_map_swappable>:
ffffffffc0201952:	00010797          	auipc	a5,0x10
ffffffffc0201956:	b0678793          	addi	a5,a5,-1274 # ffffffffc0211458 <sm>
ffffffffc020195a:	639c                	ld	a5,0(a5)
ffffffffc020195c:	0207b303          	ld	t1,32(a5)
ffffffffc0201960:	8302                	jr	t1

ffffffffc0201962 <swap_out>:
ffffffffc0201962:	711d                	addi	sp,sp,-96
ffffffffc0201964:	ec86                	sd	ra,88(sp)
ffffffffc0201966:	e8a2                	sd	s0,80(sp)
ffffffffc0201968:	e4a6                	sd	s1,72(sp)
ffffffffc020196a:	e0ca                	sd	s2,64(sp)
ffffffffc020196c:	fc4e                	sd	s3,56(sp)
ffffffffc020196e:	f852                	sd	s4,48(sp)
ffffffffc0201970:	f456                	sd	s5,40(sp)
ffffffffc0201972:	f05a                	sd	s6,32(sp)
ffffffffc0201974:	ec5e                	sd	s7,24(sp)
ffffffffc0201976:	e862                	sd	s8,16(sp)
ffffffffc0201978:	cde9                	beqz	a1,ffffffffc0201a52 <swap_out+0xf0>
ffffffffc020197a:	8ab2                	mv	s5,a2
ffffffffc020197c:	892a                	mv	s2,a0
ffffffffc020197e:	8a2e                	mv	s4,a1
ffffffffc0201980:	4401                	li	s0,0
ffffffffc0201982:	00010997          	auipc	s3,0x10
ffffffffc0201986:	ad698993          	addi	s3,s3,-1322 # ffffffffc0211458 <sm>
ffffffffc020198a:	00004b17          	auipc	s6,0x4
ffffffffc020198e:	8eeb0b13          	addi	s6,s6,-1810 # ffffffffc0205278 <commands+0xf58>
ffffffffc0201992:	00004b97          	auipc	s7,0x4
ffffffffc0201996:	8ceb8b93          	addi	s7,s7,-1842 # ffffffffc0205260 <commands+0xf40>
ffffffffc020199a:	a825                	j	ffffffffc02019d2 <swap_out+0x70>
ffffffffc020199c:	67a2                	ld	a5,8(sp)
ffffffffc020199e:	8626                	mv	a2,s1
ffffffffc02019a0:	85a2                	mv	a1,s0
ffffffffc02019a2:	63b4                	ld	a3,64(a5)
ffffffffc02019a4:	855a                	mv	a0,s6
ffffffffc02019a6:	2405                	addiw	s0,s0,1
ffffffffc02019a8:	82b1                	srli	a3,a3,0xc
ffffffffc02019aa:	0685                	addi	a3,a3,1
ffffffffc02019ac:	f12fe0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc02019b0:	6522                	ld	a0,8(sp)
ffffffffc02019b2:	4585                	li	a1,1
ffffffffc02019b4:	613c                	ld	a5,64(a0)
ffffffffc02019b6:	83b1                	srli	a5,a5,0xc
ffffffffc02019b8:	0785                	addi	a5,a5,1
ffffffffc02019ba:	07a2                	slli	a5,a5,0x8
ffffffffc02019bc:	00fc3023          	sd	a5,0(s8) # 1000 <BASE_ADDRESS-0xffffffffc01ff000>
ffffffffc02019c0:	138010ef          	jal	ra,ffffffffc0202af8 <free_pages>
ffffffffc02019c4:	01893503          	ld	a0,24(s2)
ffffffffc02019c8:	85a6                	mv	a1,s1
ffffffffc02019ca:	6f9010ef          	jal	ra,ffffffffc02038c2 <tlb_invalidate>
ffffffffc02019ce:	048a0d63          	beq	s4,s0,ffffffffc0201a28 <swap_out+0xc6>
ffffffffc02019d2:	0009b783          	ld	a5,0(s3)
ffffffffc02019d6:	8656                	mv	a2,s5
ffffffffc02019d8:	002c                	addi	a1,sp,8
ffffffffc02019da:	7b9c                	ld	a5,48(a5)
ffffffffc02019dc:	854a                	mv	a0,s2
ffffffffc02019de:	9782                	jalr	a5
ffffffffc02019e0:	e12d                	bnez	a0,ffffffffc0201a42 <swap_out+0xe0>
ffffffffc02019e2:	67a2                	ld	a5,8(sp)
ffffffffc02019e4:	01893503          	ld	a0,24(s2)
ffffffffc02019e8:	4601                	li	a2,0
ffffffffc02019ea:	63a4                	ld	s1,64(a5)
ffffffffc02019ec:	85a6                	mv	a1,s1
ffffffffc02019ee:	190010ef          	jal	ra,ffffffffc0202b7e <get_pte>
ffffffffc02019f2:	611c                	ld	a5,0(a0)
ffffffffc02019f4:	8c2a                	mv	s8,a0
ffffffffc02019f6:	8b85                	andi	a5,a5,1
ffffffffc02019f8:	cfb9                	beqz	a5,ffffffffc0201a56 <swap_out+0xf4>
ffffffffc02019fa:	65a2                	ld	a1,8(sp)
ffffffffc02019fc:	61bc                	ld	a5,64(a1)
ffffffffc02019fe:	83b1                	srli	a5,a5,0xc
ffffffffc0201a00:	00178513          	addi	a0,a5,1
ffffffffc0201a04:	0522                	slli	a0,a0,0x8
ffffffffc0201a06:	1b4020ef          	jal	ra,ffffffffc0203bba <swapfs_write>
ffffffffc0201a0a:	d949                	beqz	a0,ffffffffc020199c <swap_out+0x3a>
ffffffffc0201a0c:	855e                	mv	a0,s7
ffffffffc0201a0e:	eb0fe0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0201a12:	0009b783          	ld	a5,0(s3)
ffffffffc0201a16:	6622                	ld	a2,8(sp)
ffffffffc0201a18:	4681                	li	a3,0
ffffffffc0201a1a:	739c                	ld	a5,32(a5)
ffffffffc0201a1c:	85a6                	mv	a1,s1
ffffffffc0201a1e:	854a                	mv	a0,s2
ffffffffc0201a20:	2405                	addiw	s0,s0,1
ffffffffc0201a22:	9782                	jalr	a5
ffffffffc0201a24:	fa8a17e3          	bne	s4,s0,ffffffffc02019d2 <swap_out+0x70>
ffffffffc0201a28:	8522                	mv	a0,s0
ffffffffc0201a2a:	60e6                	ld	ra,88(sp)
ffffffffc0201a2c:	6446                	ld	s0,80(sp)
ffffffffc0201a2e:	64a6                	ld	s1,72(sp)
ffffffffc0201a30:	6906                	ld	s2,64(sp)
ffffffffc0201a32:	79e2                	ld	s3,56(sp)
ffffffffc0201a34:	7a42                	ld	s4,48(sp)
ffffffffc0201a36:	7aa2                	ld	s5,40(sp)
ffffffffc0201a38:	7b02                	ld	s6,32(sp)
ffffffffc0201a3a:	6be2                	ld	s7,24(sp)
ffffffffc0201a3c:	6c42                	ld	s8,16(sp)
ffffffffc0201a3e:	6125                	addi	sp,sp,96
ffffffffc0201a40:	8082                	ret
ffffffffc0201a42:	85a2                	mv	a1,s0
ffffffffc0201a44:	00003517          	auipc	a0,0x3
ffffffffc0201a48:	7d450513          	addi	a0,a0,2004 # ffffffffc0205218 <commands+0xef8>
ffffffffc0201a4c:	e72fe0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0201a50:	bfe1                	j	ffffffffc0201a28 <swap_out+0xc6>
ffffffffc0201a52:	4401                	li	s0,0
ffffffffc0201a54:	bfd1                	j	ffffffffc0201a28 <swap_out+0xc6>
ffffffffc0201a56:	00003697          	auipc	a3,0x3
ffffffffc0201a5a:	7f268693          	addi	a3,a3,2034 # ffffffffc0205248 <commands+0xf28>
ffffffffc0201a5e:	00003617          	auipc	a2,0x3
ffffffffc0201a62:	11a60613          	addi	a2,a2,282 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201a66:	06600593          	li	a1,102
ffffffffc0201a6a:	00003517          	auipc	a0,0x3
ffffffffc0201a6e:	4ee50513          	addi	a0,a0,1262 # ffffffffc0204f58 <commands+0xc38>
ffffffffc0201a72:	e92fe0ef          	jal	ra,ffffffffc0200104 <__panic>

ffffffffc0201a76 <swap_in>:
ffffffffc0201a76:	7179                	addi	sp,sp,-48
ffffffffc0201a78:	e84a                	sd	s2,16(sp)
ffffffffc0201a7a:	892a                	mv	s2,a0
ffffffffc0201a7c:	4505                	li	a0,1
ffffffffc0201a7e:	ec26                	sd	s1,24(sp)
ffffffffc0201a80:	e44e                	sd	s3,8(sp)
ffffffffc0201a82:	f406                	sd	ra,40(sp)
ffffffffc0201a84:	f022                	sd	s0,32(sp)
ffffffffc0201a86:	84ae                	mv	s1,a1
ffffffffc0201a88:	89b2                	mv	s3,a2
ffffffffc0201a8a:	7e7000ef          	jal	ra,ffffffffc0202a70 <alloc_pages>
ffffffffc0201a8e:	c129                	beqz	a0,ffffffffc0201ad0 <swap_in+0x5a>
ffffffffc0201a90:	842a                	mv	s0,a0
ffffffffc0201a92:	01893503          	ld	a0,24(s2)
ffffffffc0201a96:	4601                	li	a2,0
ffffffffc0201a98:	85a6                	mv	a1,s1
ffffffffc0201a9a:	0e4010ef          	jal	ra,ffffffffc0202b7e <get_pte>
ffffffffc0201a9e:	892a                	mv	s2,a0
ffffffffc0201aa0:	6108                	ld	a0,0(a0)
ffffffffc0201aa2:	85a2                	mv	a1,s0
ffffffffc0201aa4:	070020ef          	jal	ra,ffffffffc0203b14 <swapfs_read>
ffffffffc0201aa8:	00093583          	ld	a1,0(s2)
ffffffffc0201aac:	8626                	mv	a2,s1
ffffffffc0201aae:	00003517          	auipc	a0,0x3
ffffffffc0201ab2:	44a50513          	addi	a0,a0,1098 # ffffffffc0204ef8 <commands+0xbd8>
ffffffffc0201ab6:	81a1                	srli	a1,a1,0x8
ffffffffc0201ab8:	e06fe0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0201abc:	70a2                	ld	ra,40(sp)
ffffffffc0201abe:	0089b023          	sd	s0,0(s3)
ffffffffc0201ac2:	7402                	ld	s0,32(sp)
ffffffffc0201ac4:	64e2                	ld	s1,24(sp)
ffffffffc0201ac6:	6942                	ld	s2,16(sp)
ffffffffc0201ac8:	69a2                	ld	s3,8(sp)
ffffffffc0201aca:	4501                	li	a0,0
ffffffffc0201acc:	6145                	addi	sp,sp,48
ffffffffc0201ace:	8082                	ret
ffffffffc0201ad0:	00003697          	auipc	a3,0x3
ffffffffc0201ad4:	41868693          	addi	a3,a3,1048 # ffffffffc0204ee8 <commands+0xbc8>
ffffffffc0201ad8:	00003617          	auipc	a2,0x3
ffffffffc0201adc:	0a060613          	addi	a2,a2,160 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201ae0:	07c00593          	li	a1,124
ffffffffc0201ae4:	00003517          	auipc	a0,0x3
ffffffffc0201ae8:	47450513          	addi	a0,a0,1140 # ffffffffc0204f58 <commands+0xc38>
ffffffffc0201aec:	e18fe0ef          	jal	ra,ffffffffc0200104 <__panic>

ffffffffc0201af0 <default_init>:
ffffffffc0201af0:	00010797          	auipc	a5,0x10
ffffffffc0201af4:	a7078793          	addi	a5,a5,-1424 # ffffffffc0211560 <free_area>
ffffffffc0201af8:	e79c                	sd	a5,8(a5)
ffffffffc0201afa:	e39c                	sd	a5,0(a5)
ffffffffc0201afc:	0007a823          	sw	zero,16(a5)
ffffffffc0201b00:	8082                	ret

ffffffffc0201b02 <default_nr_free_pages>:
ffffffffc0201b02:	00010517          	auipc	a0,0x10
ffffffffc0201b06:	a6e56503          	lwu	a0,-1426(a0) # ffffffffc0211570 <free_area+0x10>
ffffffffc0201b0a:	8082                	ret

ffffffffc0201b0c <default_check>:
ffffffffc0201b0c:	715d                	addi	sp,sp,-80
ffffffffc0201b0e:	f84a                	sd	s2,48(sp)
ffffffffc0201b10:	00010917          	auipc	s2,0x10
ffffffffc0201b14:	a5090913          	addi	s2,s2,-1456 # ffffffffc0211560 <free_area>
ffffffffc0201b18:	00893783          	ld	a5,8(s2)
ffffffffc0201b1c:	e486                	sd	ra,72(sp)
ffffffffc0201b1e:	e0a2                	sd	s0,64(sp)
ffffffffc0201b20:	fc26                	sd	s1,56(sp)
ffffffffc0201b22:	f44e                	sd	s3,40(sp)
ffffffffc0201b24:	f052                	sd	s4,32(sp)
ffffffffc0201b26:	ec56                	sd	s5,24(sp)
ffffffffc0201b28:	e85a                	sd	s6,16(sp)
ffffffffc0201b2a:	e45e                	sd	s7,8(sp)
ffffffffc0201b2c:	e062                	sd	s8,0(sp)
ffffffffc0201b2e:	31278f63          	beq	a5,s2,ffffffffc0201e4c <default_check+0x340>
ffffffffc0201b32:	fe87b703          	ld	a4,-24(a5)
ffffffffc0201b36:	8305                	srli	a4,a4,0x1
ffffffffc0201b38:	8b05                	andi	a4,a4,1
ffffffffc0201b3a:	30070d63          	beqz	a4,ffffffffc0201e54 <default_check+0x348>
ffffffffc0201b3e:	4401                	li	s0,0
ffffffffc0201b40:	4481                	li	s1,0
ffffffffc0201b42:	a031                	j	ffffffffc0201b4e <default_check+0x42>
ffffffffc0201b44:	fe87b703          	ld	a4,-24(a5)
ffffffffc0201b48:	8b09                	andi	a4,a4,2
ffffffffc0201b4a:	30070563          	beqz	a4,ffffffffc0201e54 <default_check+0x348>
ffffffffc0201b4e:	ff87a703          	lw	a4,-8(a5)
ffffffffc0201b52:	679c                	ld	a5,8(a5)
ffffffffc0201b54:	2485                	addiw	s1,s1,1
ffffffffc0201b56:	9c39                	addw	s0,s0,a4
ffffffffc0201b58:	ff2796e3          	bne	a5,s2,ffffffffc0201b44 <default_check+0x38>
ffffffffc0201b5c:	89a2                	mv	s3,s0
ffffffffc0201b5e:	7e1000ef          	jal	ra,ffffffffc0202b3e <nr_free_pages>
ffffffffc0201b62:	75351963          	bne	a0,s3,ffffffffc02022b4 <default_check+0x7a8>
ffffffffc0201b66:	4505                	li	a0,1
ffffffffc0201b68:	709000ef          	jal	ra,ffffffffc0202a70 <alloc_pages>
ffffffffc0201b6c:	8a2a                	mv	s4,a0
ffffffffc0201b6e:	48050363          	beqz	a0,ffffffffc0201ff4 <default_check+0x4e8>
ffffffffc0201b72:	4505                	li	a0,1
ffffffffc0201b74:	6fd000ef          	jal	ra,ffffffffc0202a70 <alloc_pages>
ffffffffc0201b78:	89aa                	mv	s3,a0
ffffffffc0201b7a:	74050d63          	beqz	a0,ffffffffc02022d4 <default_check+0x7c8>
ffffffffc0201b7e:	4505                	li	a0,1
ffffffffc0201b80:	6f1000ef          	jal	ra,ffffffffc0202a70 <alloc_pages>
ffffffffc0201b84:	8aaa                	mv	s5,a0
ffffffffc0201b86:	4e050763          	beqz	a0,ffffffffc0202074 <default_check+0x568>
ffffffffc0201b8a:	2f3a0563          	beq	s4,s3,ffffffffc0201e74 <default_check+0x368>
ffffffffc0201b8e:	2eaa0363          	beq	s4,a0,ffffffffc0201e74 <default_check+0x368>
ffffffffc0201b92:	2ea98163          	beq	s3,a0,ffffffffc0201e74 <default_check+0x368>
ffffffffc0201b96:	000a2783          	lw	a5,0(s4)
ffffffffc0201b9a:	2e079d63          	bnez	a5,ffffffffc0201e94 <default_check+0x388>
ffffffffc0201b9e:	0009a783          	lw	a5,0(s3)
ffffffffc0201ba2:	2e079963          	bnez	a5,ffffffffc0201e94 <default_check+0x388>
ffffffffc0201ba6:	411c                	lw	a5,0(a0)
ffffffffc0201ba8:	2e079663          	bnez	a5,ffffffffc0201e94 <default_check+0x388>
ffffffffc0201bac:	00010797          	auipc	a5,0x10
ffffffffc0201bb0:	9ec78793          	addi	a5,a5,-1556 # ffffffffc0211598 <pages>
ffffffffc0201bb4:	639c                	ld	a5,0(a5)
ffffffffc0201bb6:	00003717          	auipc	a4,0x3
ffffffffc0201bba:	70270713          	addi	a4,a4,1794 # ffffffffc02052b8 <commands+0xf98>
ffffffffc0201bbe:	630c                	ld	a1,0(a4)
ffffffffc0201bc0:	40fa0733          	sub	a4,s4,a5
ffffffffc0201bc4:	870d                	srai	a4,a4,0x3
ffffffffc0201bc6:	02b70733          	mul	a4,a4,a1
ffffffffc0201bca:	00004697          	auipc	a3,0x4
ffffffffc0201bce:	43668693          	addi	a3,a3,1078 # ffffffffc0206000 <nbase>
ffffffffc0201bd2:	6290                	ld	a2,0(a3)
ffffffffc0201bd4:	00010697          	auipc	a3,0x10
ffffffffc0201bd8:	89c68693          	addi	a3,a3,-1892 # ffffffffc0211470 <npage>
ffffffffc0201bdc:	6294                	ld	a3,0(a3)
ffffffffc0201bde:	06b2                	slli	a3,a3,0xc
ffffffffc0201be0:	9732                	add	a4,a4,a2
ffffffffc0201be2:	0732                	slli	a4,a4,0xc
ffffffffc0201be4:	2cd77863          	bgeu	a4,a3,ffffffffc0201eb4 <default_check+0x3a8>
ffffffffc0201be8:	40f98733          	sub	a4,s3,a5
ffffffffc0201bec:	870d                	srai	a4,a4,0x3
ffffffffc0201bee:	02b70733          	mul	a4,a4,a1
ffffffffc0201bf2:	9732                	add	a4,a4,a2
ffffffffc0201bf4:	0732                	slli	a4,a4,0xc
ffffffffc0201bf6:	4ed77f63          	bgeu	a4,a3,ffffffffc02020f4 <default_check+0x5e8>
ffffffffc0201bfa:	40f507b3          	sub	a5,a0,a5
ffffffffc0201bfe:	878d                	srai	a5,a5,0x3
ffffffffc0201c00:	02b787b3          	mul	a5,a5,a1
ffffffffc0201c04:	97b2                	add	a5,a5,a2
ffffffffc0201c06:	07b2                	slli	a5,a5,0xc
ffffffffc0201c08:	34d7f663          	bgeu	a5,a3,ffffffffc0201f54 <default_check+0x448>
ffffffffc0201c0c:	4505                	li	a0,1
ffffffffc0201c0e:	00093c03          	ld	s8,0(s2)
ffffffffc0201c12:	00893b83          	ld	s7,8(s2)
ffffffffc0201c16:	01092b03          	lw	s6,16(s2)
ffffffffc0201c1a:	00010797          	auipc	a5,0x10
ffffffffc0201c1e:	9527b723          	sd	s2,-1714(a5) # ffffffffc0211568 <free_area+0x8>
ffffffffc0201c22:	00010797          	auipc	a5,0x10
ffffffffc0201c26:	9327bf23          	sd	s2,-1730(a5) # ffffffffc0211560 <free_area>
ffffffffc0201c2a:	00010797          	auipc	a5,0x10
ffffffffc0201c2e:	9407a323          	sw	zero,-1722(a5) # ffffffffc0211570 <free_area+0x10>
ffffffffc0201c32:	63f000ef          	jal	ra,ffffffffc0202a70 <alloc_pages>
ffffffffc0201c36:	2e051f63          	bnez	a0,ffffffffc0201f34 <default_check+0x428>
ffffffffc0201c3a:	4585                	li	a1,1
ffffffffc0201c3c:	8552                	mv	a0,s4
ffffffffc0201c3e:	6bb000ef          	jal	ra,ffffffffc0202af8 <free_pages>
ffffffffc0201c42:	4585                	li	a1,1
ffffffffc0201c44:	854e                	mv	a0,s3
ffffffffc0201c46:	6b3000ef          	jal	ra,ffffffffc0202af8 <free_pages>
ffffffffc0201c4a:	4585                	li	a1,1
ffffffffc0201c4c:	8556                	mv	a0,s5
ffffffffc0201c4e:	6ab000ef          	jal	ra,ffffffffc0202af8 <free_pages>
ffffffffc0201c52:	01092703          	lw	a4,16(s2)
ffffffffc0201c56:	478d                	li	a5,3
ffffffffc0201c58:	2af71e63          	bne	a4,a5,ffffffffc0201f14 <default_check+0x408>
ffffffffc0201c5c:	4505                	li	a0,1
ffffffffc0201c5e:	613000ef          	jal	ra,ffffffffc0202a70 <alloc_pages>
ffffffffc0201c62:	89aa                	mv	s3,a0
ffffffffc0201c64:	28050863          	beqz	a0,ffffffffc0201ef4 <default_check+0x3e8>
ffffffffc0201c68:	4505                	li	a0,1
ffffffffc0201c6a:	607000ef          	jal	ra,ffffffffc0202a70 <alloc_pages>
ffffffffc0201c6e:	8aaa                	mv	s5,a0
ffffffffc0201c70:	3e050263          	beqz	a0,ffffffffc0202054 <default_check+0x548>
ffffffffc0201c74:	4505                	li	a0,1
ffffffffc0201c76:	5fb000ef          	jal	ra,ffffffffc0202a70 <alloc_pages>
ffffffffc0201c7a:	8a2a                	mv	s4,a0
ffffffffc0201c7c:	3a050c63          	beqz	a0,ffffffffc0202034 <default_check+0x528>
ffffffffc0201c80:	4505                	li	a0,1
ffffffffc0201c82:	5ef000ef          	jal	ra,ffffffffc0202a70 <alloc_pages>
ffffffffc0201c86:	38051763          	bnez	a0,ffffffffc0202014 <default_check+0x508>
ffffffffc0201c8a:	4585                	li	a1,1
ffffffffc0201c8c:	854e                	mv	a0,s3
ffffffffc0201c8e:	66b000ef          	jal	ra,ffffffffc0202af8 <free_pages>
ffffffffc0201c92:	00893783          	ld	a5,8(s2)
ffffffffc0201c96:	23278f63          	beq	a5,s2,ffffffffc0201ed4 <default_check+0x3c8>
ffffffffc0201c9a:	4505                	li	a0,1
ffffffffc0201c9c:	5d5000ef          	jal	ra,ffffffffc0202a70 <alloc_pages>
ffffffffc0201ca0:	32a99a63          	bne	s3,a0,ffffffffc0201fd4 <default_check+0x4c8>
ffffffffc0201ca4:	4505                	li	a0,1
ffffffffc0201ca6:	5cb000ef          	jal	ra,ffffffffc0202a70 <alloc_pages>
ffffffffc0201caa:	30051563          	bnez	a0,ffffffffc0201fb4 <default_check+0x4a8>
ffffffffc0201cae:	01092783          	lw	a5,16(s2)
ffffffffc0201cb2:	2e079163          	bnez	a5,ffffffffc0201f94 <default_check+0x488>
ffffffffc0201cb6:	854e                	mv	a0,s3
ffffffffc0201cb8:	4585                	li	a1,1
ffffffffc0201cba:	00010797          	auipc	a5,0x10
ffffffffc0201cbe:	8b87b323          	sd	s8,-1882(a5) # ffffffffc0211560 <free_area>
ffffffffc0201cc2:	00010797          	auipc	a5,0x10
ffffffffc0201cc6:	8b77b323          	sd	s7,-1882(a5) # ffffffffc0211568 <free_area+0x8>
ffffffffc0201cca:	00010797          	auipc	a5,0x10
ffffffffc0201cce:	8b67a323          	sw	s6,-1882(a5) # ffffffffc0211570 <free_area+0x10>
ffffffffc0201cd2:	627000ef          	jal	ra,ffffffffc0202af8 <free_pages>
ffffffffc0201cd6:	4585                	li	a1,1
ffffffffc0201cd8:	8556                	mv	a0,s5
ffffffffc0201cda:	61f000ef          	jal	ra,ffffffffc0202af8 <free_pages>
ffffffffc0201cde:	4585                	li	a1,1
ffffffffc0201ce0:	8552                	mv	a0,s4
ffffffffc0201ce2:	617000ef          	jal	ra,ffffffffc0202af8 <free_pages>
ffffffffc0201ce6:	4515                	li	a0,5
ffffffffc0201ce8:	589000ef          	jal	ra,ffffffffc0202a70 <alloc_pages>
ffffffffc0201cec:	89aa                	mv	s3,a0
ffffffffc0201cee:	28050363          	beqz	a0,ffffffffc0201f74 <default_check+0x468>
ffffffffc0201cf2:	651c                	ld	a5,8(a0)
ffffffffc0201cf4:	8385                	srli	a5,a5,0x1
ffffffffc0201cf6:	8b85                	andi	a5,a5,1
ffffffffc0201cf8:	54079e63          	bnez	a5,ffffffffc0202254 <default_check+0x748>
ffffffffc0201cfc:	4505                	li	a0,1
ffffffffc0201cfe:	00093b03          	ld	s6,0(s2)
ffffffffc0201d02:	00893a83          	ld	s5,8(s2)
ffffffffc0201d06:	00010797          	auipc	a5,0x10
ffffffffc0201d0a:	8527bd23          	sd	s2,-1958(a5) # ffffffffc0211560 <free_area>
ffffffffc0201d0e:	00010797          	auipc	a5,0x10
ffffffffc0201d12:	8527bd23          	sd	s2,-1958(a5) # ffffffffc0211568 <free_area+0x8>
ffffffffc0201d16:	55b000ef          	jal	ra,ffffffffc0202a70 <alloc_pages>
ffffffffc0201d1a:	50051d63          	bnez	a0,ffffffffc0202234 <default_check+0x728>
ffffffffc0201d1e:	09098a13          	addi	s4,s3,144
ffffffffc0201d22:	8552                	mv	a0,s4
ffffffffc0201d24:	458d                	li	a1,3
ffffffffc0201d26:	01092b83          	lw	s7,16(s2)
ffffffffc0201d2a:	00010797          	auipc	a5,0x10
ffffffffc0201d2e:	8407a323          	sw	zero,-1978(a5) # ffffffffc0211570 <free_area+0x10>
ffffffffc0201d32:	5c7000ef          	jal	ra,ffffffffc0202af8 <free_pages>
ffffffffc0201d36:	4511                	li	a0,4
ffffffffc0201d38:	539000ef          	jal	ra,ffffffffc0202a70 <alloc_pages>
ffffffffc0201d3c:	4c051c63          	bnez	a0,ffffffffc0202214 <default_check+0x708>
ffffffffc0201d40:	0989b783          	ld	a5,152(s3)
ffffffffc0201d44:	8385                	srli	a5,a5,0x1
ffffffffc0201d46:	8b85                	andi	a5,a5,1
ffffffffc0201d48:	4a078663          	beqz	a5,ffffffffc02021f4 <default_check+0x6e8>
ffffffffc0201d4c:	0a89a703          	lw	a4,168(s3)
ffffffffc0201d50:	478d                	li	a5,3
ffffffffc0201d52:	4af71163          	bne	a4,a5,ffffffffc02021f4 <default_check+0x6e8>
ffffffffc0201d56:	450d                	li	a0,3
ffffffffc0201d58:	519000ef          	jal	ra,ffffffffc0202a70 <alloc_pages>
ffffffffc0201d5c:	8c2a                	mv	s8,a0
ffffffffc0201d5e:	46050b63          	beqz	a0,ffffffffc02021d4 <default_check+0x6c8>
ffffffffc0201d62:	4505                	li	a0,1
ffffffffc0201d64:	50d000ef          	jal	ra,ffffffffc0202a70 <alloc_pages>
ffffffffc0201d68:	44051663          	bnez	a0,ffffffffc02021b4 <default_check+0x6a8>
ffffffffc0201d6c:	438a1463          	bne	s4,s8,ffffffffc0202194 <default_check+0x688>
ffffffffc0201d70:	4585                	li	a1,1
ffffffffc0201d72:	854e                	mv	a0,s3
ffffffffc0201d74:	585000ef          	jal	ra,ffffffffc0202af8 <free_pages>
ffffffffc0201d78:	458d                	li	a1,3
ffffffffc0201d7a:	8552                	mv	a0,s4
ffffffffc0201d7c:	57d000ef          	jal	ra,ffffffffc0202af8 <free_pages>
ffffffffc0201d80:	0089b783          	ld	a5,8(s3)
ffffffffc0201d84:	04898c13          	addi	s8,s3,72
ffffffffc0201d88:	8385                	srli	a5,a5,0x1
ffffffffc0201d8a:	8b85                	andi	a5,a5,1
ffffffffc0201d8c:	3e078463          	beqz	a5,ffffffffc0202174 <default_check+0x668>
ffffffffc0201d90:	0189a703          	lw	a4,24(s3)
ffffffffc0201d94:	4785                	li	a5,1
ffffffffc0201d96:	3cf71f63          	bne	a4,a5,ffffffffc0202174 <default_check+0x668>
ffffffffc0201d9a:	008a3783          	ld	a5,8(s4)
ffffffffc0201d9e:	8385                	srli	a5,a5,0x1
ffffffffc0201da0:	8b85                	andi	a5,a5,1
ffffffffc0201da2:	3a078963          	beqz	a5,ffffffffc0202154 <default_check+0x648>
ffffffffc0201da6:	018a2703          	lw	a4,24(s4)
ffffffffc0201daa:	478d                	li	a5,3
ffffffffc0201dac:	3af71463          	bne	a4,a5,ffffffffc0202154 <default_check+0x648>
ffffffffc0201db0:	4505                	li	a0,1
ffffffffc0201db2:	4bf000ef          	jal	ra,ffffffffc0202a70 <alloc_pages>
ffffffffc0201db6:	36a99f63          	bne	s3,a0,ffffffffc0202134 <default_check+0x628>
ffffffffc0201dba:	4585                	li	a1,1
ffffffffc0201dbc:	53d000ef          	jal	ra,ffffffffc0202af8 <free_pages>
ffffffffc0201dc0:	4509                	li	a0,2
ffffffffc0201dc2:	4af000ef          	jal	ra,ffffffffc0202a70 <alloc_pages>
ffffffffc0201dc6:	34aa1763          	bne	s4,a0,ffffffffc0202114 <default_check+0x608>
ffffffffc0201dca:	4589                	li	a1,2
ffffffffc0201dcc:	52d000ef          	jal	ra,ffffffffc0202af8 <free_pages>
ffffffffc0201dd0:	4585                	li	a1,1
ffffffffc0201dd2:	8562                	mv	a0,s8
ffffffffc0201dd4:	525000ef          	jal	ra,ffffffffc0202af8 <free_pages>
ffffffffc0201dd8:	4515                	li	a0,5
ffffffffc0201dda:	497000ef          	jal	ra,ffffffffc0202a70 <alloc_pages>
ffffffffc0201dde:	89aa                	mv	s3,a0
ffffffffc0201de0:	48050a63          	beqz	a0,ffffffffc0202274 <default_check+0x768>
ffffffffc0201de4:	4505                	li	a0,1
ffffffffc0201de6:	48b000ef          	jal	ra,ffffffffc0202a70 <alloc_pages>
ffffffffc0201dea:	2e051563          	bnez	a0,ffffffffc02020d4 <default_check+0x5c8>
ffffffffc0201dee:	01092783          	lw	a5,16(s2)
ffffffffc0201df2:	2c079163          	bnez	a5,ffffffffc02020b4 <default_check+0x5a8>
ffffffffc0201df6:	4595                	li	a1,5
ffffffffc0201df8:	854e                	mv	a0,s3
ffffffffc0201dfa:	0000f797          	auipc	a5,0xf
ffffffffc0201dfe:	7777ab23          	sw	s7,1910(a5) # ffffffffc0211570 <free_area+0x10>
ffffffffc0201e02:	0000f797          	auipc	a5,0xf
ffffffffc0201e06:	7567bf23          	sd	s6,1886(a5) # ffffffffc0211560 <free_area>
ffffffffc0201e0a:	0000f797          	auipc	a5,0xf
ffffffffc0201e0e:	7557bf23          	sd	s5,1886(a5) # ffffffffc0211568 <free_area+0x8>
ffffffffc0201e12:	4e7000ef          	jal	ra,ffffffffc0202af8 <free_pages>
ffffffffc0201e16:	00893783          	ld	a5,8(s2)
ffffffffc0201e1a:	01278963          	beq	a5,s2,ffffffffc0201e2c <default_check+0x320>
ffffffffc0201e1e:	ff87a703          	lw	a4,-8(a5)
ffffffffc0201e22:	679c                	ld	a5,8(a5)
ffffffffc0201e24:	34fd                	addiw	s1,s1,-1
ffffffffc0201e26:	9c19                	subw	s0,s0,a4
ffffffffc0201e28:	ff279be3          	bne	a5,s2,ffffffffc0201e1e <default_check+0x312>
ffffffffc0201e2c:	26049463          	bnez	s1,ffffffffc0202094 <default_check+0x588>
ffffffffc0201e30:	46041263          	bnez	s0,ffffffffc0202294 <default_check+0x788>
ffffffffc0201e34:	60a6                	ld	ra,72(sp)
ffffffffc0201e36:	6406                	ld	s0,64(sp)
ffffffffc0201e38:	74e2                	ld	s1,56(sp)
ffffffffc0201e3a:	7942                	ld	s2,48(sp)
ffffffffc0201e3c:	79a2                	ld	s3,40(sp)
ffffffffc0201e3e:	7a02                	ld	s4,32(sp)
ffffffffc0201e40:	6ae2                	ld	s5,24(sp)
ffffffffc0201e42:	6b42                	ld	s6,16(sp)
ffffffffc0201e44:	6ba2                	ld	s7,8(sp)
ffffffffc0201e46:	6c02                	ld	s8,0(sp)
ffffffffc0201e48:	6161                	addi	sp,sp,80
ffffffffc0201e4a:	8082                	ret
ffffffffc0201e4c:	4981                	li	s3,0
ffffffffc0201e4e:	4401                	li	s0,0
ffffffffc0201e50:	4481                	li	s1,0
ffffffffc0201e52:	b331                	j	ffffffffc0201b5e <default_check+0x52>
ffffffffc0201e54:	00003697          	auipc	a3,0x3
ffffffffc0201e58:	12c68693          	addi	a3,a3,300 # ffffffffc0204f80 <commands+0xc60>
ffffffffc0201e5c:	00003617          	auipc	a2,0x3
ffffffffc0201e60:	d1c60613          	addi	a2,a2,-740 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201e64:	0f000593          	li	a1,240
ffffffffc0201e68:	00003517          	auipc	a0,0x3
ffffffffc0201e6c:	45850513          	addi	a0,a0,1112 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc0201e70:	a94fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201e74:	00003697          	auipc	a3,0x3
ffffffffc0201e78:	4c468693          	addi	a3,a3,1220 # ffffffffc0205338 <commands+0x1018>
ffffffffc0201e7c:	00003617          	auipc	a2,0x3
ffffffffc0201e80:	cfc60613          	addi	a2,a2,-772 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201e84:	0bd00593          	li	a1,189
ffffffffc0201e88:	00003517          	auipc	a0,0x3
ffffffffc0201e8c:	43850513          	addi	a0,a0,1080 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc0201e90:	a74fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201e94:	00003697          	auipc	a3,0x3
ffffffffc0201e98:	4cc68693          	addi	a3,a3,1228 # ffffffffc0205360 <commands+0x1040>
ffffffffc0201e9c:	00003617          	auipc	a2,0x3
ffffffffc0201ea0:	cdc60613          	addi	a2,a2,-804 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201ea4:	0be00593          	li	a1,190
ffffffffc0201ea8:	00003517          	auipc	a0,0x3
ffffffffc0201eac:	41850513          	addi	a0,a0,1048 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc0201eb0:	a54fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201eb4:	00003697          	auipc	a3,0x3
ffffffffc0201eb8:	4ec68693          	addi	a3,a3,1260 # ffffffffc02053a0 <commands+0x1080>
ffffffffc0201ebc:	00003617          	auipc	a2,0x3
ffffffffc0201ec0:	cbc60613          	addi	a2,a2,-836 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201ec4:	0c000593          	li	a1,192
ffffffffc0201ec8:	00003517          	auipc	a0,0x3
ffffffffc0201ecc:	3f850513          	addi	a0,a0,1016 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc0201ed0:	a34fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201ed4:	00003697          	auipc	a3,0x3
ffffffffc0201ed8:	55468693          	addi	a3,a3,1364 # ffffffffc0205428 <commands+0x1108>
ffffffffc0201edc:	00003617          	auipc	a2,0x3
ffffffffc0201ee0:	c9c60613          	addi	a2,a2,-868 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201ee4:	0d900593          	li	a1,217
ffffffffc0201ee8:	00003517          	auipc	a0,0x3
ffffffffc0201eec:	3d850513          	addi	a0,a0,984 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc0201ef0:	a14fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201ef4:	00003697          	auipc	a3,0x3
ffffffffc0201ef8:	3e468693          	addi	a3,a3,996 # ffffffffc02052d8 <commands+0xfb8>
ffffffffc0201efc:	00003617          	auipc	a2,0x3
ffffffffc0201f00:	c7c60613          	addi	a2,a2,-900 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201f04:	0d200593          	li	a1,210
ffffffffc0201f08:	00003517          	auipc	a0,0x3
ffffffffc0201f0c:	3b850513          	addi	a0,a0,952 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc0201f10:	9f4fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201f14:	00003697          	auipc	a3,0x3
ffffffffc0201f18:	50468693          	addi	a3,a3,1284 # ffffffffc0205418 <commands+0x10f8>
ffffffffc0201f1c:	00003617          	auipc	a2,0x3
ffffffffc0201f20:	c5c60613          	addi	a2,a2,-932 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201f24:	0d000593          	li	a1,208
ffffffffc0201f28:	00003517          	auipc	a0,0x3
ffffffffc0201f2c:	39850513          	addi	a0,a0,920 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc0201f30:	9d4fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201f34:	00003697          	auipc	a3,0x3
ffffffffc0201f38:	4cc68693          	addi	a3,a3,1228 # ffffffffc0205400 <commands+0x10e0>
ffffffffc0201f3c:	00003617          	auipc	a2,0x3
ffffffffc0201f40:	c3c60613          	addi	a2,a2,-964 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201f44:	0cb00593          	li	a1,203
ffffffffc0201f48:	00003517          	auipc	a0,0x3
ffffffffc0201f4c:	37850513          	addi	a0,a0,888 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc0201f50:	9b4fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201f54:	00003697          	auipc	a3,0x3
ffffffffc0201f58:	48c68693          	addi	a3,a3,1164 # ffffffffc02053e0 <commands+0x10c0>
ffffffffc0201f5c:	00003617          	auipc	a2,0x3
ffffffffc0201f60:	c1c60613          	addi	a2,a2,-996 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201f64:	0c200593          	li	a1,194
ffffffffc0201f68:	00003517          	auipc	a0,0x3
ffffffffc0201f6c:	35850513          	addi	a0,a0,856 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc0201f70:	994fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201f74:	00003697          	auipc	a3,0x3
ffffffffc0201f78:	4ec68693          	addi	a3,a3,1260 # ffffffffc0205460 <commands+0x1140>
ffffffffc0201f7c:	00003617          	auipc	a2,0x3
ffffffffc0201f80:	bfc60613          	addi	a2,a2,-1028 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201f84:	0f800593          	li	a1,248
ffffffffc0201f88:	00003517          	auipc	a0,0x3
ffffffffc0201f8c:	33850513          	addi	a0,a0,824 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc0201f90:	974fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201f94:	00003697          	auipc	a3,0x3
ffffffffc0201f98:	19c68693          	addi	a3,a3,412 # ffffffffc0205130 <commands+0xe10>
ffffffffc0201f9c:	00003617          	auipc	a2,0x3
ffffffffc0201fa0:	bdc60613          	addi	a2,a2,-1060 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201fa4:	0df00593          	li	a1,223
ffffffffc0201fa8:	00003517          	auipc	a0,0x3
ffffffffc0201fac:	31850513          	addi	a0,a0,792 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc0201fb0:	954fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201fb4:	00003697          	auipc	a3,0x3
ffffffffc0201fb8:	44c68693          	addi	a3,a3,1100 # ffffffffc0205400 <commands+0x10e0>
ffffffffc0201fbc:	00003617          	auipc	a2,0x3
ffffffffc0201fc0:	bbc60613          	addi	a2,a2,-1092 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201fc4:	0dd00593          	li	a1,221
ffffffffc0201fc8:	00003517          	auipc	a0,0x3
ffffffffc0201fcc:	2f850513          	addi	a0,a0,760 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc0201fd0:	934fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201fd4:	00003697          	auipc	a3,0x3
ffffffffc0201fd8:	46c68693          	addi	a3,a3,1132 # ffffffffc0205440 <commands+0x1120>
ffffffffc0201fdc:	00003617          	auipc	a2,0x3
ffffffffc0201fe0:	b9c60613          	addi	a2,a2,-1124 # ffffffffc0204b78 <commands+0x858>
ffffffffc0201fe4:	0dc00593          	li	a1,220
ffffffffc0201fe8:	00003517          	auipc	a0,0x3
ffffffffc0201fec:	2d850513          	addi	a0,a0,728 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc0201ff0:	914fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0201ff4:	00003697          	auipc	a3,0x3
ffffffffc0201ff8:	2e468693          	addi	a3,a3,740 # ffffffffc02052d8 <commands+0xfb8>
ffffffffc0201ffc:	00003617          	auipc	a2,0x3
ffffffffc0202000:	b7c60613          	addi	a2,a2,-1156 # ffffffffc0204b78 <commands+0x858>
ffffffffc0202004:	0b900593          	li	a1,185
ffffffffc0202008:	00003517          	auipc	a0,0x3
ffffffffc020200c:	2b850513          	addi	a0,a0,696 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc0202010:	8f4fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0202014:	00003697          	auipc	a3,0x3
ffffffffc0202018:	3ec68693          	addi	a3,a3,1004 # ffffffffc0205400 <commands+0x10e0>
ffffffffc020201c:	00003617          	auipc	a2,0x3
ffffffffc0202020:	b5c60613          	addi	a2,a2,-1188 # ffffffffc0204b78 <commands+0x858>
ffffffffc0202024:	0d600593          	li	a1,214
ffffffffc0202028:	00003517          	auipc	a0,0x3
ffffffffc020202c:	29850513          	addi	a0,a0,664 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc0202030:	8d4fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0202034:	00003697          	auipc	a3,0x3
ffffffffc0202038:	2e468693          	addi	a3,a3,740 # ffffffffc0205318 <commands+0xff8>
ffffffffc020203c:	00003617          	auipc	a2,0x3
ffffffffc0202040:	b3c60613          	addi	a2,a2,-1220 # ffffffffc0204b78 <commands+0x858>
ffffffffc0202044:	0d400593          	li	a1,212
ffffffffc0202048:	00003517          	auipc	a0,0x3
ffffffffc020204c:	27850513          	addi	a0,a0,632 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc0202050:	8b4fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0202054:	00003697          	auipc	a3,0x3
ffffffffc0202058:	2a468693          	addi	a3,a3,676 # ffffffffc02052f8 <commands+0xfd8>
ffffffffc020205c:	00003617          	auipc	a2,0x3
ffffffffc0202060:	b1c60613          	addi	a2,a2,-1252 # ffffffffc0204b78 <commands+0x858>
ffffffffc0202064:	0d300593          	li	a1,211
ffffffffc0202068:	00003517          	auipc	a0,0x3
ffffffffc020206c:	25850513          	addi	a0,a0,600 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc0202070:	894fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0202074:	00003697          	auipc	a3,0x3
ffffffffc0202078:	2a468693          	addi	a3,a3,676 # ffffffffc0205318 <commands+0xff8>
ffffffffc020207c:	00003617          	auipc	a2,0x3
ffffffffc0202080:	afc60613          	addi	a2,a2,-1284 # ffffffffc0204b78 <commands+0x858>
ffffffffc0202084:	0bb00593          	li	a1,187
ffffffffc0202088:	00003517          	auipc	a0,0x3
ffffffffc020208c:	23850513          	addi	a0,a0,568 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc0202090:	874fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0202094:	00003697          	auipc	a3,0x3
ffffffffc0202098:	51c68693          	addi	a3,a3,1308 # ffffffffc02055b0 <commands+0x1290>
ffffffffc020209c:	00003617          	auipc	a2,0x3
ffffffffc02020a0:	adc60613          	addi	a2,a2,-1316 # ffffffffc0204b78 <commands+0x858>
ffffffffc02020a4:	12500593          	li	a1,293
ffffffffc02020a8:	00003517          	auipc	a0,0x3
ffffffffc02020ac:	21850513          	addi	a0,a0,536 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc02020b0:	854fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02020b4:	00003697          	auipc	a3,0x3
ffffffffc02020b8:	07c68693          	addi	a3,a3,124 # ffffffffc0205130 <commands+0xe10>
ffffffffc02020bc:	00003617          	auipc	a2,0x3
ffffffffc02020c0:	abc60613          	addi	a2,a2,-1348 # ffffffffc0204b78 <commands+0x858>
ffffffffc02020c4:	11a00593          	li	a1,282
ffffffffc02020c8:	00003517          	auipc	a0,0x3
ffffffffc02020cc:	1f850513          	addi	a0,a0,504 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc02020d0:	834fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02020d4:	00003697          	auipc	a3,0x3
ffffffffc02020d8:	32c68693          	addi	a3,a3,812 # ffffffffc0205400 <commands+0x10e0>
ffffffffc02020dc:	00003617          	auipc	a2,0x3
ffffffffc02020e0:	a9c60613          	addi	a2,a2,-1380 # ffffffffc0204b78 <commands+0x858>
ffffffffc02020e4:	11800593          	li	a1,280
ffffffffc02020e8:	00003517          	auipc	a0,0x3
ffffffffc02020ec:	1d850513          	addi	a0,a0,472 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc02020f0:	814fe0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02020f4:	00003697          	auipc	a3,0x3
ffffffffc02020f8:	2cc68693          	addi	a3,a3,716 # ffffffffc02053c0 <commands+0x10a0>
ffffffffc02020fc:	00003617          	auipc	a2,0x3
ffffffffc0202100:	a7c60613          	addi	a2,a2,-1412 # ffffffffc0204b78 <commands+0x858>
ffffffffc0202104:	0c100593          	li	a1,193
ffffffffc0202108:	00003517          	auipc	a0,0x3
ffffffffc020210c:	1b850513          	addi	a0,a0,440 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc0202110:	ff5fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0202114:	00003697          	auipc	a3,0x3
ffffffffc0202118:	45c68693          	addi	a3,a3,1116 # ffffffffc0205570 <commands+0x1250>
ffffffffc020211c:	00003617          	auipc	a2,0x3
ffffffffc0202120:	a5c60613          	addi	a2,a2,-1444 # ffffffffc0204b78 <commands+0x858>
ffffffffc0202124:	11200593          	li	a1,274
ffffffffc0202128:	00003517          	auipc	a0,0x3
ffffffffc020212c:	19850513          	addi	a0,a0,408 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc0202130:	fd5fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0202134:	00003697          	auipc	a3,0x3
ffffffffc0202138:	41c68693          	addi	a3,a3,1052 # ffffffffc0205550 <commands+0x1230>
ffffffffc020213c:	00003617          	auipc	a2,0x3
ffffffffc0202140:	a3c60613          	addi	a2,a2,-1476 # ffffffffc0204b78 <commands+0x858>
ffffffffc0202144:	11000593          	li	a1,272
ffffffffc0202148:	00003517          	auipc	a0,0x3
ffffffffc020214c:	17850513          	addi	a0,a0,376 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc0202150:	fb5fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0202154:	00003697          	auipc	a3,0x3
ffffffffc0202158:	3d468693          	addi	a3,a3,980 # ffffffffc0205528 <commands+0x1208>
ffffffffc020215c:	00003617          	auipc	a2,0x3
ffffffffc0202160:	a1c60613          	addi	a2,a2,-1508 # ffffffffc0204b78 <commands+0x858>
ffffffffc0202164:	10e00593          	li	a1,270
ffffffffc0202168:	00003517          	auipc	a0,0x3
ffffffffc020216c:	15850513          	addi	a0,a0,344 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc0202170:	f95fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0202174:	00003697          	auipc	a3,0x3
ffffffffc0202178:	38c68693          	addi	a3,a3,908 # ffffffffc0205500 <commands+0x11e0>
ffffffffc020217c:	00003617          	auipc	a2,0x3
ffffffffc0202180:	9fc60613          	addi	a2,a2,-1540 # ffffffffc0204b78 <commands+0x858>
ffffffffc0202184:	10d00593          	li	a1,269
ffffffffc0202188:	00003517          	auipc	a0,0x3
ffffffffc020218c:	13850513          	addi	a0,a0,312 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc0202190:	f75fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0202194:	00003697          	auipc	a3,0x3
ffffffffc0202198:	35c68693          	addi	a3,a3,860 # ffffffffc02054f0 <commands+0x11d0>
ffffffffc020219c:	00003617          	auipc	a2,0x3
ffffffffc02021a0:	9dc60613          	addi	a2,a2,-1572 # ffffffffc0204b78 <commands+0x858>
ffffffffc02021a4:	10800593          	li	a1,264
ffffffffc02021a8:	00003517          	auipc	a0,0x3
ffffffffc02021ac:	11850513          	addi	a0,a0,280 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc02021b0:	f55fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02021b4:	00003697          	auipc	a3,0x3
ffffffffc02021b8:	24c68693          	addi	a3,a3,588 # ffffffffc0205400 <commands+0x10e0>
ffffffffc02021bc:	00003617          	auipc	a2,0x3
ffffffffc02021c0:	9bc60613          	addi	a2,a2,-1604 # ffffffffc0204b78 <commands+0x858>
ffffffffc02021c4:	10700593          	li	a1,263
ffffffffc02021c8:	00003517          	auipc	a0,0x3
ffffffffc02021cc:	0f850513          	addi	a0,a0,248 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc02021d0:	f35fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02021d4:	00003697          	auipc	a3,0x3
ffffffffc02021d8:	2fc68693          	addi	a3,a3,764 # ffffffffc02054d0 <commands+0x11b0>
ffffffffc02021dc:	00003617          	auipc	a2,0x3
ffffffffc02021e0:	99c60613          	addi	a2,a2,-1636 # ffffffffc0204b78 <commands+0x858>
ffffffffc02021e4:	10600593          	li	a1,262
ffffffffc02021e8:	00003517          	auipc	a0,0x3
ffffffffc02021ec:	0d850513          	addi	a0,a0,216 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc02021f0:	f15fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02021f4:	00003697          	auipc	a3,0x3
ffffffffc02021f8:	2ac68693          	addi	a3,a3,684 # ffffffffc02054a0 <commands+0x1180>
ffffffffc02021fc:	00003617          	auipc	a2,0x3
ffffffffc0202200:	97c60613          	addi	a2,a2,-1668 # ffffffffc0204b78 <commands+0x858>
ffffffffc0202204:	10500593          	li	a1,261
ffffffffc0202208:	00003517          	auipc	a0,0x3
ffffffffc020220c:	0b850513          	addi	a0,a0,184 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc0202210:	ef5fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0202214:	00003697          	auipc	a3,0x3
ffffffffc0202218:	27468693          	addi	a3,a3,628 # ffffffffc0205488 <commands+0x1168>
ffffffffc020221c:	00003617          	auipc	a2,0x3
ffffffffc0202220:	95c60613          	addi	a2,a2,-1700 # ffffffffc0204b78 <commands+0x858>
ffffffffc0202224:	10400593          	li	a1,260
ffffffffc0202228:	00003517          	auipc	a0,0x3
ffffffffc020222c:	09850513          	addi	a0,a0,152 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc0202230:	ed5fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0202234:	00003697          	auipc	a3,0x3
ffffffffc0202238:	1cc68693          	addi	a3,a3,460 # ffffffffc0205400 <commands+0x10e0>
ffffffffc020223c:	00003617          	auipc	a2,0x3
ffffffffc0202240:	93c60613          	addi	a2,a2,-1732 # ffffffffc0204b78 <commands+0x858>
ffffffffc0202244:	0fe00593          	li	a1,254
ffffffffc0202248:	00003517          	auipc	a0,0x3
ffffffffc020224c:	07850513          	addi	a0,a0,120 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc0202250:	eb5fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0202254:	00003697          	auipc	a3,0x3
ffffffffc0202258:	21c68693          	addi	a3,a3,540 # ffffffffc0205470 <commands+0x1150>
ffffffffc020225c:	00003617          	auipc	a2,0x3
ffffffffc0202260:	91c60613          	addi	a2,a2,-1764 # ffffffffc0204b78 <commands+0x858>
ffffffffc0202264:	0f900593          	li	a1,249
ffffffffc0202268:	00003517          	auipc	a0,0x3
ffffffffc020226c:	05850513          	addi	a0,a0,88 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc0202270:	e95fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0202274:	00003697          	auipc	a3,0x3
ffffffffc0202278:	31c68693          	addi	a3,a3,796 # ffffffffc0205590 <commands+0x1270>
ffffffffc020227c:	00003617          	auipc	a2,0x3
ffffffffc0202280:	8fc60613          	addi	a2,a2,-1796 # ffffffffc0204b78 <commands+0x858>
ffffffffc0202284:	11700593          	li	a1,279
ffffffffc0202288:	00003517          	auipc	a0,0x3
ffffffffc020228c:	03850513          	addi	a0,a0,56 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc0202290:	e75fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0202294:	00003697          	auipc	a3,0x3
ffffffffc0202298:	32c68693          	addi	a3,a3,812 # ffffffffc02055c0 <commands+0x12a0>
ffffffffc020229c:	00003617          	auipc	a2,0x3
ffffffffc02022a0:	8dc60613          	addi	a2,a2,-1828 # ffffffffc0204b78 <commands+0x858>
ffffffffc02022a4:	12600593          	li	a1,294
ffffffffc02022a8:	00003517          	auipc	a0,0x3
ffffffffc02022ac:	01850513          	addi	a0,a0,24 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc02022b0:	e55fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02022b4:	00003697          	auipc	a3,0x3
ffffffffc02022b8:	cdc68693          	addi	a3,a3,-804 # ffffffffc0204f90 <commands+0xc70>
ffffffffc02022bc:	00003617          	auipc	a2,0x3
ffffffffc02022c0:	8bc60613          	addi	a2,a2,-1860 # ffffffffc0204b78 <commands+0x858>
ffffffffc02022c4:	0f300593          	li	a1,243
ffffffffc02022c8:	00003517          	auipc	a0,0x3
ffffffffc02022cc:	ff850513          	addi	a0,a0,-8 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc02022d0:	e35fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02022d4:	00003697          	auipc	a3,0x3
ffffffffc02022d8:	02468693          	addi	a3,a3,36 # ffffffffc02052f8 <commands+0xfd8>
ffffffffc02022dc:	00003617          	auipc	a2,0x3
ffffffffc02022e0:	89c60613          	addi	a2,a2,-1892 # ffffffffc0204b78 <commands+0x858>
ffffffffc02022e4:	0ba00593          	li	a1,186
ffffffffc02022e8:	00003517          	auipc	a0,0x3
ffffffffc02022ec:	fd850513          	addi	a0,a0,-40 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc02022f0:	e15fd0ef          	jal	ra,ffffffffc0200104 <__panic>

ffffffffc02022f4 <default_free_pages>:
ffffffffc02022f4:	1141                	addi	sp,sp,-16
ffffffffc02022f6:	e406                	sd	ra,8(sp)
ffffffffc02022f8:	18058063          	beqz	a1,ffffffffc0202478 <default_free_pages+0x184>
ffffffffc02022fc:	00359693          	slli	a3,a1,0x3
ffffffffc0202300:	96ae                	add	a3,a3,a1
ffffffffc0202302:	068e                	slli	a3,a3,0x3
ffffffffc0202304:	96aa                	add	a3,a3,a0
ffffffffc0202306:	02d50d63          	beq	a0,a3,ffffffffc0202340 <default_free_pages+0x4c>
ffffffffc020230a:	651c                	ld	a5,8(a0)
ffffffffc020230c:	8b85                	andi	a5,a5,1
ffffffffc020230e:	14079563          	bnez	a5,ffffffffc0202458 <default_free_pages+0x164>
ffffffffc0202312:	651c                	ld	a5,8(a0)
ffffffffc0202314:	8385                	srli	a5,a5,0x1
ffffffffc0202316:	8b85                	andi	a5,a5,1
ffffffffc0202318:	14079063          	bnez	a5,ffffffffc0202458 <default_free_pages+0x164>
ffffffffc020231c:	87aa                	mv	a5,a0
ffffffffc020231e:	a809                	j	ffffffffc0202330 <default_free_pages+0x3c>
ffffffffc0202320:	6798                	ld	a4,8(a5)
ffffffffc0202322:	8b05                	andi	a4,a4,1
ffffffffc0202324:	12071a63          	bnez	a4,ffffffffc0202458 <default_free_pages+0x164>
ffffffffc0202328:	6798                	ld	a4,8(a5)
ffffffffc020232a:	8b09                	andi	a4,a4,2
ffffffffc020232c:	12071663          	bnez	a4,ffffffffc0202458 <default_free_pages+0x164>
ffffffffc0202330:	0007b423          	sd	zero,8(a5)
ffffffffc0202334:	0007a023          	sw	zero,0(a5)
ffffffffc0202338:	04878793          	addi	a5,a5,72
ffffffffc020233c:	fed792e3          	bne	a5,a3,ffffffffc0202320 <default_free_pages+0x2c>
ffffffffc0202340:	2581                	sext.w	a1,a1
ffffffffc0202342:	cd0c                	sw	a1,24(a0)
ffffffffc0202344:	00850893          	addi	a7,a0,8
ffffffffc0202348:	4789                	li	a5,2
ffffffffc020234a:	40f8b02f          	amoor.d	zero,a5,(a7)
ffffffffc020234e:	0000f697          	auipc	a3,0xf
ffffffffc0202352:	21268693          	addi	a3,a3,530 # ffffffffc0211560 <free_area>
ffffffffc0202356:	4a98                	lw	a4,16(a3)
ffffffffc0202358:	669c                	ld	a5,8(a3)
ffffffffc020235a:	9db9                	addw	a1,a1,a4
ffffffffc020235c:	0000f717          	auipc	a4,0xf
ffffffffc0202360:	20b72a23          	sw	a1,532(a4) # ffffffffc0211570 <free_area+0x10>
ffffffffc0202364:	08d78f63          	beq	a5,a3,ffffffffc0202402 <default_free_pages+0x10e>
ffffffffc0202368:	fe078713          	addi	a4,a5,-32
ffffffffc020236c:	628c                	ld	a1,0(a3)
ffffffffc020236e:	4801                	li	a6,0
ffffffffc0202370:	02050613          	addi	a2,a0,32
ffffffffc0202374:	00e56a63          	bltu	a0,a4,ffffffffc0202388 <default_free_pages+0x94>
ffffffffc0202378:	6798                	ld	a4,8(a5)
ffffffffc020237a:	02d70563          	beq	a4,a3,ffffffffc02023a4 <default_free_pages+0xb0>
ffffffffc020237e:	87ba                	mv	a5,a4
ffffffffc0202380:	fe078713          	addi	a4,a5,-32
ffffffffc0202384:	fee57ae3          	bgeu	a0,a4,ffffffffc0202378 <default_free_pages+0x84>
ffffffffc0202388:	00080663          	beqz	a6,ffffffffc0202394 <default_free_pages+0xa0>
ffffffffc020238c:	0000f817          	auipc	a6,0xf
ffffffffc0202390:	1cb83a23          	sd	a1,468(a6) # ffffffffc0211560 <free_area>
ffffffffc0202394:	638c                	ld	a1,0(a5)
ffffffffc0202396:	e390                	sd	a2,0(a5)
ffffffffc0202398:	e590                	sd	a2,8(a1)
ffffffffc020239a:	f51c                	sd	a5,40(a0)
ffffffffc020239c:	f10c                	sd	a1,32(a0)
ffffffffc020239e:	02d59163          	bne	a1,a3,ffffffffc02023c0 <default_free_pages+0xcc>
ffffffffc02023a2:	a091                	j	ffffffffc02023e6 <default_free_pages+0xf2>
ffffffffc02023a4:	e790                	sd	a2,8(a5)
ffffffffc02023a6:	f514                	sd	a3,40(a0)
ffffffffc02023a8:	6798                	ld	a4,8(a5)
ffffffffc02023aa:	f11c                	sd	a5,32(a0)
ffffffffc02023ac:	85b2                	mv	a1,a2
ffffffffc02023ae:	00d70563          	beq	a4,a3,ffffffffc02023b8 <default_free_pages+0xc4>
ffffffffc02023b2:	4805                	li	a6,1
ffffffffc02023b4:	87ba                	mv	a5,a4
ffffffffc02023b6:	b7e9                	j	ffffffffc0202380 <default_free_pages+0x8c>
ffffffffc02023b8:	e290                	sd	a2,0(a3)
ffffffffc02023ba:	85be                	mv	a1,a5
ffffffffc02023bc:	02d78163          	beq	a5,a3,ffffffffc02023de <default_free_pages+0xea>
ffffffffc02023c0:	ff85a803          	lw	a6,-8(a1) # ff8 <BASE_ADDRESS-0xffffffffc01ff008>
ffffffffc02023c4:	fe058613          	addi	a2,a1,-32
ffffffffc02023c8:	02081713          	slli	a4,a6,0x20
ffffffffc02023cc:	9301                	srli	a4,a4,0x20
ffffffffc02023ce:	00371793          	slli	a5,a4,0x3
ffffffffc02023d2:	97ba                	add	a5,a5,a4
ffffffffc02023d4:	078e                	slli	a5,a5,0x3
ffffffffc02023d6:	97b2                	add	a5,a5,a2
ffffffffc02023d8:	02f50e63          	beq	a0,a5,ffffffffc0202414 <default_free_pages+0x120>
ffffffffc02023dc:	751c                	ld	a5,40(a0)
ffffffffc02023de:	fe078713          	addi	a4,a5,-32
ffffffffc02023e2:	00d78d63          	beq	a5,a3,ffffffffc02023fc <default_free_pages+0x108>
ffffffffc02023e6:	4d0c                	lw	a1,24(a0)
ffffffffc02023e8:	02059613          	slli	a2,a1,0x20
ffffffffc02023ec:	9201                	srli	a2,a2,0x20
ffffffffc02023ee:	00361693          	slli	a3,a2,0x3
ffffffffc02023f2:	96b2                	add	a3,a3,a2
ffffffffc02023f4:	068e                	slli	a3,a3,0x3
ffffffffc02023f6:	96aa                	add	a3,a3,a0
ffffffffc02023f8:	04d70063          	beq	a4,a3,ffffffffc0202438 <default_free_pages+0x144>
ffffffffc02023fc:	60a2                	ld	ra,8(sp)
ffffffffc02023fe:	0141                	addi	sp,sp,16
ffffffffc0202400:	8082                	ret
ffffffffc0202402:	60a2                	ld	ra,8(sp)
ffffffffc0202404:	02050713          	addi	a4,a0,32
ffffffffc0202408:	e398                	sd	a4,0(a5)
ffffffffc020240a:	e798                	sd	a4,8(a5)
ffffffffc020240c:	f51c                	sd	a5,40(a0)
ffffffffc020240e:	f11c                	sd	a5,32(a0)
ffffffffc0202410:	0141                	addi	sp,sp,16
ffffffffc0202412:	8082                	ret
ffffffffc0202414:	4d1c                	lw	a5,24(a0)
ffffffffc0202416:	0107883b          	addw	a6,a5,a6
ffffffffc020241a:	ff05ac23          	sw	a6,-8(a1)
ffffffffc020241e:	57f5                	li	a5,-3
ffffffffc0202420:	60f8b02f          	amoand.d	zero,a5,(a7)
ffffffffc0202424:	02053803          	ld	a6,32(a0)
ffffffffc0202428:	7518                	ld	a4,40(a0)
ffffffffc020242a:	8532                	mv	a0,a2
ffffffffc020242c:	00e83423          	sd	a4,8(a6)
ffffffffc0202430:	659c                	ld	a5,8(a1)
ffffffffc0202432:	01073023          	sd	a6,0(a4)
ffffffffc0202436:	b765                	j	ffffffffc02023de <default_free_pages+0xea>
ffffffffc0202438:	ff87a703          	lw	a4,-8(a5)
ffffffffc020243c:	fe878693          	addi	a3,a5,-24
ffffffffc0202440:	9db9                	addw	a1,a1,a4
ffffffffc0202442:	cd0c                	sw	a1,24(a0)
ffffffffc0202444:	5775                	li	a4,-3
ffffffffc0202446:	60e6b02f          	amoand.d	zero,a4,(a3)
ffffffffc020244a:	6398                	ld	a4,0(a5)
ffffffffc020244c:	679c                	ld	a5,8(a5)
ffffffffc020244e:	60a2                	ld	ra,8(sp)
ffffffffc0202450:	e71c                	sd	a5,8(a4)
ffffffffc0202452:	e398                	sd	a4,0(a5)
ffffffffc0202454:	0141                	addi	sp,sp,16
ffffffffc0202456:	8082                	ret
ffffffffc0202458:	00003697          	auipc	a3,0x3
ffffffffc020245c:	17868693          	addi	a3,a3,376 # ffffffffc02055d0 <commands+0x12b0>
ffffffffc0202460:	00002617          	auipc	a2,0x2
ffffffffc0202464:	71860613          	addi	a2,a2,1816 # ffffffffc0204b78 <commands+0x858>
ffffffffc0202468:	08300593          	li	a1,131
ffffffffc020246c:	00003517          	auipc	a0,0x3
ffffffffc0202470:	e5450513          	addi	a0,a0,-428 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc0202474:	c91fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0202478:	00003697          	auipc	a3,0x3
ffffffffc020247c:	18068693          	addi	a3,a3,384 # ffffffffc02055f8 <commands+0x12d8>
ffffffffc0202480:	00002617          	auipc	a2,0x2
ffffffffc0202484:	6f860613          	addi	a2,a2,1784 # ffffffffc0204b78 <commands+0x858>
ffffffffc0202488:	08000593          	li	a1,128
ffffffffc020248c:	00003517          	auipc	a0,0x3
ffffffffc0202490:	e3450513          	addi	a0,a0,-460 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc0202494:	c71fd0ef          	jal	ra,ffffffffc0200104 <__panic>

ffffffffc0202498 <default_alloc_pages>:
ffffffffc0202498:	cd51                	beqz	a0,ffffffffc0202534 <default_alloc_pages+0x9c>
ffffffffc020249a:	0000f597          	auipc	a1,0xf
ffffffffc020249e:	0c658593          	addi	a1,a1,198 # ffffffffc0211560 <free_area>
ffffffffc02024a2:	0105a803          	lw	a6,16(a1)
ffffffffc02024a6:	862a                	mv	a2,a0
ffffffffc02024a8:	02081793          	slli	a5,a6,0x20
ffffffffc02024ac:	9381                	srli	a5,a5,0x20
ffffffffc02024ae:	00a7ee63          	bltu	a5,a0,ffffffffc02024ca <default_alloc_pages+0x32>
ffffffffc02024b2:	87ae                	mv	a5,a1
ffffffffc02024b4:	a801                	j	ffffffffc02024c4 <default_alloc_pages+0x2c>
ffffffffc02024b6:	ff87a703          	lw	a4,-8(a5)
ffffffffc02024ba:	02071693          	slli	a3,a4,0x20
ffffffffc02024be:	9281                	srli	a3,a3,0x20
ffffffffc02024c0:	00c6f763          	bgeu	a3,a2,ffffffffc02024ce <default_alloc_pages+0x36>
ffffffffc02024c4:	679c                	ld	a5,8(a5)
ffffffffc02024c6:	feb798e3          	bne	a5,a1,ffffffffc02024b6 <default_alloc_pages+0x1e>
ffffffffc02024ca:	4501                	li	a0,0
ffffffffc02024cc:	8082                	ret
ffffffffc02024ce:	fe078513          	addi	a0,a5,-32
ffffffffc02024d2:	dd6d                	beqz	a0,ffffffffc02024cc <default_alloc_pages+0x34>
ffffffffc02024d4:	0007b883          	ld	a7,0(a5)
ffffffffc02024d8:	0087b303          	ld	t1,8(a5)
ffffffffc02024dc:	00060e1b          	sext.w	t3,a2
ffffffffc02024e0:	0068b423          	sd	t1,8(a7)
ffffffffc02024e4:	01133023          	sd	a7,0(t1)
ffffffffc02024e8:	02d67b63          	bgeu	a2,a3,ffffffffc020251e <default_alloc_pages+0x86>
ffffffffc02024ec:	00361693          	slli	a3,a2,0x3
ffffffffc02024f0:	96b2                	add	a3,a3,a2
ffffffffc02024f2:	068e                	slli	a3,a3,0x3
ffffffffc02024f4:	96aa                	add	a3,a3,a0
ffffffffc02024f6:	41c7073b          	subw	a4,a4,t3
ffffffffc02024fa:	ce98                	sw	a4,24(a3)
ffffffffc02024fc:	00868613          	addi	a2,a3,8
ffffffffc0202500:	4709                	li	a4,2
ffffffffc0202502:	40e6302f          	amoor.d	zero,a4,(a2)
ffffffffc0202506:	0088b703          	ld	a4,8(a7)
ffffffffc020250a:	02068613          	addi	a2,a3,32
ffffffffc020250e:	0105a803          	lw	a6,16(a1)
ffffffffc0202512:	e310                	sd	a2,0(a4)
ffffffffc0202514:	00c8b423          	sd	a2,8(a7)
ffffffffc0202518:	f698                	sd	a4,40(a3)
ffffffffc020251a:	0316b023          	sd	a7,32(a3)
ffffffffc020251e:	41c8083b          	subw	a6,a6,t3
ffffffffc0202522:	0000f717          	auipc	a4,0xf
ffffffffc0202526:	05072723          	sw	a6,78(a4) # ffffffffc0211570 <free_area+0x10>
ffffffffc020252a:	5775                	li	a4,-3
ffffffffc020252c:	17a1                	addi	a5,a5,-24
ffffffffc020252e:	60e7b02f          	amoand.d	zero,a4,(a5)
ffffffffc0202532:	8082                	ret
ffffffffc0202534:	1141                	addi	sp,sp,-16
ffffffffc0202536:	00003697          	auipc	a3,0x3
ffffffffc020253a:	0c268693          	addi	a3,a3,194 # ffffffffc02055f8 <commands+0x12d8>
ffffffffc020253e:	00002617          	auipc	a2,0x2
ffffffffc0202542:	63a60613          	addi	a2,a2,1594 # ffffffffc0204b78 <commands+0x858>
ffffffffc0202546:	06200593          	li	a1,98
ffffffffc020254a:	00003517          	auipc	a0,0x3
ffffffffc020254e:	d7650513          	addi	a0,a0,-650 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc0202552:	e406                	sd	ra,8(sp)
ffffffffc0202554:	bb1fd0ef          	jal	ra,ffffffffc0200104 <__panic>

ffffffffc0202558 <default_init_memmap>:
ffffffffc0202558:	1141                	addi	sp,sp,-16
ffffffffc020255a:	e406                	sd	ra,8(sp)
ffffffffc020255c:	c1fd                	beqz	a1,ffffffffc0202642 <default_init_memmap+0xea>
ffffffffc020255e:	00359693          	slli	a3,a1,0x3
ffffffffc0202562:	96ae                	add	a3,a3,a1
ffffffffc0202564:	068e                	slli	a3,a3,0x3
ffffffffc0202566:	96aa                	add	a3,a3,a0
ffffffffc0202568:	02d50463          	beq	a0,a3,ffffffffc0202590 <default_init_memmap+0x38>
ffffffffc020256c:	6518                	ld	a4,8(a0)
ffffffffc020256e:	87aa                	mv	a5,a0
ffffffffc0202570:	8b05                	andi	a4,a4,1
ffffffffc0202572:	e709                	bnez	a4,ffffffffc020257c <default_init_memmap+0x24>
ffffffffc0202574:	a07d                	j	ffffffffc0202622 <default_init_memmap+0xca>
ffffffffc0202576:	6798                	ld	a4,8(a5)
ffffffffc0202578:	8b05                	andi	a4,a4,1
ffffffffc020257a:	c745                	beqz	a4,ffffffffc0202622 <default_init_memmap+0xca>
ffffffffc020257c:	0007ac23          	sw	zero,24(a5)
ffffffffc0202580:	0007b423          	sd	zero,8(a5)
ffffffffc0202584:	0007a023          	sw	zero,0(a5)
ffffffffc0202588:	04878793          	addi	a5,a5,72
ffffffffc020258c:	fed795e3          	bne	a5,a3,ffffffffc0202576 <default_init_memmap+0x1e>
ffffffffc0202590:	2581                	sext.w	a1,a1
ffffffffc0202592:	cd0c                	sw	a1,24(a0)
ffffffffc0202594:	4789                	li	a5,2
ffffffffc0202596:	00850713          	addi	a4,a0,8
ffffffffc020259a:	40f7302f          	amoor.d	zero,a5,(a4)
ffffffffc020259e:	0000f697          	auipc	a3,0xf
ffffffffc02025a2:	fc268693          	addi	a3,a3,-62 # ffffffffc0211560 <free_area>
ffffffffc02025a6:	4a98                	lw	a4,16(a3)
ffffffffc02025a8:	669c                	ld	a5,8(a3)
ffffffffc02025aa:	9db9                	addw	a1,a1,a4
ffffffffc02025ac:	0000f717          	auipc	a4,0xf
ffffffffc02025b0:	fcb72223          	sw	a1,-60(a4) # ffffffffc0211570 <free_area+0x10>
ffffffffc02025b4:	04d78a63          	beq	a5,a3,ffffffffc0202608 <default_init_memmap+0xb0>
ffffffffc02025b8:	fe078713          	addi	a4,a5,-32
ffffffffc02025bc:	628c                	ld	a1,0(a3)
ffffffffc02025be:	4801                	li	a6,0
ffffffffc02025c0:	02050613          	addi	a2,a0,32
ffffffffc02025c4:	00e56a63          	bltu	a0,a4,ffffffffc02025d8 <default_init_memmap+0x80>
ffffffffc02025c8:	6798                	ld	a4,8(a5)
ffffffffc02025ca:	02d70563          	beq	a4,a3,ffffffffc02025f4 <default_init_memmap+0x9c>
ffffffffc02025ce:	87ba                	mv	a5,a4
ffffffffc02025d0:	fe078713          	addi	a4,a5,-32
ffffffffc02025d4:	fee57ae3          	bgeu	a0,a4,ffffffffc02025c8 <default_init_memmap+0x70>
ffffffffc02025d8:	00080663          	beqz	a6,ffffffffc02025e4 <default_init_memmap+0x8c>
ffffffffc02025dc:	0000f717          	auipc	a4,0xf
ffffffffc02025e0:	f8b73223          	sd	a1,-124(a4) # ffffffffc0211560 <free_area>
ffffffffc02025e4:	6398                	ld	a4,0(a5)
ffffffffc02025e6:	60a2                	ld	ra,8(sp)
ffffffffc02025e8:	e390                	sd	a2,0(a5)
ffffffffc02025ea:	e710                	sd	a2,8(a4)
ffffffffc02025ec:	f51c                	sd	a5,40(a0)
ffffffffc02025ee:	f118                	sd	a4,32(a0)
ffffffffc02025f0:	0141                	addi	sp,sp,16
ffffffffc02025f2:	8082                	ret
ffffffffc02025f4:	e790                	sd	a2,8(a5)
ffffffffc02025f6:	f514                	sd	a3,40(a0)
ffffffffc02025f8:	6798                	ld	a4,8(a5)
ffffffffc02025fa:	f11c                	sd	a5,32(a0)
ffffffffc02025fc:	85b2                	mv	a1,a2
ffffffffc02025fe:	00d70e63          	beq	a4,a3,ffffffffc020261a <default_init_memmap+0xc2>
ffffffffc0202602:	4805                	li	a6,1
ffffffffc0202604:	87ba                	mv	a5,a4
ffffffffc0202606:	b7e9                	j	ffffffffc02025d0 <default_init_memmap+0x78>
ffffffffc0202608:	60a2                	ld	ra,8(sp)
ffffffffc020260a:	02050713          	addi	a4,a0,32
ffffffffc020260e:	e398                	sd	a4,0(a5)
ffffffffc0202610:	e798                	sd	a4,8(a5)
ffffffffc0202612:	f51c                	sd	a5,40(a0)
ffffffffc0202614:	f11c                	sd	a5,32(a0)
ffffffffc0202616:	0141                	addi	sp,sp,16
ffffffffc0202618:	8082                	ret
ffffffffc020261a:	60a2                	ld	ra,8(sp)
ffffffffc020261c:	e290                	sd	a2,0(a3)
ffffffffc020261e:	0141                	addi	sp,sp,16
ffffffffc0202620:	8082                	ret
ffffffffc0202622:	00003697          	auipc	a3,0x3
ffffffffc0202626:	fde68693          	addi	a3,a3,-34 # ffffffffc0205600 <commands+0x12e0>
ffffffffc020262a:	00002617          	auipc	a2,0x2
ffffffffc020262e:	54e60613          	addi	a2,a2,1358 # ffffffffc0204b78 <commands+0x858>
ffffffffc0202632:	04900593          	li	a1,73
ffffffffc0202636:	00003517          	auipc	a0,0x3
ffffffffc020263a:	c8a50513          	addi	a0,a0,-886 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc020263e:	ac7fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0202642:	00003697          	auipc	a3,0x3
ffffffffc0202646:	fb668693          	addi	a3,a3,-74 # ffffffffc02055f8 <commands+0x12d8>
ffffffffc020264a:	00002617          	auipc	a2,0x2
ffffffffc020264e:	52e60613          	addi	a2,a2,1326 # ffffffffc0204b78 <commands+0x858>
ffffffffc0202652:	04600593          	li	a1,70
ffffffffc0202656:	00003517          	auipc	a0,0x3
ffffffffc020265a:	c6a50513          	addi	a0,a0,-918 # ffffffffc02052c0 <commands+0xfa0>
ffffffffc020265e:	aa7fd0ef          	jal	ra,ffffffffc0200104 <__panic>

ffffffffc0202662 <_clock_init_mm>:
ffffffffc0202662:	0000f797          	auipc	a5,0xf
ffffffffc0202666:	e2678793          	addi	a5,a5,-474 # ffffffffc0211488 <pra_list_head>
ffffffffc020266a:	f51c                	sd	a5,40(a0)
ffffffffc020266c:	e79c                	sd	a5,8(a5)
ffffffffc020266e:	e39c                	sd	a5,0(a5)
ffffffffc0202670:	0000f717          	auipc	a4,0xf
ffffffffc0202674:	f0f73423          	sd	a5,-248(a4) # ffffffffc0211578 <curr_ptr>
ffffffffc0202678:	4501                	li	a0,0
ffffffffc020267a:	8082                	ret

ffffffffc020267c <_clock_init>:
ffffffffc020267c:	4501                	li	a0,0
ffffffffc020267e:	8082                	ret

ffffffffc0202680 <_clock_set_unswappable>:
ffffffffc0202680:	4501                	li	a0,0
ffffffffc0202682:	8082                	ret

ffffffffc0202684 <_clock_tick_event>:
ffffffffc0202684:	4501                	li	a0,0
ffffffffc0202686:	8082                	ret

ffffffffc0202688 <_clock_check_swap>:
ffffffffc0202688:	711d                	addi	sp,sp,-96
ffffffffc020268a:	4581                	li	a1,0
ffffffffc020268c:	00003517          	auipc	a0,0x3
ffffffffc0202690:	fd450513          	addi	a0,a0,-44 # ffffffffc0205660 <default_pmm_manager+0x50>
ffffffffc0202694:	ec86                	sd	ra,88(sp)
ffffffffc0202696:	e8a2                	sd	s0,80(sp)
ffffffffc0202698:	e0ca                	sd	s2,64(sp)
ffffffffc020269a:	fc4e                	sd	s3,56(sp)
ffffffffc020269c:	e4a6                	sd	s1,72(sp)
ffffffffc020269e:	f852                	sd	s4,48(sp)
ffffffffc02026a0:	f456                	sd	s5,40(sp)
ffffffffc02026a2:	f05a                	sd	s6,32(sp)
ffffffffc02026a4:	ec5e                	sd	s7,24(sp)
ffffffffc02026a6:	e862                	sd	s8,16(sp)
ffffffffc02026a8:	e466                	sd	s9,8(sp)
ffffffffc02026aa:	a15fd0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc02026ae:	4615                	li	a2,5
ffffffffc02026b0:	4585                	li	a1,1
ffffffffc02026b2:	00003517          	auipc	a0,0x3
ffffffffc02026b6:	fb650513          	addi	a0,a0,-74 # ffffffffc0205668 <default_pmm_manager+0x58>
ffffffffc02026ba:	690d                	lui	s2,0x3
ffffffffc02026bc:	49b1                	li	s3,12
ffffffffc02026be:	a01fd0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc02026c2:	0000f417          	auipc	s0,0xf
ffffffffc02026c6:	d8e40413          	addi	s0,s0,-626 # ffffffffc0211450 <pgfault_num>
ffffffffc02026ca:	01390023          	sb	s3,0(s2) # 3000 <BASE_ADDRESS-0xffffffffc01fd000>
ffffffffc02026ce:	401c                	lw	a5,0(s0)
ffffffffc02026d0:	4711                	li	a4,4
ffffffffc02026d2:	2781                	sext.w	a5,a5
ffffffffc02026d4:	10e79663          	bne	a5,a4,ffffffffc02027e0 <_clock_check_swap+0x158>
ffffffffc02026d8:	6a05                	lui	s4,0x1
ffffffffc02026da:	4aa9                	li	s5,10
ffffffffc02026dc:	015a0023          	sb	s5,0(s4) # 1000 <BASE_ADDRESS-0xffffffffc01ff000>
ffffffffc02026e0:	4018                	lw	a4,0(s0)
ffffffffc02026e2:	2701                	sext.w	a4,a4
ffffffffc02026e4:	26f71e63          	bne	a4,a5,ffffffffc0202960 <_clock_check_swap+0x2d8>
ffffffffc02026e8:	6b11                	lui	s6,0x4
ffffffffc02026ea:	4bb5                	li	s7,13
ffffffffc02026ec:	017b0023          	sb	s7,0(s6) # 4000 <BASE_ADDRESS-0xffffffffc01fc000>
ffffffffc02026f0:	4004                	lw	s1,0(s0)
ffffffffc02026f2:	2481                	sext.w	s1,s1
ffffffffc02026f4:	24e49663          	bne	s1,a4,ffffffffc0202940 <_clock_check_swap+0x2b8>
ffffffffc02026f8:	6c09                	lui	s8,0x2
ffffffffc02026fa:	4cad                	li	s9,11
ffffffffc02026fc:	019c0023          	sb	s9,0(s8) # 2000 <BASE_ADDRESS-0xffffffffc01fe000>
ffffffffc0202700:	4615                	li	a2,5
ffffffffc0202702:	4589                	li	a1,2
ffffffffc0202704:	00003517          	auipc	a0,0x3
ffffffffc0202708:	f6450513          	addi	a0,a0,-156 # ffffffffc0205668 <default_pmm_manager+0x58>
ffffffffc020270c:	9b3fd0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0202710:	401c                	lw	a5,0(s0)
ffffffffc0202712:	2781                	sext.w	a5,a5
ffffffffc0202714:	20979663          	bne	a5,s1,ffffffffc0202920 <_clock_check_swap+0x298>
ffffffffc0202718:	6795                	lui	a5,0x5
ffffffffc020271a:	4739                	li	a4,14
ffffffffc020271c:	00e78023          	sb	a4,0(a5) # 5000 <BASE_ADDRESS-0xffffffffc01fb000>
ffffffffc0202720:	401c                	lw	a5,0(s0)
ffffffffc0202722:	4715                	li	a4,5
ffffffffc0202724:	2781                	sext.w	a5,a5
ffffffffc0202726:	1ce79d63          	bne	a5,a4,ffffffffc0202900 <_clock_check_swap+0x278>
ffffffffc020272a:	019c0023          	sb	s9,0(s8)
ffffffffc020272e:	4018                	lw	a4,0(s0)
ffffffffc0202730:	2701                	sext.w	a4,a4
ffffffffc0202732:	1af71763          	bne	a4,a5,ffffffffc02028e0 <_clock_check_swap+0x258>
ffffffffc0202736:	4615                	li	a2,5
ffffffffc0202738:	458d                	li	a1,3
ffffffffc020273a:	00003517          	auipc	a0,0x3
ffffffffc020273e:	f2e50513          	addi	a0,a0,-210 # ffffffffc0205668 <default_pmm_manager+0x58>
ffffffffc0202742:	97dfd0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0202746:	015a0023          	sb	s5,0(s4)
ffffffffc020274a:	401c                	lw	a5,0(s0)
ffffffffc020274c:	4719                	li	a4,6
ffffffffc020274e:	2781                	sext.w	a5,a5
ffffffffc0202750:	16e79863          	bne	a5,a4,ffffffffc02028c0 <_clock_check_swap+0x238>
ffffffffc0202754:	019c0023          	sb	s9,0(s8)
ffffffffc0202758:	401c                	lw	a5,0(s0)
ffffffffc020275a:	471d                	li	a4,7
ffffffffc020275c:	2781                	sext.w	a5,a5
ffffffffc020275e:	14e79163          	bne	a5,a4,ffffffffc02028a0 <_clock_check_swap+0x218>
ffffffffc0202762:	01390023          	sb	s3,0(s2)
ffffffffc0202766:	401c                	lw	a5,0(s0)
ffffffffc0202768:	4721                	li	a4,8
ffffffffc020276a:	2781                	sext.w	a5,a5
ffffffffc020276c:	10e79a63          	bne	a5,a4,ffffffffc0202880 <_clock_check_swap+0x1f8>
ffffffffc0202770:	4615                	li	a2,5
ffffffffc0202772:	4591                	li	a1,4
ffffffffc0202774:	00003517          	auipc	a0,0x3
ffffffffc0202778:	ef450513          	addi	a0,a0,-268 # ffffffffc0205668 <default_pmm_manager+0x58>
ffffffffc020277c:	943fd0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0202780:	017b0023          	sb	s7,0(s6)
ffffffffc0202784:	401c                	lw	a5,0(s0)
ffffffffc0202786:	4725                	li	a4,9
ffffffffc0202788:	2781                	sext.w	a5,a5
ffffffffc020278a:	0ce79b63          	bne	a5,a4,ffffffffc0202860 <_clock_check_swap+0x1d8>
ffffffffc020278e:	6795                	lui	a5,0x5
ffffffffc0202790:	4739                	li	a4,14
ffffffffc0202792:	00e78023          	sb	a4,0(a5) # 5000 <BASE_ADDRESS-0xffffffffc01fb000>
ffffffffc0202796:	401c                	lw	a5,0(s0)
ffffffffc0202798:	4729                	li	a4,10
ffffffffc020279a:	2781                	sext.w	a5,a5
ffffffffc020279c:	0ae79263          	bne	a5,a4,ffffffffc0202840 <_clock_check_swap+0x1b8>
ffffffffc02027a0:	6705                	lui	a4,0x1
ffffffffc02027a2:	00074703          	lbu	a4,0(a4) # 1000 <BASE_ADDRESS-0xffffffffc01ff000>
ffffffffc02027a6:	06f71d63          	bne	a4,a5,ffffffffc0202820 <_clock_check_swap+0x198>
ffffffffc02027aa:	401c                	lw	a5,0(s0)
ffffffffc02027ac:	472d                	li	a4,11
ffffffffc02027ae:	2781                	sext.w	a5,a5
ffffffffc02027b0:	04e79863          	bne	a5,a4,ffffffffc0202800 <_clock_check_swap+0x178>
ffffffffc02027b4:	4615                	li	a2,5
ffffffffc02027b6:	4595                	li	a1,5
ffffffffc02027b8:	00003517          	auipc	a0,0x3
ffffffffc02027bc:	eb050513          	addi	a0,a0,-336 # ffffffffc0205668 <default_pmm_manager+0x58>
ffffffffc02027c0:	8fffd0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc02027c4:	60e6                	ld	ra,88(sp)
ffffffffc02027c6:	6446                	ld	s0,80(sp)
ffffffffc02027c8:	64a6                	ld	s1,72(sp)
ffffffffc02027ca:	6906                	ld	s2,64(sp)
ffffffffc02027cc:	79e2                	ld	s3,56(sp)
ffffffffc02027ce:	7a42                	ld	s4,48(sp)
ffffffffc02027d0:	7aa2                	ld	s5,40(sp)
ffffffffc02027d2:	7b02                	ld	s6,32(sp)
ffffffffc02027d4:	6be2                	ld	s7,24(sp)
ffffffffc02027d6:	6c42                	ld	s8,16(sp)
ffffffffc02027d8:	6ca2                	ld	s9,8(sp)
ffffffffc02027da:	4501                	li	a0,0
ffffffffc02027dc:	6125                	addi	sp,sp,96
ffffffffc02027de:	8082                	ret
ffffffffc02027e0:	00003697          	auipc	a3,0x3
ffffffffc02027e4:	94068693          	addi	a3,a3,-1728 # ffffffffc0205120 <commands+0xe00>
ffffffffc02027e8:	00002617          	auipc	a2,0x2
ffffffffc02027ec:	39060613          	addi	a2,a2,912 # ffffffffc0204b78 <commands+0x858>
ffffffffc02027f0:	06c00593          	li	a1,108
ffffffffc02027f4:	00003517          	auipc	a0,0x3
ffffffffc02027f8:	e8c50513          	addi	a0,a0,-372 # ffffffffc0205680 <default_pmm_manager+0x70>
ffffffffc02027fc:	909fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0202800:	00003697          	auipc	a3,0x3
ffffffffc0202804:	f2068693          	addi	a3,a3,-224 # ffffffffc0205720 <default_pmm_manager+0x110>
ffffffffc0202808:	00002617          	auipc	a2,0x2
ffffffffc020280c:	37060613          	addi	a2,a2,880 # ffffffffc0204b78 <commands+0x858>
ffffffffc0202810:	08600593          	li	a1,134
ffffffffc0202814:	00003517          	auipc	a0,0x3
ffffffffc0202818:	e6c50513          	addi	a0,a0,-404 # ffffffffc0205680 <default_pmm_manager+0x70>
ffffffffc020281c:	8e9fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0202820:	00003697          	auipc	a3,0x3
ffffffffc0202824:	ed868693          	addi	a3,a3,-296 # ffffffffc02056f8 <default_pmm_manager+0xe8>
ffffffffc0202828:	00002617          	auipc	a2,0x2
ffffffffc020282c:	35060613          	addi	a2,a2,848 # ffffffffc0204b78 <commands+0x858>
ffffffffc0202830:	08400593          	li	a1,132
ffffffffc0202834:	00003517          	auipc	a0,0x3
ffffffffc0202838:	e4c50513          	addi	a0,a0,-436 # ffffffffc0205680 <default_pmm_manager+0x70>
ffffffffc020283c:	8c9fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0202840:	00003697          	auipc	a3,0x3
ffffffffc0202844:	ea868693          	addi	a3,a3,-344 # ffffffffc02056e8 <default_pmm_manager+0xd8>
ffffffffc0202848:	00002617          	auipc	a2,0x2
ffffffffc020284c:	33060613          	addi	a2,a2,816 # ffffffffc0204b78 <commands+0x858>
ffffffffc0202850:	08300593          	li	a1,131
ffffffffc0202854:	00003517          	auipc	a0,0x3
ffffffffc0202858:	e2c50513          	addi	a0,a0,-468 # ffffffffc0205680 <default_pmm_manager+0x70>
ffffffffc020285c:	8a9fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0202860:	00003697          	auipc	a3,0x3
ffffffffc0202864:	e7868693          	addi	a3,a3,-392 # ffffffffc02056d8 <default_pmm_manager+0xc8>
ffffffffc0202868:	00002617          	auipc	a2,0x2
ffffffffc020286c:	31060613          	addi	a2,a2,784 # ffffffffc0204b78 <commands+0x858>
ffffffffc0202870:	08100593          	li	a1,129
ffffffffc0202874:	00003517          	auipc	a0,0x3
ffffffffc0202878:	e0c50513          	addi	a0,a0,-500 # ffffffffc0205680 <default_pmm_manager+0x70>
ffffffffc020287c:	889fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0202880:	00003697          	auipc	a3,0x3
ffffffffc0202884:	e4868693          	addi	a3,a3,-440 # ffffffffc02056c8 <default_pmm_manager+0xb8>
ffffffffc0202888:	00002617          	auipc	a2,0x2
ffffffffc020288c:	2f060613          	addi	a2,a2,752 # ffffffffc0204b78 <commands+0x858>
ffffffffc0202890:	07e00593          	li	a1,126
ffffffffc0202894:	00003517          	auipc	a0,0x3
ffffffffc0202898:	dec50513          	addi	a0,a0,-532 # ffffffffc0205680 <default_pmm_manager+0x70>
ffffffffc020289c:	869fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02028a0:	00003697          	auipc	a3,0x3
ffffffffc02028a4:	e1868693          	addi	a3,a3,-488 # ffffffffc02056b8 <default_pmm_manager+0xa8>
ffffffffc02028a8:	00002617          	auipc	a2,0x2
ffffffffc02028ac:	2d060613          	addi	a2,a2,720 # ffffffffc0204b78 <commands+0x858>
ffffffffc02028b0:	07c00593          	li	a1,124
ffffffffc02028b4:	00003517          	auipc	a0,0x3
ffffffffc02028b8:	dcc50513          	addi	a0,a0,-564 # ffffffffc0205680 <default_pmm_manager+0x70>
ffffffffc02028bc:	849fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02028c0:	00003697          	auipc	a3,0x3
ffffffffc02028c4:	de868693          	addi	a3,a3,-536 # ffffffffc02056a8 <default_pmm_manager+0x98>
ffffffffc02028c8:	00002617          	auipc	a2,0x2
ffffffffc02028cc:	2b060613          	addi	a2,a2,688 # ffffffffc0204b78 <commands+0x858>
ffffffffc02028d0:	07a00593          	li	a1,122
ffffffffc02028d4:	00003517          	auipc	a0,0x3
ffffffffc02028d8:	dac50513          	addi	a0,a0,-596 # ffffffffc0205680 <default_pmm_manager+0x70>
ffffffffc02028dc:	829fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02028e0:	00003697          	auipc	a3,0x3
ffffffffc02028e4:	db868693          	addi	a3,a3,-584 # ffffffffc0205698 <default_pmm_manager+0x88>
ffffffffc02028e8:	00002617          	auipc	a2,0x2
ffffffffc02028ec:	29060613          	addi	a2,a2,656 # ffffffffc0204b78 <commands+0x858>
ffffffffc02028f0:	07700593          	li	a1,119
ffffffffc02028f4:	00003517          	auipc	a0,0x3
ffffffffc02028f8:	d8c50513          	addi	a0,a0,-628 # ffffffffc0205680 <default_pmm_manager+0x70>
ffffffffc02028fc:	809fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0202900:	00003697          	auipc	a3,0x3
ffffffffc0202904:	d9868693          	addi	a3,a3,-616 # ffffffffc0205698 <default_pmm_manager+0x88>
ffffffffc0202908:	00002617          	auipc	a2,0x2
ffffffffc020290c:	27060613          	addi	a2,a2,624 # ffffffffc0204b78 <commands+0x858>
ffffffffc0202910:	07500593          	li	a1,117
ffffffffc0202914:	00003517          	auipc	a0,0x3
ffffffffc0202918:	d6c50513          	addi	a0,a0,-660 # ffffffffc0205680 <default_pmm_manager+0x70>
ffffffffc020291c:	fe8fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0202920:	00003697          	auipc	a3,0x3
ffffffffc0202924:	80068693          	addi	a3,a3,-2048 # ffffffffc0205120 <commands+0xe00>
ffffffffc0202928:	00002617          	auipc	a2,0x2
ffffffffc020292c:	25060613          	addi	a2,a2,592 # ffffffffc0204b78 <commands+0x858>
ffffffffc0202930:	07300593          	li	a1,115
ffffffffc0202934:	00003517          	auipc	a0,0x3
ffffffffc0202938:	d4c50513          	addi	a0,a0,-692 # ffffffffc0205680 <default_pmm_manager+0x70>
ffffffffc020293c:	fc8fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0202940:	00002697          	auipc	a3,0x2
ffffffffc0202944:	7e068693          	addi	a3,a3,2016 # ffffffffc0205120 <commands+0xe00>
ffffffffc0202948:	00002617          	auipc	a2,0x2
ffffffffc020294c:	23060613          	addi	a2,a2,560 # ffffffffc0204b78 <commands+0x858>
ffffffffc0202950:	07000593          	li	a1,112
ffffffffc0202954:	00003517          	auipc	a0,0x3
ffffffffc0202958:	d2c50513          	addi	a0,a0,-724 # ffffffffc0205680 <default_pmm_manager+0x70>
ffffffffc020295c:	fa8fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0202960:	00002697          	auipc	a3,0x2
ffffffffc0202964:	7c068693          	addi	a3,a3,1984 # ffffffffc0205120 <commands+0xe00>
ffffffffc0202968:	00002617          	auipc	a2,0x2
ffffffffc020296c:	21060613          	addi	a2,a2,528 # ffffffffc0204b78 <commands+0x858>
ffffffffc0202970:	06e00593          	li	a1,110
ffffffffc0202974:	00003517          	auipc	a0,0x3
ffffffffc0202978:	d0c50513          	addi	a0,a0,-756 # ffffffffc0205680 <default_pmm_manager+0x70>
ffffffffc020297c:	f88fd0ef          	jal	ra,ffffffffc0200104 <__panic>

ffffffffc0202980 <_clock_swap_out_victim>:
ffffffffc0202980:	7514                	ld	a3,40(a0)
ffffffffc0202982:	1141                	addi	sp,sp,-16
ffffffffc0202984:	e406                	sd	ra,8(sp)
ffffffffc0202986:	c6b9                	beqz	a3,ffffffffc02029d4 <_clock_swap_out_victim+0x54>
ffffffffc0202988:	e635                	bnez	a2,ffffffffc02029f4 <_clock_swap_out_victim+0x74>
ffffffffc020298a:	0000f797          	auipc	a5,0xf
ffffffffc020298e:	bee78793          	addi	a5,a5,-1042 # ffffffffc0211578 <curr_ptr>
ffffffffc0202992:	639c                	ld	a5,0(a5)
ffffffffc0202994:	4605                	li	a2,1
ffffffffc0202996:	679c                	ld	a5,8(a5)
ffffffffc0202998:	fef68fe3          	beq	a3,a5,ffffffffc0202996 <_clock_swap_out_victim+0x16>
ffffffffc020299c:	fe07b703          	ld	a4,-32(a5)
ffffffffc02029a0:	00c71b63          	bne	a4,a2,ffffffffc02029b6 <_clock_swap_out_victim+0x36>
ffffffffc02029a4:	fe07b023          	sd	zero,-32(a5)
ffffffffc02029a8:	679c                	ld	a5,8(a5)
ffffffffc02029aa:	fef686e3          	beq	a3,a5,ffffffffc0202996 <_clock_swap_out_victim+0x16>
ffffffffc02029ae:	fe07b703          	ld	a4,-32(a5)
ffffffffc02029b2:	fec709e3          	beq	a4,a2,ffffffffc02029a4 <_clock_swap_out_victim+0x24>
ffffffffc02029b6:	6394                	ld	a3,0(a5)
ffffffffc02029b8:	6798                	ld	a4,8(a5)
ffffffffc02029ba:	0000f617          	auipc	a2,0xf
ffffffffc02029be:	baf63f23          	sd	a5,-1090(a2) # ffffffffc0211578 <curr_ptr>
ffffffffc02029c2:	60a2                	ld	ra,8(sp)
ffffffffc02029c4:	e698                	sd	a4,8(a3)
ffffffffc02029c6:	e314                	sd	a3,0(a4)
ffffffffc02029c8:	fd078793          	addi	a5,a5,-48
ffffffffc02029cc:	e19c                	sd	a5,0(a1)
ffffffffc02029ce:	4501                	li	a0,0
ffffffffc02029d0:	0141                	addi	sp,sp,16
ffffffffc02029d2:	8082                	ret
ffffffffc02029d4:	00003697          	auipc	a3,0x3
ffffffffc02029d8:	d7c68693          	addi	a3,a3,-644 # ffffffffc0205750 <default_pmm_manager+0x140>
ffffffffc02029dc:	00002617          	auipc	a2,0x2
ffffffffc02029e0:	19c60613          	addi	a2,a2,412 # ffffffffc0204b78 <commands+0x858>
ffffffffc02029e4:	04b00593          	li	a1,75
ffffffffc02029e8:	00003517          	auipc	a0,0x3
ffffffffc02029ec:	c9850513          	addi	a0,a0,-872 # ffffffffc0205680 <default_pmm_manager+0x70>
ffffffffc02029f0:	f14fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02029f4:	00003697          	auipc	a3,0x3
ffffffffc02029f8:	d6c68693          	addi	a3,a3,-660 # ffffffffc0205760 <default_pmm_manager+0x150>
ffffffffc02029fc:	00002617          	auipc	a2,0x2
ffffffffc0202a00:	17c60613          	addi	a2,a2,380 # ffffffffc0204b78 <commands+0x858>
ffffffffc0202a04:	04c00593          	li	a1,76
ffffffffc0202a08:	00003517          	auipc	a0,0x3
ffffffffc0202a0c:	c7850513          	addi	a0,a0,-904 # ffffffffc0205680 <default_pmm_manager+0x70>
ffffffffc0202a10:	ef4fd0ef          	jal	ra,ffffffffc0200104 <__panic>

ffffffffc0202a14 <_clock_map_swappable>:
ffffffffc0202a14:	03060713          	addi	a4,a2,48
ffffffffc0202a18:	751c                	ld	a5,40(a0)
ffffffffc0202a1a:	cb19                	beqz	a4,ffffffffc0202a30 <_clock_map_swappable+0x1c>
ffffffffc0202a1c:	cb91                	beqz	a5,ffffffffc0202a30 <_clock_map_swappable+0x1c>
ffffffffc0202a1e:	6394                	ld	a3,0(a5)
ffffffffc0202a20:	e398                	sd	a4,0(a5)
ffffffffc0202a22:	4501                	li	a0,0
ffffffffc0202a24:	e698                	sd	a4,8(a3)
ffffffffc0202a26:	fe1c                	sd	a5,56(a2)
ffffffffc0202a28:	4785                	li	a5,1
ffffffffc0202a2a:	fa14                	sd	a3,48(a2)
ffffffffc0202a2c:	ea1c                	sd	a5,16(a2)
ffffffffc0202a2e:	8082                	ret
ffffffffc0202a30:	1141                	addi	sp,sp,-16
ffffffffc0202a32:	00003697          	auipc	a3,0x3
ffffffffc0202a36:	cfe68693          	addi	a3,a3,-770 # ffffffffc0205730 <default_pmm_manager+0x120>
ffffffffc0202a3a:	00002617          	auipc	a2,0x2
ffffffffc0202a3e:	13e60613          	addi	a2,a2,318 # ffffffffc0204b78 <commands+0x858>
ffffffffc0202a42:	03800593          	li	a1,56
ffffffffc0202a46:	00003517          	auipc	a0,0x3
ffffffffc0202a4a:	c3a50513          	addi	a0,a0,-966 # ffffffffc0205680 <default_pmm_manager+0x70>
ffffffffc0202a4e:	e406                	sd	ra,8(sp)
ffffffffc0202a50:	eb4fd0ef          	jal	ra,ffffffffc0200104 <__panic>

ffffffffc0202a54 <pa2page.part.4>:
ffffffffc0202a54:	1141                	addi	sp,sp,-16
ffffffffc0202a56:	00002617          	auipc	a2,0x2
ffffffffc0202a5a:	41a60613          	addi	a2,a2,1050 # ffffffffc0204e70 <commands+0xb50>
ffffffffc0202a5e:	06500593          	li	a1,101
ffffffffc0202a62:	00002517          	auipc	a0,0x2
ffffffffc0202a66:	42e50513          	addi	a0,a0,1070 # ffffffffc0204e90 <commands+0xb70>
ffffffffc0202a6a:	e406                	sd	ra,8(sp)
ffffffffc0202a6c:	e98fd0ef          	jal	ra,ffffffffc0200104 <__panic>

ffffffffc0202a70 <alloc_pages>:
ffffffffc0202a70:	715d                	addi	sp,sp,-80
ffffffffc0202a72:	e0a2                	sd	s0,64(sp)
ffffffffc0202a74:	fc26                	sd	s1,56(sp)
ffffffffc0202a76:	f84a                	sd	s2,48(sp)
ffffffffc0202a78:	f44e                	sd	s3,40(sp)
ffffffffc0202a7a:	f052                	sd	s4,32(sp)
ffffffffc0202a7c:	ec56                	sd	s5,24(sp)
ffffffffc0202a7e:	e486                	sd	ra,72(sp)
ffffffffc0202a80:	842a                	mv	s0,a0
ffffffffc0202a82:	0000f497          	auipc	s1,0xf
ffffffffc0202a86:	afe48493          	addi	s1,s1,-1282 # ffffffffc0211580 <pmm_manager>
ffffffffc0202a8a:	4985                	li	s3,1
ffffffffc0202a8c:	0000fa17          	auipc	s4,0xf
ffffffffc0202a90:	9d4a0a13          	addi	s4,s4,-1580 # ffffffffc0211460 <swap_init_ok>
ffffffffc0202a94:	0005091b          	sext.w	s2,a0
ffffffffc0202a98:	0000fa97          	auipc	s5,0xf
ffffffffc0202a9c:	9e8a8a93          	addi	s5,s5,-1560 # ffffffffc0211480 <check_mm_struct>
ffffffffc0202aa0:	a00d                	j	ffffffffc0202ac2 <alloc_pages+0x52>
ffffffffc0202aa2:	609c                	ld	a5,0(s1)
ffffffffc0202aa4:	6f9c                	ld	a5,24(a5)
ffffffffc0202aa6:	9782                	jalr	a5
ffffffffc0202aa8:	4601                	li	a2,0
ffffffffc0202aaa:	85ca                	mv	a1,s2
ffffffffc0202aac:	ed0d                	bnez	a0,ffffffffc0202ae6 <alloc_pages+0x76>
ffffffffc0202aae:	0289ec63          	bltu	s3,s0,ffffffffc0202ae6 <alloc_pages+0x76>
ffffffffc0202ab2:	000a2783          	lw	a5,0(s4)
ffffffffc0202ab6:	2781                	sext.w	a5,a5
ffffffffc0202ab8:	c79d                	beqz	a5,ffffffffc0202ae6 <alloc_pages+0x76>
ffffffffc0202aba:	000ab503          	ld	a0,0(s5)
ffffffffc0202abe:	ea5fe0ef          	jal	ra,ffffffffc0201962 <swap_out>
ffffffffc0202ac2:	100027f3          	csrr	a5,sstatus
ffffffffc0202ac6:	8b89                	andi	a5,a5,2
ffffffffc0202ac8:	8522                	mv	a0,s0
ffffffffc0202aca:	dfe1                	beqz	a5,ffffffffc0202aa2 <alloc_pages+0x32>
ffffffffc0202acc:	a27fd0ef          	jal	ra,ffffffffc02004f2 <intr_disable>
ffffffffc0202ad0:	609c                	ld	a5,0(s1)
ffffffffc0202ad2:	8522                	mv	a0,s0
ffffffffc0202ad4:	6f9c                	ld	a5,24(a5)
ffffffffc0202ad6:	9782                	jalr	a5
ffffffffc0202ad8:	e42a                	sd	a0,8(sp)
ffffffffc0202ada:	a13fd0ef          	jal	ra,ffffffffc02004ec <intr_enable>
ffffffffc0202ade:	6522                	ld	a0,8(sp)
ffffffffc0202ae0:	4601                	li	a2,0
ffffffffc0202ae2:	85ca                	mv	a1,s2
ffffffffc0202ae4:	d569                	beqz	a0,ffffffffc0202aae <alloc_pages+0x3e>
ffffffffc0202ae6:	60a6                	ld	ra,72(sp)
ffffffffc0202ae8:	6406                	ld	s0,64(sp)
ffffffffc0202aea:	74e2                	ld	s1,56(sp)
ffffffffc0202aec:	7942                	ld	s2,48(sp)
ffffffffc0202aee:	79a2                	ld	s3,40(sp)
ffffffffc0202af0:	7a02                	ld	s4,32(sp)
ffffffffc0202af2:	6ae2                	ld	s5,24(sp)
ffffffffc0202af4:	6161                	addi	sp,sp,80
ffffffffc0202af6:	8082                	ret

ffffffffc0202af8 <free_pages>:
ffffffffc0202af8:	100027f3          	csrr	a5,sstatus
ffffffffc0202afc:	8b89                	andi	a5,a5,2
ffffffffc0202afe:	eb89                	bnez	a5,ffffffffc0202b10 <free_pages+0x18>
ffffffffc0202b00:	0000f797          	auipc	a5,0xf
ffffffffc0202b04:	a8078793          	addi	a5,a5,-1408 # ffffffffc0211580 <pmm_manager>
ffffffffc0202b08:	639c                	ld	a5,0(a5)
ffffffffc0202b0a:	0207b303          	ld	t1,32(a5)
ffffffffc0202b0e:	8302                	jr	t1
ffffffffc0202b10:	1101                	addi	sp,sp,-32
ffffffffc0202b12:	ec06                	sd	ra,24(sp)
ffffffffc0202b14:	e822                	sd	s0,16(sp)
ffffffffc0202b16:	e426                	sd	s1,8(sp)
ffffffffc0202b18:	842a                	mv	s0,a0
ffffffffc0202b1a:	84ae                	mv	s1,a1
ffffffffc0202b1c:	9d7fd0ef          	jal	ra,ffffffffc02004f2 <intr_disable>
ffffffffc0202b20:	0000f797          	auipc	a5,0xf
ffffffffc0202b24:	a6078793          	addi	a5,a5,-1440 # ffffffffc0211580 <pmm_manager>
ffffffffc0202b28:	639c                	ld	a5,0(a5)
ffffffffc0202b2a:	85a6                	mv	a1,s1
ffffffffc0202b2c:	8522                	mv	a0,s0
ffffffffc0202b2e:	739c                	ld	a5,32(a5)
ffffffffc0202b30:	9782                	jalr	a5
ffffffffc0202b32:	6442                	ld	s0,16(sp)
ffffffffc0202b34:	60e2                	ld	ra,24(sp)
ffffffffc0202b36:	64a2                	ld	s1,8(sp)
ffffffffc0202b38:	6105                	addi	sp,sp,32
ffffffffc0202b3a:	9b3fd06f          	j	ffffffffc02004ec <intr_enable>

ffffffffc0202b3e <nr_free_pages>:
ffffffffc0202b3e:	100027f3          	csrr	a5,sstatus
ffffffffc0202b42:	8b89                	andi	a5,a5,2
ffffffffc0202b44:	eb89                	bnez	a5,ffffffffc0202b56 <nr_free_pages+0x18>
ffffffffc0202b46:	0000f797          	auipc	a5,0xf
ffffffffc0202b4a:	a3a78793          	addi	a5,a5,-1478 # ffffffffc0211580 <pmm_manager>
ffffffffc0202b4e:	639c                	ld	a5,0(a5)
ffffffffc0202b50:	0287b303          	ld	t1,40(a5)
ffffffffc0202b54:	8302                	jr	t1
ffffffffc0202b56:	1141                	addi	sp,sp,-16
ffffffffc0202b58:	e406                	sd	ra,8(sp)
ffffffffc0202b5a:	e022                	sd	s0,0(sp)
ffffffffc0202b5c:	997fd0ef          	jal	ra,ffffffffc02004f2 <intr_disable>
ffffffffc0202b60:	0000f797          	auipc	a5,0xf
ffffffffc0202b64:	a2078793          	addi	a5,a5,-1504 # ffffffffc0211580 <pmm_manager>
ffffffffc0202b68:	639c                	ld	a5,0(a5)
ffffffffc0202b6a:	779c                	ld	a5,40(a5)
ffffffffc0202b6c:	9782                	jalr	a5
ffffffffc0202b6e:	842a                	mv	s0,a0
ffffffffc0202b70:	97dfd0ef          	jal	ra,ffffffffc02004ec <intr_enable>
ffffffffc0202b74:	8522                	mv	a0,s0
ffffffffc0202b76:	60a2                	ld	ra,8(sp)
ffffffffc0202b78:	6402                	ld	s0,0(sp)
ffffffffc0202b7a:	0141                	addi	sp,sp,16
ffffffffc0202b7c:	8082                	ret

ffffffffc0202b7e <get_pte>:
ffffffffc0202b7e:	715d                	addi	sp,sp,-80
ffffffffc0202b80:	fc26                	sd	s1,56(sp)
ffffffffc0202b82:	01e5d493          	srli	s1,a1,0x1e
ffffffffc0202b86:	1ff4f493          	andi	s1,s1,511
ffffffffc0202b8a:	048e                	slli	s1,s1,0x3
ffffffffc0202b8c:	94aa                	add	s1,s1,a0
ffffffffc0202b8e:	6094                	ld	a3,0(s1)
ffffffffc0202b90:	f84a                	sd	s2,48(sp)
ffffffffc0202b92:	f44e                	sd	s3,40(sp)
ffffffffc0202b94:	f052                	sd	s4,32(sp)
ffffffffc0202b96:	e486                	sd	ra,72(sp)
ffffffffc0202b98:	e0a2                	sd	s0,64(sp)
ffffffffc0202b9a:	ec56                	sd	s5,24(sp)
ffffffffc0202b9c:	e85a                	sd	s6,16(sp)
ffffffffc0202b9e:	e45e                	sd	s7,8(sp)
ffffffffc0202ba0:	0016f793          	andi	a5,a3,1
ffffffffc0202ba4:	892e                	mv	s2,a1
ffffffffc0202ba6:	8a32                	mv	s4,a2
ffffffffc0202ba8:	0000f997          	auipc	s3,0xf
ffffffffc0202bac:	8c898993          	addi	s3,s3,-1848 # ffffffffc0211470 <npage>
ffffffffc0202bb0:	e3c9                	bnez	a5,ffffffffc0202c32 <get_pte+0xb4>
ffffffffc0202bb2:	16060163          	beqz	a2,ffffffffc0202d14 <get_pte+0x196>
ffffffffc0202bb6:	4505                	li	a0,1
ffffffffc0202bb8:	eb9ff0ef          	jal	ra,ffffffffc0202a70 <alloc_pages>
ffffffffc0202bbc:	842a                	mv	s0,a0
ffffffffc0202bbe:	14050b63          	beqz	a0,ffffffffc0202d14 <get_pte+0x196>
ffffffffc0202bc2:	0000fb97          	auipc	s7,0xf
ffffffffc0202bc6:	9d6b8b93          	addi	s7,s7,-1578 # ffffffffc0211598 <pages>
ffffffffc0202bca:	000bb503          	ld	a0,0(s7)
ffffffffc0202bce:	00002797          	auipc	a5,0x2
ffffffffc0202bd2:	6ea78793          	addi	a5,a5,1770 # ffffffffc02052b8 <commands+0xf98>
ffffffffc0202bd6:	0007bb03          	ld	s6,0(a5)
ffffffffc0202bda:	40a40533          	sub	a0,s0,a0
ffffffffc0202bde:	850d                	srai	a0,a0,0x3
ffffffffc0202be0:	03650533          	mul	a0,a0,s6
ffffffffc0202be4:	00080ab7          	lui	s5,0x80
ffffffffc0202be8:	0000f997          	auipc	s3,0xf
ffffffffc0202bec:	88898993          	addi	s3,s3,-1912 # ffffffffc0211470 <npage>
ffffffffc0202bf0:	4785                	li	a5,1
ffffffffc0202bf2:	0009b703          	ld	a4,0(s3)
ffffffffc0202bf6:	c01c                	sw	a5,0(s0)
ffffffffc0202bf8:	9556                	add	a0,a0,s5
ffffffffc0202bfa:	00c51793          	slli	a5,a0,0xc
ffffffffc0202bfe:	83b1                	srli	a5,a5,0xc
ffffffffc0202c00:	0532                	slli	a0,a0,0xc
ffffffffc0202c02:	16e7f063          	bgeu	a5,a4,ffffffffc0202d62 <get_pte+0x1e4>
ffffffffc0202c06:	0000f797          	auipc	a5,0xf
ffffffffc0202c0a:	98278793          	addi	a5,a5,-1662 # ffffffffc0211588 <va_pa_offset>
ffffffffc0202c0e:	639c                	ld	a5,0(a5)
ffffffffc0202c10:	6605                	lui	a2,0x1
ffffffffc0202c12:	4581                	li	a1,0
ffffffffc0202c14:	953e                	add	a0,a0,a5
ffffffffc0202c16:	0e8010ef          	jal	ra,ffffffffc0203cfe <memset>
ffffffffc0202c1a:	000bb683          	ld	a3,0(s7)
ffffffffc0202c1e:	40d406b3          	sub	a3,s0,a3
ffffffffc0202c22:	868d                	srai	a3,a3,0x3
ffffffffc0202c24:	036686b3          	mul	a3,a3,s6
ffffffffc0202c28:	96d6                	add	a3,a3,s5
ffffffffc0202c2a:	06aa                	slli	a3,a3,0xa
ffffffffc0202c2c:	0116e693          	ori	a3,a3,17
ffffffffc0202c30:	e094                	sd	a3,0(s1)
ffffffffc0202c32:	77fd                	lui	a5,0xfffff
ffffffffc0202c34:	068a                	slli	a3,a3,0x2
ffffffffc0202c36:	0009b703          	ld	a4,0(s3)
ffffffffc0202c3a:	8efd                	and	a3,a3,a5
ffffffffc0202c3c:	00c6d793          	srli	a5,a3,0xc
ffffffffc0202c40:	0ce7fc63          	bgeu	a5,a4,ffffffffc0202d18 <get_pte+0x19a>
ffffffffc0202c44:	0000fa97          	auipc	s5,0xf
ffffffffc0202c48:	944a8a93          	addi	s5,s5,-1724 # ffffffffc0211588 <va_pa_offset>
ffffffffc0202c4c:	000ab403          	ld	s0,0(s5)
ffffffffc0202c50:	01595793          	srli	a5,s2,0x15
ffffffffc0202c54:	1ff7f793          	andi	a5,a5,511
ffffffffc0202c58:	96a2                	add	a3,a3,s0
ffffffffc0202c5a:	00379413          	slli	s0,a5,0x3
ffffffffc0202c5e:	9436                	add	s0,s0,a3
ffffffffc0202c60:	6014                	ld	a3,0(s0)
ffffffffc0202c62:	0016f793          	andi	a5,a3,1
ffffffffc0202c66:	ebbd                	bnez	a5,ffffffffc0202cdc <get_pte+0x15e>
ffffffffc0202c68:	0a0a0663          	beqz	s4,ffffffffc0202d14 <get_pte+0x196>
ffffffffc0202c6c:	4505                	li	a0,1
ffffffffc0202c6e:	e03ff0ef          	jal	ra,ffffffffc0202a70 <alloc_pages>
ffffffffc0202c72:	84aa                	mv	s1,a0
ffffffffc0202c74:	c145                	beqz	a0,ffffffffc0202d14 <get_pte+0x196>
ffffffffc0202c76:	0000fb97          	auipc	s7,0xf
ffffffffc0202c7a:	922b8b93          	addi	s7,s7,-1758 # ffffffffc0211598 <pages>
ffffffffc0202c7e:	000bb503          	ld	a0,0(s7)
ffffffffc0202c82:	00002797          	auipc	a5,0x2
ffffffffc0202c86:	63678793          	addi	a5,a5,1590 # ffffffffc02052b8 <commands+0xf98>
ffffffffc0202c8a:	0007bb03          	ld	s6,0(a5)
ffffffffc0202c8e:	40a48533          	sub	a0,s1,a0
ffffffffc0202c92:	850d                	srai	a0,a0,0x3
ffffffffc0202c94:	03650533          	mul	a0,a0,s6
ffffffffc0202c98:	00080a37          	lui	s4,0x80
ffffffffc0202c9c:	4785                	li	a5,1
ffffffffc0202c9e:	0009b703          	ld	a4,0(s3)
ffffffffc0202ca2:	c09c                	sw	a5,0(s1)
ffffffffc0202ca4:	9552                	add	a0,a0,s4
ffffffffc0202ca6:	00c51793          	slli	a5,a0,0xc
ffffffffc0202caa:	83b1                	srli	a5,a5,0xc
ffffffffc0202cac:	0532                	slli	a0,a0,0xc
ffffffffc0202cae:	08e7fd63          	bgeu	a5,a4,ffffffffc0202d48 <get_pte+0x1ca>
ffffffffc0202cb2:	000ab783          	ld	a5,0(s5)
ffffffffc0202cb6:	6605                	lui	a2,0x1
ffffffffc0202cb8:	4581                	li	a1,0
ffffffffc0202cba:	953e                	add	a0,a0,a5
ffffffffc0202cbc:	042010ef          	jal	ra,ffffffffc0203cfe <memset>
ffffffffc0202cc0:	000bb683          	ld	a3,0(s7)
ffffffffc0202cc4:	40d486b3          	sub	a3,s1,a3
ffffffffc0202cc8:	868d                	srai	a3,a3,0x3
ffffffffc0202cca:	036686b3          	mul	a3,a3,s6
ffffffffc0202cce:	96d2                	add	a3,a3,s4
ffffffffc0202cd0:	06aa                	slli	a3,a3,0xa
ffffffffc0202cd2:	0116e693          	ori	a3,a3,17
ffffffffc0202cd6:	e014                	sd	a3,0(s0)
ffffffffc0202cd8:	0009b703          	ld	a4,0(s3)
ffffffffc0202cdc:	068a                	slli	a3,a3,0x2
ffffffffc0202cde:	757d                	lui	a0,0xfffff
ffffffffc0202ce0:	8ee9                	and	a3,a3,a0
ffffffffc0202ce2:	00c6d793          	srli	a5,a3,0xc
ffffffffc0202ce6:	04e7f563          	bgeu	a5,a4,ffffffffc0202d30 <get_pte+0x1b2>
ffffffffc0202cea:	000ab503          	ld	a0,0(s5)
ffffffffc0202cee:	00c95793          	srli	a5,s2,0xc
ffffffffc0202cf2:	1ff7f793          	andi	a5,a5,511
ffffffffc0202cf6:	96aa                	add	a3,a3,a0
ffffffffc0202cf8:	00379513          	slli	a0,a5,0x3
ffffffffc0202cfc:	9536                	add	a0,a0,a3
ffffffffc0202cfe:	60a6                	ld	ra,72(sp)
ffffffffc0202d00:	6406                	ld	s0,64(sp)
ffffffffc0202d02:	74e2                	ld	s1,56(sp)
ffffffffc0202d04:	7942                	ld	s2,48(sp)
ffffffffc0202d06:	79a2                	ld	s3,40(sp)
ffffffffc0202d08:	7a02                	ld	s4,32(sp)
ffffffffc0202d0a:	6ae2                	ld	s5,24(sp)
ffffffffc0202d0c:	6b42                	ld	s6,16(sp)
ffffffffc0202d0e:	6ba2                	ld	s7,8(sp)
ffffffffc0202d10:	6161                	addi	sp,sp,80
ffffffffc0202d12:	8082                	ret
ffffffffc0202d14:	4501                	li	a0,0
ffffffffc0202d16:	b7e5                	j	ffffffffc0202cfe <get_pte+0x180>
ffffffffc0202d18:	00003617          	auipc	a2,0x3
ffffffffc0202d1c:	a7060613          	addi	a2,a2,-1424 # ffffffffc0205788 <default_pmm_manager+0x178>
ffffffffc0202d20:	10200593          	li	a1,258
ffffffffc0202d24:	00003517          	auipc	a0,0x3
ffffffffc0202d28:	a8c50513          	addi	a0,a0,-1396 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc0202d2c:	bd8fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0202d30:	00003617          	auipc	a2,0x3
ffffffffc0202d34:	a5860613          	addi	a2,a2,-1448 # ffffffffc0205788 <default_pmm_manager+0x178>
ffffffffc0202d38:	10f00593          	li	a1,271
ffffffffc0202d3c:	00003517          	auipc	a0,0x3
ffffffffc0202d40:	a7450513          	addi	a0,a0,-1420 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc0202d44:	bc0fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0202d48:	86aa                	mv	a3,a0
ffffffffc0202d4a:	00003617          	auipc	a2,0x3
ffffffffc0202d4e:	a3e60613          	addi	a2,a2,-1474 # ffffffffc0205788 <default_pmm_manager+0x178>
ffffffffc0202d52:	10b00593          	li	a1,267
ffffffffc0202d56:	00003517          	auipc	a0,0x3
ffffffffc0202d5a:	a5a50513          	addi	a0,a0,-1446 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc0202d5e:	ba6fd0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0202d62:	86aa                	mv	a3,a0
ffffffffc0202d64:	00003617          	auipc	a2,0x3
ffffffffc0202d68:	a2460613          	addi	a2,a2,-1500 # ffffffffc0205788 <default_pmm_manager+0x178>
ffffffffc0202d6c:	0ff00593          	li	a1,255
ffffffffc0202d70:	00003517          	auipc	a0,0x3
ffffffffc0202d74:	a4050513          	addi	a0,a0,-1472 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc0202d78:	b8cfd0ef          	jal	ra,ffffffffc0200104 <__panic>

ffffffffc0202d7c <get_page>:
ffffffffc0202d7c:	1141                	addi	sp,sp,-16
ffffffffc0202d7e:	e022                	sd	s0,0(sp)
ffffffffc0202d80:	8432                	mv	s0,a2
ffffffffc0202d82:	4601                	li	a2,0
ffffffffc0202d84:	e406                	sd	ra,8(sp)
ffffffffc0202d86:	df9ff0ef          	jal	ra,ffffffffc0202b7e <get_pte>
ffffffffc0202d8a:	c011                	beqz	s0,ffffffffc0202d8e <get_page+0x12>
ffffffffc0202d8c:	e008                	sd	a0,0(s0)
ffffffffc0202d8e:	c511                	beqz	a0,ffffffffc0202d9a <get_page+0x1e>
ffffffffc0202d90:	611c                	ld	a5,0(a0)
ffffffffc0202d92:	4501                	li	a0,0
ffffffffc0202d94:	0017f713          	andi	a4,a5,1
ffffffffc0202d98:	e709                	bnez	a4,ffffffffc0202da2 <get_page+0x26>
ffffffffc0202d9a:	60a2                	ld	ra,8(sp)
ffffffffc0202d9c:	6402                	ld	s0,0(sp)
ffffffffc0202d9e:	0141                	addi	sp,sp,16
ffffffffc0202da0:	8082                	ret
ffffffffc0202da2:	0000e717          	auipc	a4,0xe
ffffffffc0202da6:	6ce70713          	addi	a4,a4,1742 # ffffffffc0211470 <npage>
ffffffffc0202daa:	6318                	ld	a4,0(a4)
ffffffffc0202dac:	078a                	slli	a5,a5,0x2
ffffffffc0202dae:	83b1                	srli	a5,a5,0xc
ffffffffc0202db0:	02e7f363          	bgeu	a5,a4,ffffffffc0202dd6 <get_page+0x5a>
ffffffffc0202db4:	fff80537          	lui	a0,0xfff80
ffffffffc0202db8:	97aa                	add	a5,a5,a0
ffffffffc0202dba:	0000e697          	auipc	a3,0xe
ffffffffc0202dbe:	7de68693          	addi	a3,a3,2014 # ffffffffc0211598 <pages>
ffffffffc0202dc2:	6288                	ld	a0,0(a3)
ffffffffc0202dc4:	60a2                	ld	ra,8(sp)
ffffffffc0202dc6:	6402                	ld	s0,0(sp)
ffffffffc0202dc8:	00379713          	slli	a4,a5,0x3
ffffffffc0202dcc:	97ba                	add	a5,a5,a4
ffffffffc0202dce:	078e                	slli	a5,a5,0x3
ffffffffc0202dd0:	953e                	add	a0,a0,a5
ffffffffc0202dd2:	0141                	addi	sp,sp,16
ffffffffc0202dd4:	8082                	ret
ffffffffc0202dd6:	c7fff0ef          	jal	ra,ffffffffc0202a54 <pa2page.part.4>

ffffffffc0202dda <page_remove>:
ffffffffc0202dda:	1141                	addi	sp,sp,-16
ffffffffc0202ddc:	4601                	li	a2,0
ffffffffc0202dde:	e406                	sd	ra,8(sp)
ffffffffc0202de0:	e022                	sd	s0,0(sp)
ffffffffc0202de2:	d9dff0ef          	jal	ra,ffffffffc0202b7e <get_pte>
ffffffffc0202de6:	c511                	beqz	a0,ffffffffc0202df2 <page_remove+0x18>
ffffffffc0202de8:	611c                	ld	a5,0(a0)
ffffffffc0202dea:	842a                	mv	s0,a0
ffffffffc0202dec:	0017f713          	andi	a4,a5,1
ffffffffc0202df0:	e709                	bnez	a4,ffffffffc0202dfa <page_remove+0x20>
ffffffffc0202df2:	60a2                	ld	ra,8(sp)
ffffffffc0202df4:	6402                	ld	s0,0(sp)
ffffffffc0202df6:	0141                	addi	sp,sp,16
ffffffffc0202df8:	8082                	ret
ffffffffc0202dfa:	0000e717          	auipc	a4,0xe
ffffffffc0202dfe:	67670713          	addi	a4,a4,1654 # ffffffffc0211470 <npage>
ffffffffc0202e02:	6318                	ld	a4,0(a4)
ffffffffc0202e04:	078a                	slli	a5,a5,0x2
ffffffffc0202e06:	83b1                	srli	a5,a5,0xc
ffffffffc0202e08:	04e7f063          	bgeu	a5,a4,ffffffffc0202e48 <page_remove+0x6e>
ffffffffc0202e0c:	fff80737          	lui	a4,0xfff80
ffffffffc0202e10:	97ba                	add	a5,a5,a4
ffffffffc0202e12:	0000e717          	auipc	a4,0xe
ffffffffc0202e16:	78670713          	addi	a4,a4,1926 # ffffffffc0211598 <pages>
ffffffffc0202e1a:	6308                	ld	a0,0(a4)
ffffffffc0202e1c:	00379713          	slli	a4,a5,0x3
ffffffffc0202e20:	97ba                	add	a5,a5,a4
ffffffffc0202e22:	078e                	slli	a5,a5,0x3
ffffffffc0202e24:	953e                	add	a0,a0,a5
ffffffffc0202e26:	411c                	lw	a5,0(a0)
ffffffffc0202e28:	fff7871b          	addiw	a4,a5,-1
ffffffffc0202e2c:	c118                	sw	a4,0(a0)
ffffffffc0202e2e:	cb09                	beqz	a4,ffffffffc0202e40 <page_remove+0x66>
ffffffffc0202e30:	00043023          	sd	zero,0(s0)
ffffffffc0202e34:	12000073          	sfence.vma
ffffffffc0202e38:	60a2                	ld	ra,8(sp)
ffffffffc0202e3a:	6402                	ld	s0,0(sp)
ffffffffc0202e3c:	0141                	addi	sp,sp,16
ffffffffc0202e3e:	8082                	ret
ffffffffc0202e40:	4585                	li	a1,1
ffffffffc0202e42:	cb7ff0ef          	jal	ra,ffffffffc0202af8 <free_pages>
ffffffffc0202e46:	b7ed                	j	ffffffffc0202e30 <page_remove+0x56>
ffffffffc0202e48:	c0dff0ef          	jal	ra,ffffffffc0202a54 <pa2page.part.4>

ffffffffc0202e4c <page_insert>:
ffffffffc0202e4c:	7179                	addi	sp,sp,-48
ffffffffc0202e4e:	87b2                	mv	a5,a2
ffffffffc0202e50:	f022                	sd	s0,32(sp)
ffffffffc0202e52:	4605                	li	a2,1
ffffffffc0202e54:	842e                	mv	s0,a1
ffffffffc0202e56:	85be                	mv	a1,a5
ffffffffc0202e58:	ec26                	sd	s1,24(sp)
ffffffffc0202e5a:	f406                	sd	ra,40(sp)
ffffffffc0202e5c:	e84a                	sd	s2,16(sp)
ffffffffc0202e5e:	e44e                	sd	s3,8(sp)
ffffffffc0202e60:	84b6                	mv	s1,a3
ffffffffc0202e62:	d1dff0ef          	jal	ra,ffffffffc0202b7e <get_pte>
ffffffffc0202e66:	c945                	beqz	a0,ffffffffc0202f16 <page_insert+0xca>
ffffffffc0202e68:	4014                	lw	a3,0(s0)
ffffffffc0202e6a:	611c                	ld	a5,0(a0)
ffffffffc0202e6c:	892a                	mv	s2,a0
ffffffffc0202e6e:	0016871b          	addiw	a4,a3,1
ffffffffc0202e72:	c018                	sw	a4,0(s0)
ffffffffc0202e74:	0017f713          	andi	a4,a5,1
ffffffffc0202e78:	e339                	bnez	a4,ffffffffc0202ebe <page_insert+0x72>
ffffffffc0202e7a:	0000e797          	auipc	a5,0xe
ffffffffc0202e7e:	71e78793          	addi	a5,a5,1822 # ffffffffc0211598 <pages>
ffffffffc0202e82:	639c                	ld	a5,0(a5)
ffffffffc0202e84:	00002717          	auipc	a4,0x2
ffffffffc0202e88:	43470713          	addi	a4,a4,1076 # ffffffffc02052b8 <commands+0xf98>
ffffffffc0202e8c:	40f407b3          	sub	a5,s0,a5
ffffffffc0202e90:	6300                	ld	s0,0(a4)
ffffffffc0202e92:	878d                	srai	a5,a5,0x3
ffffffffc0202e94:	000806b7          	lui	a3,0x80
ffffffffc0202e98:	028787b3          	mul	a5,a5,s0
ffffffffc0202e9c:	97b6                	add	a5,a5,a3
ffffffffc0202e9e:	07aa                	slli	a5,a5,0xa
ffffffffc0202ea0:	8fc5                	or	a5,a5,s1
ffffffffc0202ea2:	0017e793          	ori	a5,a5,1
ffffffffc0202ea6:	00f93023          	sd	a5,0(s2)
ffffffffc0202eaa:	12000073          	sfence.vma
ffffffffc0202eae:	4501                	li	a0,0
ffffffffc0202eb0:	70a2                	ld	ra,40(sp)
ffffffffc0202eb2:	7402                	ld	s0,32(sp)
ffffffffc0202eb4:	64e2                	ld	s1,24(sp)
ffffffffc0202eb6:	6942                	ld	s2,16(sp)
ffffffffc0202eb8:	69a2                	ld	s3,8(sp)
ffffffffc0202eba:	6145                	addi	sp,sp,48
ffffffffc0202ebc:	8082                	ret
ffffffffc0202ebe:	0000e717          	auipc	a4,0xe
ffffffffc0202ec2:	5b270713          	addi	a4,a4,1458 # ffffffffc0211470 <npage>
ffffffffc0202ec6:	6318                	ld	a4,0(a4)
ffffffffc0202ec8:	00279513          	slli	a0,a5,0x2
ffffffffc0202ecc:	8131                	srli	a0,a0,0xc
ffffffffc0202ece:	04e57663          	bgeu	a0,a4,ffffffffc0202f1a <page_insert+0xce>
ffffffffc0202ed2:	fff807b7          	lui	a5,0xfff80
ffffffffc0202ed6:	953e                	add	a0,a0,a5
ffffffffc0202ed8:	0000e997          	auipc	s3,0xe
ffffffffc0202edc:	6c098993          	addi	s3,s3,1728 # ffffffffc0211598 <pages>
ffffffffc0202ee0:	0009b783          	ld	a5,0(s3)
ffffffffc0202ee4:	00351713          	slli	a4,a0,0x3
ffffffffc0202ee8:	953a                	add	a0,a0,a4
ffffffffc0202eea:	050e                	slli	a0,a0,0x3
ffffffffc0202eec:	953e                	add	a0,a0,a5
ffffffffc0202eee:	00a40e63          	beq	s0,a0,ffffffffc0202f0a <page_insert+0xbe>
ffffffffc0202ef2:	411c                	lw	a5,0(a0)
ffffffffc0202ef4:	fff7871b          	addiw	a4,a5,-1
ffffffffc0202ef8:	c118                	sw	a4,0(a0)
ffffffffc0202efa:	cb11                	beqz	a4,ffffffffc0202f0e <page_insert+0xc2>
ffffffffc0202efc:	00093023          	sd	zero,0(s2)
ffffffffc0202f00:	12000073          	sfence.vma
ffffffffc0202f04:	0009b783          	ld	a5,0(s3)
ffffffffc0202f08:	bfb5                	j	ffffffffc0202e84 <page_insert+0x38>
ffffffffc0202f0a:	c014                	sw	a3,0(s0)
ffffffffc0202f0c:	bfa5                	j	ffffffffc0202e84 <page_insert+0x38>
ffffffffc0202f0e:	4585                	li	a1,1
ffffffffc0202f10:	be9ff0ef          	jal	ra,ffffffffc0202af8 <free_pages>
ffffffffc0202f14:	b7e5                	j	ffffffffc0202efc <page_insert+0xb0>
ffffffffc0202f16:	5571                	li	a0,-4
ffffffffc0202f18:	bf61                	j	ffffffffc0202eb0 <page_insert+0x64>
ffffffffc0202f1a:	b3bff0ef          	jal	ra,ffffffffc0202a54 <pa2page.part.4>

ffffffffc0202f1e <pmm_init>:
ffffffffc0202f1e:	00002797          	auipc	a5,0x2
ffffffffc0202f22:	6f278793          	addi	a5,a5,1778 # ffffffffc0205610 <default_pmm_manager>
ffffffffc0202f26:	638c                	ld	a1,0(a5)
ffffffffc0202f28:	7139                	addi	sp,sp,-64
ffffffffc0202f2a:	00003517          	auipc	a0,0x3
ffffffffc0202f2e:	8ee50513          	addi	a0,a0,-1810 # ffffffffc0205818 <default_pmm_manager+0x208>
ffffffffc0202f32:	fc06                	sd	ra,56(sp)
ffffffffc0202f34:	0000e717          	auipc	a4,0xe
ffffffffc0202f38:	64f73623          	sd	a5,1612(a4) # ffffffffc0211580 <pmm_manager>
ffffffffc0202f3c:	f822                	sd	s0,48(sp)
ffffffffc0202f3e:	f426                	sd	s1,40(sp)
ffffffffc0202f40:	f04a                	sd	s2,32(sp)
ffffffffc0202f42:	ec4e                	sd	s3,24(sp)
ffffffffc0202f44:	e852                	sd	s4,16(sp)
ffffffffc0202f46:	e456                	sd	s5,8(sp)
ffffffffc0202f48:	e05a                	sd	s6,0(sp)
ffffffffc0202f4a:	0000e417          	auipc	s0,0xe
ffffffffc0202f4e:	63640413          	addi	s0,s0,1590 # ffffffffc0211580 <pmm_manager>
ffffffffc0202f52:	96cfd0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0202f56:	601c                	ld	a5,0(s0)
ffffffffc0202f58:	49c5                	li	s3,17
ffffffffc0202f5a:	40100a13          	li	s4,1025
ffffffffc0202f5e:	679c                	ld	a5,8(a5)
ffffffffc0202f60:	0000e497          	auipc	s1,0xe
ffffffffc0202f64:	51048493          	addi	s1,s1,1296 # ffffffffc0211470 <npage>
ffffffffc0202f68:	0000e917          	auipc	s2,0xe
ffffffffc0202f6c:	63090913          	addi	s2,s2,1584 # ffffffffc0211598 <pages>
ffffffffc0202f70:	9782                	jalr	a5
ffffffffc0202f72:	57f5                	li	a5,-3
ffffffffc0202f74:	07fa                	slli	a5,a5,0x1e
ffffffffc0202f76:	07e006b7          	lui	a3,0x7e00
ffffffffc0202f7a:	01b99613          	slli	a2,s3,0x1b
ffffffffc0202f7e:	015a1593          	slli	a1,s4,0x15
ffffffffc0202f82:	00003517          	auipc	a0,0x3
ffffffffc0202f86:	8ae50513          	addi	a0,a0,-1874 # ffffffffc0205830 <default_pmm_manager+0x220>
ffffffffc0202f8a:	0000e717          	auipc	a4,0xe
ffffffffc0202f8e:	5ef73f23          	sd	a5,1534(a4) # ffffffffc0211588 <va_pa_offset>
ffffffffc0202f92:	92cfd0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0202f96:	00003517          	auipc	a0,0x3
ffffffffc0202f9a:	8ca50513          	addi	a0,a0,-1846 # ffffffffc0205860 <default_pmm_manager+0x250>
ffffffffc0202f9e:	920fd0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0202fa2:	01b99693          	slli	a3,s3,0x1b
ffffffffc0202fa6:	16fd                	addi	a3,a3,-1
ffffffffc0202fa8:	015a1613          	slli	a2,s4,0x15
ffffffffc0202fac:	07e005b7          	lui	a1,0x7e00
ffffffffc0202fb0:	00003517          	auipc	a0,0x3
ffffffffc0202fb4:	8c850513          	addi	a0,a0,-1848 # ffffffffc0205878 <default_pmm_manager+0x268>
ffffffffc0202fb8:	906fd0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0202fbc:	777d                	lui	a4,0xfffff
ffffffffc0202fbe:	0000f797          	auipc	a5,0xf
ffffffffc0202fc2:	5e178793          	addi	a5,a5,1505 # ffffffffc021259f <end+0xfff>
ffffffffc0202fc6:	8ff9                	and	a5,a5,a4
ffffffffc0202fc8:	00088737          	lui	a4,0x88
ffffffffc0202fcc:	0000e697          	auipc	a3,0xe
ffffffffc0202fd0:	4ae6b223          	sd	a4,1188(a3) # ffffffffc0211470 <npage>
ffffffffc0202fd4:	0000e717          	auipc	a4,0xe
ffffffffc0202fd8:	5cf73223          	sd	a5,1476(a4) # ffffffffc0211598 <pages>
ffffffffc0202fdc:	4681                	li	a3,0
ffffffffc0202fde:	4701                	li	a4,0
ffffffffc0202fe0:	4585                	li	a1,1
ffffffffc0202fe2:	fff80637          	lui	a2,0xfff80
ffffffffc0202fe6:	a019                	j	ffffffffc0202fec <pmm_init+0xce>
ffffffffc0202fe8:	00093783          	ld	a5,0(s2)
ffffffffc0202fec:	97b6                	add	a5,a5,a3
ffffffffc0202fee:	07a1                	addi	a5,a5,8
ffffffffc0202ff0:	40b7b02f          	amoor.d	zero,a1,(a5)
ffffffffc0202ff4:	609c                	ld	a5,0(s1)
ffffffffc0202ff6:	0705                	addi	a4,a4,1
ffffffffc0202ff8:	04868693          	addi	a3,a3,72
ffffffffc0202ffc:	00c78533          	add	a0,a5,a2
ffffffffc0203000:	fea764e3          	bltu	a4,a0,ffffffffc0202fe8 <pmm_init+0xca>
ffffffffc0203004:	00093503          	ld	a0,0(s2)
ffffffffc0203008:	00379693          	slli	a3,a5,0x3
ffffffffc020300c:	96be                	add	a3,a3,a5
ffffffffc020300e:	fdc00737          	lui	a4,0xfdc00
ffffffffc0203012:	972a                	add	a4,a4,a0
ffffffffc0203014:	068e                	slli	a3,a3,0x3
ffffffffc0203016:	96ba                	add	a3,a3,a4
ffffffffc0203018:	c0200737          	lui	a4,0xc0200
ffffffffc020301c:	7ae6ea63          	bltu	a3,a4,ffffffffc02037d0 <pmm_init+0x8b2>
ffffffffc0203020:	0000e997          	auipc	s3,0xe
ffffffffc0203024:	56898993          	addi	s3,s3,1384 # ffffffffc0211588 <va_pa_offset>
ffffffffc0203028:	0009b703          	ld	a4,0(s3)
ffffffffc020302c:	45c5                	li	a1,17
ffffffffc020302e:	05ee                	slli	a1,a1,0x1b
ffffffffc0203030:	8e99                	sub	a3,a3,a4
ffffffffc0203032:	36b6e563          	bltu	a3,a1,ffffffffc020339c <pmm_init+0x47e>
ffffffffc0203036:	601c                	ld	a5,0(s0)
ffffffffc0203038:	0000e417          	auipc	s0,0xe
ffffffffc020303c:	43040413          	addi	s0,s0,1072 # ffffffffc0211468 <boot_pgdir>
ffffffffc0203040:	7b9c                	ld	a5,48(a5)
ffffffffc0203042:	9782                	jalr	a5
ffffffffc0203044:	00003517          	auipc	a0,0x3
ffffffffc0203048:	88450513          	addi	a0,a0,-1916 # ffffffffc02058c8 <default_pmm_manager+0x2b8>
ffffffffc020304c:	872fd0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0203050:	00006517          	auipc	a0,0x6
ffffffffc0203054:	fb050513          	addi	a0,a0,-80 # ffffffffc0209000 <boot_page_table_sv39>
ffffffffc0203058:	0000e797          	auipc	a5,0xe
ffffffffc020305c:	40a7b823          	sd	a0,1040(a5) # ffffffffc0211468 <boot_pgdir>
ffffffffc0203060:	c02007b7          	lui	a5,0xc0200
ffffffffc0203064:	7cf56263          	bltu	a0,a5,ffffffffc0203828 <pmm_init+0x90a>
ffffffffc0203068:	0009b783          	ld	a5,0(s3)
ffffffffc020306c:	6098                	ld	a4,0(s1)
ffffffffc020306e:	40f507b3          	sub	a5,a0,a5
ffffffffc0203072:	0000e697          	auipc	a3,0xe
ffffffffc0203076:	50f6bf23          	sd	a5,1310(a3) # ffffffffc0211590 <boot_cr3>
ffffffffc020307a:	c80007b7          	lui	a5,0xc8000
ffffffffc020307e:	83b1                	srli	a5,a5,0xc
ffffffffc0203080:	78e7e463          	bltu	a5,a4,ffffffffc0203808 <pmm_init+0x8ea>
ffffffffc0203084:	03451793          	slli	a5,a0,0x34
ffffffffc0203088:	3a079e63          	bnez	a5,ffffffffc0203444 <pmm_init+0x526>
ffffffffc020308c:	4601                	li	a2,0
ffffffffc020308e:	4581                	li	a1,0
ffffffffc0203090:	cedff0ef          	jal	ra,ffffffffc0202d7c <get_page>
ffffffffc0203094:	74051a63          	bnez	a0,ffffffffc02037e8 <pmm_init+0x8ca>
ffffffffc0203098:	4505                	li	a0,1
ffffffffc020309a:	9d7ff0ef          	jal	ra,ffffffffc0202a70 <alloc_pages>
ffffffffc020309e:	8a2a                	mv	s4,a0
ffffffffc02030a0:	6008                	ld	a0,0(s0)
ffffffffc02030a2:	4681                	li	a3,0
ffffffffc02030a4:	4601                	li	a2,0
ffffffffc02030a6:	85d2                	mv	a1,s4
ffffffffc02030a8:	da5ff0ef          	jal	ra,ffffffffc0202e4c <page_insert>
ffffffffc02030ac:	3c051c63          	bnez	a0,ffffffffc0203484 <pmm_init+0x566>
ffffffffc02030b0:	6008                	ld	a0,0(s0)
ffffffffc02030b2:	4601                	li	a2,0
ffffffffc02030b4:	4581                	li	a1,0
ffffffffc02030b6:	ac9ff0ef          	jal	ra,ffffffffc0202b7e <get_pte>
ffffffffc02030ba:	3a050563          	beqz	a0,ffffffffc0203464 <pmm_init+0x546>
ffffffffc02030be:	611c                	ld	a5,0(a0)
ffffffffc02030c0:	0017f713          	andi	a4,a5,1
ffffffffc02030c4:	36070463          	beqz	a4,ffffffffc020342c <pmm_init+0x50e>
ffffffffc02030c8:	6090                	ld	a2,0(s1)
ffffffffc02030ca:	078a                	slli	a5,a5,0x2
ffffffffc02030cc:	83b1                	srli	a5,a5,0xc
ffffffffc02030ce:	34c7fd63          	bgeu	a5,a2,ffffffffc0203428 <pmm_init+0x50a>
ffffffffc02030d2:	fff80737          	lui	a4,0xfff80
ffffffffc02030d6:	97ba                	add	a5,a5,a4
ffffffffc02030d8:	00379713          	slli	a4,a5,0x3
ffffffffc02030dc:	00093683          	ld	a3,0(s2)
ffffffffc02030e0:	97ba                	add	a5,a5,a4
ffffffffc02030e2:	078e                	slli	a5,a5,0x3
ffffffffc02030e4:	97b6                	add	a5,a5,a3
ffffffffc02030e6:	4cfa1963          	bne	s4,a5,ffffffffc02035b8 <pmm_init+0x69a>
ffffffffc02030ea:	000a2703          	lw	a4,0(s4) # 80000 <BASE_ADDRESS-0xffffffffc0180000>
ffffffffc02030ee:	4785                	li	a5,1
ffffffffc02030f0:	4af71463          	bne	a4,a5,ffffffffc0203598 <pmm_init+0x67a>
ffffffffc02030f4:	6008                	ld	a0,0(s0)
ffffffffc02030f6:	76fd                	lui	a3,0xfffff
ffffffffc02030f8:	611c                	ld	a5,0(a0)
ffffffffc02030fa:	078a                	slli	a5,a5,0x2
ffffffffc02030fc:	8ff5                	and	a5,a5,a3
ffffffffc02030fe:	00c7d713          	srli	a4,a5,0xc
ffffffffc0203102:	46c77e63          	bgeu	a4,a2,ffffffffc020357e <pmm_init+0x660>
ffffffffc0203106:	0009bb03          	ld	s6,0(s3)
ffffffffc020310a:	97da                	add	a5,a5,s6
ffffffffc020310c:	0007ba83          	ld	s5,0(a5) # ffffffffc8000000 <end+0x7deea60>
ffffffffc0203110:	0a8a                	slli	s5,s5,0x2
ffffffffc0203112:	00dafab3          	and	s5,s5,a3
ffffffffc0203116:	00cad793          	srli	a5,s5,0xc
ffffffffc020311a:	44c7f563          	bgeu	a5,a2,ffffffffc0203564 <pmm_init+0x646>
ffffffffc020311e:	4601                	li	a2,0
ffffffffc0203120:	6585                	lui	a1,0x1
ffffffffc0203122:	9ada                	add	s5,s5,s6
ffffffffc0203124:	a5bff0ef          	jal	ra,ffffffffc0202b7e <get_pte>
ffffffffc0203128:	0aa1                	addi	s5,s5,8
ffffffffc020312a:	41551d63          	bne	a0,s5,ffffffffc0203544 <pmm_init+0x626>
ffffffffc020312e:	4505                	li	a0,1
ffffffffc0203130:	941ff0ef          	jal	ra,ffffffffc0202a70 <alloc_pages>
ffffffffc0203134:	8aaa                	mv	s5,a0
ffffffffc0203136:	6008                	ld	a0,0(s0)
ffffffffc0203138:	46d1                	li	a3,20
ffffffffc020313a:	6605                	lui	a2,0x1
ffffffffc020313c:	85d6                	mv	a1,s5
ffffffffc020313e:	d0fff0ef          	jal	ra,ffffffffc0202e4c <page_insert>
ffffffffc0203142:	3e051163          	bnez	a0,ffffffffc0203524 <pmm_init+0x606>
ffffffffc0203146:	6008                	ld	a0,0(s0)
ffffffffc0203148:	4601                	li	a2,0
ffffffffc020314a:	6585                	lui	a1,0x1
ffffffffc020314c:	a33ff0ef          	jal	ra,ffffffffc0202b7e <get_pte>
ffffffffc0203150:	3a050a63          	beqz	a0,ffffffffc0203504 <pmm_init+0x5e6>
ffffffffc0203154:	611c                	ld	a5,0(a0)
ffffffffc0203156:	0107f713          	andi	a4,a5,16
ffffffffc020315a:	38070563          	beqz	a4,ffffffffc02034e4 <pmm_init+0x5c6>
ffffffffc020315e:	8b91                	andi	a5,a5,4
ffffffffc0203160:	36078263          	beqz	a5,ffffffffc02034c4 <pmm_init+0x5a6>
ffffffffc0203164:	6008                	ld	a0,0(s0)
ffffffffc0203166:	611c                	ld	a5,0(a0)
ffffffffc0203168:	8bc1                	andi	a5,a5,16
ffffffffc020316a:	32078d63          	beqz	a5,ffffffffc02034a4 <pmm_init+0x586>
ffffffffc020316e:	000aa703          	lw	a4,0(s5)
ffffffffc0203172:	4785                	li	a5,1
ffffffffc0203174:	50f71263          	bne	a4,a5,ffffffffc0203678 <pmm_init+0x75a>
ffffffffc0203178:	4681                	li	a3,0
ffffffffc020317a:	6605                	lui	a2,0x1
ffffffffc020317c:	85d2                	mv	a1,s4
ffffffffc020317e:	ccfff0ef          	jal	ra,ffffffffc0202e4c <page_insert>
ffffffffc0203182:	4c051b63          	bnez	a0,ffffffffc0203658 <pmm_init+0x73a>
ffffffffc0203186:	000a2703          	lw	a4,0(s4)
ffffffffc020318a:	4789                	li	a5,2
ffffffffc020318c:	4af71663          	bne	a4,a5,ffffffffc0203638 <pmm_init+0x71a>
ffffffffc0203190:	000aa783          	lw	a5,0(s5)
ffffffffc0203194:	48079263          	bnez	a5,ffffffffc0203618 <pmm_init+0x6fa>
ffffffffc0203198:	6008                	ld	a0,0(s0)
ffffffffc020319a:	4601                	li	a2,0
ffffffffc020319c:	6585                	lui	a1,0x1
ffffffffc020319e:	9e1ff0ef          	jal	ra,ffffffffc0202b7e <get_pte>
ffffffffc02031a2:	44050b63          	beqz	a0,ffffffffc02035f8 <pmm_init+0x6da>
ffffffffc02031a6:	6114                	ld	a3,0(a0)
ffffffffc02031a8:	0016f793          	andi	a5,a3,1
ffffffffc02031ac:	28078063          	beqz	a5,ffffffffc020342c <pmm_init+0x50e>
ffffffffc02031b0:	6098                	ld	a4,0(s1)
ffffffffc02031b2:	00269793          	slli	a5,a3,0x2
ffffffffc02031b6:	83b1                	srli	a5,a5,0xc
ffffffffc02031b8:	26e7f863          	bgeu	a5,a4,ffffffffc0203428 <pmm_init+0x50a>
ffffffffc02031bc:	fff80737          	lui	a4,0xfff80
ffffffffc02031c0:	97ba                	add	a5,a5,a4
ffffffffc02031c2:	00379713          	slli	a4,a5,0x3
ffffffffc02031c6:	00093603          	ld	a2,0(s2)
ffffffffc02031ca:	97ba                	add	a5,a5,a4
ffffffffc02031cc:	078e                	slli	a5,a5,0x3
ffffffffc02031ce:	97b2                	add	a5,a5,a2
ffffffffc02031d0:	40fa1463          	bne	s4,a5,ffffffffc02035d8 <pmm_init+0x6ba>
ffffffffc02031d4:	8ac1                	andi	a3,a3,16
ffffffffc02031d6:	5c069d63          	bnez	a3,ffffffffc02037b0 <pmm_init+0x892>
ffffffffc02031da:	6008                	ld	a0,0(s0)
ffffffffc02031dc:	4581                	li	a1,0
ffffffffc02031de:	bfdff0ef          	jal	ra,ffffffffc0202dda <page_remove>
ffffffffc02031e2:	000a2703          	lw	a4,0(s4)
ffffffffc02031e6:	4785                	li	a5,1
ffffffffc02031e8:	5af71463          	bne	a4,a5,ffffffffc0203790 <pmm_init+0x872>
ffffffffc02031ec:	000aa783          	lw	a5,0(s5)
ffffffffc02031f0:	4c079463          	bnez	a5,ffffffffc02036b8 <pmm_init+0x79a>
ffffffffc02031f4:	6008                	ld	a0,0(s0)
ffffffffc02031f6:	6585                	lui	a1,0x1
ffffffffc02031f8:	be3ff0ef          	jal	ra,ffffffffc0202dda <page_remove>
ffffffffc02031fc:	000a2783          	lw	a5,0(s4)
ffffffffc0203200:	48079c63          	bnez	a5,ffffffffc0203698 <pmm_init+0x77a>
ffffffffc0203204:	000aa783          	lw	a5,0(s5)
ffffffffc0203208:	64079d63          	bnez	a5,ffffffffc0203862 <pmm_init+0x944>
ffffffffc020320c:	601c                	ld	a5,0(s0)
ffffffffc020320e:	6098                	ld	a4,0(s1)
ffffffffc0203210:	639c                	ld	a5,0(a5)
ffffffffc0203212:	078a                	slli	a5,a5,0x2
ffffffffc0203214:	83b1                	srli	a5,a5,0xc
ffffffffc0203216:	20e7f963          	bgeu	a5,a4,ffffffffc0203428 <pmm_init+0x50a>
ffffffffc020321a:	fff80537          	lui	a0,0xfff80
ffffffffc020321e:	97aa                	add	a5,a5,a0
ffffffffc0203220:	00379713          	slli	a4,a5,0x3
ffffffffc0203224:	00093503          	ld	a0,0(s2)
ffffffffc0203228:	97ba                	add	a5,a5,a4
ffffffffc020322a:	078e                	slli	a5,a5,0x3
ffffffffc020322c:	953e                	add	a0,a0,a5
ffffffffc020322e:	4118                	lw	a4,0(a0)
ffffffffc0203230:	4785                	li	a5,1
ffffffffc0203232:	60f71863          	bne	a4,a5,ffffffffc0203842 <pmm_init+0x924>
ffffffffc0203236:	4585                	li	a1,1
ffffffffc0203238:	8c1ff0ef          	jal	ra,ffffffffc0202af8 <free_pages>
ffffffffc020323c:	601c                	ld	a5,0(s0)
ffffffffc020323e:	00003517          	auipc	a0,0x3
ffffffffc0203242:	95250513          	addi	a0,a0,-1710 # ffffffffc0205b90 <default_pmm_manager+0x580>
ffffffffc0203246:	0007b023          	sd	zero,0(a5)
ffffffffc020324a:	e75fc0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc020324e:	6098                	ld	a4,0(s1)
ffffffffc0203250:	c02007b7          	lui	a5,0xc0200
ffffffffc0203254:	00c71693          	slli	a3,a4,0xc
ffffffffc0203258:	16d7f963          	bgeu	a5,a3,ffffffffc02033ca <pmm_init+0x4ac>
ffffffffc020325c:	83b1                	srli	a5,a5,0xc
ffffffffc020325e:	6008                	ld	a0,0(s0)
ffffffffc0203260:	c0200a37          	lui	s4,0xc0200
ffffffffc0203264:	1ae7f563          	bgeu	a5,a4,ffffffffc020340e <pmm_init+0x4f0>
ffffffffc0203268:	7b7d                	lui	s6,0xfffff
ffffffffc020326a:	6a85                	lui	s5,0x1
ffffffffc020326c:	a029                	j	ffffffffc0203276 <pmm_init+0x358>
ffffffffc020326e:	00ca5713          	srli	a4,s4,0xc
ffffffffc0203272:	18f77e63          	bgeu	a4,a5,ffffffffc020340e <pmm_init+0x4f0>
ffffffffc0203276:	0009b583          	ld	a1,0(s3)
ffffffffc020327a:	4601                	li	a2,0
ffffffffc020327c:	95d2                	add	a1,a1,s4
ffffffffc020327e:	901ff0ef          	jal	ra,ffffffffc0202b7e <get_pte>
ffffffffc0203282:	16050663          	beqz	a0,ffffffffc02033ee <pmm_init+0x4d0>
ffffffffc0203286:	611c                	ld	a5,0(a0)
ffffffffc0203288:	078a                	slli	a5,a5,0x2
ffffffffc020328a:	0167f7b3          	and	a5,a5,s6
ffffffffc020328e:	15479063          	bne	a5,s4,ffffffffc02033ce <pmm_init+0x4b0>
ffffffffc0203292:	609c                	ld	a5,0(s1)
ffffffffc0203294:	9a56                	add	s4,s4,s5
ffffffffc0203296:	6008                	ld	a0,0(s0)
ffffffffc0203298:	00c79713          	slli	a4,a5,0xc
ffffffffc020329c:	fcea69e3          	bltu	s4,a4,ffffffffc020326e <pmm_init+0x350>
ffffffffc02032a0:	611c                	ld	a5,0(a0)
ffffffffc02032a2:	48079763          	bnez	a5,ffffffffc0203730 <pmm_init+0x812>
ffffffffc02032a6:	4505                	li	a0,1
ffffffffc02032a8:	fc8ff0ef          	jal	ra,ffffffffc0202a70 <alloc_pages>
ffffffffc02032ac:	8a2a                	mv	s4,a0
ffffffffc02032ae:	6008                	ld	a0,0(s0)
ffffffffc02032b0:	4699                	li	a3,6
ffffffffc02032b2:	10000613          	li	a2,256
ffffffffc02032b6:	85d2                	mv	a1,s4
ffffffffc02032b8:	b95ff0ef          	jal	ra,ffffffffc0202e4c <page_insert>
ffffffffc02032bc:	44051a63          	bnez	a0,ffffffffc0203710 <pmm_init+0x7f2>
ffffffffc02032c0:	000a2703          	lw	a4,0(s4) # ffffffffc0200000 <kern_entry>
ffffffffc02032c4:	4785                	li	a5,1
ffffffffc02032c6:	5cf71e63          	bne	a4,a5,ffffffffc02038a2 <pmm_init+0x984>
ffffffffc02032ca:	6008                	ld	a0,0(s0)
ffffffffc02032cc:	6a85                	lui	s5,0x1
ffffffffc02032ce:	4699                	li	a3,6
ffffffffc02032d0:	100a8613          	addi	a2,s5,256 # 1100 <BASE_ADDRESS-0xffffffffc01fef00>
ffffffffc02032d4:	85d2                	mv	a1,s4
ffffffffc02032d6:	b77ff0ef          	jal	ra,ffffffffc0202e4c <page_insert>
ffffffffc02032da:	5a051463          	bnez	a0,ffffffffc0203882 <pmm_init+0x964>
ffffffffc02032de:	000a2703          	lw	a4,0(s4)
ffffffffc02032e2:	4789                	li	a5,2
ffffffffc02032e4:	48f71663          	bne	a4,a5,ffffffffc0203770 <pmm_init+0x852>
ffffffffc02032e8:	00003597          	auipc	a1,0x3
ffffffffc02032ec:	9e058593          	addi	a1,a1,-1568 # ffffffffc0205cc8 <default_pmm_manager+0x6b8>
ffffffffc02032f0:	10000513          	li	a0,256
ffffffffc02032f4:	1b1000ef          	jal	ra,ffffffffc0203ca4 <strcpy>
ffffffffc02032f8:	100a8593          	addi	a1,s5,256
ffffffffc02032fc:	10000513          	li	a0,256
ffffffffc0203300:	1b7000ef          	jal	ra,ffffffffc0203cb6 <strcmp>
ffffffffc0203304:	44051663          	bnez	a0,ffffffffc0203750 <pmm_init+0x832>
ffffffffc0203308:	00093683          	ld	a3,0(s2)
ffffffffc020330c:	00002797          	auipc	a5,0x2
ffffffffc0203310:	fac78793          	addi	a5,a5,-84 # ffffffffc02052b8 <commands+0xf98>
ffffffffc0203314:	639c                	ld	a5,0(a5)
ffffffffc0203316:	40da06b3          	sub	a3,s4,a3
ffffffffc020331a:	868d                	srai	a3,a3,0x3
ffffffffc020331c:	02f686b3          	mul	a3,a3,a5
ffffffffc0203320:	00080ab7          	lui	s5,0x80
ffffffffc0203324:	6098                	ld	a4,0(s1)
ffffffffc0203326:	96d6                	add	a3,a3,s5
ffffffffc0203328:	00c69793          	slli	a5,a3,0xc
ffffffffc020332c:	83b1                	srli	a5,a5,0xc
ffffffffc020332e:	06b2                	slli	a3,a3,0xc
ffffffffc0203330:	3ce7f463          	bgeu	a5,a4,ffffffffc02036f8 <pmm_init+0x7da>
ffffffffc0203334:	0009b783          	ld	a5,0(s3)
ffffffffc0203338:	10000513          	li	a0,256
ffffffffc020333c:	96be                	add	a3,a3,a5
ffffffffc020333e:	10068023          	sb	zero,256(a3) # fffffffffffff100 <end+0x3fdedb60>
ffffffffc0203342:	11f000ef          	jal	ra,ffffffffc0203c60 <strlen>
ffffffffc0203346:	38051963          	bnez	a0,ffffffffc02036d8 <pmm_init+0x7ba>
ffffffffc020334a:	4585                	li	a1,1
ffffffffc020334c:	8552                	mv	a0,s4
ffffffffc020334e:	faaff0ef          	jal	ra,ffffffffc0202af8 <free_pages>
ffffffffc0203352:	601c                	ld	a5,0(s0)
ffffffffc0203354:	6098                	ld	a4,0(s1)
ffffffffc0203356:	639c                	ld	a5,0(a5)
ffffffffc0203358:	078a                	slli	a5,a5,0x2
ffffffffc020335a:	83b1                	srli	a5,a5,0xc
ffffffffc020335c:	0ce7f663          	bgeu	a5,a4,ffffffffc0203428 <pmm_init+0x50a>
ffffffffc0203360:	415787b3          	sub	a5,a5,s5
ffffffffc0203364:	00093503          	ld	a0,0(s2)
ffffffffc0203368:	00379713          	slli	a4,a5,0x3
ffffffffc020336c:	97ba                	add	a5,a5,a4
ffffffffc020336e:	078e                	slli	a5,a5,0x3
ffffffffc0203370:	953e                	add	a0,a0,a5
ffffffffc0203372:	4585                	li	a1,1
ffffffffc0203374:	f84ff0ef          	jal	ra,ffffffffc0202af8 <free_pages>
ffffffffc0203378:	601c                	ld	a5,0(s0)
ffffffffc020337a:	7442                	ld	s0,48(sp)
ffffffffc020337c:	70e2                	ld	ra,56(sp)
ffffffffc020337e:	74a2                	ld	s1,40(sp)
ffffffffc0203380:	7902                	ld	s2,32(sp)
ffffffffc0203382:	69e2                	ld	s3,24(sp)
ffffffffc0203384:	6a42                	ld	s4,16(sp)
ffffffffc0203386:	6aa2                	ld	s5,8(sp)
ffffffffc0203388:	6b02                	ld	s6,0(sp)
ffffffffc020338a:	0007b023          	sd	zero,0(a5)
ffffffffc020338e:	00003517          	auipc	a0,0x3
ffffffffc0203392:	9b250513          	addi	a0,a0,-1614 # ffffffffc0205d40 <default_pmm_manager+0x730>
ffffffffc0203396:	6121                	addi	sp,sp,64
ffffffffc0203398:	d27fc06f          	j	ffffffffc02000be <cprintf>
ffffffffc020339c:	6705                	lui	a4,0x1
ffffffffc020339e:	177d                	addi	a4,a4,-1
ffffffffc02033a0:	96ba                	add	a3,a3,a4
ffffffffc02033a2:	00c6d713          	srli	a4,a3,0xc
ffffffffc02033a6:	08f77163          	bgeu	a4,a5,ffffffffc0203428 <pmm_init+0x50a>
ffffffffc02033aa:	00043803          	ld	a6,0(s0)
ffffffffc02033ae:	9732                	add	a4,a4,a2
ffffffffc02033b0:	00371793          	slli	a5,a4,0x3
ffffffffc02033b4:	767d                	lui	a2,0xfffff
ffffffffc02033b6:	8ef1                	and	a3,a3,a2
ffffffffc02033b8:	97ba                	add	a5,a5,a4
ffffffffc02033ba:	01083703          	ld	a4,16(a6)
ffffffffc02033be:	8d95                	sub	a1,a1,a3
ffffffffc02033c0:	078e                	slli	a5,a5,0x3
ffffffffc02033c2:	81b1                	srli	a1,a1,0xc
ffffffffc02033c4:	953e                	add	a0,a0,a5
ffffffffc02033c6:	9702                	jalr	a4
ffffffffc02033c8:	b1bd                	j	ffffffffc0203036 <pmm_init+0x118>
ffffffffc02033ca:	6008                	ld	a0,0(s0)
ffffffffc02033cc:	bdd1                	j	ffffffffc02032a0 <pmm_init+0x382>
ffffffffc02033ce:	00003697          	auipc	a3,0x3
ffffffffc02033d2:	82268693          	addi	a3,a3,-2014 # ffffffffc0205bf0 <default_pmm_manager+0x5e0>
ffffffffc02033d6:	00001617          	auipc	a2,0x1
ffffffffc02033da:	7a260613          	addi	a2,a2,1954 # ffffffffc0204b78 <commands+0x858>
ffffffffc02033de:	1c100593          	li	a1,449
ffffffffc02033e2:	00002517          	auipc	a0,0x2
ffffffffc02033e6:	3ce50513          	addi	a0,a0,974 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc02033ea:	d1bfc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02033ee:	00002697          	auipc	a3,0x2
ffffffffc02033f2:	7c268693          	addi	a3,a3,1986 # ffffffffc0205bb0 <default_pmm_manager+0x5a0>
ffffffffc02033f6:	00001617          	auipc	a2,0x1
ffffffffc02033fa:	78260613          	addi	a2,a2,1922 # ffffffffc0204b78 <commands+0x858>
ffffffffc02033fe:	1c000593          	li	a1,448
ffffffffc0203402:	00002517          	auipc	a0,0x2
ffffffffc0203406:	3ae50513          	addi	a0,a0,942 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc020340a:	cfbfc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc020340e:	86d2                	mv	a3,s4
ffffffffc0203410:	00002617          	auipc	a2,0x2
ffffffffc0203414:	37860613          	addi	a2,a2,888 # ffffffffc0205788 <default_pmm_manager+0x178>
ffffffffc0203418:	1c000593          	li	a1,448
ffffffffc020341c:	00002517          	auipc	a0,0x2
ffffffffc0203420:	39450513          	addi	a0,a0,916 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc0203424:	ce1fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0203428:	e2cff0ef          	jal	ra,ffffffffc0202a54 <pa2page.part.4>
ffffffffc020342c:	00002617          	auipc	a2,0x2
ffffffffc0203430:	d2c60613          	addi	a2,a2,-724 # ffffffffc0205158 <commands+0xe38>
ffffffffc0203434:	07000593          	li	a1,112
ffffffffc0203438:	00002517          	auipc	a0,0x2
ffffffffc020343c:	a5850513          	addi	a0,a0,-1448 # ffffffffc0204e90 <commands+0xb70>
ffffffffc0203440:	cc5fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0203444:	00002697          	auipc	a3,0x2
ffffffffc0203448:	4c468693          	addi	a3,a3,1220 # ffffffffc0205908 <default_pmm_manager+0x2f8>
ffffffffc020344c:	00001617          	auipc	a2,0x1
ffffffffc0203450:	72c60613          	addi	a2,a2,1836 # ffffffffc0204b78 <commands+0x858>
ffffffffc0203454:	18f00593          	li	a1,399
ffffffffc0203458:	00002517          	auipc	a0,0x2
ffffffffc020345c:	35850513          	addi	a0,a0,856 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc0203460:	ca5fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0203464:	00002697          	auipc	a3,0x2
ffffffffc0203468:	53468693          	addi	a3,a3,1332 # ffffffffc0205998 <default_pmm_manager+0x388>
ffffffffc020346c:	00001617          	auipc	a2,0x1
ffffffffc0203470:	70c60613          	addi	a2,a2,1804 # ffffffffc0204b78 <commands+0x858>
ffffffffc0203474:	19600593          	li	a1,406
ffffffffc0203478:	00002517          	auipc	a0,0x2
ffffffffc020347c:	33850513          	addi	a0,a0,824 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc0203480:	c85fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0203484:	00002697          	auipc	a3,0x2
ffffffffc0203488:	4e468693          	addi	a3,a3,1252 # ffffffffc0205968 <default_pmm_manager+0x358>
ffffffffc020348c:	00001617          	auipc	a2,0x1
ffffffffc0203490:	6ec60613          	addi	a2,a2,1772 # ffffffffc0204b78 <commands+0x858>
ffffffffc0203494:	19400593          	li	a1,404
ffffffffc0203498:	00002517          	auipc	a0,0x2
ffffffffc020349c:	31850513          	addi	a0,a0,792 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc02034a0:	c65fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02034a4:	00002697          	auipc	a3,0x2
ffffffffc02034a8:	60468693          	addi	a3,a3,1540 # ffffffffc0205aa8 <default_pmm_manager+0x498>
ffffffffc02034ac:	00001617          	auipc	a2,0x1
ffffffffc02034b0:	6cc60613          	addi	a2,a2,1740 # ffffffffc0204b78 <commands+0x858>
ffffffffc02034b4:	1a300593          	li	a1,419
ffffffffc02034b8:	00002517          	auipc	a0,0x2
ffffffffc02034bc:	2f850513          	addi	a0,a0,760 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc02034c0:	c45fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02034c4:	00002697          	auipc	a3,0x2
ffffffffc02034c8:	5d468693          	addi	a3,a3,1492 # ffffffffc0205a98 <default_pmm_manager+0x488>
ffffffffc02034cc:	00001617          	auipc	a2,0x1
ffffffffc02034d0:	6ac60613          	addi	a2,a2,1708 # ffffffffc0204b78 <commands+0x858>
ffffffffc02034d4:	1a200593          	li	a1,418
ffffffffc02034d8:	00002517          	auipc	a0,0x2
ffffffffc02034dc:	2d850513          	addi	a0,a0,728 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc02034e0:	c25fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02034e4:	00002697          	auipc	a3,0x2
ffffffffc02034e8:	5a468693          	addi	a3,a3,1444 # ffffffffc0205a88 <default_pmm_manager+0x478>
ffffffffc02034ec:	00001617          	auipc	a2,0x1
ffffffffc02034f0:	68c60613          	addi	a2,a2,1676 # ffffffffc0204b78 <commands+0x858>
ffffffffc02034f4:	1a100593          	li	a1,417
ffffffffc02034f8:	00002517          	auipc	a0,0x2
ffffffffc02034fc:	2b850513          	addi	a0,a0,696 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc0203500:	c05fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0203504:	00002697          	auipc	a3,0x2
ffffffffc0203508:	55468693          	addi	a3,a3,1364 # ffffffffc0205a58 <default_pmm_manager+0x448>
ffffffffc020350c:	00001617          	auipc	a2,0x1
ffffffffc0203510:	66c60613          	addi	a2,a2,1644 # ffffffffc0204b78 <commands+0x858>
ffffffffc0203514:	1a000593          	li	a1,416
ffffffffc0203518:	00002517          	auipc	a0,0x2
ffffffffc020351c:	29850513          	addi	a0,a0,664 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc0203520:	be5fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0203524:	00002697          	auipc	a3,0x2
ffffffffc0203528:	4fc68693          	addi	a3,a3,1276 # ffffffffc0205a20 <default_pmm_manager+0x410>
ffffffffc020352c:	00001617          	auipc	a2,0x1
ffffffffc0203530:	64c60613          	addi	a2,a2,1612 # ffffffffc0204b78 <commands+0x858>
ffffffffc0203534:	19f00593          	li	a1,415
ffffffffc0203538:	00002517          	auipc	a0,0x2
ffffffffc020353c:	27850513          	addi	a0,a0,632 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc0203540:	bc5fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0203544:	00002697          	auipc	a3,0x2
ffffffffc0203548:	4b468693          	addi	a3,a3,1204 # ffffffffc02059f8 <default_pmm_manager+0x3e8>
ffffffffc020354c:	00001617          	auipc	a2,0x1
ffffffffc0203550:	62c60613          	addi	a2,a2,1580 # ffffffffc0204b78 <commands+0x858>
ffffffffc0203554:	19c00593          	li	a1,412
ffffffffc0203558:	00002517          	auipc	a0,0x2
ffffffffc020355c:	25850513          	addi	a0,a0,600 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc0203560:	ba5fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0203564:	86d6                	mv	a3,s5
ffffffffc0203566:	00002617          	auipc	a2,0x2
ffffffffc020356a:	22260613          	addi	a2,a2,546 # ffffffffc0205788 <default_pmm_manager+0x178>
ffffffffc020356e:	19b00593          	li	a1,411
ffffffffc0203572:	00002517          	auipc	a0,0x2
ffffffffc0203576:	23e50513          	addi	a0,a0,574 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc020357a:	b8bfc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc020357e:	86be                	mv	a3,a5
ffffffffc0203580:	00002617          	auipc	a2,0x2
ffffffffc0203584:	20860613          	addi	a2,a2,520 # ffffffffc0205788 <default_pmm_manager+0x178>
ffffffffc0203588:	19a00593          	li	a1,410
ffffffffc020358c:	00002517          	auipc	a0,0x2
ffffffffc0203590:	22450513          	addi	a0,a0,548 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc0203594:	b71fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0203598:	00002697          	auipc	a3,0x2
ffffffffc020359c:	44868693          	addi	a3,a3,1096 # ffffffffc02059e0 <default_pmm_manager+0x3d0>
ffffffffc02035a0:	00001617          	auipc	a2,0x1
ffffffffc02035a4:	5d860613          	addi	a2,a2,1496 # ffffffffc0204b78 <commands+0x858>
ffffffffc02035a8:	19800593          	li	a1,408
ffffffffc02035ac:	00002517          	auipc	a0,0x2
ffffffffc02035b0:	20450513          	addi	a0,a0,516 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc02035b4:	b51fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02035b8:	00002697          	auipc	a3,0x2
ffffffffc02035bc:	41068693          	addi	a3,a3,1040 # ffffffffc02059c8 <default_pmm_manager+0x3b8>
ffffffffc02035c0:	00001617          	auipc	a2,0x1
ffffffffc02035c4:	5b860613          	addi	a2,a2,1464 # ffffffffc0204b78 <commands+0x858>
ffffffffc02035c8:	19700593          	li	a1,407
ffffffffc02035cc:	00002517          	auipc	a0,0x2
ffffffffc02035d0:	1e450513          	addi	a0,a0,484 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc02035d4:	b31fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02035d8:	00002697          	auipc	a3,0x2
ffffffffc02035dc:	3f068693          	addi	a3,a3,1008 # ffffffffc02059c8 <default_pmm_manager+0x3b8>
ffffffffc02035e0:	00001617          	auipc	a2,0x1
ffffffffc02035e4:	59860613          	addi	a2,a2,1432 # ffffffffc0204b78 <commands+0x858>
ffffffffc02035e8:	1aa00593          	li	a1,426
ffffffffc02035ec:	00002517          	auipc	a0,0x2
ffffffffc02035f0:	1c450513          	addi	a0,a0,452 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc02035f4:	b11fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02035f8:	00002697          	auipc	a3,0x2
ffffffffc02035fc:	46068693          	addi	a3,a3,1120 # ffffffffc0205a58 <default_pmm_manager+0x448>
ffffffffc0203600:	00001617          	auipc	a2,0x1
ffffffffc0203604:	57860613          	addi	a2,a2,1400 # ffffffffc0204b78 <commands+0x858>
ffffffffc0203608:	1a900593          	li	a1,425
ffffffffc020360c:	00002517          	auipc	a0,0x2
ffffffffc0203610:	1a450513          	addi	a0,a0,420 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc0203614:	af1fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0203618:	00002697          	auipc	a3,0x2
ffffffffc020361c:	50868693          	addi	a3,a3,1288 # ffffffffc0205b20 <default_pmm_manager+0x510>
ffffffffc0203620:	00001617          	auipc	a2,0x1
ffffffffc0203624:	55860613          	addi	a2,a2,1368 # ffffffffc0204b78 <commands+0x858>
ffffffffc0203628:	1a800593          	li	a1,424
ffffffffc020362c:	00002517          	auipc	a0,0x2
ffffffffc0203630:	18450513          	addi	a0,a0,388 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc0203634:	ad1fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0203638:	00002697          	auipc	a3,0x2
ffffffffc020363c:	4d068693          	addi	a3,a3,1232 # ffffffffc0205b08 <default_pmm_manager+0x4f8>
ffffffffc0203640:	00001617          	auipc	a2,0x1
ffffffffc0203644:	53860613          	addi	a2,a2,1336 # ffffffffc0204b78 <commands+0x858>
ffffffffc0203648:	1a700593          	li	a1,423
ffffffffc020364c:	00002517          	auipc	a0,0x2
ffffffffc0203650:	16450513          	addi	a0,a0,356 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc0203654:	ab1fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0203658:	00002697          	auipc	a3,0x2
ffffffffc020365c:	48068693          	addi	a3,a3,1152 # ffffffffc0205ad8 <default_pmm_manager+0x4c8>
ffffffffc0203660:	00001617          	auipc	a2,0x1
ffffffffc0203664:	51860613          	addi	a2,a2,1304 # ffffffffc0204b78 <commands+0x858>
ffffffffc0203668:	1a600593          	li	a1,422
ffffffffc020366c:	00002517          	auipc	a0,0x2
ffffffffc0203670:	14450513          	addi	a0,a0,324 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc0203674:	a91fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0203678:	00002697          	auipc	a3,0x2
ffffffffc020367c:	44868693          	addi	a3,a3,1096 # ffffffffc0205ac0 <default_pmm_manager+0x4b0>
ffffffffc0203680:	00001617          	auipc	a2,0x1
ffffffffc0203684:	4f860613          	addi	a2,a2,1272 # ffffffffc0204b78 <commands+0x858>
ffffffffc0203688:	1a400593          	li	a1,420
ffffffffc020368c:	00002517          	auipc	a0,0x2
ffffffffc0203690:	12450513          	addi	a0,a0,292 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc0203694:	a71fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0203698:	00002697          	auipc	a3,0x2
ffffffffc020369c:	4b868693          	addi	a3,a3,1208 # ffffffffc0205b50 <default_pmm_manager+0x540>
ffffffffc02036a0:	00001617          	auipc	a2,0x1
ffffffffc02036a4:	4d860613          	addi	a2,a2,1240 # ffffffffc0204b78 <commands+0x858>
ffffffffc02036a8:	1b200593          	li	a1,434
ffffffffc02036ac:	00002517          	auipc	a0,0x2
ffffffffc02036b0:	10450513          	addi	a0,a0,260 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc02036b4:	a51fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02036b8:	00002697          	auipc	a3,0x2
ffffffffc02036bc:	46868693          	addi	a3,a3,1128 # ffffffffc0205b20 <default_pmm_manager+0x510>
ffffffffc02036c0:	00001617          	auipc	a2,0x1
ffffffffc02036c4:	4b860613          	addi	a2,a2,1208 # ffffffffc0204b78 <commands+0x858>
ffffffffc02036c8:	1af00593          	li	a1,431
ffffffffc02036cc:	00002517          	auipc	a0,0x2
ffffffffc02036d0:	0e450513          	addi	a0,a0,228 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc02036d4:	a31fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02036d8:	00002697          	auipc	a3,0x2
ffffffffc02036dc:	64068693          	addi	a3,a3,1600 # ffffffffc0205d18 <default_pmm_manager+0x708>
ffffffffc02036e0:	00001617          	auipc	a2,0x1
ffffffffc02036e4:	49860613          	addi	a2,a2,1176 # ffffffffc0204b78 <commands+0x858>
ffffffffc02036e8:	1d300593          	li	a1,467
ffffffffc02036ec:	00002517          	auipc	a0,0x2
ffffffffc02036f0:	0c450513          	addi	a0,a0,196 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc02036f4:	a11fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02036f8:	00002617          	auipc	a2,0x2
ffffffffc02036fc:	09060613          	addi	a2,a2,144 # ffffffffc0205788 <default_pmm_manager+0x178>
ffffffffc0203700:	06a00593          	li	a1,106
ffffffffc0203704:	00001517          	auipc	a0,0x1
ffffffffc0203708:	78c50513          	addi	a0,a0,1932 # ffffffffc0204e90 <commands+0xb70>
ffffffffc020370c:	9f9fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0203710:	00002697          	auipc	a3,0x2
ffffffffc0203714:	51068693          	addi	a3,a3,1296 # ffffffffc0205c20 <default_pmm_manager+0x610>
ffffffffc0203718:	00001617          	auipc	a2,0x1
ffffffffc020371c:	46060613          	addi	a2,a2,1120 # ffffffffc0204b78 <commands+0x858>
ffffffffc0203720:	1c900593          	li	a1,457
ffffffffc0203724:	00002517          	auipc	a0,0x2
ffffffffc0203728:	08c50513          	addi	a0,a0,140 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc020372c:	9d9fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0203730:	00002697          	auipc	a3,0x2
ffffffffc0203734:	4d868693          	addi	a3,a3,1240 # ffffffffc0205c08 <default_pmm_manager+0x5f8>
ffffffffc0203738:	00001617          	auipc	a2,0x1
ffffffffc020373c:	44060613          	addi	a2,a2,1088 # ffffffffc0204b78 <commands+0x858>
ffffffffc0203740:	1c500593          	li	a1,453
ffffffffc0203744:	00002517          	auipc	a0,0x2
ffffffffc0203748:	06c50513          	addi	a0,a0,108 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc020374c:	9b9fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0203750:	00002697          	auipc	a3,0x2
ffffffffc0203754:	59068693          	addi	a3,a3,1424 # ffffffffc0205ce0 <default_pmm_manager+0x6d0>
ffffffffc0203758:	00001617          	auipc	a2,0x1
ffffffffc020375c:	42060613          	addi	a2,a2,1056 # ffffffffc0204b78 <commands+0x858>
ffffffffc0203760:	1d000593          	li	a1,464
ffffffffc0203764:	00002517          	auipc	a0,0x2
ffffffffc0203768:	04c50513          	addi	a0,a0,76 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc020376c:	999fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0203770:	00002697          	auipc	a3,0x2
ffffffffc0203774:	54068693          	addi	a3,a3,1344 # ffffffffc0205cb0 <default_pmm_manager+0x6a0>
ffffffffc0203778:	00001617          	auipc	a2,0x1
ffffffffc020377c:	40060613          	addi	a2,a2,1024 # ffffffffc0204b78 <commands+0x858>
ffffffffc0203780:	1cc00593          	li	a1,460
ffffffffc0203784:	00002517          	auipc	a0,0x2
ffffffffc0203788:	02c50513          	addi	a0,a0,44 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc020378c:	979fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0203790:	00002697          	auipc	a3,0x2
ffffffffc0203794:	25068693          	addi	a3,a3,592 # ffffffffc02059e0 <default_pmm_manager+0x3d0>
ffffffffc0203798:	00001617          	auipc	a2,0x1
ffffffffc020379c:	3e060613          	addi	a2,a2,992 # ffffffffc0204b78 <commands+0x858>
ffffffffc02037a0:	1ae00593          	li	a1,430
ffffffffc02037a4:	00002517          	auipc	a0,0x2
ffffffffc02037a8:	00c50513          	addi	a0,a0,12 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc02037ac:	959fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02037b0:	00002697          	auipc	a3,0x2
ffffffffc02037b4:	38868693          	addi	a3,a3,904 # ffffffffc0205b38 <default_pmm_manager+0x528>
ffffffffc02037b8:	00001617          	auipc	a2,0x1
ffffffffc02037bc:	3c060613          	addi	a2,a2,960 # ffffffffc0204b78 <commands+0x858>
ffffffffc02037c0:	1ab00593          	li	a1,427
ffffffffc02037c4:	00002517          	auipc	a0,0x2
ffffffffc02037c8:	fec50513          	addi	a0,a0,-20 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc02037cc:	939fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02037d0:	00002617          	auipc	a2,0x2
ffffffffc02037d4:	0d060613          	addi	a2,a2,208 # ffffffffc02058a0 <default_pmm_manager+0x290>
ffffffffc02037d8:	07700593          	li	a1,119
ffffffffc02037dc:	00002517          	auipc	a0,0x2
ffffffffc02037e0:	fd450513          	addi	a0,a0,-44 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc02037e4:	921fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02037e8:	00002697          	auipc	a3,0x2
ffffffffc02037ec:	15868693          	addi	a3,a3,344 # ffffffffc0205940 <default_pmm_manager+0x330>
ffffffffc02037f0:	00001617          	auipc	a2,0x1
ffffffffc02037f4:	38860613          	addi	a2,a2,904 # ffffffffc0204b78 <commands+0x858>
ffffffffc02037f8:	19000593          	li	a1,400
ffffffffc02037fc:	00002517          	auipc	a0,0x2
ffffffffc0203800:	fb450513          	addi	a0,a0,-76 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc0203804:	901fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0203808:	00002697          	auipc	a3,0x2
ffffffffc020380c:	0e068693          	addi	a3,a3,224 # ffffffffc02058e8 <default_pmm_manager+0x2d8>
ffffffffc0203810:	00001617          	auipc	a2,0x1
ffffffffc0203814:	36860613          	addi	a2,a2,872 # ffffffffc0204b78 <commands+0x858>
ffffffffc0203818:	18e00593          	li	a1,398
ffffffffc020381c:	00002517          	auipc	a0,0x2
ffffffffc0203820:	f9450513          	addi	a0,a0,-108 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc0203824:	8e1fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0203828:	86aa                	mv	a3,a0
ffffffffc020382a:	00002617          	auipc	a2,0x2
ffffffffc020382e:	07660613          	addi	a2,a2,118 # ffffffffc02058a0 <default_pmm_manager+0x290>
ffffffffc0203832:	0bd00593          	li	a1,189
ffffffffc0203836:	00002517          	auipc	a0,0x2
ffffffffc020383a:	f7a50513          	addi	a0,a0,-134 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc020383e:	8c7fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0203842:	00002697          	auipc	a3,0x2
ffffffffc0203846:	32668693          	addi	a3,a3,806 # ffffffffc0205b68 <default_pmm_manager+0x558>
ffffffffc020384a:	00001617          	auipc	a2,0x1
ffffffffc020384e:	32e60613          	addi	a2,a2,814 # ffffffffc0204b78 <commands+0x858>
ffffffffc0203852:	1b500593          	li	a1,437
ffffffffc0203856:	00002517          	auipc	a0,0x2
ffffffffc020385a:	f5a50513          	addi	a0,a0,-166 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc020385e:	8a7fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0203862:	00002697          	auipc	a3,0x2
ffffffffc0203866:	2be68693          	addi	a3,a3,702 # ffffffffc0205b20 <default_pmm_manager+0x510>
ffffffffc020386a:	00001617          	auipc	a2,0x1
ffffffffc020386e:	30e60613          	addi	a2,a2,782 # ffffffffc0204b78 <commands+0x858>
ffffffffc0203872:	1b300593          	li	a1,435
ffffffffc0203876:	00002517          	auipc	a0,0x2
ffffffffc020387a:	f3a50513          	addi	a0,a0,-198 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc020387e:	887fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0203882:	00002697          	auipc	a3,0x2
ffffffffc0203886:	3ee68693          	addi	a3,a3,1006 # ffffffffc0205c70 <default_pmm_manager+0x660>
ffffffffc020388a:	00001617          	auipc	a2,0x1
ffffffffc020388e:	2ee60613          	addi	a2,a2,750 # ffffffffc0204b78 <commands+0x858>
ffffffffc0203892:	1cb00593          	li	a1,459
ffffffffc0203896:	00002517          	auipc	a0,0x2
ffffffffc020389a:	f1a50513          	addi	a0,a0,-230 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc020389e:	867fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02038a2:	00002697          	auipc	a3,0x2
ffffffffc02038a6:	3b668693          	addi	a3,a3,950 # ffffffffc0205c58 <default_pmm_manager+0x648>
ffffffffc02038aa:	00001617          	auipc	a2,0x1
ffffffffc02038ae:	2ce60613          	addi	a2,a2,718 # ffffffffc0204b78 <commands+0x858>
ffffffffc02038b2:	1ca00593          	li	a1,458
ffffffffc02038b6:	00002517          	auipc	a0,0x2
ffffffffc02038ba:	efa50513          	addi	a0,a0,-262 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc02038be:	847fc0ef          	jal	ra,ffffffffc0200104 <__panic>

ffffffffc02038c2 <tlb_invalidate>:
ffffffffc02038c2:	12000073          	sfence.vma
ffffffffc02038c6:	8082                	ret

ffffffffc02038c8 <pgdir_alloc_page>:
ffffffffc02038c8:	7179                	addi	sp,sp,-48
ffffffffc02038ca:	e84a                	sd	s2,16(sp)
ffffffffc02038cc:	892a                	mv	s2,a0
ffffffffc02038ce:	4505                	li	a0,1
ffffffffc02038d0:	f022                	sd	s0,32(sp)
ffffffffc02038d2:	ec26                	sd	s1,24(sp)
ffffffffc02038d4:	e44e                	sd	s3,8(sp)
ffffffffc02038d6:	f406                	sd	ra,40(sp)
ffffffffc02038d8:	84ae                	mv	s1,a1
ffffffffc02038da:	89b2                	mv	s3,a2
ffffffffc02038dc:	994ff0ef          	jal	ra,ffffffffc0202a70 <alloc_pages>
ffffffffc02038e0:	842a                	mv	s0,a0
ffffffffc02038e2:	cd19                	beqz	a0,ffffffffc0203900 <pgdir_alloc_page+0x38>
ffffffffc02038e4:	85aa                	mv	a1,a0
ffffffffc02038e6:	86ce                	mv	a3,s3
ffffffffc02038e8:	8626                	mv	a2,s1
ffffffffc02038ea:	854a                	mv	a0,s2
ffffffffc02038ec:	d60ff0ef          	jal	ra,ffffffffc0202e4c <page_insert>
ffffffffc02038f0:	ed39                	bnez	a0,ffffffffc020394e <pgdir_alloc_page+0x86>
ffffffffc02038f2:	0000e797          	auipc	a5,0xe
ffffffffc02038f6:	b6e78793          	addi	a5,a5,-1170 # ffffffffc0211460 <swap_init_ok>
ffffffffc02038fa:	439c                	lw	a5,0(a5)
ffffffffc02038fc:	2781                	sext.w	a5,a5
ffffffffc02038fe:	eb89                	bnez	a5,ffffffffc0203910 <pgdir_alloc_page+0x48>
ffffffffc0203900:	8522                	mv	a0,s0
ffffffffc0203902:	70a2                	ld	ra,40(sp)
ffffffffc0203904:	7402                	ld	s0,32(sp)
ffffffffc0203906:	64e2                	ld	s1,24(sp)
ffffffffc0203908:	6942                	ld	s2,16(sp)
ffffffffc020390a:	69a2                	ld	s3,8(sp)
ffffffffc020390c:	6145                	addi	sp,sp,48
ffffffffc020390e:	8082                	ret
ffffffffc0203910:	0000e797          	auipc	a5,0xe
ffffffffc0203914:	b7078793          	addi	a5,a5,-1168 # ffffffffc0211480 <check_mm_struct>
ffffffffc0203918:	6388                	ld	a0,0(a5)
ffffffffc020391a:	4681                	li	a3,0
ffffffffc020391c:	8622                	mv	a2,s0
ffffffffc020391e:	85a6                	mv	a1,s1
ffffffffc0203920:	832fe0ef          	jal	ra,ffffffffc0201952 <swap_map_swappable>
ffffffffc0203924:	4018                	lw	a4,0(s0)
ffffffffc0203926:	e024                	sd	s1,64(s0)
ffffffffc0203928:	4785                	li	a5,1
ffffffffc020392a:	fcf70be3          	beq	a4,a5,ffffffffc0203900 <pgdir_alloc_page+0x38>
ffffffffc020392e:	00002697          	auipc	a3,0x2
ffffffffc0203932:	ed268693          	addi	a3,a3,-302 # ffffffffc0205800 <default_pmm_manager+0x1f0>
ffffffffc0203936:	00001617          	auipc	a2,0x1
ffffffffc020393a:	24260613          	addi	a2,a2,578 # ffffffffc0204b78 <commands+0x858>
ffffffffc020393e:	17a00593          	li	a1,378
ffffffffc0203942:	00002517          	auipc	a0,0x2
ffffffffc0203946:	e6e50513          	addi	a0,a0,-402 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc020394a:	fbafc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc020394e:	8522                	mv	a0,s0
ffffffffc0203950:	4585                	li	a1,1
ffffffffc0203952:	9a6ff0ef          	jal	ra,ffffffffc0202af8 <free_pages>
ffffffffc0203956:	4401                	li	s0,0
ffffffffc0203958:	b765                	j	ffffffffc0203900 <pgdir_alloc_page+0x38>

ffffffffc020395a <kmalloc>:
ffffffffc020395a:	1141                	addi	sp,sp,-16
ffffffffc020395c:	67d5                	lui	a5,0x15
ffffffffc020395e:	e406                	sd	ra,8(sp)
ffffffffc0203960:	fff50713          	addi	a4,a0,-1
ffffffffc0203964:	17f9                	addi	a5,a5,-2
ffffffffc0203966:	04e7ee63          	bltu	a5,a4,ffffffffc02039c2 <kmalloc+0x68>
ffffffffc020396a:	6785                	lui	a5,0x1
ffffffffc020396c:	17fd                	addi	a5,a5,-1
ffffffffc020396e:	953e                	add	a0,a0,a5
ffffffffc0203970:	8131                	srli	a0,a0,0xc
ffffffffc0203972:	8feff0ef          	jal	ra,ffffffffc0202a70 <alloc_pages>
ffffffffc0203976:	c159                	beqz	a0,ffffffffc02039fc <kmalloc+0xa2>
ffffffffc0203978:	0000e797          	auipc	a5,0xe
ffffffffc020397c:	c2078793          	addi	a5,a5,-992 # ffffffffc0211598 <pages>
ffffffffc0203980:	639c                	ld	a5,0(a5)
ffffffffc0203982:	8d1d                	sub	a0,a0,a5
ffffffffc0203984:	00002797          	auipc	a5,0x2
ffffffffc0203988:	93478793          	addi	a5,a5,-1740 # ffffffffc02052b8 <commands+0xf98>
ffffffffc020398c:	6394                	ld	a3,0(a5)
ffffffffc020398e:	850d                	srai	a0,a0,0x3
ffffffffc0203990:	0000e797          	auipc	a5,0xe
ffffffffc0203994:	ae078793          	addi	a5,a5,-1312 # ffffffffc0211470 <npage>
ffffffffc0203998:	02d50533          	mul	a0,a0,a3
ffffffffc020399c:	000806b7          	lui	a3,0x80
ffffffffc02039a0:	6398                	ld	a4,0(a5)
ffffffffc02039a2:	9536                	add	a0,a0,a3
ffffffffc02039a4:	00c51793          	slli	a5,a0,0xc
ffffffffc02039a8:	83b1                	srli	a5,a5,0xc
ffffffffc02039aa:	0532                	slli	a0,a0,0xc
ffffffffc02039ac:	02e7fb63          	bgeu	a5,a4,ffffffffc02039e2 <kmalloc+0x88>
ffffffffc02039b0:	0000e797          	auipc	a5,0xe
ffffffffc02039b4:	bd878793          	addi	a5,a5,-1064 # ffffffffc0211588 <va_pa_offset>
ffffffffc02039b8:	639c                	ld	a5,0(a5)
ffffffffc02039ba:	60a2                	ld	ra,8(sp)
ffffffffc02039bc:	953e                	add	a0,a0,a5
ffffffffc02039be:	0141                	addi	sp,sp,16
ffffffffc02039c0:	8082                	ret
ffffffffc02039c2:	00002697          	auipc	a3,0x2
ffffffffc02039c6:	e0e68693          	addi	a3,a3,-498 # ffffffffc02057d0 <default_pmm_manager+0x1c0>
ffffffffc02039ca:	00001617          	auipc	a2,0x1
ffffffffc02039ce:	1ae60613          	addi	a2,a2,430 # ffffffffc0204b78 <commands+0x858>
ffffffffc02039d2:	1df00593          	li	a1,479
ffffffffc02039d6:	00002517          	auipc	a0,0x2
ffffffffc02039da:	dda50513          	addi	a0,a0,-550 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc02039de:	f26fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02039e2:	86aa                	mv	a3,a0
ffffffffc02039e4:	00002617          	auipc	a2,0x2
ffffffffc02039e8:	da460613          	addi	a2,a2,-604 # ffffffffc0205788 <default_pmm_manager+0x178>
ffffffffc02039ec:	06a00593          	li	a1,106
ffffffffc02039f0:	00001517          	auipc	a0,0x1
ffffffffc02039f4:	4a050513          	addi	a0,a0,1184 # ffffffffc0204e90 <commands+0xb70>
ffffffffc02039f8:	f0cfc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc02039fc:	00002697          	auipc	a3,0x2
ffffffffc0203a00:	df468693          	addi	a3,a3,-524 # ffffffffc02057f0 <default_pmm_manager+0x1e0>
ffffffffc0203a04:	00001617          	auipc	a2,0x1
ffffffffc0203a08:	17460613          	addi	a2,a2,372 # ffffffffc0204b78 <commands+0x858>
ffffffffc0203a0c:	1e200593          	li	a1,482
ffffffffc0203a10:	00002517          	auipc	a0,0x2
ffffffffc0203a14:	da050513          	addi	a0,a0,-608 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc0203a18:	eecfc0ef          	jal	ra,ffffffffc0200104 <__panic>

ffffffffc0203a1c <kfree>:
ffffffffc0203a1c:	1141                	addi	sp,sp,-16
ffffffffc0203a1e:	67d5                	lui	a5,0x15
ffffffffc0203a20:	e406                	sd	ra,8(sp)
ffffffffc0203a22:	fff58713          	addi	a4,a1,-1
ffffffffc0203a26:	17f9                	addi	a5,a5,-2
ffffffffc0203a28:	04e7eb63          	bltu	a5,a4,ffffffffc0203a7e <kfree+0x62>
ffffffffc0203a2c:	c941                	beqz	a0,ffffffffc0203abc <kfree+0xa0>
ffffffffc0203a2e:	6785                	lui	a5,0x1
ffffffffc0203a30:	17fd                	addi	a5,a5,-1
ffffffffc0203a32:	95be                	add	a1,a1,a5
ffffffffc0203a34:	c02007b7          	lui	a5,0xc0200
ffffffffc0203a38:	81b1                	srli	a1,a1,0xc
ffffffffc0203a3a:	06f56463          	bltu	a0,a5,ffffffffc0203aa2 <kfree+0x86>
ffffffffc0203a3e:	0000e797          	auipc	a5,0xe
ffffffffc0203a42:	b4a78793          	addi	a5,a5,-1206 # ffffffffc0211588 <va_pa_offset>
ffffffffc0203a46:	639c                	ld	a5,0(a5)
ffffffffc0203a48:	0000e717          	auipc	a4,0xe
ffffffffc0203a4c:	a2870713          	addi	a4,a4,-1496 # ffffffffc0211470 <npage>
ffffffffc0203a50:	6318                	ld	a4,0(a4)
ffffffffc0203a52:	40f507b3          	sub	a5,a0,a5
ffffffffc0203a56:	83b1                	srli	a5,a5,0xc
ffffffffc0203a58:	04e7f363          	bgeu	a5,a4,ffffffffc0203a9e <kfree+0x82>
ffffffffc0203a5c:	fff80537          	lui	a0,0xfff80
ffffffffc0203a60:	97aa                	add	a5,a5,a0
ffffffffc0203a62:	0000e697          	auipc	a3,0xe
ffffffffc0203a66:	b3668693          	addi	a3,a3,-1226 # ffffffffc0211598 <pages>
ffffffffc0203a6a:	6288                	ld	a0,0(a3)
ffffffffc0203a6c:	00379713          	slli	a4,a5,0x3
ffffffffc0203a70:	60a2                	ld	ra,8(sp)
ffffffffc0203a72:	97ba                	add	a5,a5,a4
ffffffffc0203a74:	078e                	slli	a5,a5,0x3
ffffffffc0203a76:	953e                	add	a0,a0,a5
ffffffffc0203a78:	0141                	addi	sp,sp,16
ffffffffc0203a7a:	87eff06f          	j	ffffffffc0202af8 <free_pages>
ffffffffc0203a7e:	00002697          	auipc	a3,0x2
ffffffffc0203a82:	d5268693          	addi	a3,a3,-686 # ffffffffc02057d0 <default_pmm_manager+0x1c0>
ffffffffc0203a86:	00001617          	auipc	a2,0x1
ffffffffc0203a8a:	0f260613          	addi	a2,a2,242 # ffffffffc0204b78 <commands+0x858>
ffffffffc0203a8e:	1e800593          	li	a1,488
ffffffffc0203a92:	00002517          	auipc	a0,0x2
ffffffffc0203a96:	d1e50513          	addi	a0,a0,-738 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc0203a9a:	e6afc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0203a9e:	fb7fe0ef          	jal	ra,ffffffffc0202a54 <pa2page.part.4>
ffffffffc0203aa2:	86aa                	mv	a3,a0
ffffffffc0203aa4:	00002617          	auipc	a2,0x2
ffffffffc0203aa8:	dfc60613          	addi	a2,a2,-516 # ffffffffc02058a0 <default_pmm_manager+0x290>
ffffffffc0203aac:	06c00593          	li	a1,108
ffffffffc0203ab0:	00001517          	auipc	a0,0x1
ffffffffc0203ab4:	3e050513          	addi	a0,a0,992 # ffffffffc0204e90 <commands+0xb70>
ffffffffc0203ab8:	e4cfc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0203abc:	00002697          	auipc	a3,0x2
ffffffffc0203ac0:	d0468693          	addi	a3,a3,-764 # ffffffffc02057c0 <default_pmm_manager+0x1b0>
ffffffffc0203ac4:	00001617          	auipc	a2,0x1
ffffffffc0203ac8:	0b460613          	addi	a2,a2,180 # ffffffffc0204b78 <commands+0x858>
ffffffffc0203acc:	1e900593          	li	a1,489
ffffffffc0203ad0:	00002517          	auipc	a0,0x2
ffffffffc0203ad4:	ce050513          	addi	a0,a0,-800 # ffffffffc02057b0 <default_pmm_manager+0x1a0>
ffffffffc0203ad8:	e2cfc0ef          	jal	ra,ffffffffc0200104 <__panic>

ffffffffc0203adc <swapfs_init>:
ffffffffc0203adc:	1141                	addi	sp,sp,-16
ffffffffc0203ade:	4505                	li	a0,1
ffffffffc0203ae0:	e406                	sd	ra,8(sp)
ffffffffc0203ae2:	8f1fc0ef          	jal	ra,ffffffffc02003d2 <ide_device_valid>
ffffffffc0203ae6:	cd01                	beqz	a0,ffffffffc0203afe <swapfs_init+0x22>
ffffffffc0203ae8:	4505                	li	a0,1
ffffffffc0203aea:	8effc0ef          	jal	ra,ffffffffc02003d8 <ide_device_size>
ffffffffc0203aee:	60a2                	ld	ra,8(sp)
ffffffffc0203af0:	810d                	srli	a0,a0,0x3
ffffffffc0203af2:	0000e797          	auipc	a5,0xe
ffffffffc0203af6:	a2a7b723          	sd	a0,-1490(a5) # ffffffffc0211520 <max_swap_offset>
ffffffffc0203afa:	0141                	addi	sp,sp,16
ffffffffc0203afc:	8082                	ret
ffffffffc0203afe:	00002617          	auipc	a2,0x2
ffffffffc0203b02:	26260613          	addi	a2,a2,610 # ffffffffc0205d60 <default_pmm_manager+0x750>
ffffffffc0203b06:	45b5                	li	a1,13
ffffffffc0203b08:	00002517          	auipc	a0,0x2
ffffffffc0203b0c:	27850513          	addi	a0,a0,632 # ffffffffc0205d80 <default_pmm_manager+0x770>
ffffffffc0203b10:	df4fc0ef          	jal	ra,ffffffffc0200104 <__panic>

ffffffffc0203b14 <swapfs_read>:
ffffffffc0203b14:	1141                	addi	sp,sp,-16
ffffffffc0203b16:	e406                	sd	ra,8(sp)
ffffffffc0203b18:	00855793          	srli	a5,a0,0x8
ffffffffc0203b1c:	c7b5                	beqz	a5,ffffffffc0203b88 <swapfs_read+0x74>
ffffffffc0203b1e:	0000e717          	auipc	a4,0xe
ffffffffc0203b22:	a0270713          	addi	a4,a4,-1534 # ffffffffc0211520 <max_swap_offset>
ffffffffc0203b26:	6318                	ld	a4,0(a4)
ffffffffc0203b28:	06e7f063          	bgeu	a5,a4,ffffffffc0203b88 <swapfs_read+0x74>
ffffffffc0203b2c:	0000e717          	auipc	a4,0xe
ffffffffc0203b30:	a6c70713          	addi	a4,a4,-1428 # ffffffffc0211598 <pages>
ffffffffc0203b34:	6310                	ld	a2,0(a4)
ffffffffc0203b36:	00001717          	auipc	a4,0x1
ffffffffc0203b3a:	78270713          	addi	a4,a4,1922 # ffffffffc02052b8 <commands+0xf98>
ffffffffc0203b3e:	00002697          	auipc	a3,0x2
ffffffffc0203b42:	4c268693          	addi	a3,a3,1218 # ffffffffc0206000 <nbase>
ffffffffc0203b46:	40c58633          	sub	a2,a1,a2
ffffffffc0203b4a:	630c                	ld	a1,0(a4)
ffffffffc0203b4c:	860d                	srai	a2,a2,0x3
ffffffffc0203b4e:	0000e717          	auipc	a4,0xe
ffffffffc0203b52:	92270713          	addi	a4,a4,-1758 # ffffffffc0211470 <npage>
ffffffffc0203b56:	02b60633          	mul	a2,a2,a1
ffffffffc0203b5a:	0037959b          	slliw	a1,a5,0x3
ffffffffc0203b5e:	629c                	ld	a5,0(a3)
ffffffffc0203b60:	6318                	ld	a4,0(a4)
ffffffffc0203b62:	963e                	add	a2,a2,a5
ffffffffc0203b64:	00c61793          	slli	a5,a2,0xc
ffffffffc0203b68:	83b1                	srli	a5,a5,0xc
ffffffffc0203b6a:	0632                	slli	a2,a2,0xc
ffffffffc0203b6c:	02e7fa63          	bgeu	a5,a4,ffffffffc0203ba0 <swapfs_read+0x8c>
ffffffffc0203b70:	0000e797          	auipc	a5,0xe
ffffffffc0203b74:	a1878793          	addi	a5,a5,-1512 # ffffffffc0211588 <va_pa_offset>
ffffffffc0203b78:	639c                	ld	a5,0(a5)
ffffffffc0203b7a:	60a2                	ld	ra,8(sp)
ffffffffc0203b7c:	46a1                	li	a3,8
ffffffffc0203b7e:	963e                	add	a2,a2,a5
ffffffffc0203b80:	4505                	li	a0,1
ffffffffc0203b82:	0141                	addi	sp,sp,16
ffffffffc0203b84:	85bfc06f          	j	ffffffffc02003de <ide_read_secs>
ffffffffc0203b88:	86aa                	mv	a3,a0
ffffffffc0203b8a:	00002617          	auipc	a2,0x2
ffffffffc0203b8e:	20e60613          	addi	a2,a2,526 # ffffffffc0205d98 <default_pmm_manager+0x788>
ffffffffc0203b92:	45d1                	li	a1,20
ffffffffc0203b94:	00002517          	auipc	a0,0x2
ffffffffc0203b98:	1ec50513          	addi	a0,a0,492 # ffffffffc0205d80 <default_pmm_manager+0x770>
ffffffffc0203b9c:	d68fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0203ba0:	86b2                	mv	a3,a2
ffffffffc0203ba2:	06a00593          	li	a1,106
ffffffffc0203ba6:	00002617          	auipc	a2,0x2
ffffffffc0203baa:	be260613          	addi	a2,a2,-1054 # ffffffffc0205788 <default_pmm_manager+0x178>
ffffffffc0203bae:	00001517          	auipc	a0,0x1
ffffffffc0203bb2:	2e250513          	addi	a0,a0,738 # ffffffffc0204e90 <commands+0xb70>
ffffffffc0203bb6:	d4efc0ef          	jal	ra,ffffffffc0200104 <__panic>

ffffffffc0203bba <swapfs_write>:
ffffffffc0203bba:	1141                	addi	sp,sp,-16
ffffffffc0203bbc:	e406                	sd	ra,8(sp)
ffffffffc0203bbe:	00855793          	srli	a5,a0,0x8
ffffffffc0203bc2:	c7b5                	beqz	a5,ffffffffc0203c2e <swapfs_write+0x74>
ffffffffc0203bc4:	0000e717          	auipc	a4,0xe
ffffffffc0203bc8:	95c70713          	addi	a4,a4,-1700 # ffffffffc0211520 <max_swap_offset>
ffffffffc0203bcc:	6318                	ld	a4,0(a4)
ffffffffc0203bce:	06e7f063          	bgeu	a5,a4,ffffffffc0203c2e <swapfs_write+0x74>
ffffffffc0203bd2:	0000e717          	auipc	a4,0xe
ffffffffc0203bd6:	9c670713          	addi	a4,a4,-1594 # ffffffffc0211598 <pages>
ffffffffc0203bda:	6310                	ld	a2,0(a4)
ffffffffc0203bdc:	00001717          	auipc	a4,0x1
ffffffffc0203be0:	6dc70713          	addi	a4,a4,1756 # ffffffffc02052b8 <commands+0xf98>
ffffffffc0203be4:	00002697          	auipc	a3,0x2
ffffffffc0203be8:	41c68693          	addi	a3,a3,1052 # ffffffffc0206000 <nbase>
ffffffffc0203bec:	40c58633          	sub	a2,a1,a2
ffffffffc0203bf0:	630c                	ld	a1,0(a4)
ffffffffc0203bf2:	860d                	srai	a2,a2,0x3
ffffffffc0203bf4:	0000e717          	auipc	a4,0xe
ffffffffc0203bf8:	87c70713          	addi	a4,a4,-1924 # ffffffffc0211470 <npage>
ffffffffc0203bfc:	02b60633          	mul	a2,a2,a1
ffffffffc0203c00:	0037959b          	slliw	a1,a5,0x3
ffffffffc0203c04:	629c                	ld	a5,0(a3)
ffffffffc0203c06:	6318                	ld	a4,0(a4)
ffffffffc0203c08:	963e                	add	a2,a2,a5
ffffffffc0203c0a:	00c61793          	slli	a5,a2,0xc
ffffffffc0203c0e:	83b1                	srli	a5,a5,0xc
ffffffffc0203c10:	0632                	slli	a2,a2,0xc
ffffffffc0203c12:	02e7fa63          	bgeu	a5,a4,ffffffffc0203c46 <swapfs_write+0x8c>
ffffffffc0203c16:	0000e797          	auipc	a5,0xe
ffffffffc0203c1a:	97278793          	addi	a5,a5,-1678 # ffffffffc0211588 <va_pa_offset>
ffffffffc0203c1e:	639c                	ld	a5,0(a5)
ffffffffc0203c20:	60a2                	ld	ra,8(sp)
ffffffffc0203c22:	46a1                	li	a3,8
ffffffffc0203c24:	963e                	add	a2,a2,a5
ffffffffc0203c26:	4505                	li	a0,1
ffffffffc0203c28:	0141                	addi	sp,sp,16
ffffffffc0203c2a:	fd8fc06f          	j	ffffffffc0200402 <ide_write_secs>
ffffffffc0203c2e:	86aa                	mv	a3,a0
ffffffffc0203c30:	00002617          	auipc	a2,0x2
ffffffffc0203c34:	16860613          	addi	a2,a2,360 # ffffffffc0205d98 <default_pmm_manager+0x788>
ffffffffc0203c38:	45e5                	li	a1,25
ffffffffc0203c3a:	00002517          	auipc	a0,0x2
ffffffffc0203c3e:	14650513          	addi	a0,a0,326 # ffffffffc0205d80 <default_pmm_manager+0x770>
ffffffffc0203c42:	cc2fc0ef          	jal	ra,ffffffffc0200104 <__panic>
ffffffffc0203c46:	86b2                	mv	a3,a2
ffffffffc0203c48:	06a00593          	li	a1,106
ffffffffc0203c4c:	00002617          	auipc	a2,0x2
ffffffffc0203c50:	b3c60613          	addi	a2,a2,-1220 # ffffffffc0205788 <default_pmm_manager+0x178>
ffffffffc0203c54:	00001517          	auipc	a0,0x1
ffffffffc0203c58:	23c50513          	addi	a0,a0,572 # ffffffffc0204e90 <commands+0xb70>
ffffffffc0203c5c:	ca8fc0ef          	jal	ra,ffffffffc0200104 <__panic>

ffffffffc0203c60 <strlen>:
ffffffffc0203c60:	00054783          	lbu	a5,0(a0)
ffffffffc0203c64:	cb91                	beqz	a5,ffffffffc0203c78 <strlen+0x18>
ffffffffc0203c66:	4781                	li	a5,0
ffffffffc0203c68:	0785                	addi	a5,a5,1
ffffffffc0203c6a:	00f50733          	add	a4,a0,a5
ffffffffc0203c6e:	00074703          	lbu	a4,0(a4)
ffffffffc0203c72:	fb7d                	bnez	a4,ffffffffc0203c68 <strlen+0x8>
ffffffffc0203c74:	853e                	mv	a0,a5
ffffffffc0203c76:	8082                	ret
ffffffffc0203c78:	4781                	li	a5,0
ffffffffc0203c7a:	853e                	mv	a0,a5
ffffffffc0203c7c:	8082                	ret

ffffffffc0203c7e <strnlen>:
ffffffffc0203c7e:	c185                	beqz	a1,ffffffffc0203c9e <strnlen+0x20>
ffffffffc0203c80:	00054783          	lbu	a5,0(a0)
ffffffffc0203c84:	cf89                	beqz	a5,ffffffffc0203c9e <strnlen+0x20>
ffffffffc0203c86:	4781                	li	a5,0
ffffffffc0203c88:	a021                	j	ffffffffc0203c90 <strnlen+0x12>
ffffffffc0203c8a:	00074703          	lbu	a4,0(a4)
ffffffffc0203c8e:	c711                	beqz	a4,ffffffffc0203c9a <strnlen+0x1c>
ffffffffc0203c90:	0785                	addi	a5,a5,1
ffffffffc0203c92:	00f50733          	add	a4,a0,a5
ffffffffc0203c96:	fef59ae3          	bne	a1,a5,ffffffffc0203c8a <strnlen+0xc>
ffffffffc0203c9a:	853e                	mv	a0,a5
ffffffffc0203c9c:	8082                	ret
ffffffffc0203c9e:	4781                	li	a5,0
ffffffffc0203ca0:	853e                	mv	a0,a5
ffffffffc0203ca2:	8082                	ret

ffffffffc0203ca4 <strcpy>:
ffffffffc0203ca4:	87aa                	mv	a5,a0
ffffffffc0203ca6:	0585                	addi	a1,a1,1
ffffffffc0203ca8:	fff5c703          	lbu	a4,-1(a1)
ffffffffc0203cac:	0785                	addi	a5,a5,1
ffffffffc0203cae:	fee78fa3          	sb	a4,-1(a5)
ffffffffc0203cb2:	fb75                	bnez	a4,ffffffffc0203ca6 <strcpy+0x2>
ffffffffc0203cb4:	8082                	ret

ffffffffc0203cb6 <strcmp>:
ffffffffc0203cb6:	00054783          	lbu	a5,0(a0)
ffffffffc0203cba:	0005c703          	lbu	a4,0(a1)
ffffffffc0203cbe:	cb91                	beqz	a5,ffffffffc0203cd2 <strcmp+0x1c>
ffffffffc0203cc0:	00e79c63          	bne	a5,a4,ffffffffc0203cd8 <strcmp+0x22>
ffffffffc0203cc4:	0505                	addi	a0,a0,1
ffffffffc0203cc6:	00054783          	lbu	a5,0(a0)
ffffffffc0203cca:	0585                	addi	a1,a1,1
ffffffffc0203ccc:	0005c703          	lbu	a4,0(a1)
ffffffffc0203cd0:	fbe5                	bnez	a5,ffffffffc0203cc0 <strcmp+0xa>
ffffffffc0203cd2:	4501                	li	a0,0
ffffffffc0203cd4:	9d19                	subw	a0,a0,a4
ffffffffc0203cd6:	8082                	ret
ffffffffc0203cd8:	0007851b          	sext.w	a0,a5
ffffffffc0203cdc:	9d19                	subw	a0,a0,a4
ffffffffc0203cde:	8082                	ret

ffffffffc0203ce0 <strchr>:
ffffffffc0203ce0:	00054783          	lbu	a5,0(a0)
ffffffffc0203ce4:	cb91                	beqz	a5,ffffffffc0203cf8 <strchr+0x18>
ffffffffc0203ce6:	00b79563          	bne	a5,a1,ffffffffc0203cf0 <strchr+0x10>
ffffffffc0203cea:	a809                	j	ffffffffc0203cfc <strchr+0x1c>
ffffffffc0203cec:	00b78763          	beq	a5,a1,ffffffffc0203cfa <strchr+0x1a>
ffffffffc0203cf0:	0505                	addi	a0,a0,1
ffffffffc0203cf2:	00054783          	lbu	a5,0(a0)
ffffffffc0203cf6:	fbfd                	bnez	a5,ffffffffc0203cec <strchr+0xc>
ffffffffc0203cf8:	4501                	li	a0,0
ffffffffc0203cfa:	8082                	ret
ffffffffc0203cfc:	8082                	ret

ffffffffc0203cfe <memset>:
ffffffffc0203cfe:	ca01                	beqz	a2,ffffffffc0203d0e <memset+0x10>
ffffffffc0203d00:	962a                	add	a2,a2,a0
ffffffffc0203d02:	87aa                	mv	a5,a0
ffffffffc0203d04:	0785                	addi	a5,a5,1
ffffffffc0203d06:	feb78fa3          	sb	a1,-1(a5)
ffffffffc0203d0a:	fec79de3          	bne	a5,a2,ffffffffc0203d04 <memset+0x6>
ffffffffc0203d0e:	8082                	ret

ffffffffc0203d10 <memcpy>:
ffffffffc0203d10:	ca19                	beqz	a2,ffffffffc0203d26 <memcpy+0x16>
ffffffffc0203d12:	962e                	add	a2,a2,a1
ffffffffc0203d14:	87aa                	mv	a5,a0
ffffffffc0203d16:	0585                	addi	a1,a1,1
ffffffffc0203d18:	fff5c703          	lbu	a4,-1(a1)
ffffffffc0203d1c:	0785                	addi	a5,a5,1
ffffffffc0203d1e:	fee78fa3          	sb	a4,-1(a5)
ffffffffc0203d22:	fec59ae3          	bne	a1,a2,ffffffffc0203d16 <memcpy+0x6>
ffffffffc0203d26:	8082                	ret

ffffffffc0203d28 <printnum>:
ffffffffc0203d28:	02069813          	slli	a6,a3,0x20
ffffffffc0203d2c:	7179                	addi	sp,sp,-48
ffffffffc0203d2e:	02085813          	srli	a6,a6,0x20
ffffffffc0203d32:	e052                	sd	s4,0(sp)
ffffffffc0203d34:	03067a33          	remu	s4,a2,a6
ffffffffc0203d38:	f022                	sd	s0,32(sp)
ffffffffc0203d3a:	ec26                	sd	s1,24(sp)
ffffffffc0203d3c:	e84a                	sd	s2,16(sp)
ffffffffc0203d3e:	f406                	sd	ra,40(sp)
ffffffffc0203d40:	e44e                	sd	s3,8(sp)
ffffffffc0203d42:	84aa                	mv	s1,a0
ffffffffc0203d44:	892e                	mv	s2,a1
ffffffffc0203d46:	fff7041b          	addiw	s0,a4,-1
ffffffffc0203d4a:	2a01                	sext.w	s4,s4
ffffffffc0203d4c:	03067e63          	bgeu	a2,a6,ffffffffc0203d88 <printnum+0x60>
ffffffffc0203d50:	89be                	mv	s3,a5
ffffffffc0203d52:	00805763          	blez	s0,ffffffffc0203d60 <printnum+0x38>
ffffffffc0203d56:	347d                	addiw	s0,s0,-1
ffffffffc0203d58:	85ca                	mv	a1,s2
ffffffffc0203d5a:	854e                	mv	a0,s3
ffffffffc0203d5c:	9482                	jalr	s1
ffffffffc0203d5e:	fc65                	bnez	s0,ffffffffc0203d56 <printnum+0x2e>
ffffffffc0203d60:	1a02                	slli	s4,s4,0x20
ffffffffc0203d62:	020a5a13          	srli	s4,s4,0x20
ffffffffc0203d66:	00002797          	auipc	a5,0x2
ffffffffc0203d6a:	1e278793          	addi	a5,a5,482 # ffffffffc0205f48 <error_string+0x38>
ffffffffc0203d6e:	9a3e                	add	s4,s4,a5
ffffffffc0203d70:	7402                	ld	s0,32(sp)
ffffffffc0203d72:	000a4503          	lbu	a0,0(s4)
ffffffffc0203d76:	70a2                	ld	ra,40(sp)
ffffffffc0203d78:	69a2                	ld	s3,8(sp)
ffffffffc0203d7a:	6a02                	ld	s4,0(sp)
ffffffffc0203d7c:	85ca                	mv	a1,s2
ffffffffc0203d7e:	8326                	mv	t1,s1
ffffffffc0203d80:	6942                	ld	s2,16(sp)
ffffffffc0203d82:	64e2                	ld	s1,24(sp)
ffffffffc0203d84:	6145                	addi	sp,sp,48
ffffffffc0203d86:	8302                	jr	t1
ffffffffc0203d88:	03065633          	divu	a2,a2,a6
ffffffffc0203d8c:	8722                	mv	a4,s0
ffffffffc0203d8e:	f9bff0ef          	jal	ra,ffffffffc0203d28 <printnum>
ffffffffc0203d92:	b7f9                	j	ffffffffc0203d60 <printnum+0x38>

ffffffffc0203d94 <vprintfmt>:
ffffffffc0203d94:	7119                	addi	sp,sp,-128
ffffffffc0203d96:	f4a6                	sd	s1,104(sp)
ffffffffc0203d98:	f0ca                	sd	s2,96(sp)
ffffffffc0203d9a:	e8d2                	sd	s4,80(sp)
ffffffffc0203d9c:	e4d6                	sd	s5,72(sp)
ffffffffc0203d9e:	e0da                	sd	s6,64(sp)
ffffffffc0203da0:	fc5e                	sd	s7,56(sp)
ffffffffc0203da2:	f862                	sd	s8,48(sp)
ffffffffc0203da4:	f06a                	sd	s10,32(sp)
ffffffffc0203da6:	fc86                	sd	ra,120(sp)
ffffffffc0203da8:	f8a2                	sd	s0,112(sp)
ffffffffc0203daa:	ecce                	sd	s3,88(sp)
ffffffffc0203dac:	f466                	sd	s9,40(sp)
ffffffffc0203dae:	ec6e                	sd	s11,24(sp)
ffffffffc0203db0:	892a                	mv	s2,a0
ffffffffc0203db2:	84ae                	mv	s1,a1
ffffffffc0203db4:	8d32                	mv	s10,a2
ffffffffc0203db6:	8ab6                	mv	s5,a3
ffffffffc0203db8:	5b7d                	li	s6,-1
ffffffffc0203dba:	00002a17          	auipc	s4,0x2
ffffffffc0203dbe:	ffea0a13          	addi	s4,s4,-2 # ffffffffc0205db8 <default_pmm_manager+0x7a8>
ffffffffc0203dc2:	05e00b93          	li	s7,94
ffffffffc0203dc6:	00002c17          	auipc	s8,0x2
ffffffffc0203dca:	14ac0c13          	addi	s8,s8,330 # ffffffffc0205f10 <error_string>
ffffffffc0203dce:	000d4503          	lbu	a0,0(s10)
ffffffffc0203dd2:	02500793          	li	a5,37
ffffffffc0203dd6:	001d0413          	addi	s0,s10,1
ffffffffc0203dda:	00f50e63          	beq	a0,a5,ffffffffc0203df6 <vprintfmt+0x62>
ffffffffc0203dde:	c521                	beqz	a0,ffffffffc0203e26 <vprintfmt+0x92>
ffffffffc0203de0:	02500993          	li	s3,37
ffffffffc0203de4:	a011                	j	ffffffffc0203de8 <vprintfmt+0x54>
ffffffffc0203de6:	c121                	beqz	a0,ffffffffc0203e26 <vprintfmt+0x92>
ffffffffc0203de8:	85a6                	mv	a1,s1
ffffffffc0203dea:	0405                	addi	s0,s0,1
ffffffffc0203dec:	9902                	jalr	s2
ffffffffc0203dee:	fff44503          	lbu	a0,-1(s0)
ffffffffc0203df2:	ff351ae3          	bne	a0,s3,ffffffffc0203de6 <vprintfmt+0x52>
ffffffffc0203df6:	00044603          	lbu	a2,0(s0)
ffffffffc0203dfa:	02000793          	li	a5,32
ffffffffc0203dfe:	4981                	li	s3,0
ffffffffc0203e00:	4801                	li	a6,0
ffffffffc0203e02:	5cfd                	li	s9,-1
ffffffffc0203e04:	5dfd                	li	s11,-1
ffffffffc0203e06:	05500593          	li	a1,85
ffffffffc0203e0a:	4525                	li	a0,9
ffffffffc0203e0c:	fdd6069b          	addiw	a3,a2,-35
ffffffffc0203e10:	0ff6f693          	andi	a3,a3,255
ffffffffc0203e14:	00140d13          	addi	s10,s0,1
ffffffffc0203e18:	1ed5ef63          	bltu	a1,a3,ffffffffc0204016 <vprintfmt+0x282>
ffffffffc0203e1c:	068a                	slli	a3,a3,0x2
ffffffffc0203e1e:	96d2                	add	a3,a3,s4
ffffffffc0203e20:	4294                	lw	a3,0(a3)
ffffffffc0203e22:	96d2                	add	a3,a3,s4
ffffffffc0203e24:	8682                	jr	a3
ffffffffc0203e26:	70e6                	ld	ra,120(sp)
ffffffffc0203e28:	7446                	ld	s0,112(sp)
ffffffffc0203e2a:	74a6                	ld	s1,104(sp)
ffffffffc0203e2c:	7906                	ld	s2,96(sp)
ffffffffc0203e2e:	69e6                	ld	s3,88(sp)
ffffffffc0203e30:	6a46                	ld	s4,80(sp)
ffffffffc0203e32:	6aa6                	ld	s5,72(sp)
ffffffffc0203e34:	6b06                	ld	s6,64(sp)
ffffffffc0203e36:	7be2                	ld	s7,56(sp)
ffffffffc0203e38:	7c42                	ld	s8,48(sp)
ffffffffc0203e3a:	7ca2                	ld	s9,40(sp)
ffffffffc0203e3c:	7d02                	ld	s10,32(sp)
ffffffffc0203e3e:	6de2                	ld	s11,24(sp)
ffffffffc0203e40:	6109                	addi	sp,sp,128
ffffffffc0203e42:	8082                	ret
ffffffffc0203e44:	87b2                	mv	a5,a2
ffffffffc0203e46:	00144603          	lbu	a2,1(s0)
ffffffffc0203e4a:	846a                	mv	s0,s10
ffffffffc0203e4c:	b7c1                	j	ffffffffc0203e0c <vprintfmt+0x78>
ffffffffc0203e4e:	000aac83          	lw	s9,0(s5) # 80000 <BASE_ADDRESS-0xffffffffc0180000>
ffffffffc0203e52:	00144603          	lbu	a2,1(s0)
ffffffffc0203e56:	0aa1                	addi	s5,s5,8
ffffffffc0203e58:	846a                	mv	s0,s10
ffffffffc0203e5a:	fa0dd9e3          	bgez	s11,ffffffffc0203e0c <vprintfmt+0x78>
ffffffffc0203e5e:	8de6                	mv	s11,s9
ffffffffc0203e60:	5cfd                	li	s9,-1
ffffffffc0203e62:	b76d                	j	ffffffffc0203e0c <vprintfmt+0x78>
ffffffffc0203e64:	fffdc693          	not	a3,s11
ffffffffc0203e68:	96fd                	srai	a3,a3,0x3f
ffffffffc0203e6a:	00ddfdb3          	and	s11,s11,a3
ffffffffc0203e6e:	00144603          	lbu	a2,1(s0)
ffffffffc0203e72:	2d81                	sext.w	s11,s11
ffffffffc0203e74:	846a                	mv	s0,s10
ffffffffc0203e76:	bf59                	j	ffffffffc0203e0c <vprintfmt+0x78>
ffffffffc0203e78:	4705                	li	a4,1
ffffffffc0203e7a:	008a8593          	addi	a1,s5,8
ffffffffc0203e7e:	01074463          	blt	a4,a6,ffffffffc0203e86 <vprintfmt+0xf2>
ffffffffc0203e82:	22080863          	beqz	a6,ffffffffc02040b2 <vprintfmt+0x31e>
ffffffffc0203e86:	000ab603          	ld	a2,0(s5)
ffffffffc0203e8a:	46c1                	li	a3,16
ffffffffc0203e8c:	8aae                	mv	s5,a1
ffffffffc0203e8e:	a291                	j	ffffffffc0203fd2 <vprintfmt+0x23e>
ffffffffc0203e90:	fd060c9b          	addiw	s9,a2,-48
ffffffffc0203e94:	00144603          	lbu	a2,1(s0)
ffffffffc0203e98:	846a                	mv	s0,s10
ffffffffc0203e9a:	fd06069b          	addiw	a3,a2,-48
ffffffffc0203e9e:	0006089b          	sext.w	a7,a2
ffffffffc0203ea2:	fad56ce3          	bltu	a0,a3,ffffffffc0203e5a <vprintfmt+0xc6>
ffffffffc0203ea6:	0405                	addi	s0,s0,1
ffffffffc0203ea8:	002c969b          	slliw	a3,s9,0x2
ffffffffc0203eac:	00044603          	lbu	a2,0(s0)
ffffffffc0203eb0:	0196873b          	addw	a4,a3,s9
ffffffffc0203eb4:	0017171b          	slliw	a4,a4,0x1
ffffffffc0203eb8:	0117073b          	addw	a4,a4,a7
ffffffffc0203ebc:	fd06069b          	addiw	a3,a2,-48
ffffffffc0203ec0:	fd070c9b          	addiw	s9,a4,-48
ffffffffc0203ec4:	0006089b          	sext.w	a7,a2
ffffffffc0203ec8:	fcd57fe3          	bgeu	a0,a3,ffffffffc0203ea6 <vprintfmt+0x112>
ffffffffc0203ecc:	b779                	j	ffffffffc0203e5a <vprintfmt+0xc6>
ffffffffc0203ece:	000aa503          	lw	a0,0(s5)
ffffffffc0203ed2:	85a6                	mv	a1,s1
ffffffffc0203ed4:	0aa1                	addi	s5,s5,8
ffffffffc0203ed6:	9902                	jalr	s2
ffffffffc0203ed8:	bddd                	j	ffffffffc0203dce <vprintfmt+0x3a>
ffffffffc0203eda:	4705                	li	a4,1
ffffffffc0203edc:	008a8993          	addi	s3,s5,8
ffffffffc0203ee0:	01074463          	blt	a4,a6,ffffffffc0203ee8 <vprintfmt+0x154>
ffffffffc0203ee4:	1c080463          	beqz	a6,ffffffffc02040ac <vprintfmt+0x318>
ffffffffc0203ee8:	000ab403          	ld	s0,0(s5)
ffffffffc0203eec:	1c044a63          	bltz	s0,ffffffffc02040c0 <vprintfmt+0x32c>
ffffffffc0203ef0:	8622                	mv	a2,s0
ffffffffc0203ef2:	8ace                	mv	s5,s3
ffffffffc0203ef4:	46a9                	li	a3,10
ffffffffc0203ef6:	a8f1                	j	ffffffffc0203fd2 <vprintfmt+0x23e>
ffffffffc0203ef8:	000aa783          	lw	a5,0(s5)
ffffffffc0203efc:	4719                	li	a4,6
ffffffffc0203efe:	0aa1                	addi	s5,s5,8
ffffffffc0203f00:	41f7d69b          	sraiw	a3,a5,0x1f
ffffffffc0203f04:	8fb5                	xor	a5,a5,a3
ffffffffc0203f06:	40d786bb          	subw	a3,a5,a3
ffffffffc0203f0a:	12d74963          	blt	a4,a3,ffffffffc020403c <vprintfmt+0x2a8>
ffffffffc0203f0e:	00369793          	slli	a5,a3,0x3
ffffffffc0203f12:	97e2                	add	a5,a5,s8
ffffffffc0203f14:	639c                	ld	a5,0(a5)
ffffffffc0203f16:	12078363          	beqz	a5,ffffffffc020403c <vprintfmt+0x2a8>
ffffffffc0203f1a:	86be                	mv	a3,a5
ffffffffc0203f1c:	00002617          	auipc	a2,0x2
ffffffffc0203f20:	0dc60613          	addi	a2,a2,220 # ffffffffc0205ff8 <error_string+0xe8>
ffffffffc0203f24:	85a6                	mv	a1,s1
ffffffffc0203f26:	854a                	mv	a0,s2
ffffffffc0203f28:	1cc000ef          	jal	ra,ffffffffc02040f4 <printfmt>
ffffffffc0203f2c:	b54d                	j	ffffffffc0203dce <vprintfmt+0x3a>
ffffffffc0203f2e:	000ab603          	ld	a2,0(s5)
ffffffffc0203f32:	0aa1                	addi	s5,s5,8
ffffffffc0203f34:	1a060163          	beqz	a2,ffffffffc02040d6 <vprintfmt+0x342>
ffffffffc0203f38:	00160413          	addi	s0,a2,1
ffffffffc0203f3c:	15b05763          	blez	s11,ffffffffc020408a <vprintfmt+0x2f6>
ffffffffc0203f40:	02d00593          	li	a1,45
ffffffffc0203f44:	10b79d63          	bne	a5,a1,ffffffffc020405e <vprintfmt+0x2ca>
ffffffffc0203f48:	00064783          	lbu	a5,0(a2)
ffffffffc0203f4c:	0007851b          	sext.w	a0,a5
ffffffffc0203f50:	c905                	beqz	a0,ffffffffc0203f80 <vprintfmt+0x1ec>
ffffffffc0203f52:	000cc563          	bltz	s9,ffffffffc0203f5c <vprintfmt+0x1c8>
ffffffffc0203f56:	3cfd                	addiw	s9,s9,-1
ffffffffc0203f58:	036c8263          	beq	s9,s6,ffffffffc0203f7c <vprintfmt+0x1e8>
ffffffffc0203f5c:	85a6                	mv	a1,s1
ffffffffc0203f5e:	14098f63          	beqz	s3,ffffffffc02040bc <vprintfmt+0x328>
ffffffffc0203f62:	3781                	addiw	a5,a5,-32
ffffffffc0203f64:	14fbfc63          	bgeu	s7,a5,ffffffffc02040bc <vprintfmt+0x328>
ffffffffc0203f68:	03f00513          	li	a0,63
ffffffffc0203f6c:	9902                	jalr	s2
ffffffffc0203f6e:	0405                	addi	s0,s0,1
ffffffffc0203f70:	fff44783          	lbu	a5,-1(s0)
ffffffffc0203f74:	3dfd                	addiw	s11,s11,-1
ffffffffc0203f76:	0007851b          	sext.w	a0,a5
ffffffffc0203f7a:	fd61                	bnez	a0,ffffffffc0203f52 <vprintfmt+0x1be>
ffffffffc0203f7c:	e5b059e3          	blez	s11,ffffffffc0203dce <vprintfmt+0x3a>
ffffffffc0203f80:	3dfd                	addiw	s11,s11,-1
ffffffffc0203f82:	85a6                	mv	a1,s1
ffffffffc0203f84:	02000513          	li	a0,32
ffffffffc0203f88:	9902                	jalr	s2
ffffffffc0203f8a:	e40d82e3          	beqz	s11,ffffffffc0203dce <vprintfmt+0x3a>
ffffffffc0203f8e:	3dfd                	addiw	s11,s11,-1
ffffffffc0203f90:	85a6                	mv	a1,s1
ffffffffc0203f92:	02000513          	li	a0,32
ffffffffc0203f96:	9902                	jalr	s2
ffffffffc0203f98:	fe0d94e3          	bnez	s11,ffffffffc0203f80 <vprintfmt+0x1ec>
ffffffffc0203f9c:	bd0d                	j	ffffffffc0203dce <vprintfmt+0x3a>
ffffffffc0203f9e:	4705                	li	a4,1
ffffffffc0203fa0:	008a8593          	addi	a1,s5,8
ffffffffc0203fa4:	01074463          	blt	a4,a6,ffffffffc0203fac <vprintfmt+0x218>
ffffffffc0203fa8:	0e080863          	beqz	a6,ffffffffc0204098 <vprintfmt+0x304>
ffffffffc0203fac:	000ab603          	ld	a2,0(s5)
ffffffffc0203fb0:	46a1                	li	a3,8
ffffffffc0203fb2:	8aae                	mv	s5,a1
ffffffffc0203fb4:	a839                	j	ffffffffc0203fd2 <vprintfmt+0x23e>
ffffffffc0203fb6:	03000513          	li	a0,48
ffffffffc0203fba:	85a6                	mv	a1,s1
ffffffffc0203fbc:	e03e                	sd	a5,0(sp)
ffffffffc0203fbe:	9902                	jalr	s2
ffffffffc0203fc0:	85a6                	mv	a1,s1
ffffffffc0203fc2:	07800513          	li	a0,120
ffffffffc0203fc6:	9902                	jalr	s2
ffffffffc0203fc8:	0aa1                	addi	s5,s5,8
ffffffffc0203fca:	ff8ab603          	ld	a2,-8(s5)
ffffffffc0203fce:	6782                	ld	a5,0(sp)
ffffffffc0203fd0:	46c1                	li	a3,16
ffffffffc0203fd2:	2781                	sext.w	a5,a5
ffffffffc0203fd4:	876e                	mv	a4,s11
ffffffffc0203fd6:	85a6                	mv	a1,s1
ffffffffc0203fd8:	854a                	mv	a0,s2
ffffffffc0203fda:	d4fff0ef          	jal	ra,ffffffffc0203d28 <printnum>
ffffffffc0203fde:	bbc5                	j	ffffffffc0203dce <vprintfmt+0x3a>
ffffffffc0203fe0:	00144603          	lbu	a2,1(s0)
ffffffffc0203fe4:	2805                	addiw	a6,a6,1
ffffffffc0203fe6:	846a                	mv	s0,s10
ffffffffc0203fe8:	b515                	j	ffffffffc0203e0c <vprintfmt+0x78>
ffffffffc0203fea:	00144603          	lbu	a2,1(s0)
ffffffffc0203fee:	4985                	li	s3,1
ffffffffc0203ff0:	846a                	mv	s0,s10
ffffffffc0203ff2:	bd29                	j	ffffffffc0203e0c <vprintfmt+0x78>
ffffffffc0203ff4:	85a6                	mv	a1,s1
ffffffffc0203ff6:	02500513          	li	a0,37
ffffffffc0203ffa:	9902                	jalr	s2
ffffffffc0203ffc:	bbc9                	j	ffffffffc0203dce <vprintfmt+0x3a>
ffffffffc0203ffe:	4705                	li	a4,1
ffffffffc0204000:	008a8593          	addi	a1,s5,8
ffffffffc0204004:	01074463          	blt	a4,a6,ffffffffc020400c <vprintfmt+0x278>
ffffffffc0204008:	08080d63          	beqz	a6,ffffffffc02040a2 <vprintfmt+0x30e>
ffffffffc020400c:	000ab603          	ld	a2,0(s5)
ffffffffc0204010:	46a9                	li	a3,10
ffffffffc0204012:	8aae                	mv	s5,a1
ffffffffc0204014:	bf7d                	j	ffffffffc0203fd2 <vprintfmt+0x23e>
ffffffffc0204016:	85a6                	mv	a1,s1
ffffffffc0204018:	02500513          	li	a0,37
ffffffffc020401c:	9902                	jalr	s2
ffffffffc020401e:	fff44703          	lbu	a4,-1(s0)
ffffffffc0204022:	02500793          	li	a5,37
ffffffffc0204026:	8d22                	mv	s10,s0
ffffffffc0204028:	daf703e3          	beq	a4,a5,ffffffffc0203dce <vprintfmt+0x3a>
ffffffffc020402c:	02500713          	li	a4,37
ffffffffc0204030:	1d7d                	addi	s10,s10,-1
ffffffffc0204032:	fffd4783          	lbu	a5,-1(s10)
ffffffffc0204036:	fee79de3          	bne	a5,a4,ffffffffc0204030 <vprintfmt+0x29c>
ffffffffc020403a:	bb51                	j	ffffffffc0203dce <vprintfmt+0x3a>
ffffffffc020403c:	00002617          	auipc	a2,0x2
ffffffffc0204040:	fac60613          	addi	a2,a2,-84 # ffffffffc0205fe8 <error_string+0xd8>
ffffffffc0204044:	85a6                	mv	a1,s1
ffffffffc0204046:	854a                	mv	a0,s2
ffffffffc0204048:	0ac000ef          	jal	ra,ffffffffc02040f4 <printfmt>
ffffffffc020404c:	b349                	j	ffffffffc0203dce <vprintfmt+0x3a>
ffffffffc020404e:	00002617          	auipc	a2,0x2
ffffffffc0204052:	f9260613          	addi	a2,a2,-110 # ffffffffc0205fe0 <error_string+0xd0>
ffffffffc0204056:	00002417          	auipc	s0,0x2
ffffffffc020405a:	f8b40413          	addi	s0,s0,-117 # ffffffffc0205fe1 <error_string+0xd1>
ffffffffc020405e:	8532                	mv	a0,a2
ffffffffc0204060:	85e6                	mv	a1,s9
ffffffffc0204062:	e032                	sd	a2,0(sp)
ffffffffc0204064:	e43e                	sd	a5,8(sp)
ffffffffc0204066:	c19ff0ef          	jal	ra,ffffffffc0203c7e <strnlen>
ffffffffc020406a:	40ad8dbb          	subw	s11,s11,a0
ffffffffc020406e:	6602                	ld	a2,0(sp)
ffffffffc0204070:	01b05d63          	blez	s11,ffffffffc020408a <vprintfmt+0x2f6>
ffffffffc0204074:	67a2                	ld	a5,8(sp)
ffffffffc0204076:	2781                	sext.w	a5,a5
ffffffffc0204078:	e43e                	sd	a5,8(sp)
ffffffffc020407a:	6522                	ld	a0,8(sp)
ffffffffc020407c:	85a6                	mv	a1,s1
ffffffffc020407e:	e032                	sd	a2,0(sp)
ffffffffc0204080:	3dfd                	addiw	s11,s11,-1
ffffffffc0204082:	9902                	jalr	s2
ffffffffc0204084:	6602                	ld	a2,0(sp)
ffffffffc0204086:	fe0d9ae3          	bnez	s11,ffffffffc020407a <vprintfmt+0x2e6>
ffffffffc020408a:	00064783          	lbu	a5,0(a2)
ffffffffc020408e:	0007851b          	sext.w	a0,a5
ffffffffc0204092:	ec0510e3          	bnez	a0,ffffffffc0203f52 <vprintfmt+0x1be>
ffffffffc0204096:	bb25                	j	ffffffffc0203dce <vprintfmt+0x3a>
ffffffffc0204098:	000ae603          	lwu	a2,0(s5)
ffffffffc020409c:	46a1                	li	a3,8
ffffffffc020409e:	8aae                	mv	s5,a1
ffffffffc02040a0:	bf0d                	j	ffffffffc0203fd2 <vprintfmt+0x23e>
ffffffffc02040a2:	000ae603          	lwu	a2,0(s5)
ffffffffc02040a6:	46a9                	li	a3,10
ffffffffc02040a8:	8aae                	mv	s5,a1
ffffffffc02040aa:	b725                	j	ffffffffc0203fd2 <vprintfmt+0x23e>
ffffffffc02040ac:	000aa403          	lw	s0,0(s5)
ffffffffc02040b0:	bd35                	j	ffffffffc0203eec <vprintfmt+0x158>
ffffffffc02040b2:	000ae603          	lwu	a2,0(s5)
ffffffffc02040b6:	46c1                	li	a3,16
ffffffffc02040b8:	8aae                	mv	s5,a1
ffffffffc02040ba:	bf21                	j	ffffffffc0203fd2 <vprintfmt+0x23e>
ffffffffc02040bc:	9902                	jalr	s2
ffffffffc02040be:	bd45                	j	ffffffffc0203f6e <vprintfmt+0x1da>
ffffffffc02040c0:	85a6                	mv	a1,s1
ffffffffc02040c2:	02d00513          	li	a0,45
ffffffffc02040c6:	e03e                	sd	a5,0(sp)
ffffffffc02040c8:	9902                	jalr	s2
ffffffffc02040ca:	8ace                	mv	s5,s3
ffffffffc02040cc:	40800633          	neg	a2,s0
ffffffffc02040d0:	46a9                	li	a3,10
ffffffffc02040d2:	6782                	ld	a5,0(sp)
ffffffffc02040d4:	bdfd                	j	ffffffffc0203fd2 <vprintfmt+0x23e>
ffffffffc02040d6:	01b05663          	blez	s11,ffffffffc02040e2 <vprintfmt+0x34e>
ffffffffc02040da:	02d00693          	li	a3,45
ffffffffc02040de:	f6d798e3          	bne	a5,a3,ffffffffc020404e <vprintfmt+0x2ba>
ffffffffc02040e2:	00002417          	auipc	s0,0x2
ffffffffc02040e6:	eff40413          	addi	s0,s0,-257 # ffffffffc0205fe1 <error_string+0xd1>
ffffffffc02040ea:	02800513          	li	a0,40
ffffffffc02040ee:	02800793          	li	a5,40
ffffffffc02040f2:	b585                	j	ffffffffc0203f52 <vprintfmt+0x1be>

ffffffffc02040f4 <printfmt>:
ffffffffc02040f4:	715d                	addi	sp,sp,-80
ffffffffc02040f6:	02810313          	addi	t1,sp,40
ffffffffc02040fa:	f436                	sd	a3,40(sp)
ffffffffc02040fc:	869a                	mv	a3,t1
ffffffffc02040fe:	ec06                	sd	ra,24(sp)
ffffffffc0204100:	f83a                	sd	a4,48(sp)
ffffffffc0204102:	fc3e                	sd	a5,56(sp)
ffffffffc0204104:	e0c2                	sd	a6,64(sp)
ffffffffc0204106:	e4c6                	sd	a7,72(sp)
ffffffffc0204108:	e41a                	sd	t1,8(sp)
ffffffffc020410a:	c8bff0ef          	jal	ra,ffffffffc0203d94 <vprintfmt>
ffffffffc020410e:	60e2                	ld	ra,24(sp)
ffffffffc0204110:	6161                	addi	sp,sp,80
ffffffffc0204112:	8082                	ret

ffffffffc0204114 <readline>:
ffffffffc0204114:	715d                	addi	sp,sp,-80
ffffffffc0204116:	e486                	sd	ra,72(sp)
ffffffffc0204118:	e0a2                	sd	s0,64(sp)
ffffffffc020411a:	fc26                	sd	s1,56(sp)
ffffffffc020411c:	f84a                	sd	s2,48(sp)
ffffffffc020411e:	f44e                	sd	s3,40(sp)
ffffffffc0204120:	f052                	sd	s4,32(sp)
ffffffffc0204122:	ec56                	sd	s5,24(sp)
ffffffffc0204124:	e85a                	sd	s6,16(sp)
ffffffffc0204126:	e45e                	sd	s7,8(sp)
ffffffffc0204128:	c901                	beqz	a0,ffffffffc0204138 <readline+0x24>
ffffffffc020412a:	85aa                	mv	a1,a0
ffffffffc020412c:	00002517          	auipc	a0,0x2
ffffffffc0204130:	ecc50513          	addi	a0,a0,-308 # ffffffffc0205ff8 <error_string+0xe8>
ffffffffc0204134:	f8bfb0ef          	jal	ra,ffffffffc02000be <cprintf>
ffffffffc0204138:	4481                	li	s1,0
ffffffffc020413a:	497d                	li	s2,31
ffffffffc020413c:	49a1                	li	s3,8
ffffffffc020413e:	4aa9                	li	s5,10
ffffffffc0204140:	4b35                	li	s6,13
ffffffffc0204142:	0000db97          	auipc	s7,0xd
ffffffffc0204146:	efeb8b93          	addi	s7,s7,-258 # ffffffffc0211040 <buf>
ffffffffc020414a:	3fe00a13          	li	s4,1022
ffffffffc020414e:	fa7fb0ef          	jal	ra,ffffffffc02000f4 <getchar>
ffffffffc0204152:	842a                	mv	s0,a0
ffffffffc0204154:	00054b63          	bltz	a0,ffffffffc020416a <readline+0x56>
ffffffffc0204158:	00a95b63          	bge	s2,a0,ffffffffc020416e <readline+0x5a>
ffffffffc020415c:	029a5463          	bge	s4,s1,ffffffffc0204184 <readline+0x70>
ffffffffc0204160:	f95fb0ef          	jal	ra,ffffffffc02000f4 <getchar>
ffffffffc0204164:	842a                	mv	s0,a0
ffffffffc0204166:	fe0559e3          	bgez	a0,ffffffffc0204158 <readline+0x44>
ffffffffc020416a:	4501                	li	a0,0
ffffffffc020416c:	a099                	j	ffffffffc02041b2 <readline+0x9e>
ffffffffc020416e:	03341463          	bne	s0,s3,ffffffffc0204196 <readline+0x82>
ffffffffc0204172:	e8b9                	bnez	s1,ffffffffc02041c8 <readline+0xb4>
ffffffffc0204174:	f81fb0ef          	jal	ra,ffffffffc02000f4 <getchar>
ffffffffc0204178:	842a                	mv	s0,a0
ffffffffc020417a:	fe0548e3          	bltz	a0,ffffffffc020416a <readline+0x56>
ffffffffc020417e:	fea958e3          	bge	s2,a0,ffffffffc020416e <readline+0x5a>
ffffffffc0204182:	4481                	li	s1,0
ffffffffc0204184:	8522                	mv	a0,s0
ffffffffc0204186:	f6dfb0ef          	jal	ra,ffffffffc02000f2 <cputchar>
ffffffffc020418a:	009b87b3          	add	a5,s7,s1
ffffffffc020418e:	00878023          	sb	s0,0(a5)
ffffffffc0204192:	2485                	addiw	s1,s1,1
ffffffffc0204194:	bf6d                	j	ffffffffc020414e <readline+0x3a>
ffffffffc0204196:	01540463          	beq	s0,s5,ffffffffc020419e <readline+0x8a>
ffffffffc020419a:	fb641ae3          	bne	s0,s6,ffffffffc020414e <readline+0x3a>
ffffffffc020419e:	8522                	mv	a0,s0
ffffffffc02041a0:	f53fb0ef          	jal	ra,ffffffffc02000f2 <cputchar>
ffffffffc02041a4:	0000d517          	auipc	a0,0xd
ffffffffc02041a8:	e9c50513          	addi	a0,a0,-356 # ffffffffc0211040 <buf>
ffffffffc02041ac:	94aa                	add	s1,s1,a0
ffffffffc02041ae:	00048023          	sb	zero,0(s1)
ffffffffc02041b2:	60a6                	ld	ra,72(sp)
ffffffffc02041b4:	6406                	ld	s0,64(sp)
ffffffffc02041b6:	74e2                	ld	s1,56(sp)
ffffffffc02041b8:	7942                	ld	s2,48(sp)
ffffffffc02041ba:	79a2                	ld	s3,40(sp)
ffffffffc02041bc:	7a02                	ld	s4,32(sp)
ffffffffc02041be:	6ae2                	ld	s5,24(sp)
ffffffffc02041c0:	6b42                	ld	s6,16(sp)
ffffffffc02041c2:	6ba2                	ld	s7,8(sp)
ffffffffc02041c4:	6161                	addi	sp,sp,80
ffffffffc02041c6:	8082                	ret
ffffffffc02041c8:	4521                	li	a0,8
ffffffffc02041ca:	f29fb0ef          	jal	ra,ffffffffc02000f2 <cputchar>
ffffffffc02041ce:	34fd                	addiw	s1,s1,-1
ffffffffc02041d0:	bfbd                	j	ffffffffc020414e <readline+0x3a>
