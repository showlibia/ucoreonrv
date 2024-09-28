
bin/kernel：     文件格式 elf64-littleriscv


Disassembly of section .text:

0000000080200000 <kern_entry>:
#include <memlayout.h>

    .section .text,"ax",%progbits
    .globl kern_entry
kern_entry:
    la sp, bootstacktop
    80200000:	00003117          	auipc	sp,0x3
    80200004:	00010113          	mv	sp,sp

    tail kern_init
    80200008:	a009                	j	8020000a <kern_init>

000000008020000a <kern_init>:

int kern_init(void) __attribute__((noreturn));

int kern_init(void) {
    extern char edata[], end[];
    memset(edata, 0, end - edata);
    8020000a:	00003517          	auipc	a0,0x3
    8020000e:	ffe50513          	addi	a0,a0,-2 # 80203008 <edata>
    80200012:	00003617          	auipc	a2,0x3
    80200016:	ff660613          	addi	a2,a2,-10 # 80203008 <edata>
int kern_init(void) {
    8020001a:	1141                	addi	sp,sp,-16
    memset(edata, 0, end - edata);
    8020001c:	4581                	li	a1,0
    8020001e:	8e09                	sub	a2,a2,a0
int kern_init(void) {
    80200020:	e406                	sd	ra,8(sp)
    memset(edata, 0, end - edata);
    80200022:	094000ef          	jal	ra,802000b6 <memset>

    const char *message = "(THU.CST) os is loading ...\n";
    cprintf("%s\n\n", message);
    80200026:	00000597          	auipc	a1,0x0
    8020002a:	4aa58593          	addi	a1,a1,1194 # 802004d0 <sbi_console_putchar+0x1c>
    8020002e:	00000517          	auipc	a0,0x0
    80200032:	4c250513          	addi	a0,a0,1218 # 802004f0 <sbi_console_putchar+0x3c>
    80200036:	020000ef          	jal	ra,80200056 <cprintf>
 
   while (1)
        ;
    8020003a:	a001                	j	8020003a <kern_init+0x30>

000000008020003c <cputch>:

/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void cputch(int c, int *cnt) {
    8020003c:	1141                	addi	sp,sp,-16
    8020003e:	e022                	sd	s0,0(sp)
    80200040:	e406                	sd	ra,8(sp)
    80200042:	842e                	mv	s0,a1
    cons_putc(c);
    80200044:	046000ef          	jal	ra,8020008a <cons_putc>
    (*cnt)++;
    80200048:	401c                	lw	a5,0(s0)
}
    8020004a:	60a2                	ld	ra,8(sp)
    (*cnt)++;
    8020004c:	2785                	addiw	a5,a5,1
    8020004e:	c01c                	sw	a5,0(s0)
}
    80200050:	6402                	ld	s0,0(sp)
    80200052:	0141                	addi	sp,sp,16
    80200054:	8082                	ret

0000000080200056 <cprintf>:
 * cprintf - formats a string and writes it to stdout
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int cprintf(const char *fmt, ...) {
    80200056:	711d                	addi	sp,sp,-96
    va_list ap;
    int cnt;
    va_start(ap, fmt);
    80200058:	02810313          	addi	t1,sp,40 # 80203028 <edata+0x20>
int cprintf(const char *fmt, ...) {
    8020005c:	f42e                	sd	a1,40(sp)
    8020005e:	f832                	sd	a2,48(sp)
    80200060:	fc36                	sd	a3,56(sp)
    vprintfmt((void *)cputch, &cnt, fmt, ap);
    80200062:	862a                	mv	a2,a0
    80200064:	004c                	addi	a1,sp,4
    80200066:	00000517          	auipc	a0,0x0
    8020006a:	fd650513          	addi	a0,a0,-42 # 8020003c <cputch>
    8020006e:	869a                	mv	a3,t1
int cprintf(const char *fmt, ...) {
    80200070:	ec06                	sd	ra,24(sp)
    80200072:	e0ba                	sd	a4,64(sp)
    80200074:	e4be                	sd	a5,72(sp)
    80200076:	e8c2                	sd	a6,80(sp)
    80200078:	ecc6                	sd	a7,88(sp)
    va_start(ap, fmt);
    8020007a:	e41a                	sd	t1,8(sp)
    int cnt = 0;
    8020007c:	c202                	sw	zero,4(sp)
    vprintfmt((void *)cputch, &cnt, fmt, ap);
    8020007e:	0b6000ef          	jal	ra,80200134 <vprintfmt>
    cnt = vcprintf(fmt, ap);
    va_end(ap);
    return cnt;
}
    80200082:	60e2                	ld	ra,24(sp)
    80200084:	4512                	lw	a0,4(sp)
    80200086:	6125                	addi	sp,sp,96
    80200088:	8082                	ret

000000008020008a <cons_putc>:

/* cons_init - initializes the console devices */
void cons_init(void) {}

/* cons_putc - print a single character @c to console devices */
void cons_putc(int c) { sbi_console_putchar((unsigned char)c); }
    8020008a:	0ff57513          	andi	a0,a0,255
    8020008e:	a11d                	j	802004b4 <sbi_console_putchar>

0000000080200090 <strnlen>:
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
    while (cnt < len && *s ++ != '\0') {
    80200090:	c185                	beqz	a1,802000b0 <strnlen+0x20>
    80200092:	00054783          	lbu	a5,0(a0)
    80200096:	cf89                	beqz	a5,802000b0 <strnlen+0x20>
    size_t cnt = 0;
    80200098:	4781                	li	a5,0
    8020009a:	a021                	j	802000a2 <strnlen+0x12>
    while (cnt < len && *s ++ != '\0') {
    8020009c:	00074703          	lbu	a4,0(a4)
    802000a0:	c711                	beqz	a4,802000ac <strnlen+0x1c>
        cnt ++;
    802000a2:	0785                	addi	a5,a5,1
    while (cnt < len && *s ++ != '\0') {
    802000a4:	00f50733          	add	a4,a0,a5
    802000a8:	fef59ae3          	bne	a1,a5,8020009c <strnlen+0xc>
    }
    return cnt;
}
    802000ac:	853e                	mv	a0,a5
    802000ae:	8082                	ret
    size_t cnt = 0;
    802000b0:	4781                	li	a5,0
}
    802000b2:	853e                	mv	a0,a5
    802000b4:	8082                	ret

00000000802000b6 <memset>:
memset(void *s, char c, size_t n) {
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
#else
    char *p = s;
    while (n -- > 0) {
    802000b6:	ca01                	beqz	a2,802000c6 <memset+0x10>
    802000b8:	962a                	add	a2,a2,a0
    char *p = s;
    802000ba:	87aa                	mv	a5,a0
        *p ++ = c;
    802000bc:	0785                	addi	a5,a5,1
    802000be:	feb78fa3          	sb	a1,-1(a5)
    while (n -- > 0) {
    802000c2:	fec79de3          	bne	a5,a2,802000bc <memset+0x6>
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
    802000c6:	8082                	ret

00000000802000c8 <printnum>:
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
    unsigned long long result = num;
    unsigned mod = do_div(result, base);
    802000c8:	02069813          	slli	a6,a3,0x20
        unsigned long long num, unsigned base, int width, int padc) {
    802000cc:	7179                	addi	sp,sp,-48
    unsigned mod = do_div(result, base);
    802000ce:	02085813          	srli	a6,a6,0x20
        unsigned long long num, unsigned base, int width, int padc) {
    802000d2:	e052                	sd	s4,0(sp)
    unsigned mod = do_div(result, base);
    802000d4:	03067a33          	remu	s4,a2,a6
        unsigned long long num, unsigned base, int width, int padc) {
    802000d8:	f022                	sd	s0,32(sp)
    802000da:	ec26                	sd	s1,24(sp)
    802000dc:	e84a                	sd	s2,16(sp)
    802000de:	f406                	sd	ra,40(sp)
    802000e0:	e44e                	sd	s3,8(sp)
    802000e2:	84aa                	mv	s1,a0
    802000e4:	892e                	mv	s2,a1
    802000e6:	fff7041b          	addiw	s0,a4,-1
    unsigned mod = do_div(result, base);
    802000ea:	2a01                	sext.w	s4,s4

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
    802000ec:	03067e63          	bgeu	a2,a6,80200128 <printnum+0x60>
    802000f0:	89be                	mv	s3,a5
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
    802000f2:	00805763          	blez	s0,80200100 <printnum+0x38>
    802000f6:	347d                	addiw	s0,s0,-1
            putch(padc, putdat);
    802000f8:	85ca                	mv	a1,s2
    802000fa:	854e                	mv	a0,s3
    802000fc:	9482                	jalr	s1
        while (-- width > 0)
    802000fe:	fc65                	bnez	s0,802000f6 <printnum+0x2e>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
    80200100:	1a02                	slli	s4,s4,0x20
    80200102:	020a5a13          	srli	s4,s4,0x20
    80200106:	00000797          	auipc	a5,0x0
    8020010a:	58278793          	addi	a5,a5,1410 # 80200688 <error_string+0x38>
    8020010e:	9a3e                	add	s4,s4,a5
}
    80200110:	7402                	ld	s0,32(sp)
    putch("0123456789abcdef"[mod], putdat);
    80200112:	000a4503          	lbu	a0,0(s4)
}
    80200116:	70a2                	ld	ra,40(sp)
    80200118:	69a2                	ld	s3,8(sp)
    8020011a:	6a02                	ld	s4,0(sp)
    putch("0123456789abcdef"[mod], putdat);
    8020011c:	85ca                	mv	a1,s2
    8020011e:	8326                	mv	t1,s1
}
    80200120:	6942                	ld	s2,16(sp)
    80200122:	64e2                	ld	s1,24(sp)
    80200124:	6145                	addi	sp,sp,48
    putch("0123456789abcdef"[mod], putdat);
    80200126:	8302                	jr	t1
        printnum(putch, putdat, result, base, width - 1, padc);
    80200128:	03065633          	divu	a2,a2,a6
    8020012c:	8722                	mv	a4,s0
    8020012e:	f9bff0ef          	jal	ra,802000c8 <printnum>
    80200132:	b7f9                	j	80200100 <printnum+0x38>

0000000080200134 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
    80200134:	7119                	addi	sp,sp,-128
    80200136:	f4a6                	sd	s1,104(sp)
    80200138:	f0ca                	sd	s2,96(sp)
    8020013a:	e8d2                	sd	s4,80(sp)
    8020013c:	e4d6                	sd	s5,72(sp)
    8020013e:	e0da                	sd	s6,64(sp)
    80200140:	fc5e                	sd	s7,56(sp)
    80200142:	f862                	sd	s8,48(sp)
    80200144:	f06a                	sd	s10,32(sp)
    80200146:	fc86                	sd	ra,120(sp)
    80200148:	f8a2                	sd	s0,112(sp)
    8020014a:	ecce                	sd	s3,88(sp)
    8020014c:	f466                	sd	s9,40(sp)
    8020014e:	ec6e                	sd	s11,24(sp)
    80200150:	892a                	mv	s2,a0
    80200152:	84ae                	mv	s1,a1
    80200154:	8d32                	mv	s10,a2
    80200156:	8ab6                	mv	s5,a3
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
        width = precision = -1;
    80200158:	5b7d                	li	s6,-1
        lflag = altflag = 0;

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
    8020015a:	00000a17          	auipc	s4,0x0
    8020015e:	39ea0a13          	addi	s4,s4,926 # 802004f8 <sbi_console_putchar+0x44>
                for (width -= strnlen(p, precision); width > 0; width --) {
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
                if (altflag && (ch < ' ' || ch > '~')) {
    80200162:	05e00b93          	li	s7,94
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
    80200166:	00000c17          	auipc	s8,0x0
    8020016a:	4eac0c13          	addi	s8,s8,1258 # 80200650 <error_string>
        while ((ch = *(unsigned char *)fmt ++) != '%') {
    8020016e:	000d4503          	lbu	a0,0(s10)
    80200172:	02500793          	li	a5,37
    80200176:	001d0413          	addi	s0,s10,1
    8020017a:	00f50e63          	beq	a0,a5,80200196 <vprintfmt+0x62>
            if (ch == '\0') {
    8020017e:	c521                	beqz	a0,802001c6 <vprintfmt+0x92>
        while ((ch = *(unsigned char *)fmt ++) != '%') {
    80200180:	02500993          	li	s3,37
    80200184:	a011                	j	80200188 <vprintfmt+0x54>
            if (ch == '\0') {
    80200186:	c121                	beqz	a0,802001c6 <vprintfmt+0x92>
            putch(ch, putdat);
    80200188:	85a6                	mv	a1,s1
        while ((ch = *(unsigned char *)fmt ++) != '%') {
    8020018a:	0405                	addi	s0,s0,1
            putch(ch, putdat);
    8020018c:	9902                	jalr	s2
        while ((ch = *(unsigned char *)fmt ++) != '%') {
    8020018e:	fff44503          	lbu	a0,-1(s0)
    80200192:	ff351ae3          	bne	a0,s3,80200186 <vprintfmt+0x52>
    80200196:	00044603          	lbu	a2,0(s0)
        char padc = ' ';
    8020019a:	02000793          	li	a5,32
        lflag = altflag = 0;
    8020019e:	4981                	li	s3,0
    802001a0:	4801                	li	a6,0
        width = precision = -1;
    802001a2:	5cfd                	li	s9,-1
    802001a4:	5dfd                	li	s11,-1
        switch (ch = *(unsigned char *)fmt ++) {
    802001a6:	05500593          	li	a1,85
                if (ch < '0' || ch > '9') {
    802001aa:	4525                	li	a0,9
        switch (ch = *(unsigned char *)fmt ++) {
    802001ac:	fdd6069b          	addiw	a3,a2,-35
    802001b0:	0ff6f693          	andi	a3,a3,255
    802001b4:	00140d13          	addi	s10,s0,1
    802001b8:	1ed5ef63          	bltu	a1,a3,802003b6 <vprintfmt+0x282>
    802001bc:	068a                	slli	a3,a3,0x2
    802001be:	96d2                	add	a3,a3,s4
    802001c0:	4294                	lw	a3,0(a3)
    802001c2:	96d2                	add	a3,a3,s4
    802001c4:	8682                	jr	a3
            for (fmt --; fmt[-1] != '%'; fmt --)
                /* do nothing */;
            break;
        }
    }
}
    802001c6:	70e6                	ld	ra,120(sp)
    802001c8:	7446                	ld	s0,112(sp)
    802001ca:	74a6                	ld	s1,104(sp)
    802001cc:	7906                	ld	s2,96(sp)
    802001ce:	69e6                	ld	s3,88(sp)
    802001d0:	6a46                	ld	s4,80(sp)
    802001d2:	6aa6                	ld	s5,72(sp)
    802001d4:	6b06                	ld	s6,64(sp)
    802001d6:	7be2                	ld	s7,56(sp)
    802001d8:	7c42                	ld	s8,48(sp)
    802001da:	7ca2                	ld	s9,40(sp)
    802001dc:	7d02                	ld	s10,32(sp)
    802001de:	6de2                	ld	s11,24(sp)
    802001e0:	6109                	addi	sp,sp,128
    802001e2:	8082                	ret
            padc = '-';
    802001e4:	87b2                	mv	a5,a2
        switch (ch = *(unsigned char *)fmt ++) {
    802001e6:	00144603          	lbu	a2,1(s0)
    802001ea:	846a                	mv	s0,s10
    802001ec:	b7c1                	j	802001ac <vprintfmt+0x78>
            precision = va_arg(ap, int);
    802001ee:	000aac83          	lw	s9,0(s5)
            goto process_precision;
    802001f2:	00144603          	lbu	a2,1(s0)
            precision = va_arg(ap, int);
    802001f6:	0aa1                	addi	s5,s5,8
        switch (ch = *(unsigned char *)fmt ++) {
    802001f8:	846a                	mv	s0,s10
            if (width < 0)
    802001fa:	fa0dd9e3          	bgez	s11,802001ac <vprintfmt+0x78>
                width = precision, precision = -1;
    802001fe:	8de6                	mv	s11,s9
    80200200:	5cfd                	li	s9,-1
    80200202:	b76d                	j	802001ac <vprintfmt+0x78>
            if (width < 0)
    80200204:	fffdc693          	not	a3,s11
    80200208:	96fd                	srai	a3,a3,0x3f
    8020020a:	00ddfdb3          	and	s11,s11,a3
    8020020e:	00144603          	lbu	a2,1(s0)
    80200212:	2d81                	sext.w	s11,s11
        switch (ch = *(unsigned char *)fmt ++) {
    80200214:	846a                	mv	s0,s10
    80200216:	bf59                	j	802001ac <vprintfmt+0x78>
    if (lflag >= 2) {
    80200218:	4705                	li	a4,1
    8020021a:	008a8593          	addi	a1,s5,8
    8020021e:	01074463          	blt	a4,a6,80200226 <vprintfmt+0xf2>
    else if (lflag) {
    80200222:	22080863          	beqz	a6,80200452 <vprintfmt+0x31e>
        return va_arg(*ap, unsigned long);
    80200226:	000ab603          	ld	a2,0(s5)
    8020022a:	46c1                	li	a3,16
    8020022c:	8aae                	mv	s5,a1
    8020022e:	a291                	j	80200372 <vprintfmt+0x23e>
                precision = precision * 10 + ch - '0';
    80200230:	fd060c9b          	addiw	s9,a2,-48
                ch = *fmt;
    80200234:	00144603          	lbu	a2,1(s0)
        switch (ch = *(unsigned char *)fmt ++) {
    80200238:	846a                	mv	s0,s10
                if (ch < '0' || ch > '9') {
    8020023a:	fd06069b          	addiw	a3,a2,-48
                ch = *fmt;
    8020023e:	0006089b          	sext.w	a7,a2
                if (ch < '0' || ch > '9') {
    80200242:	fad56ce3          	bltu	a0,a3,802001fa <vprintfmt+0xc6>
            for (precision = 0; ; ++ fmt) {
    80200246:	0405                	addi	s0,s0,1
                precision = precision * 10 + ch - '0';
    80200248:	002c969b          	slliw	a3,s9,0x2
                ch = *fmt;
    8020024c:	00044603          	lbu	a2,0(s0)
                precision = precision * 10 + ch - '0';
    80200250:	0196873b          	addw	a4,a3,s9
    80200254:	0017171b          	slliw	a4,a4,0x1
    80200258:	0117073b          	addw	a4,a4,a7
                if (ch < '0' || ch > '9') {
    8020025c:	fd06069b          	addiw	a3,a2,-48
                precision = precision * 10 + ch - '0';
    80200260:	fd070c9b          	addiw	s9,a4,-48
                ch = *fmt;
    80200264:	0006089b          	sext.w	a7,a2
                if (ch < '0' || ch > '9') {
    80200268:	fcd57fe3          	bgeu	a0,a3,80200246 <vprintfmt+0x112>
    8020026c:	b779                	j	802001fa <vprintfmt+0xc6>
            putch(va_arg(ap, int), putdat);
    8020026e:	000aa503          	lw	a0,0(s5)
    80200272:	85a6                	mv	a1,s1
    80200274:	0aa1                	addi	s5,s5,8
    80200276:	9902                	jalr	s2
            break;
    80200278:	bddd                	j	8020016e <vprintfmt+0x3a>
    if (lflag >= 2) {
    8020027a:	4705                	li	a4,1
    8020027c:	008a8993          	addi	s3,s5,8
    80200280:	01074463          	blt	a4,a6,80200288 <vprintfmt+0x154>
    else if (lflag) {
    80200284:	1c080463          	beqz	a6,8020044c <vprintfmt+0x318>
        return va_arg(*ap, long);
    80200288:	000ab403          	ld	s0,0(s5)
            if ((long long)num < 0) {
    8020028c:	1c044a63          	bltz	s0,80200460 <vprintfmt+0x32c>
            num = getint(&ap, lflag);
    80200290:	8622                	mv	a2,s0
    80200292:	8ace                	mv	s5,s3
    80200294:	46a9                	li	a3,10
    80200296:	a8f1                	j	80200372 <vprintfmt+0x23e>
            err = va_arg(ap, int);
    80200298:	000aa783          	lw	a5,0(s5)
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
    8020029c:	4719                	li	a4,6
            err = va_arg(ap, int);
    8020029e:	0aa1                	addi	s5,s5,8
            if (err < 0) {
    802002a0:	41f7d69b          	sraiw	a3,a5,0x1f
    802002a4:	8fb5                	xor	a5,a5,a3
    802002a6:	40d786bb          	subw	a3,a5,a3
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
    802002aa:	12d74963          	blt	a4,a3,802003dc <vprintfmt+0x2a8>
    802002ae:	00369793          	slli	a5,a3,0x3
    802002b2:	97e2                	add	a5,a5,s8
    802002b4:	639c                	ld	a5,0(a5)
    802002b6:	12078363          	beqz	a5,802003dc <vprintfmt+0x2a8>
                printfmt(putch, putdat, "%s", p);
    802002ba:	86be                	mv	a3,a5
    802002bc:	00000617          	auipc	a2,0x0
    802002c0:	47c60613          	addi	a2,a2,1148 # 80200738 <error_string+0xe8>
    802002c4:	85a6                	mv	a1,s1
    802002c6:	854a                	mv	a0,s2
    802002c8:	1cc000ef          	jal	ra,80200494 <printfmt>
    802002cc:	b54d                	j	8020016e <vprintfmt+0x3a>
            if ((p = va_arg(ap, char *)) == NULL) {
    802002ce:	000ab603          	ld	a2,0(s5)
    802002d2:	0aa1                	addi	s5,s5,8
    802002d4:	1a060163          	beqz	a2,80200476 <vprintfmt+0x342>
            if (width > 0 && padc != '-') {
    802002d8:	00160413          	addi	s0,a2,1
    802002dc:	15b05763          	blez	s11,8020042a <vprintfmt+0x2f6>
    802002e0:	02d00593          	li	a1,45
    802002e4:	10b79d63          	bne	a5,a1,802003fe <vprintfmt+0x2ca>
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
    802002e8:	00064783          	lbu	a5,0(a2)
    802002ec:	0007851b          	sext.w	a0,a5
    802002f0:	c905                	beqz	a0,80200320 <vprintfmt+0x1ec>
    802002f2:	000cc563          	bltz	s9,802002fc <vprintfmt+0x1c8>
    802002f6:	3cfd                	addiw	s9,s9,-1
    802002f8:	036c8263          	beq	s9,s6,8020031c <vprintfmt+0x1e8>
                    putch('?', putdat);
    802002fc:	85a6                	mv	a1,s1
                if (altflag && (ch < ' ' || ch > '~')) {
    802002fe:	14098f63          	beqz	s3,8020045c <vprintfmt+0x328>
    80200302:	3781                	addiw	a5,a5,-32
    80200304:	14fbfc63          	bgeu	s7,a5,8020045c <vprintfmt+0x328>
                    putch('?', putdat);
    80200308:	03f00513          	li	a0,63
    8020030c:	9902                	jalr	s2
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
    8020030e:	0405                	addi	s0,s0,1
    80200310:	fff44783          	lbu	a5,-1(s0)
    80200314:	3dfd                	addiw	s11,s11,-1
    80200316:	0007851b          	sext.w	a0,a5
    8020031a:	fd61                	bnez	a0,802002f2 <vprintfmt+0x1be>
            for (; width > 0; width --) {
    8020031c:	e5b059e3          	blez	s11,8020016e <vprintfmt+0x3a>
    80200320:	3dfd                	addiw	s11,s11,-1
                putch(' ', putdat);
    80200322:	85a6                	mv	a1,s1
    80200324:	02000513          	li	a0,32
    80200328:	9902                	jalr	s2
            for (; width > 0; width --) {
    8020032a:	e40d82e3          	beqz	s11,8020016e <vprintfmt+0x3a>
    8020032e:	3dfd                	addiw	s11,s11,-1
                putch(' ', putdat);
    80200330:	85a6                	mv	a1,s1
    80200332:	02000513          	li	a0,32
    80200336:	9902                	jalr	s2
            for (; width > 0; width --) {
    80200338:	fe0d94e3          	bnez	s11,80200320 <vprintfmt+0x1ec>
    8020033c:	bd0d                	j	8020016e <vprintfmt+0x3a>
    if (lflag >= 2) {
    8020033e:	4705                	li	a4,1
    80200340:	008a8593          	addi	a1,s5,8
    80200344:	01074463          	blt	a4,a6,8020034c <vprintfmt+0x218>
    else if (lflag) {
    80200348:	0e080863          	beqz	a6,80200438 <vprintfmt+0x304>
        return va_arg(*ap, unsigned long);
    8020034c:	000ab603          	ld	a2,0(s5)
    80200350:	46a1                	li	a3,8
    80200352:	8aae                	mv	s5,a1
    80200354:	a839                	j	80200372 <vprintfmt+0x23e>
            putch('0', putdat);
    80200356:	03000513          	li	a0,48
    8020035a:	85a6                	mv	a1,s1
    8020035c:	e03e                	sd	a5,0(sp)
    8020035e:	9902                	jalr	s2
            putch('x', putdat);
    80200360:	85a6                	mv	a1,s1
    80200362:	07800513          	li	a0,120
    80200366:	9902                	jalr	s2
            num = (unsigned long long)va_arg(ap, void *);
    80200368:	0aa1                	addi	s5,s5,8
    8020036a:	ff8ab603          	ld	a2,-8(s5)
            goto number;
    8020036e:	6782                	ld	a5,0(sp)
    80200370:	46c1                	li	a3,16
            printnum(putch, putdat, num, base, width, padc);
    80200372:	2781                	sext.w	a5,a5
    80200374:	876e                	mv	a4,s11
    80200376:	85a6                	mv	a1,s1
    80200378:	854a                	mv	a0,s2
    8020037a:	d4fff0ef          	jal	ra,802000c8 <printnum>
            break;
    8020037e:	bbc5                	j	8020016e <vprintfmt+0x3a>
            lflag ++;
    80200380:	00144603          	lbu	a2,1(s0)
    80200384:	2805                	addiw	a6,a6,1
        switch (ch = *(unsigned char *)fmt ++) {
    80200386:	846a                	mv	s0,s10
            goto reswitch;
    80200388:	b515                	j	802001ac <vprintfmt+0x78>
            goto reswitch;
    8020038a:	00144603          	lbu	a2,1(s0)
            altflag = 1;
    8020038e:	4985                	li	s3,1
        switch (ch = *(unsigned char *)fmt ++) {
    80200390:	846a                	mv	s0,s10
            goto reswitch;
    80200392:	bd29                	j	802001ac <vprintfmt+0x78>
            putch(ch, putdat);
    80200394:	85a6                	mv	a1,s1
    80200396:	02500513          	li	a0,37
    8020039a:	9902                	jalr	s2
            break;
    8020039c:	bbc9                	j	8020016e <vprintfmt+0x3a>
    if (lflag >= 2) {
    8020039e:	4705                	li	a4,1
    802003a0:	008a8593          	addi	a1,s5,8
    802003a4:	01074463          	blt	a4,a6,802003ac <vprintfmt+0x278>
    else if (lflag) {
    802003a8:	08080d63          	beqz	a6,80200442 <vprintfmt+0x30e>
        return va_arg(*ap, unsigned long);
    802003ac:	000ab603          	ld	a2,0(s5)
    802003b0:	46a9                	li	a3,10
    802003b2:	8aae                	mv	s5,a1
    802003b4:	bf7d                	j	80200372 <vprintfmt+0x23e>
            putch('%', putdat);
    802003b6:	85a6                	mv	a1,s1
    802003b8:	02500513          	li	a0,37
    802003bc:	9902                	jalr	s2
            for (fmt --; fmt[-1] != '%'; fmt --)
    802003be:	fff44703          	lbu	a4,-1(s0)
    802003c2:	02500793          	li	a5,37
    802003c6:	8d22                	mv	s10,s0
    802003c8:	daf703e3          	beq	a4,a5,8020016e <vprintfmt+0x3a>
    802003cc:	02500713          	li	a4,37
    802003d0:	1d7d                	addi	s10,s10,-1
    802003d2:	fffd4783          	lbu	a5,-1(s10)
    802003d6:	fee79de3          	bne	a5,a4,802003d0 <vprintfmt+0x29c>
    802003da:	bb51                	j	8020016e <vprintfmt+0x3a>
                printfmt(putch, putdat, "error %d", err);
    802003dc:	00000617          	auipc	a2,0x0
    802003e0:	34c60613          	addi	a2,a2,844 # 80200728 <error_string+0xd8>
    802003e4:	85a6                	mv	a1,s1
    802003e6:	854a                	mv	a0,s2
    802003e8:	0ac000ef          	jal	ra,80200494 <printfmt>
    802003ec:	b349                	j	8020016e <vprintfmt+0x3a>
                p = "(null)";
    802003ee:	00000617          	auipc	a2,0x0
    802003f2:	33260613          	addi	a2,a2,818 # 80200720 <error_string+0xd0>
            if (width > 0 && padc != '-') {
    802003f6:	00000417          	auipc	s0,0x0
    802003fa:	32b40413          	addi	s0,s0,811 # 80200721 <error_string+0xd1>
                for (width -= strnlen(p, precision); width > 0; width --) {
    802003fe:	8532                	mv	a0,a2
    80200400:	85e6                	mv	a1,s9
    80200402:	e032                	sd	a2,0(sp)
    80200404:	e43e                	sd	a5,8(sp)
    80200406:	c8bff0ef          	jal	ra,80200090 <strnlen>
    8020040a:	40ad8dbb          	subw	s11,s11,a0
    8020040e:	6602                	ld	a2,0(sp)
    80200410:	01b05d63          	blez	s11,8020042a <vprintfmt+0x2f6>
    80200414:	67a2                	ld	a5,8(sp)
    80200416:	2781                	sext.w	a5,a5
    80200418:	e43e                	sd	a5,8(sp)
                    putch(padc, putdat);
    8020041a:	6522                	ld	a0,8(sp)
    8020041c:	85a6                	mv	a1,s1
    8020041e:	e032                	sd	a2,0(sp)
                for (width -= strnlen(p, precision); width > 0; width --) {
    80200420:	3dfd                	addiw	s11,s11,-1
                    putch(padc, putdat);
    80200422:	9902                	jalr	s2
                for (width -= strnlen(p, precision); width > 0; width --) {
    80200424:	6602                	ld	a2,0(sp)
    80200426:	fe0d9ae3          	bnez	s11,8020041a <vprintfmt+0x2e6>
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
    8020042a:	00064783          	lbu	a5,0(a2)
    8020042e:	0007851b          	sext.w	a0,a5
    80200432:	ec0510e3          	bnez	a0,802002f2 <vprintfmt+0x1be>
    80200436:	bb25                	j	8020016e <vprintfmt+0x3a>
        return va_arg(*ap, unsigned int);
    80200438:	000ae603          	lwu	a2,0(s5)
    8020043c:	46a1                	li	a3,8
    8020043e:	8aae                	mv	s5,a1
    80200440:	bf0d                	j	80200372 <vprintfmt+0x23e>
    80200442:	000ae603          	lwu	a2,0(s5)
    80200446:	46a9                	li	a3,10
    80200448:	8aae                	mv	s5,a1
    8020044a:	b725                	j	80200372 <vprintfmt+0x23e>
        return va_arg(*ap, int);
    8020044c:	000aa403          	lw	s0,0(s5)
    80200450:	bd35                	j	8020028c <vprintfmt+0x158>
        return va_arg(*ap, unsigned int);
    80200452:	000ae603          	lwu	a2,0(s5)
    80200456:	46c1                	li	a3,16
    80200458:	8aae                	mv	s5,a1
    8020045a:	bf21                	j	80200372 <vprintfmt+0x23e>
                    putch(ch, putdat);
    8020045c:	9902                	jalr	s2
    8020045e:	bd45                	j	8020030e <vprintfmt+0x1da>
                putch('-', putdat);
    80200460:	85a6                	mv	a1,s1
    80200462:	02d00513          	li	a0,45
    80200466:	e03e                	sd	a5,0(sp)
    80200468:	9902                	jalr	s2
                num = -(long long)num;
    8020046a:	8ace                	mv	s5,s3
    8020046c:	40800633          	neg	a2,s0
    80200470:	46a9                	li	a3,10
    80200472:	6782                	ld	a5,0(sp)
    80200474:	bdfd                	j	80200372 <vprintfmt+0x23e>
            if (width > 0 && padc != '-') {
    80200476:	01b05663          	blez	s11,80200482 <vprintfmt+0x34e>
    8020047a:	02d00693          	li	a3,45
    8020047e:	f6d798e3          	bne	a5,a3,802003ee <vprintfmt+0x2ba>
    80200482:	00000417          	auipc	s0,0x0
    80200486:	29f40413          	addi	s0,s0,671 # 80200721 <error_string+0xd1>
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
    8020048a:	02800513          	li	a0,40
    8020048e:	02800793          	li	a5,40
    80200492:	b585                	j	802002f2 <vprintfmt+0x1be>

0000000080200494 <printfmt>:
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
    80200494:	715d                	addi	sp,sp,-80
    va_start(ap, fmt);
    80200496:	02810313          	addi	t1,sp,40
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
    8020049a:	f436                	sd	a3,40(sp)
    vprintfmt(putch, putdat, fmt, ap);
    8020049c:	869a                	mv	a3,t1
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
    8020049e:	ec06                	sd	ra,24(sp)
    802004a0:	f83a                	sd	a4,48(sp)
    802004a2:	fc3e                	sd	a5,56(sp)
    802004a4:	e0c2                	sd	a6,64(sp)
    802004a6:	e4c6                	sd	a7,72(sp)
    va_start(ap, fmt);
    802004a8:	e41a                	sd	t1,8(sp)
    vprintfmt(putch, putdat, fmt, ap);
    802004aa:	c8bff0ef          	jal	ra,80200134 <vprintfmt>
}
    802004ae:	60e2                	ld	ra,24(sp)
    802004b0:	6161                	addi	sp,sp,80
    802004b2:	8082                	ret

00000000802004b4 <sbi_console_putchar>:
    );
    return ret_val;
}

void sbi_console_putchar(unsigned char ch) {
    sbi_call(SBI_CONSOLE_PUTCHAR, ch, 0, 0);
    802004b4:	00003797          	auipc	a5,0x3
    802004b8:	b4c78793          	addi	a5,a5,-1204 # 80203000 <bootstacktop>
    __asm__ volatile (
    802004bc:	6398                	ld	a4,0(a5)
    802004be:	4781                	li	a5,0
    802004c0:	88ba                	mv	a7,a4
    802004c2:	852a                	mv	a0,a0
    802004c4:	85be                	mv	a1,a5
    802004c6:	863e                	mv	a2,a5
    802004c8:	00000073          	ecall
    802004cc:	87aa                	mv	a5,a0
}
    802004ce:	8082                	ret
