
bin/kernel：     文件格式 elf64-littleriscv


Disassembly of section .text:

0000000080200000 <kern_entry>:
#include <memlayout.h>

    .section .text,"ax",%progbits
    .globl kern_entry
kern_entry:
    la sp, bootstacktop
    80200000:	00004117          	auipc	sp,0x4
    80200004:	00010113          	mv	sp,sp

    tail kern_init
    80200008:	a091                	j	8020004c <kern_init>

000000008020000a <lab1_print_cur_status>:
    grade_backtrace1(arg0, arg2);
}

void grade_backtrace(void) { grade_backtrace0(0, (unsigned long long)kern_init, 0xffff0000); }

static void lab1_print_cur_status(void) {
    8020000a:	1141                	addi	sp,sp,-16
    8020000c:	e406                	sd	ra,8(sp)
    unsigned int sstatus;
    asm volatile("csrr %0, sstatus" : "=r"(sstatus));
    8020000e:	100027f3          	csrr	a5,sstatus
    if (sstatus & (1 << 8))
    80200012:	1007f793          	andi	a5,a5,256
    80200016:	c785                	beqz	a5,8020003e <lab1_print_cur_status+0x34>
    {
        cprintf("Processor is in kernel mode.\n");
    80200018:	00001517          	auipc	a0,0x1
    8020001c:	ac050513          	addi	a0,a0,-1344 # 80200ad8 <etext+0x82>
    80200020:	0d6000ef          	jal	ra,802000f6 <cprintf>
    {
        cprintf("Processor is in user mode.\n");
    }

    static int round = 0;
    round++;
    80200024:	00004797          	auipc	a5,0x4
    80200028:	fe478793          	addi	a5,a5,-28 # 80204008 <edata>
    8020002c:	439c                	lw	a5,0(a5)
}
    8020002e:	60a2                	ld	ra,8(sp)
    round++;
    80200030:	2785                	addiw	a5,a5,1
    80200032:	00004717          	auipc	a4,0x4
    80200036:	fcf72b23          	sw	a5,-42(a4) # 80204008 <edata>
}
    8020003a:	0141                	addi	sp,sp,16
    8020003c:	8082                	ret
        cprintf("Processor is in user mode.\n");
    8020003e:	00001517          	auipc	a0,0x1
    80200042:	aba50513          	addi	a0,a0,-1350 # 80200af8 <etext+0xa2>
    80200046:	0b0000ef          	jal	ra,802000f6 <cprintf>
    8020004a:	bfe9                	j	80200024 <lab1_print_cur_status+0x1a>

000000008020004c <kern_init>:
    memset(edata, 0, end - edata);
    8020004c:	00004517          	auipc	a0,0x4
    80200050:	fbc50513          	addi	a0,a0,-68 # 80204008 <edata>
    80200054:	00004617          	auipc	a2,0x4
    80200058:	fcc60613          	addi	a2,a2,-52 # 80204020 <end>
