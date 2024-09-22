# LAB_01
## 1.描述处理中断异常的流程
在发生中断的时候, CPU会跳到stvec。
源码采用Direct模式,低两位为'00'也就是只有一个中断处理程序, stvec直接跳到中断处理程序的入口点。

非法指令异常处理流程：
加电 -> OpenSBI 启动 -> 跳转到 0x80200000 (kern/init/entry.S) -> 进入 kern_init() 函数 (kern/init/init.c) -> 调用 intr_enable 设置 sstatus 的中断使能位为1 -> 遇到异常 -> CPU 根据 stvec 跳转到中断入口(trapentry.S) -> 保存 CPU 寄存器状态 -> 将上下文传递给 trap 函数 -> 从栈恢复 CPU 寄存器 -> 退出中断处理程序

trap 函数执行流：
接收通过 a0 传来的 trapframe 指针 -> 传递给 trap_dispatch 函数 -> 根据 scause 值分类处理 -> 进入 interrupt_handler() 或 exception_handler() -> 根据异常类型执行相应处理

## 2.对于任何中断，都需要保存所有寄存器吗？为什么？

在处理中断时，并不一定需要保存所有寄存器。有以下原因：

1. **寄存器分类**：在许多处理器架构中，寄存器分为**调用者保存寄存器**（caller-saved）和**被调用者保存寄存器**（callee-saved）。
   - **调用者保存寄存器**：在执行函数调用时，调用方需要在调用之前保存这些寄存器的值，因为被调用的函数可能会修改它们。
   - **被调用者保存寄存器**：这些寄存器由被调用的函数在执行时负责保存。如果函数修改了这些寄存器，它必须在返回之前恢复它们的值。

   在处理中断时，不一定需要保存所有寄存器。如果中断处理程序只会使用调用者保存的寄存器，理论上它可以避免保存这些寄存器的状态。

2. **中断处理效率**：保存和恢复所有寄存器会增加中断处理的开销，特别是如果有很多寄存器。为了提高中断处理的效率，通常只保存处理程序中确实需要使用或可能修改的寄存器。

3. **简化的中断处理**：有些处理器提供专门的中断寄存器集，或有硬件支持的机制，可以自动保存和恢复部分关键寄存器（如程序计数器、状态寄存器等）。这样可以减少对普通寄存器的保存需求。

4. **特权级的区别**：在一些处理器架构中，不同特权级之间的中断可能涉及到不同的寄存器集。例如，从用户态切换到内核态时，可能只需要保存用户态的寄存器，而内核态有自己独立的寄存器或专用寄存器集。

## 3.触发、捕获、处理异常
`mret`，用于 M 态中断返回到 S 态或 U 态，实际作用为pc←mepc，回顾sepc定义，返回到通过中断进入 M 态之前的地址。

如下在init.c中添加非法异常指令`mret`

```c
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
    clock_init();  // init clock interrupt

    intr_enable();  // enable irq interrupt

    asm volatile("init"::);

    // LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    // lab1_switch_test();
    /* do nothing */
    while (1)
        ;
}
```

在`trap.c`中打印出异常类型
```c
void trap(struct trapframe *tf) 
{   
    cprintf("---%d---\n",tf->cause);//获取当前异常的类型
    trap_dispatch(tf); 
}
```

得到结果为0x2,查阅`riscv.h`可知，类型为CAUSE_ILLEGAL_INSTRUCTION
故修改trap.c中的exception_handler()函数如下：
```c
void exception_handler(struct trapframe *tf) {
    switch (tf->cause) {
        case CAUSE_MISALIGNED_FETCH:
            break;
        case CAUSE_FAULT_FETCH:
            break;
        case CAUSE_ILLEGAL_INSTRUCTION:
            cprintf("ebreak caught at 0x%01611x\n", tf->epc);
            tf->epc += 2;
            break;
        case CAUSE_BREAKPOINT:
            cprintf("ebreak caught at 0x%016llx\n", tf->epc);
            tf->epc += 2;
            break;
        case CAUSE_MISALIGNED_LOAD:
            break;
        case CAUSE_FAULT_LOAD:
            break;
        case CAUSE_MISALIGNED_STORE:
            break;
        case CAUSE_FAULT_STORE:
            break;
        case CAUSE_USER_ECALL:
            break;
        case CAUSE_SUPERVISOR_ECALL:
            break;
        case CAUSE_HYPERVISOR_ECALL:
            break;
        case CAUSE_MACHINE_ECALL:
            break;
        default:
            print_trapframe(tf);
            break;
    }
}
```
在终端中`make qemu`得到

```
++ setup executable memory footprint: 17KB
ebreak caught at 0x000000008020004e
100 ticks
100 ticks
100 ticks
···
···
```

