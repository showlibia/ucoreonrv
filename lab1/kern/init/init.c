#include <clock.h>
#include <console.h>
#include <defs.h>
#include <intr.h>
#include <kdebug.h>
#include <kmonitor.h>
#include <pmm.h>
#include <riscv.h>
#include <stdio.h>
#include <string.h>
#include <trap.h>

int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);


int kern_init(void) {
    extern char edata[], end[];
    memset(edata, 0, end - edata);

    cons_init();  // init the console

    const char *message = "(THU.CST) os is loading ...\n";
    cprintf("%s\n\n", message);

    print_kerninfo();

    // grade_backtrace();

    idt_init();  // init interrupt descriptor table

    // rdtime in mbare mode crashes
    //clock_init();  // init clock interrupt

    intr_enable();  // enable irq interrupt

  //  asm volatile("mret"::);

    // LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
     lab1_switch_test();
    /* do nothing */
    while (1)
        ;
}

void __attribute__((noinline))
grade_backtrace2(unsigned long long arg0, unsigned long long arg1, unsigned long long arg2, unsigned long long arg3) {
    mon_backtrace(0, NULL, NULL);
}

void __attribute__((noinline)) grade_backtrace1(int arg0, int arg1) {
    grade_backtrace2(arg0, (unsigned long long)&arg0, arg1, (unsigned long long)&arg1);
}

void __attribute__((noinline)) grade_backtrace0(int arg0, int arg1, int arg2) {
    grade_backtrace1(arg0, arg2);
}

void grade_backtrace(void) { grade_backtrace0(0, (unsigned long long)kern_init, 0xffff0000); }

static void lab1_print_cur_status(void) {
    unsigned int sstatus;
    asm volatile("csrr %0, sstatus" : "=r"(sstatus));
    if (sstatus & (1 << 8))
    {
        cprintf("Processor is in kernel mode.\n");
    } else
    {
        cprintf("Processor is in user mode.\n");
    }

    static int round = 0;
    round++;
}

static void lab1_switch_to_user(void) {
    // LAB1 CHALLENGE 1 : TODO
    
    //将sstatus寄存器spp位设置为1，sret返回时进入u态
    unsigned int sstatus_value;
    asm volatile("csrr %0, sstatus" : "=r"(sstatus_value));
    sstatus_value &= ~(1 << 8);  // spp 设置为 0，表示用户态
    asm volatile("csrw sstatus, %0" : : "r"(sstatus_value));


    unsigned long long ra_value,sepc_value;
    
    // 读取 ra 寄存器的值
    asm volatile("mv %0, ra" : "=r"(ra_value));

    ra_value += 0x26;
  
    // 将 ra 的值写入 sepc 寄存器
    asm volatile("csrw sepc, %0" : : "r"(ra_value));

     asm volatile("csrr %0, sepc" : "=r"(sepc_value));
    cprintf("0x%016llx--0x%016llx\n",sepc_value,ra_value);
    //cprintf("888\n");

   asm volatile("sret" : :);
    
}

static void lab1_switch_to_kernel(void) {
    // LAB1 CHALLENGE 1 :  TODO

}
unsigned long pc;
static void lab1_switch_test(void) {
    lab1_print_cur_status();
    cprintf("+++ switch to  user  mode +++\n");
    lab1_switch_to_user();
    
    //  asm volatile("auipc %0, 0" : "=r"(pc));
    //  cprintf("0x%016llx\n",pc);

   // cprintf("66666666666666666\n");

    lab1_print_cur_status();
    cprintf("+++ switch to kernel mode +++\n");
    lab1_switch_to_kernel();
    lab1_print_cur_status();
}