int kern_init(void) {
    8020005c:	1141                	addi	sp,sp,-16
    memset(edata, 0, end - edata);
    8020005e:	8e09                	sub	a2,a2,a0
    80200060:	4581                	li	a1,0
int kern_init(void) {
    80200062:	e406                	sd	ra,8(sp)
    memset(edata, 0, end - edata);
    80200064:	5bc000ef          	jal	ra,80200620 <memset>
    cons_init();  // init the console
    80200068:	160000ef          	jal	ra,802001c8 <cons_init>
    cprintf("%s\n\n", message);
    8020006c:	00001597          	auipc	a1,0x1
    80200070:	9ec58593          	addi	a1,a1,-1556 # 80200a58 <etext+0x2>
    80200074:	00001517          	auipc	a0,0x1
    80200078:	a0450513          	addi	a0,a0,-1532 # 80200a78 <etext+0x22>
    8020007c:	07a000ef          	jal	ra,802000f6 <cprintf>
    print_kerninfo();
    80200080:	0aa000ef          	jal	ra,8020012a <print_kerninfo>
    idt_init();  // init interrupt descriptor table
    80200084:	154000ef          	jal	ra,802001d8 <idt_init>
    intr_enable();  // enable irq interrupt
    80200088:	14a000ef          	jal	ra,802001d2 <intr_enable>
    // LAB1 CHALLENGE 1 :  TODO

}
unsigned long pc;
static void lab1_switch_test(void) {
    lab1_print_cur_status();
    8020008c:	f7fff0ef          	jal	ra,8020000a <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
    80200090:	00001517          	auipc	a0,0x1
    80200094:	9f050513          	addi	a0,a0,-1552 # 80200a80 <etext+0x2a>
    80200098:	05e000ef          	jal	ra,802000f6 <cprintf>
    asm volatile("csrr %0, sstatus" : "=r"(sstatus_value));
    8020009c:	100027f3          	csrr	a5,sstatus
    sstatus_value &= ~(1 << 8);  // spp 设置为 0，表示用户态
    802000a0:	eff7f793          	andi	a5,a5,-257
    asm volatile("csrw sstatus, %0" : : "r"(sstatus_value));
    802000a4:	10079073          	csrw	sstatus,a5
    asm volatile("mv %0, ra" : "=r"(ra_value));
    802000a8:	8606                	mv	a2,ra
    ra_value += 0x26;
    802000aa:	02660613          	addi	a2,a2,38
    asm volatile("csrw sepc, %0" : : "r"(ra_value));
    802000ae:	14161073          	csrw	sepc,a2
     asm volatile("csrr %0, sepc" : "=r"(sepc_value));
    802000b2:	141025f3          	csrr	a1,sepc
    cprintf("0x%016llx--0x%016llx\n",sepc_value,ra_value);
    802000b6:	00001517          	auipc	a0,0x1
    802000ba:	9ea50513          	addi	a0,a0,-1558 # 80200aa0 <etext+0x4a>
    802000be:	038000ef          	jal	ra,802000f6 <cprintf>
   asm volatile("sret" : :);
    802000c2:	10200073          	sret
    //  asm volatile("auipc %0, 0" : "=r"(pc));
    //  cprintf("0x%016llx\n",pc);

   // cprintf("66666666666666666\n");

    lab1_print_cur_status();
    802000c6:	f45ff0ef          	jal	ra,8020000a <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
    802000ca:	00001517          	auipc	a0,0x1
    802000ce:	9ee50513          	addi	a0,a0,-1554 # 80200ab8 <etext+0x62>
    802000d2:	024000ef          	jal	ra,802000f6 <cprintf>
    lab1_switch_to_kernel();
    lab1_print_cur_status();
    802000d6:	f35ff0ef          	jal	ra,8020000a <lab1_print_cur_status>
        ;
    802000da:	a001                	j	802000da <kern_init+0x8e>

00000000802000dc <cputch>:

/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void cputch(int c, int *cnt) {
    802000dc:	1141                	addi	sp,sp,-16
    802000de:	e022                	sd	s0,0(sp)
    802000e0:	e406                	sd	ra,8(sp)
    802000e2:	842e                	mv	s0,a1
    cons_putc(c);
    802000e4:	0e6000ef          	jal	ra,802001ca <cons_putc>
    (*cnt)++;
    802000e8:	401c                	lw	a5,0(s0)
}
    802000ea:	60a2                	ld	ra,8(sp)
    (*cnt)++;
    802000ec:	2785                	addiw	a5,a5,1
    802000ee:	c01c                	sw	a5,0(s0)
}
    802000f0:	6402                	ld	s0,0(sp)
    802000f2:	0141                	addi	sp,sp,16
    802000f4:	8082                	ret

00000000802000f6 <cprintf>:
 * cprintf - formats a string and writes it to stdout
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int cprintf(const char *fmt, ...) {
    802000f6:	711d                	addi	sp,sp,-96
    va_list ap;
    int cnt;
    va_start(ap, fmt);
    802000f8:	02810313          	addi	t1,sp,40 # 80204028 <end+0x8>
int cprintf(const char *fmt, ...) {
    802000fc:	f42e                	sd	a1,40(sp)
    802000fe:	f832                	sd	a2,48(sp)
    80200100:	fc36                	sd	a3,56(sp)
    vprintfmt((void *)cputch, &cnt, fmt, ap);
    80200102:	862a                	mv	a2,a0
    80200104:	004c                	addi	a1,sp,4
    80200106:	00000517          	auipc	a0,0x0
    8020010a:	fd650513          	addi	a0,a0,-42 # 802000dc <cputch>
    8020010e:	869a                	mv	a3,t1
int cprintf(const char *fmt, ...) {
    80200110:	ec06                	sd	ra,24(sp)
    80200112:	e0ba                	sd	a4,64(sp)
    80200114:	e4be                	sd	a5,72(sp)
    80200116:	e8c2                	sd	a6,80(sp)
    80200118:	ecc6                	sd	a7,88(sp)
    va_start(ap, fmt);
    8020011a:	e41a                	sd	t1,8(sp)
    int cnt = 0;
    8020011c:	c202                	sw	zero,4(sp)
    vprintfmt((void *)cputch, &cnt, fmt, ap);
    8020011e:	580000ef          	jal	ra,8020069e <vprintfmt>
    cnt = vcprintf(fmt, ap);
    va_end(ap);
    return cnt;
}
    80200122:	60e2                	ld	ra,24(sp)
    80200124:	4512                	lw	a0,4(sp)
    80200126:	6125                	addi	sp,sp,96
    80200128:	8082                	ret

000000008020012a <print_kerninfo>:
/* *
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void print_kerninfo(void) {
    8020012a:	1141                	addi	sp,sp,-16
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
    8020012c:	00001517          	auipc	a0,0x1
    80200130:	9ec50513          	addi	a0,a0,-1556 # 80200b18 <etext+0xc2>
void print_kerninfo(void) {
    80200134:	e406                	sd	ra,8(sp)
    cprintf("Special kernel symbols:\n");
    80200136:	fc1ff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  entry  0x%016x (virtual)\n", kern_init);
    8020013a:	00000597          	auipc	a1,0x0
    8020013e:	f1258593          	addi	a1,a1,-238 # 8020004c <kern_init>
    80200142:	00001517          	auipc	a0,0x1
    80200146:	9f650513          	addi	a0,a0,-1546 # 80200b38 <etext+0xe2>
    8020014a:	fadff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  etext  0x%016x (virtual)\n", etext);
    8020014e:	00001597          	auipc	a1,0x1
    80200152:	90858593          	addi	a1,a1,-1784 # 80200a56 <etext>
    80200156:	00001517          	auipc	a0,0x1
    8020015a:	a0250513          	addi	a0,a0,-1534 # 80200b58 <etext+0x102>
    8020015e:	f99ff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  edata  0x%016x (virtual)\n", edata);
    80200162:	00004597          	auipc	a1,0x4
    80200166:	ea658593          	addi	a1,a1,-346 # 80204008 <edata>
    8020016a:	00001517          	auipc	a0,0x1
    8020016e:	a0e50513          	addi	a0,a0,-1522 # 80200b78 <etext+0x122>
    80200172:	f85ff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  end    0x%016x (virtual)\n", end);
    80200176:	00004597          	auipc	a1,0x4
    8020017a:	eaa58593          	addi	a1,a1,-342 # 80204020 <end>
    8020017e:	00001517          	auipc	a0,0x1
    80200182:	a1a50513          	addi	a0,a0,-1510 # 80200b98 <etext+0x142>
    80200186:	f71ff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n",
            (end - kern_init + 1023) / 1024);
    8020018a:	00004597          	auipc	a1,0x4
    8020018e:	29558593          	addi	a1,a1,661 # 8020441f <end+0x3ff>
    80200192:	00000797          	auipc	a5,0x0
    80200196:	eba78793          	addi	a5,a5,-326 # 8020004c <kern_init>
    8020019a:	40f587b3          	sub	a5,a1,a5
    cprintf("Kernel executable memory footprint: %dKB\n",
    8020019e:	43f7d593          	srai	a1,a5,0x3f
}
    802001a2:	60a2                	ld	ra,8(sp)
    cprintf("Kernel executable memory footprint: %dKB\n",
    802001a4:	3ff5f593          	andi	a1,a1,1023
    802001a8:	95be                	add	a1,a1,a5
    802001aa:	85a9                	srai	a1,a1,0xa
    802001ac:	00001517          	auipc	a0,0x1
    802001b0:	a0c50513          	addi	a0,a0,-1524 # 80200bb8 <etext+0x162>
}
    802001b4:	0141                	addi	sp,sp,16
    cprintf("Kernel executable memory footprint: %dKB\n",
    802001b6:	b781                	j	802000f6 <cprintf>

00000000802001b8 <clock_set_next_event>:
volatile size_t ticks;

static inline uint64_t get_cycles(void) {
#if __riscv_xlen == 64
    uint64_t n;
    __asm__ __volatile__("rdtime %0" : "=r"(n));
    802001b8:	c0102573          	rdtime	a0
    ticks = 0;

    cprintf("++ setup timer interrupts\n");
}

void clock_set_next_event(void) { sbi_set_timer(get_cycles() + timebase); }
    802001bc:	67e1                	lui	a5,0x18
    802001be:	6a078793          	addi	a5,a5,1696 # 186a0 <BASE_ADDRESS-0x801e7960>
    802001c2:	953e                	add	a0,a0,a5
    802001c4:	0770006f          	j	80200a3a <sbi_set_timer>

00000000802001c8 <cons_init>:

/* serial_intr - try to feed input characters from serial port */
void serial_intr(void) {}

/* cons_init - initializes the console devices */
void cons_init(void) {}
    802001c8:	8082                	ret

00000000802001ca <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void cons_putc(int c) { sbi_console_putchar((unsigned char)c); }
    802001ca:	0ff57513          	andi	a0,a0,255
    802001ce:	0510006f          	j	80200a1e <sbi_console_putchar>

00000000802001d2 <intr_enable>:
#include <intr.h>
#include <riscv.h>

/* intr_enable - enable irq interrupt */
void intr_enable(void) { set_csr(sstatus, SSTATUS_SIE); }
    802001d2:	100167f3          	csrrsi	a5,sstatus,2
    802001d6:	8082                	ret

00000000802001d8 <idt_init>:
 */
void idt_init(void) {
    extern void __alltraps(void);
    /* Set sscratch register to 0, indicating to exception vector that we are
     * presently executing in the kernel */
    write_csr(sscratch, 0);
    802001d8:	14005073          	csrwi	sscratch,0
    /* Set the exception vector address */
    write_csr(stvec, &__alltraps);
    802001dc:	00000797          	auipc	a5,0x0
    802001e0:	36878793          	addi	a5,a5,872 # 80200544 <__alltraps>
    802001e4:	10579073          	csrw	stvec,a5
}
    802001e8:	8082                	ret

00000000802001ea <print_regs>:
    cprintf("  badvaddr 0x%08x\n", tf->badvaddr);
    cprintf("  cause    0x%08x\n", tf->cause);
}

void print_regs(struct pushregs *gpr) {
    cprintf("  zero     0x%08x\n", gpr->zero);
    802001ea:	610c                	ld	a1,0(a0)
void print_regs(struct pushregs *gpr) {
    802001ec:	1141                	addi	sp,sp,-16
    802001ee:	e022                	sd	s0,0(sp)
    802001f0:	842a                	mv	s0,a0
    cprintf("  zero     0x%08x\n", gpr->zero);
    802001f2:	00001517          	auipc	a0,0x1
    802001f6:	b2650513          	addi	a0,a0,-1242 # 80200d18 <etext+0x2c2>
void print_regs(struct pushregs *gpr) {
    802001fa:	e406                	sd	ra,8(sp)
    cprintf("  zero     0x%08x\n", gpr->zero);
    802001fc:	efbff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  ra       0x%08x\n", gpr->ra);
    80200200:	640c                	ld	a1,8(s0)
    80200202:	00001517          	auipc	a0,0x1
    80200206:	b2e50513          	addi	a0,a0,-1234 # 80200d30 <etext+0x2da>
    8020020a:	eedff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  sp       0x%08x\n", gpr->sp);
    8020020e:	680c                	ld	a1,16(s0)
    80200210:	00001517          	auipc	a0,0x1
    80200214:	b3850513          	addi	a0,a0,-1224 # 80200d48 <etext+0x2f2>
    80200218:	edfff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  gp       0x%08x\n", gpr->gp);
    8020021c:	6c0c                	ld	a1,24(s0)
    8020021e:	00001517          	auipc	a0,0x1
    80200222:	b4250513          	addi	a0,a0,-1214 # 80200d60 <etext+0x30a>
    80200226:	ed1ff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  tp       0x%08x\n", gpr->tp);
    8020022a:	700c                	ld	a1,32(s0)
    8020022c:	00001517          	auipc	a0,0x1
    80200230:	b4c50513          	addi	a0,a0,-1204 # 80200d78 <etext+0x322>
    80200234:	ec3ff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  t0       0x%08x\n", gpr->t0);
    80200238:	740c                	ld	a1,40(s0)
    8020023a:	00001517          	auipc	a0,0x1
    8020023e:	b5650513          	addi	a0,a0,-1194 # 80200d90 <etext+0x33a>
    80200242:	eb5ff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  t1       0x%08x\n", gpr->t1);
    80200246:	780c                	ld	a1,48(s0)
    80200248:	00001517          	auipc	a0,0x1
    8020024c:	b6050513          	addi	a0,a0,-1184 # 80200da8 <etext+0x352>
    80200250:	ea7ff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  t2       0x%08x\n", gpr->t2);
    80200254:	7c0c                	ld	a1,56(s0)
    80200256:	00001517          	auipc	a0,0x1
    8020025a:	b6a50513          	addi	a0,a0,-1174 # 80200dc0 <etext+0x36a>
    8020025e:	e99ff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  s0       0x%08x\n", gpr->s0);
    80200262:	602c                	ld	a1,64(s0)
    80200264:	00001517          	auipc	a0,0x1
    80200268:	b7450513          	addi	a0,a0,-1164 # 80200dd8 <etext+0x382>
    8020026c:	e8bff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  s1       0x%08x\n", gpr->s1);
    80200270:	642c                	ld	a1,72(s0)
    80200272:	00001517          	auipc	a0,0x1
    80200276:	b7e50513          	addi	a0,a0,-1154 # 80200df0 <etext+0x39a>
    8020027a:	e7dff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  a0       0x%08x\n", gpr->a0);
    8020027e:	682c                	ld	a1,80(s0)
    80200280:	00001517          	auipc	a0,0x1
    80200284:	b8850513          	addi	a0,a0,-1144 # 80200e08 <etext+0x3b2>
    80200288:	e6fff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  a1       0x%08x\n", gpr->a1);
    8020028c:	6c2c                	ld	a1,88(s0)
    8020028e:	00001517          	auipc	a0,0x1
    80200292:	b9250513          	addi	a0,a0,-1134 # 80200e20 <etext+0x3ca>
    80200296:	e61ff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  a2       0x%08x\n", gpr->a2);
    8020029a:	702c                	ld	a1,96(s0)
    8020029c:	00001517          	auipc	a0,0x1
    802002a0:	b9c50513          	addi	a0,a0,-1124 # 80200e38 <etext+0x3e2>
    802002a4:	e53ff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  a3       0x%08x\n", gpr->a3);
    802002a8:	742c                	ld	a1,104(s0)
    802002aa:	00001517          	auipc	a0,0x1
    802002ae:	ba650513          	addi	a0,a0,-1114 # 80200e50 <etext+0x3fa>
    802002b2:	e45ff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  a4       0x%08x\n", gpr->a4);
    802002b6:	782c                	ld	a1,112(s0)
    802002b8:	00001517          	auipc	a0,0x1
    802002bc:	bb050513          	addi	a0,a0,-1104 # 80200e68 <etext+0x412>
    802002c0:	e37ff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  a5       0x%08x\n", gpr->a5);
    802002c4:	7c2c                	ld	a1,120(s0)
    802002c6:	00001517          	auipc	a0,0x1
    802002ca:	bba50513          	addi	a0,a0,-1094 # 80200e80 <etext+0x42a>
    802002ce:	e29ff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  a6       0x%08x\n", gpr->a6);
    802002d2:	604c                	ld	a1,128(s0)
    802002d4:	00001517          	auipc	a0,0x1
    802002d8:	bc450513          	addi	a0,a0,-1084 # 80200e98 <etext+0x442>
    802002dc:	e1bff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  a7       0x%08x\n", gpr->a7);
    802002e0:	644c                	ld	a1,136(s0)
    802002e2:	00001517          	auipc	a0,0x1
    802002e6:	bce50513          	addi	a0,a0,-1074 # 80200eb0 <etext+0x45a>
    802002ea:	e0dff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  s2       0x%08x\n", gpr->s2);
    802002ee:	684c                	ld	a1,144(s0)
    802002f0:	00001517          	auipc	a0,0x1
    802002f4:	bd850513          	addi	a0,a0,-1064 # 80200ec8 <etext+0x472>
    802002f8:	dffff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  s3       0x%08x\n", gpr->s3);
    802002fc:	6c4c                	ld	a1,152(s0)
    802002fe:	00001517          	auipc	a0,0x1
    80200302:	be250513          	addi	a0,a0,-1054 # 80200ee0 <etext+0x48a>
    80200306:	df1ff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  s4       0x%08x\n", gpr->s4);
    8020030a:	704c                	ld	a1,160(s0)
    8020030c:	00001517          	auipc	a0,0x1
    80200310:	bec50513          	addi	a0,a0,-1044 # 80200ef8 <etext+0x4a2>
    80200314:	de3ff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  s5       0x%08x\n", gpr->s5);
    80200318:	744c                	ld	a1,168(s0)
    8020031a:	00001517          	auipc	a0,0x1
    8020031e:	bf650513          	addi	a0,a0,-1034 # 80200f10 <etext+0x4ba>
    80200322:	dd5ff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  s6       0x%08x\n", gpr->s6);
    80200326:	784c                	ld	a1,176(s0)
    80200328:	00001517          	auipc	a0,0x1
    8020032c:	c0050513          	addi	a0,a0,-1024 # 80200f28 <etext+0x4d2>
    80200330:	dc7ff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  s7       0x%08x\n", gpr->s7);
    80200334:	7c4c                	ld	a1,184(s0)
    80200336:	00001517          	auipc	a0,0x1
    8020033a:	c0a50513          	addi	a0,a0,-1014 # 80200f40 <etext+0x4ea>
    8020033e:	db9ff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  s8       0x%08x\n", gpr->s8);
    80200342:	606c                	ld	a1,192(s0)
    80200344:	00001517          	auipc	a0,0x1
    80200348:	c1450513          	addi	a0,a0,-1004 # 80200f58 <etext+0x502>
    8020034c:	dabff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  s9       0x%08x\n", gpr->s9);
    80200350:	646c                	ld	a1,200(s0)
    80200352:	00001517          	auipc	a0,0x1
    80200356:	c1e50513          	addi	a0,a0,-994 # 80200f70 <etext+0x51a>
    8020035a:	d9dff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  s10      0x%08x\n", gpr->s10);
    8020035e:	686c                	ld	a1,208(s0)
    80200360:	00001517          	auipc	a0,0x1
    80200364:	c2850513          	addi	a0,a0,-984 # 80200f88 <etext+0x532>
    80200368:	d8fff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  s11      0x%08x\n", gpr->s11);
    8020036c:	6c6c                	ld	a1,216(s0)
    8020036e:	00001517          	auipc	a0,0x1
    80200372:	c3250513          	addi	a0,a0,-974 # 80200fa0 <etext+0x54a>
    80200376:	d81ff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  t3       0x%08x\n", gpr->t3);
    8020037a:	706c                	ld	a1,224(s0)
    8020037c:	00001517          	auipc	a0,0x1
    80200380:	c3c50513          	addi	a0,a0,-964 # 80200fb8 <etext+0x562>
    80200384:	d73ff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  t4       0x%08x\n", gpr->t4);
    80200388:	746c                	ld	a1,232(s0)
    8020038a:	00001517          	auipc	a0,0x1
    8020038e:	c4650513          	addi	a0,a0,-954 # 80200fd0 <etext+0x57a>
    80200392:	d65ff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  t5       0x%08x\n", gpr->t5);
    80200396:	786c                	ld	a1,240(s0)
    80200398:	00001517          	auipc	a0,0x1
    8020039c:	c5050513          	addi	a0,a0,-944 # 80200fe8 <etext+0x592>
    802003a0:	d57ff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  t6       0x%08x\n", gpr->t6);
    802003a4:	7c6c                	ld	a1,248(s0)
}
    802003a6:	6402                	ld	s0,0(sp)
    802003a8:	60a2                	ld	ra,8(sp)
    cprintf("  t6       0x%08x\n", gpr->t6);
    802003aa:	00001517          	auipc	a0,0x1
    802003ae:	c5650513          	addi	a0,a0,-938 # 80201000 <etext+0x5aa>
}
    802003b2:	0141                	addi	sp,sp,16
    cprintf("  t6       0x%08x\n", gpr->t6);
    802003b4:	b389                	j	802000f6 <cprintf>

00000000802003b6 <print_trapframe>:
void print_trapframe(struct trapframe *tf) {
    802003b6:	1141                	addi	sp,sp,-16
    802003b8:	e022                	sd	s0,0(sp)
    cprintf("trapframe at %p\n", tf);
    802003ba:	85aa                	mv	a1,a0
void print_trapframe(struct trapframe *tf) {
    802003bc:	842a                	mv	s0,a0
    cprintf("trapframe at %p\n", tf);
    802003be:	00001517          	auipc	a0,0x1
    802003c2:	c5a50513          	addi	a0,a0,-934 # 80201018 <etext+0x5c2>
void print_trapframe(struct trapframe *tf) {
    802003c6:	e406                	sd	ra,8(sp)
    cprintf("trapframe at %p\n", tf);
    802003c8:	d2fff0ef          	jal	ra,802000f6 <cprintf>
    print_regs(&tf->gpr);
    802003cc:	8522                	mv	a0,s0
    802003ce:	e1dff0ef          	jal	ra,802001ea <print_regs>
    cprintf("  status   0x%08x\n", tf->status);
    802003d2:	10043583          	ld	a1,256(s0)
    802003d6:	00001517          	auipc	a0,0x1
    802003da:	c5a50513          	addi	a0,a0,-934 # 80201030 <etext+0x5da>
    802003de:	d19ff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  epc      0x%08x\n", tf->epc);
    802003e2:	10843583          	ld	a1,264(s0)
    802003e6:	00001517          	auipc	a0,0x1
    802003ea:	c6250513          	addi	a0,a0,-926 # 80201048 <etext+0x5f2>
    802003ee:	d09ff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  badvaddr 0x%08x\n", tf->badvaddr);
    802003f2:	11043583          	ld	a1,272(s0)
    802003f6:	00001517          	auipc	a0,0x1
    802003fa:	c6a50513          	addi	a0,a0,-918 # 80201060 <etext+0x60a>
    802003fe:	cf9ff0ef          	jal	ra,802000f6 <cprintf>
    cprintf("  cause    0x%08x\n", tf->cause);
    80200402:	11843583          	ld	a1,280(s0)
}
    80200406:	6402                	ld	s0,0(sp)
    80200408:	60a2                	ld	ra,8(sp)
    cprintf("  cause    0x%08x\n", tf->cause);
    8020040a:	00001517          	auipc	a0,0x1
    8020040e:	c6e50513          	addi	a0,a0,-914 # 80201078 <etext+0x622>
}
    80200412:	0141                	addi	sp,sp,16
    cprintf("  cause    0x%08x\n", tf->cause);
    80200414:	b1cd                	j	802000f6 <cprintf>

0000000080200416 <interrupt_handler>:

void interrupt_handler(struct trapframe *tf) {
    intptr_t cause = (tf->cause << 1) >> 1;
    80200416:	11853783          	ld	a5,280(a0)
    switch (cause) {
    8020041a:	472d                	li	a4,11
    intptr_t cause = (tf->cause << 1) >> 1;
    8020041c:	0786                	slli	a5,a5,0x1
    8020041e:	8385                	srli	a5,a5,0x1
    switch (cause) {
    80200420:	06f76a63          	bltu	a4,a5,80200494 <interrupt_handler+0x7e>
    80200424:	00000717          	auipc	a4,0x0
    80200428:	7c070713          	addi	a4,a4,1984 # 80200be4 <etext+0x18e>
    8020042c:	078a                	slli	a5,a5,0x2
    8020042e:	97ba                	add	a5,a5,a4
    80200430:	439c                	lw	a5,0(a5)
    80200432:	97ba                	add	a5,a5,a4
    80200434:	8782                	jr	a5
            break;
        case IRQ_H_SOFT:
            cprintf("Hypervisor software interrupt\n");
            break;
        case IRQ_M_SOFT:
            cprintf("Machine software interrupt\n");
    80200436:	00001517          	auipc	a0,0x1
    8020043a:	89250513          	addi	a0,a0,-1902 # 80200cc8 <etext+0x272>
    8020043e:	b965                	j	802000f6 <cprintf>
            cprintf("Hypervisor software interrupt\n");
    80200440:	00001517          	auipc	a0,0x1
    80200444:	86850513          	addi	a0,a0,-1944 # 80200ca8 <etext+0x252>
    80200448:	b17d                	j	802000f6 <cprintf>
            cprintf("User software interrupt\n");
    8020044a:	00001517          	auipc	a0,0x1
    8020044e:	81e50513          	addi	a0,a0,-2018 # 80200c68 <etext+0x212>
    80200452:	b155                	j	802000f6 <cprintf>
            cprintf("Supervisor software interrupt\n");
    80200454:	00001517          	auipc	a0,0x1
    80200458:	83450513          	addi	a0,a0,-1996 # 80200c88 <etext+0x232>
    8020045c:	b969                	j	802000f6 <cprintf>
            break;
        case IRQ_U_EXT:
            cprintf("User software interrupt\n");
            break;
        case IRQ_S_EXT:
            cprintf("Supervisor external interrupt\n");
    8020045e:	00001517          	auipc	a0,0x1
    80200462:	89a50513          	addi	a0,a0,-1894 # 80200cf8 <etext+0x2a2>
    80200466:	b941                	j	802000f6 <cprintf>
void interrupt_handler(struct trapframe *tf) {
    80200468:	1141                	addi	sp,sp,-16
    8020046a:	e406                	sd	ra,8(sp)
            clock_set_next_event();
    8020046c:	d4dff0ef          	jal	ra,802001b8 <clock_set_next_event>
            if (++ticks % TICK_NUM == 0) {
    80200470:	00004797          	auipc	a5,0x4
    80200474:	ba878793          	addi	a5,a5,-1112 # 80204018 <ticks>
    80200478:	639c                	ld	a5,0(a5)
    8020047a:	06400713          	li	a4,100
    8020047e:	0785                	addi	a5,a5,1
    80200480:	02e7f733          	remu	a4,a5,a4
    80200484:	00004697          	auipc	a3,0x4
    80200488:	b8f6ba23          	sd	a5,-1132(a3) # 80204018 <ticks>
    8020048c:	c709                	beqz	a4,80200496 <interrupt_handler+0x80>
            break;
        default:
            print_trapframe(tf);
            break;
    }
}
    8020048e:	60a2                	ld	ra,8(sp)
    80200490:	0141                	addi	sp,sp,16
    80200492:	8082                	ret
            print_trapframe(tf);
    80200494:	b70d                	j	802003b6 <print_trapframe>
}
    80200496:	60a2                	ld	ra,8(sp)
    cprintf("%d ticks\n", TICK_NUM);
    80200498:	06400593          	li	a1,100
    8020049c:	00001517          	auipc	a0,0x1
    802004a0:	84c50513          	addi	a0,a0,-1972 # 80200ce8 <etext+0x292>
}
    802004a4:	0141                	addi	sp,sp,16
    cprintf("%d ticks\n", TICK_NUM);
    802004a6:	b981                	j	802000f6 <cprintf>

00000000802004a8 <exception_handler>:

void exception_handler(struct trapframe *tf) {
    switch (tf->cause) {
    802004a8:	11853783          	ld	a5,280(a0)
    802004ac:	46ad                	li	a3,11
    802004ae:	06f6e163          	bltu	a3,a5,80200510 <exception_handler+0x68>
    802004b2:	00000717          	auipc	a4,0x0
    802004b6:	76270713          	addi	a4,a4,1890 # 80200c14 <etext+0x1be>
    802004ba:	078a                	slli	a5,a5,0x2
    802004bc:	97ba                	add	a5,a5,a4
    802004be:	439c                	lw	a5,0(a5)
void exception_handler(struct trapframe *tf) {
    802004c0:	1141                	addi	sp,sp,-16
    802004c2:	e022                	sd	s0,0(sp)
    802004c4:	e406                	sd	ra,8(sp)
    switch (tf->cause) {
    802004c6:	97ba                	add	a5,a5,a4
    802004c8:	842a                	mv	s0,a0
    802004ca:	8782                	jr	a5
        case CAUSE_MISALIGNED_FETCH:
            break;
        case CAUSE_FAULT_FETCH:
            break;
        case CAUSE_ILLEGAL_INSTRUCTION:
            cprintf("ebreak caught at 0x%016llx\n", tf->epc);
    802004cc:	10853583          	ld	a1,264(a0)
    802004d0:	00000517          	auipc	a0,0x0
    802004d4:	77850513          	addi	a0,a0,1912 # 80200c48 <etext+0x1f2>
    802004d8:	c1fff0ef          	jal	ra,802000f6 <cprintf>
            tf->epc += 4;
    802004dc:	10843783          	ld	a5,264(s0)
    802004e0:	0791                	addi	a5,a5,4
    802004e2:	10f43423          	sd	a5,264(s0)
            break;
        default:
            print_trapframe(tf);
            break;
    }
}
    802004e6:	60a2                	ld	ra,8(sp)
    802004e8:	6402                	ld	s0,0(sp)
    802004ea:	0141                	addi	sp,sp,16
    802004ec:	8082                	ret
            cprintf("ebreak caught at 0x%016llx\n", tf->epc);
    802004ee:	10853583          	ld	a1,264(a0)
    802004f2:	00000517          	auipc	a0,0x0
    802004f6:	75650513          	addi	a0,a0,1878 # 80200c48 <etext+0x1f2>
    802004fa:	bfdff0ef          	jal	ra,802000f6 <cprintf>
            tf->epc += 2;
    802004fe:	10843783          	ld	a5,264(s0)
}
    80200502:	60a2                	ld	ra,8(sp)
            tf->epc += 2;
    80200504:	0789                	addi	a5,a5,2
    80200506:	10f43423          	sd	a5,264(s0)
}
    8020050a:	6402                	ld	s0,0(sp)
    8020050c:	0141                	addi	sp,sp,16
    8020050e:	8082                	ret
            print_trapframe(tf);
    80200510:	b55d                	j	802003b6 <print_trapframe>

0000000080200512 <trap>:
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void trap(struct trapframe *tf) 
{   
    cprintf("---%d---\n",tf->cause);
    80200512:	11853583          	ld	a1,280(a0)
{   
    80200516:	1141                	addi	sp,sp,-16
    80200518:	e022                	sd	s0,0(sp)
    8020051a:	842a                	mv	s0,a0
    cprintf("---%d---\n",tf->cause);
    8020051c:	00001517          	auipc	a0,0x1
    80200520:	b7450513          	addi	a0,a0,-1164 # 80201090 <etext+0x63a>
{   
    80200524:	e406                	sd	ra,8(sp)
    cprintf("---%d---\n",tf->cause);
    80200526:	bd1ff0ef          	jal	ra,802000f6 <cprintf>
    if ((intptr_t)tf->cause < 0) {
    8020052a:	11843783          	ld	a5,280(s0)
        interrupt_handler(tf);
    8020052e:	8522                	mv	a0,s0
    if ((intptr_t)tf->cause < 0) {
    80200530:	0007c663          	bltz	a5,8020053c <trap+0x2a>
    trap_dispatch(tf); 
}
    80200534:	6402                	ld	s0,0(sp)
    80200536:	60a2                	ld	ra,8(sp)
    80200538:	0141                	addi	sp,sp,16
        exception_handler(tf);
    8020053a:	b7bd                	j	802004a8 <exception_handler>
}
    8020053c:	6402                	ld	s0,0(sp)
    8020053e:	60a2                	ld	ra,8(sp)
    80200540:	0141                	addi	sp,sp,16
        interrupt_handler(tf);
    80200542:	bdd1                	j	80200416 <interrupt_handler>

0000000080200544 <__alltraps>:
    .endm

    .globl __alltraps
.align(2)
__alltraps:
    SAVE_ALL
    80200544:	14011073          	csrw	sscratch,sp
    80200548:	712d                	addi	sp,sp,-288
    8020054a:	e002                	sd	zero,0(sp)
    8020054c:	e406                	sd	ra,8(sp)
    8020054e:	ec0e                	sd	gp,24(sp)
    80200550:	f012                	sd	tp,32(sp)
    80200552:	f416                	sd	t0,40(sp)
    80200554:	f81a                	sd	t1,48(sp)
    80200556:	fc1e                	sd	t2,56(sp)
    80200558:	e0a2                	sd	s0,64(sp)
    8020055a:	e4a6                	sd	s1,72(sp)
    8020055c:	e8aa                	sd	a0,80(sp)
    8020055e:	ecae                	sd	a1,88(sp)
    80200560:	f0b2                	sd	a2,96(sp)
    80200562:	f4b6                	sd	a3,104(sp)
    80200564:	f8ba                	sd	a4,112(sp)
    80200566:	fcbe                	sd	a5,120(sp)
    80200568:	e142                	sd	a6,128(sp)
    8020056a:	e546                	sd	a7,136(sp)
    8020056c:	e94a                	sd	s2,144(sp)
    8020056e:	ed4e                	sd	s3,152(sp)
    80200570:	f152                	sd	s4,160(sp)
    80200572:	f556                	sd	s5,168(sp)
    80200574:	f95a                	sd	s6,176(sp)
    80200576:	fd5e                	sd	s7,184(sp)
    80200578:	e1e2                	sd	s8,192(sp)
    8020057a:	e5e6                	sd	s9,200(sp)
    8020057c:	e9ea                	sd	s10,208(sp)
    8020057e:	edee                	sd	s11,216(sp)
    80200580:	f1f2                	sd	t3,224(sp)
    80200582:	f5f6                	sd	t4,232(sp)
    80200584:	f9fa                	sd	t5,240(sp)
    80200586:	fdfe                	sd	t6,248(sp)
    80200588:	14001473          	csrrw	s0,sscratch,zero
    8020058c:	100024f3          	csrr	s1,sstatus
    80200590:	14102973          	csrr	s2,sepc
    80200594:	143029f3          	csrr	s3,stval
    80200598:	14202a73          	csrr	s4,scause
    8020059c:	e822                	sd	s0,16(sp)
    8020059e:	e226                	sd	s1,256(sp)
    802005a0:	e64a                	sd	s2,264(sp)
    802005a2:	ea4e                	sd	s3,272(sp)
    802005a4:	ee52                	sd	s4,280(sp)

    move  a0, sp
    802005a6:	850a                	mv	a0,sp
    jal trap
    802005a8:	f6bff0ef          	jal	ra,80200512 <trap>

00000000802005ac <__trapret>:
    # sp should be the same as before "jal trap"

    .globl __trapret
__trapret:
    RESTORE_ALL
    802005ac:	6492                	ld	s1,256(sp)
    802005ae:	6932                	ld	s2,264(sp)
    802005b0:	10049073          	csrw	sstatus,s1
    802005b4:	14191073          	csrw	sepc,s2
    802005b8:	60a2                	ld	ra,8(sp)
    802005ba:	61e2                	ld	gp,24(sp)
    802005bc:	7202                	ld	tp,32(sp)
    802005be:	72a2                	ld	t0,40(sp)
    802005c0:	7342                	ld	t1,48(sp)
    802005c2:	73e2                	ld	t2,56(sp)
    802005c4:	6406                	ld	s0,64(sp)
    802005c6:	64a6                	ld	s1,72(sp)
    802005c8:	6546                	ld	a0,80(sp)
    802005ca:	65e6                	ld	a1,88(sp)
    802005cc:	7606                	ld	a2,96(sp)
    802005ce:	76a6                	ld	a3,104(sp)
    802005d0:	7746                	ld	a4,112(sp)
    802005d2:	77e6                	ld	a5,120(sp)
    802005d4:	680a                	ld	a6,128(sp)
    802005d6:	68aa                	ld	a7,136(sp)
    802005d8:	694a                	ld	s2,144(sp)
    802005da:	69ea                	ld	s3,152(sp)
    802005dc:	7a0a                	ld	s4,160(sp)
    802005de:	7aaa                	ld	s5,168(sp)
    802005e0:	7b4a                	ld	s6,176(sp)
    802005e2:	7bea                	ld	s7,184(sp)
    802005e4:	6c0e                	ld	s8,192(sp)
    802005e6:	6cae                	ld	s9,200(sp)
    802005e8:	6d4e                	ld	s10,208(sp)
    802005ea:	6dee                	ld	s11,216(sp)
    802005ec:	7e0e                	ld	t3,224(sp)
    802005ee:	7eae                	ld	t4,232(sp)
    802005f0:	7f4e                	ld	t5,240(sp)
    802005f2:	7fee                	ld	t6,248(sp)
    802005f4:	6142                	ld	sp,16(sp)
    # return from supervisor call
    sret
    802005f6:	10200073          	sret

00000000802005fa <strnlen>:
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
    while (cnt < len && *s ++ != '\0') {
    802005fa:	c185                	beqz	a1,8020061a <strnlen+0x20>
    802005fc:	00054783          	lbu	a5,0(a0)
    80200600:	cf89                	beqz	a5,8020061a <strnlen+0x20>
    size_t cnt = 0;
    80200602:	4781                	li	a5,0
    80200604:	a021                	j	8020060c <strnlen+0x12>
    while (cnt < len && *s ++ != '\0') {
    80200606:	00074703          	lbu	a4,0(a4)
    8020060a:	c711                	beqz	a4,80200616 <strnlen+0x1c>
        cnt ++;
    8020060c:	0785                	addi	a5,a5,1
    while (cnt < len && *s ++ != '\0') {
    8020060e:	00f50733          	add	a4,a0,a5
    80200612:	fef59ae3          	bne	a1,a5,80200606 <strnlen+0xc>
    }
    return cnt;
}
    80200616:	853e                	mv	a0,a5
    80200618:	8082                	ret
    size_t cnt = 0;
    8020061a:	4781                	li	a5,0
}
    8020061c:	853e                	mv	a0,a5
    8020061e:	8082                	ret

0000000080200620 <memset>:
memset(void *s, char c, size_t n) {
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
#else
    char *p = s;
    while (n -- > 0) {
    80200620:	ca01                	beqz	a2,80200630 <memset+0x10>
    80200622:	962a                	add	a2,a2,a0
    char *p = s;
    80200624:	87aa                	mv	a5,a0
        *p ++ = c;
    80200626:	0785                	addi	a5,a5,1
    80200628:	feb78fa3          	sb	a1,-1(a5)
    while (n -- > 0) {
    8020062c:	fec79de3          	bne	a5,a2,80200626 <memset+0x6>
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
    80200630:	8082                	ret

0000000080200632 <printnum>:
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
    unsigned long long result = num;
    unsigned mod = do_div(result, base);
    80200632:	02069813          	slli	a6,a3,0x20
        unsigned long long num, unsigned base, int width, int padc) {
    80200636:	7179                	addi	sp,sp,-48
    unsigned mod = do_div(result, base);
    80200638:	02085813          	srli	a6,a6,0x20
        unsigned long long num, unsigned base, int width, int padc) {
    8020063c:	e052                	sd	s4,0(sp)
    unsigned mod = do_div(result, base);
    8020063e:	03067a33          	remu	s4,a2,a6
        unsigned long long num, unsigned base, int width, int padc) {
    80200642:	f022                	sd	s0,32(sp)
    80200644:	ec26                	sd	s1,24(sp)
    80200646:	e84a                	sd	s2,16(sp)
    80200648:	f406                	sd	ra,40(sp)
    8020064a:	e44e                	sd	s3,8(sp)
    8020064c:	84aa                	mv	s1,a0
    8020064e:	892e                	mv	s2,a1
    80200650:	fff7041b          	addiw	s0,a4,-1
    unsigned mod = do_div(result, base);
    80200654:	2a01                	sext.w	s4,s4

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
    80200656:	03067e63          	bgeu	a2,a6,80200692 <printnum+0x60>
    8020065a:	89be                	mv	s3,a5
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
    8020065c:	00805763          	blez	s0,8020066a <printnum+0x38>
    80200660:	347d                	addiw	s0,s0,-1
            putch(padc, putdat);
    80200662:	85ca                	mv	a1,s2
    80200664:	854e                	mv	a0,s3
    80200666:	9482                	jalr	s1
        while (-- width > 0)
    80200668:	fc65                	bnez	s0,80200660 <printnum+0x2e>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
    8020066a:	1a02                	slli	s4,s4,0x20
    8020066c:	020a5a13          	srli	s4,s4,0x20
    80200670:	00001797          	auipc	a5,0x1
    80200674:	bc078793          	addi	a5,a5,-1088 # 80201230 <error_string+0x38>
    80200678:	9a3e                	add	s4,s4,a5
}
    8020067a:	7402                	ld	s0,32(sp)
    putch("0123456789abcdef"[mod], putdat);
    8020067c:	000a4503          	lbu	a0,0(s4)
}
    80200680:	70a2                	ld	ra,40(sp)
    80200682:	69a2                	ld	s3,8(sp)
    80200684:	6a02                	ld	s4,0(sp)
    putch("0123456789abcdef"[mod], putdat);
    80200686:	85ca                	mv	a1,s2
    80200688:	8326                	mv	t1,s1
}
    8020068a:	6942                	ld	s2,16(sp)
    8020068c:	64e2                	ld	s1,24(sp)
    8020068e:	6145                	addi	sp,sp,48
    putch("0123456789abcdef"[mod], putdat);
    80200690:	8302                	jr	t1
        printnum(putch, putdat, result, base, width - 1, padc);
    80200692:	03065633          	divu	a2,a2,a6
    80200696:	8722                	mv	a4,s0
    80200698:	f9bff0ef          	jal	ra,80200632 <printnum>
    8020069c:	b7f9                	j	8020066a <printnum+0x38>

000000008020069e <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
    8020069e:	7119                	addi	sp,sp,-128
    802006a0:	f4a6                	sd	s1,104(sp)
    802006a2:	f0ca                	sd	s2,96(sp)
    802006a4:	e8d2                	sd	s4,80(sp)
    802006a6:	e4d6                	sd	s5,72(sp)
    802006a8:	e0da                	sd	s6,64(sp)
    802006aa:	fc5e                	sd	s7,56(sp)
    802006ac:	f862                	sd	s8,48(sp)
    802006ae:	f06a                	sd	s10,32(sp)
    802006b0:	fc86                	sd	ra,120(sp)
    802006b2:	f8a2                	sd	s0,112(sp)
    802006b4:	ecce                	sd	s3,88(sp)
    802006b6:	f466                	sd	s9,40(sp)
    802006b8:	ec6e                	sd	s11,24(sp)
    802006ba:	892a                	mv	s2,a0
    802006bc:	84ae                	mv	s1,a1
    802006be:	8d32                	mv	s10,a2
    802006c0:	8ab6                	mv	s5,a3
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
        width = precision = -1;
    802006c2:	5b7d                	li	s6,-1
        lflag = altflag = 0;

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
    802006c4:	00001a17          	auipc	s4,0x1
    802006c8:	9d8a0a13          	addi	s4,s4,-1576 # 8020109c <etext+0x646>
                for (width -= strnlen(p, precision); width > 0; width --) {
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
                if (altflag && (ch < ' ' || ch > '~')) {
    802006cc:	05e00b93          	li	s7,94
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
    802006d0:	00001c17          	auipc	s8,0x1
    802006d4:	b28c0c13          	addi	s8,s8,-1240 # 802011f8 <error_string>
        while ((ch = *(unsigned char *)fmt ++) != '%') {
    802006d8:	000d4503          	lbu	a0,0(s10)
    802006dc:	02500793          	li	a5,37
    802006e0:	001d0413          	addi	s0,s10,1
    802006e4:	00f50e63          	beq	a0,a5,80200700 <vprintfmt+0x62>
            if (ch == '\0') {
    802006e8:	c521                	beqz	a0,80200730 <vprintfmt+0x92>
        while ((ch = *(unsigned char *)fmt ++) != '%') {
    802006ea:	02500993          	li	s3,37
    802006ee:	a011                	j	802006f2 <vprintfmt+0x54>
            if (ch == '\0') {
    802006f0:	c121                	beqz	a0,80200730 <vprintfmt+0x92>
            putch(ch, putdat);
    802006f2:	85a6                	mv	a1,s1
        while ((ch = *(unsigned char *)fmt ++) != '%') {
    802006f4:	0405                	addi	s0,s0,1
            putch(ch, putdat);
    802006f6:	9902                	jalr	s2
        while ((ch = *(unsigned char *)fmt ++) != '%') {
    802006f8:	fff44503          	lbu	a0,-1(s0)
    802006fc:	ff351ae3          	bne	a0,s3,802006f0 <vprintfmt+0x52>
    80200700:	00044603          	lbu	a2,0(s0)
        char padc = ' ';
    80200704:	02000793          	li	a5,32
        lflag = altflag = 0;
    80200708:	4981                	li	s3,0
    8020070a:	4801                	li	a6,0
        width = precision = -1;
    8020070c:	5cfd                	li	s9,-1
    8020070e:	5dfd                	li	s11,-1
        switch (ch = *(unsigned char *)fmt ++) {
    80200710:	05500593          	li	a1,85
                if (ch < '0' || ch > '9') {
    80200714:	4525                	li	a0,9
        switch (ch = *(unsigned char *)fmt ++) {
    80200716:	fdd6069b          	addiw	a3,a2,-35
    8020071a:	0ff6f693          	andi	a3,a3,255
    8020071e:	00140d13          	addi	s10,s0,1
    80200722:	1ed5ef63          	bltu	a1,a3,80200920 <vprintfmt+0x282>
    80200726:	068a                	slli	a3,a3,0x2
    80200728:	96d2                	add	a3,a3,s4
    8020072a:	4294                	lw	a3,0(a3)
    8020072c:	96d2                	add	a3,a3,s4
    8020072e:	8682                	jr	a3
            for (fmt --; fmt[-1] != '%'; fmt --)
                /* do nothing */;
            break;
        }
    }
}
    80200730:	70e6                	ld	ra,120(sp)
    80200732:	7446                	ld	s0,112(sp)
    80200734:	74a6                	ld	s1,104(sp)
    80200736:	7906                	ld	s2,96(sp)
    80200738:	69e6                	ld	s3,88(sp)
    8020073a:	6a46                	ld	s4,80(sp)
    8020073c:	6aa6                	ld	s5,72(sp)
    8020073e:	6b06                	ld	s6,64(sp)
    80200740:	7be2                	ld	s7,56(sp)
    80200742:	7c42                	ld	s8,48(sp)
    80200744:	7ca2                	ld	s9,40(sp)
    80200746:	7d02                	ld	s10,32(sp)
    80200748:	6de2                	ld	s11,24(sp)
    8020074a:	6109                	addi	sp,sp,128
    8020074c:	8082                	ret
            padc = '-';
    8020074e:	87b2                	mv	a5,a2
        switch (ch = *(unsigned char *)fmt ++) {
    80200750:	00144603          	lbu	a2,1(s0)
    80200754:	846a                	mv	s0,s10
    80200756:	b7c1                	j	80200716 <vprintfmt+0x78>
            precision = va_arg(ap, int);
    80200758:	000aac83          	lw	s9,0(s5)
            goto process_precision;
    8020075c:	00144603          	lbu	a2,1(s0)
            precision = va_arg(ap, int);
    80200760:	0aa1                	addi	s5,s5,8
        switch (ch = *(unsigned char *)fmt ++) {
    80200762:	846a                	mv	s0,s10
            if (width < 0)
    80200764:	fa0dd9e3          	bgez	s11,80200716 <vprintfmt+0x78>
                width = precision, precision = -1;
    80200768:	8de6                	mv	s11,s9
    8020076a:	5cfd                	li	s9,-1
    8020076c:	b76d                	j	80200716 <vprintfmt+0x78>
            if (width < 0)
    8020076e:	fffdc693          	not	a3,s11
    80200772:	96fd                	srai	a3,a3,0x3f
    80200774:	00ddfdb3          	and	s11,s11,a3
    80200778:	00144603          	lbu	a2,1(s0)
    8020077c:	2d81                	sext.w	s11,s11
        switch (ch = *(unsigned char *)fmt ++) {
    8020077e:	846a                	mv	s0,s10
    80200780:	bf59                	j	80200716 <vprintfmt+0x78>
    if (lflag >= 2) {
    80200782:	4705                	li	a4,1
    80200784:	008a8593          	addi	a1,s5,8
    80200788:	01074463          	blt	a4,a6,80200790 <vprintfmt+0xf2>
    else if (lflag) {
    8020078c:	22080863          	beqz	a6,802009bc <vprintfmt+0x31e>
        return va_arg(*ap, unsigned long);
    80200790:	000ab603          	ld	a2,0(s5)
    80200794:	46c1                	li	a3,16
    80200796:	8aae                	mv	s5,a1
    80200798:	a291                	j	802008dc <vprintfmt+0x23e>
                precision = precision * 10 + ch - '0';
    8020079a:	fd060c9b          	addiw	s9,a2,-48
                ch = *fmt;
    8020079e:	00144603          	lbu	a2,1(s0)
        switch (ch = *(unsigned char *)fmt ++) {
    802007a2:	846a                	mv	s0,s10
                if (ch < '0' || ch > '9') {
    802007a4:	fd06069b          	addiw	a3,a2,-48
                ch = *fmt;
    802007a8:	0006089b          	sext.w	a7,a2
                if (ch < '0' || ch > '9') {
    802007ac:	fad56ce3          	bltu	a0,a3,80200764 <vprintfmt+0xc6>
            for (precision = 0; ; ++ fmt) {
    802007b0:	0405                	addi	s0,s0,1
                precision = precision * 10 + ch - '0';
    802007b2:	002c969b          	slliw	a3,s9,0x2
                ch = *fmt;
    802007b6:	00044603          	lbu	a2,0(s0)
                precision = precision * 10 + ch - '0';
    802007ba:	0196873b          	addw	a4,a3,s9
    802007be:	0017171b          	slliw	a4,a4,0x1
    802007c2:	0117073b          	addw	a4,a4,a7
                if (ch < '0' || ch > '9') {
    802007c6:	fd06069b          	addiw	a3,a2,-48
                precision = precision * 10 + ch - '0';
    802007ca:	fd070c9b          	addiw	s9,a4,-48
                ch = *fmt;
    802007ce:	0006089b          	sext.w	a7,a2
                if (ch < '0' || ch > '9') {
    802007d2:	fcd57fe3          	bgeu	a0,a3,802007b0 <vprintfmt+0x112>
    802007d6:	b779                	j	80200764 <vprintfmt+0xc6>
            putch(va_arg(ap, int), putdat);
    802007d8:	000aa503          	lw	a0,0(s5)
    802007dc:	85a6                	mv	a1,s1
    802007de:	0aa1                	addi	s5,s5,8
    802007e0:	9902                	jalr	s2
            break;
    802007e2:	bddd                	j	802006d8 <vprintfmt+0x3a>
    if (lflag >= 2) {
    802007e4:	4705                	li	a4,1
    802007e6:	008a8993          	addi	s3,s5,8
    802007ea:	01074463          	blt	a4,a6,802007f2 <vprintfmt+0x154>
    else if (lflag) {
    802007ee:	1c080463          	beqz	a6,802009b6 <vprintfmt+0x318>
        return va_arg(*ap, long);
    802007f2:	000ab403          	ld	s0,0(s5)
            if ((long long)num < 0) {
    802007f6:	1c044a63          	bltz	s0,802009ca <vprintfmt+0x32c>
            num = getint(&ap, lflag);
    802007fa:	8622                	mv	a2,s0
    802007fc:	8ace                	mv	s5,s3
    802007fe:	46a9                	li	a3,10
    80200800:	a8f1                	j	802008dc <vprintfmt+0x23e>
            err = va_arg(ap, int);
    80200802:	000aa783          	lw	a5,0(s5)
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
    80200806:	4719                	li	a4,6
            err = va_arg(ap, int);
    80200808:	0aa1                	addi	s5,s5,8
            if (err < 0) {
    8020080a:	41f7d69b          	sraiw	a3,a5,0x1f
    8020080e:	8fb5                	xor	a5,a5,a3
    80200810:	40d786bb          	subw	a3,a5,a3
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
    80200814:	12d74963          	blt	a4,a3,80200946 <vprintfmt+0x2a8>
    80200818:	00369793          	slli	a5,a3,0x3
    8020081c:	97e2                	add	a5,a5,s8
    8020081e:	639c                	ld	a5,0(a5)
    80200820:	12078363          	beqz	a5,80200946 <vprintfmt+0x2a8>
                printfmt(putch, putdat, "%s", p);
    80200824:	86be                	mv	a3,a5
    80200826:	00001617          	auipc	a2,0x1
    8020082a:	aba60613          	addi	a2,a2,-1350 # 802012e0 <error_string+0xe8>
    8020082e:	85a6                	mv	a1,s1
    80200830:	854a                	mv	a0,s2
    80200832:	1cc000ef          	jal	ra,802009fe <printfmt>
    80200836:	b54d                	j	802006d8 <vprintfmt+0x3a>
            if ((p = va_arg(ap, char *)) == NULL) {
    80200838:	000ab603          	ld	a2,0(s5)
    8020083c:	0aa1                	addi	s5,s5,8
    8020083e:	1a060163          	beqz	a2,802009e0 <vprintfmt+0x342>
            if (width > 0 && padc != '-') {
    80200842:	00160413          	addi	s0,a2,1
    80200846:	15b05763          	blez	s11,80200994 <vprintfmt+0x2f6>
    8020084a:	02d00593          	li	a1,45
    8020084e:	10b79d63          	bne	a5,a1,80200968 <vprintfmt+0x2ca>
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
    80200852:	00064783          	lbu	a5,0(a2)
    80200856:	0007851b          	sext.w	a0,a5
    8020085a:	c905                	beqz	a0,8020088a <vprintfmt+0x1ec>
    8020085c:	000cc563          	bltz	s9,80200866 <vprintfmt+0x1c8>
    80200860:	3cfd                	addiw	s9,s9,-1
    80200862:	036c8263          	beq	s9,s6,80200886 <vprintfmt+0x1e8>
                    putch('?', putdat);
    80200866:	85a6                	mv	a1,s1
                if (altflag && (ch < ' ' || ch > '~')) {
    80200868:	14098f63          	beqz	s3,802009c6 <vprintfmt+0x328>
    8020086c:	3781                	addiw	a5,a5,-32
    8020086e:	14fbfc63          	bgeu	s7,a5,802009c6 <vprintfmt+0x328>
                    putch('?', putdat);
    80200872:	03f00513          	li	a0,63
    80200876:	9902                	jalr	s2
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
    80200878:	0405                	addi	s0,s0,1
    8020087a:	fff44783          	lbu	a5,-1(s0)
    8020087e:	3dfd                	addiw	s11,s11,-1
    80200880:	0007851b          	sext.w	a0,a5
    80200884:	fd61                	bnez	a0,8020085c <vprintfmt+0x1be>
            for (; width > 0; width --) {
    80200886:	e5b059e3          	blez	s11,802006d8 <vprintfmt+0x3a>
    8020088a:	3dfd                	addiw	s11,s11,-1
                putch(' ', putdat);
    8020088c:	85a6                	mv	a1,s1
    8020088e:	02000513          	li	a0,32
    80200892:	9902                	jalr	s2
            for (; width > 0; width --) {
    80200894:	e40d82e3          	beqz	s11,802006d8 <vprintfmt+0x3a>
    80200898:	3dfd                	addiw	s11,s11,-1
                putch(' ', putdat);
    8020089a:	85a6                	mv	a1,s1
    8020089c:	02000513          	li	a0,32
    802008a0:	9902                	jalr	s2
            for (; width > 0; width --) {
    802008a2:	fe0d94e3          	bnez	s11,8020088a <vprintfmt+0x1ec>
    802008a6:	bd0d                	j	802006d8 <vprintfmt+0x3a>
    if (lflag >= 2) {
    802008a8:	4705                	li	a4,1
    802008aa:	008a8593          	addi	a1,s5,8
    802008ae:	01074463          	blt	a4,a6,802008b6 <vprintfmt+0x218>
    else if (lflag) {
    802008b2:	0e080863          	beqz	a6,802009a2 <vprintfmt+0x304>
        return va_arg(*ap, unsigned long);
    802008b6:	000ab603          	ld	a2,0(s5)
    802008ba:	46a1                	li	a3,8
    802008bc:	8aae                	mv	s5,a1
    802008be:	a839                	j	802008dc <vprintfmt+0x23e>
            putch('0', putdat);
    802008c0:	03000513          	li	a0,48
    802008c4:	85a6                	mv	a1,s1
    802008c6:	e03e                	sd	a5,0(sp)
    802008c8:	9902                	jalr	s2
            putch('x', putdat);
    802008ca:	85a6                	mv	a1,s1
    802008cc:	07800513          	li	a0,120
    802008d0:	9902                	jalr	s2
            num = (unsigned long long)va_arg(ap, void *);
    802008d2:	0aa1                	addi	s5,s5,8
    802008d4:	ff8ab603          	ld	a2,-8(s5)
            goto number;
    802008d8:	6782                	ld	a5,0(sp)
    802008da:	46c1                	li	a3,16
            printnum(putch, putdat, num, base, width, padc);
    802008dc:	2781                	sext.w	a5,a5
    802008de:	876e                	mv	a4,s11
    802008e0:	85a6                	mv	a1,s1
    802008e2:	854a                	mv	a0,s2
    802008e4:	d4fff0ef          	jal	ra,80200632 <printnum>
            break;
    802008e8:	bbc5                	j	802006d8 <vprintfmt+0x3a>
            lflag ++;
    802008ea:	00144603          	lbu	a2,1(s0)
    802008ee:	2805                	addiw	a6,a6,1
        switch (ch = *(unsigned char *)fmt ++) {
    802008f0:	846a                	mv	s0,s10
            goto reswitch;
    802008f2:	b515                	j	80200716 <vprintfmt+0x78>
            goto reswitch;
    802008f4:	00144603          	lbu	a2,1(s0)
            altflag = 1;
    802008f8:	4985                	li	s3,1
        switch (ch = *(unsigned char *)fmt ++) {
    802008fa:	846a                	mv	s0,s10
            goto reswitch;
    802008fc:	bd29                	j	80200716 <vprintfmt+0x78>
            putch(ch, putdat);
    802008fe:	85a6                	mv	a1,s1
    80200900:	02500513          	li	a0,37
    80200904:	9902                	jalr	s2
            break;
    80200906:	bbc9                	j	802006d8 <vprintfmt+0x3a>
    if (lflag >= 2) {
    80200908:	4705                	li	a4,1
    8020090a:	008a8593          	addi	a1,s5,8
    8020090e:	01074463          	blt	a4,a6,80200916 <vprintfmt+0x278>
    else if (lflag) {
    80200912:	08080d63          	beqz	a6,802009ac <vprintfmt+0x30e>
        return va_arg(*ap, unsigned long);
    80200916:	000ab603          	ld	a2,0(s5)
    8020091a:	46a9                	li	a3,10
    8020091c:	8aae                	mv	s5,a1
    8020091e:	bf7d                	j	802008dc <vprintfmt+0x23e>
            putch('%', putdat);
    80200920:	85a6                	mv	a1,s1
    80200922:	02500513          	li	a0,37
    80200926:	9902                	jalr	s2
            for (fmt --; fmt[-1] != '%'; fmt --)
    80200928:	fff44703          	lbu	a4,-1(s0)
    8020092c:	02500793          	li	a5,37
    80200930:	8d22                	mv	s10,s0
    80200932:	daf703e3          	beq	a4,a5,802006d8 <vprintfmt+0x3a>
    80200936:	02500713          	li	a4,37
    8020093a:	1d7d                	addi	s10,s10,-1
    8020093c:	fffd4783          	lbu	a5,-1(s10)
    80200940:	fee79de3          	bne	a5,a4,8020093a <vprintfmt+0x29c>
    80200944:	bb51                	j	802006d8 <vprintfmt+0x3a>
                printfmt(putch, putdat, "error %d", err);
    80200946:	00001617          	auipc	a2,0x1
    8020094a:	98a60613          	addi	a2,a2,-1654 # 802012d0 <error_string+0xd8>
    8020094e:	85a6                	mv	a1,s1
    80200950:	854a                	mv	a0,s2
    80200952:	0ac000ef          	jal	ra,802009fe <printfmt>
    80200956:	b349                	j	802006d8 <vprintfmt+0x3a>
                p = "(null)";
    80200958:	00001617          	auipc	a2,0x1
    8020095c:	97060613          	addi	a2,a2,-1680 # 802012c8 <error_string+0xd0>
            if (width > 0 && padc != '-') {
    80200960:	00001417          	auipc	s0,0x1
    80200964:	96940413          	addi	s0,s0,-1687 # 802012c9 <error_string+0xd1>
                for (width -= strnlen(p, precision); width > 0; width --) {
    80200968:	8532                	mv	a0,a2
    8020096a:	85e6                	mv	a1,s9
    8020096c:	e032                	sd	a2,0(sp)
    8020096e:	e43e                	sd	a5,8(sp)
    80200970:	c8bff0ef          	jal	ra,802005fa <strnlen>
    80200974:	40ad8dbb          	subw	s11,s11,a0
    80200978:	6602                	ld	a2,0(sp)
    8020097a:	01b05d63          	blez	s11,80200994 <vprintfmt+0x2f6>
    8020097e:	67a2                	ld	a5,8(sp)
    80200980:	2781                	sext.w	a5,a5
    80200982:	e43e                	sd	a5,8(sp)
                    putch(padc, putdat);
    80200984:	6522                	ld	a0,8(sp)
    80200986:	85a6                	mv	a1,s1
    80200988:	e032                	sd	a2,0(sp)
                for (width -= strnlen(p, precision); width > 0; width --) {
    8020098a:	3dfd                	addiw	s11,s11,-1
                    putch(padc, putdat);
    8020098c:	9902                	jalr	s2
                for (width -= strnlen(p, precision); width > 0; width --) {
    8020098e:	6602                	ld	a2,0(sp)
    80200990:	fe0d9ae3          	bnez	s11,80200984 <vprintfmt+0x2e6>
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
    80200994:	00064783          	lbu	a5,0(a2)
    80200998:	0007851b          	sext.w	a0,a5
    8020099c:	ec0510e3          	bnez	a0,8020085c <vprintfmt+0x1be>
    802009a0:	bb25                	j	802006d8 <vprintfmt+0x3a>
        return va_arg(*ap, unsigned int);
    802009a2:	000ae603          	lwu	a2,0(s5)
    802009a6:	46a1                	li	a3,8
    802009a8:	8aae                	mv	s5,a1
    802009aa:	bf0d                	j	802008dc <vprintfmt+0x23e>
    802009ac:	000ae603          	lwu	a2,0(s5)
    802009b0:	46a9                	li	a3,10
    802009b2:	8aae                	mv	s5,a1
    802009b4:	b725                	j	802008dc <vprintfmt+0x23e>
        return va_arg(*ap, int);
    802009b6:	000aa403          	lw	s0,0(s5)
    802009ba:	bd35                	j	802007f6 <vprintfmt+0x158>
        return va_arg(*ap, unsigned int);
    802009bc:	000ae603          	lwu	a2,0(s5)
    802009c0:	46c1                	li	a3,16
    802009c2:	8aae                	mv	s5,a1
    802009c4:	bf21                	j	802008dc <vprintfmt+0x23e>
                    putch(ch, putdat);
    802009c6:	9902                	jalr	s2
    802009c8:	bd45                	j	80200878 <vprintfmt+0x1da>
                putch('-', putdat);
    802009ca:	85a6                	mv	a1,s1
    802009cc:	02d00513          	li	a0,45
    802009d0:	e03e                	sd	a5,0(sp)
    802009d2:	9902                	jalr	s2
                num = -(long long)num;
    802009d4:	8ace                	mv	s5,s3
    802009d6:	40800633          	neg	a2,s0
    802009da:	46a9                	li	a3,10
    802009dc:	6782                	ld	a5,0(sp)
    802009de:	bdfd                	j	802008dc <vprintfmt+0x23e>
            if (width > 0 && padc != '-') {
    802009e0:	01b05663          	blez	s11,802009ec <vprintfmt+0x34e>
    802009e4:	02d00693          	li	a3,45
    802009e8:	f6d798e3          	bne	a5,a3,80200958 <vprintfmt+0x2ba>
    802009ec:	00001417          	auipc	s0,0x1
    802009f0:	8dd40413          	addi	s0,s0,-1827 # 802012c9 <error_string+0xd1>
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
    802009f4:	02800513          	li	a0,40
    802009f8:	02800793          	li	a5,40
    802009fc:	b585                	j	8020085c <vprintfmt+0x1be>

00000000802009fe <printfmt>:
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
    802009fe:	715d                	addi	sp,sp,-80
    va_start(ap, fmt);
    80200a00:	02810313          	addi	t1,sp,40
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
    80200a04:	f436                	sd	a3,40(sp)
    vprintfmt(putch, putdat, fmt, ap);
    80200a06:	869a                	mv	a3,t1
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
    80200a08:	ec06                	sd	ra,24(sp)
    80200a0a:	f83a                	sd	a4,48(sp)
    80200a0c:	fc3e                	sd	a5,56(sp)
    80200a0e:	e0c2                	sd	a6,64(sp)
    80200a10:	e4c6                	sd	a7,72(sp)
    va_start(ap, fmt);
    80200a12:	e41a                	sd	t1,8(sp)
    vprintfmt(putch, putdat, fmt, ap);
    80200a14:	c8bff0ef          	jal	ra,8020069e <vprintfmt>
}
    80200a18:	60e2                	ld	ra,24(sp)
    80200a1a:	6161                	addi	sp,sp,80
    80200a1c:	8082                	ret

0000000080200a1e <sbi_console_putchar>:

int sbi_console_getchar(void) {
    return sbi_call(SBI_CONSOLE_GETCHAR, 0, 0, 0);
}
void sbi_console_putchar(unsigned char ch) {
    sbi_call(SBI_CONSOLE_PUTCHAR, ch, 0, 0);
    80200a1e:	00003797          	auipc	a5,0x3
    80200a22:	5e278793          	addi	a5,a5,1506 # 80204000 <bootstacktop>
    __asm__ volatile (
    80200a26:	6398                	ld	a4,0(a5)
    80200a28:	4781                	li	a5,0
    80200a2a:	88ba                	mv	a7,a4
    80200a2c:	852a                	mv	a0,a0
    80200a2e:	85be                	mv	a1,a5
    80200a30:	863e                	mv	a2,a5
    80200a32:	00000073          	ecall
    80200a36:	87aa                	mv	a5,a0
}
    80200a38:	8082                	ret

0000000080200a3a <sbi_set_timer>:

void sbi_set_timer(unsigned long long stime_value) {
    sbi_call(SBI_SET_TIMER, stime_value, 0, 0);
    80200a3a:	00003797          	auipc	a5,0x3
    80200a3e:	5d678793          	addi	a5,a5,1494 # 80204010 <SBI_SET_TIMER>
    __asm__ volatile (
    80200a42:	6398                	ld	a4,0(a5)
    80200a44:	4781                	li	a5,0
    80200a46:	88ba                	mv	a7,a4
    80200a48:	852a                	mv	a0,a0
    80200a4a:	85be                	mv	a1,a5
    80200a4c:	863e                	mv	a2,a5
    80200a4e:	00000073          	ecall
    80200a52:	87aa                	mv	a5,a0
}
    80200a54:	8082                	ret
