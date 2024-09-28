

# 练习一  描述处理中断异常的流程
由于我们当前处于S模式

在发生中断、异常时，cpu会跳到**stvec**寄存器所存放的地址，对于stvec寄存器结构

+ **高位部分**：保存陷阱向量的基地址（即处理异常或中断的入口地址）。
+ **低 2 位**：mode 字段，用来选择处理陷阱的方式：
  - 00：**Direct 模式**（直接模式）—— 所有中断或异常都会跳转到基地址。
  - 01：**Vectored 模式**（向量模式）—— 中断类型会跳转到不同的偏移量地址，基地址加上对应中断号的偏移。

在源码中我们采用**Direct模式**，即stvec寄存器低两位为00，在**trapentry.S**中
```
.globl __alltraps
.align(2)
```
让alltraps函数地址对齐四字节，即&__alltraps低两位为00，在**kern/trap/trap.c**中
```
    write_csr(stvec, &__alltraps);
```
将__alltraps这个符号的地址直接写到stvec寄存器

以非法指令异常为例，我们的执行流为：

加电 -> OpenSBI启动 -> 跳转到 0x80200000 (`kern/init/entry.S`）->进入`kern_init()`函数（`kern/init/init.c`) -> `intr_enable`函数 设置sstatus的Supervisor中断使能位-> 遇到非法指令异常 -> cpu根据`stvec`寄存器跳到`&__alltraps`（`trapentry.S`）-> 保存CPU的寄存器 -> 把上下文包装成结构体送到`trap`函数-> 从内存中（栈上）恢复CPU的寄存器 -> 退出中断处理程序 -> 结束

`trap`函数的执行流为：

接收`trapentry.S`通过 `a0`寄存器传来的参数（指向 trapframe 结构体的指针也就是栈中的保存了寄存器内容的地址）-> 传给`trap_dispatch`函数，根据`scause`的数值给情况分类 —> 进入`interrupt_handler()`或`exception_handler()` -> 根据中断或异常的不同类型来处理 -> 结束

# 练习二  对于任何中断，都需要保存所有寄存器吗？为什么？

不需要，在恢复上下文的代码中，我们可以看到在恢复现场的时候，对于控制状态寄存器的四个寄存器status,epc,badaddr,cause只恢复了其中的status和epc寄存器。这主要是因为badaddr寄存器和cause寄存器中保存的分别是出错的地址以及出错的原因，当我们处理完这个中断的时候，也就不需要这两个寄存器中保存的值，所以可以不用恢复这两个寄存器。

# 练习三：触发、捕获、处理异常

如下在代码中添加非法异常指令`mret`

```c
// kern/init/init.c
int kern_init(void) {
    extern char edata[], end[];
    memset(edata, 0, end - edata);

    cons_init();  // init the console

    const char *message = "(THU.CST) os is loading ...\n";
    cprintf("%s\n\n", message);

    print_kerninfo();

    idt_init();  // init interrupt descriptor table
    intr_enable();  // enable irq interrupt

    asm volatile("mret"::);//ILLEGAL_INSTRUCTION

    while (1)
        ;
}
```

在`trap.c`中

```c
// kern/trap/trap.c
void trap(struct trapframe *tf) 
{   
    cprintf("---%d---\n",tf->cause);//获取当前异常的scause
    trap_dispatch(tf); 
}
```

得到结果为0x2,查阅`riscv.h`可知，类型为CAUSE_ILLEGAL_INSTRUCTION

故修改代码为
```c
// kern/trap/trap.c
void exception_handler(struct trapframe *tf) {
    switch (tf->cause) {
      //something............
        case CAUSE_ILLEGAL_INSTRUCTION:
            cprintf("ebreak caught at 0x%016llx\n", tf->epc);
            tf->epc += 4;
            break;
      //something.............
    }
}
```
在终端中`make qemu`得到

```shell
---2---
ebreak caught at 0x000000008020004a

```
并且进入死循环

**值得注意**，在代码中要将`tf->epc` 加4后返回，因为出现异常时，中断返回地址 epc 的值被更新为当前发生异常的指令 PC，因此在异常返回时，如果直接使用 epc 保存的 PC 值作为返回地址，则会再次跳回 非法异常指令，从而造成死循环（执行 非法异常指令导致重新进入异常）。

**正确做法** 查阅mret的指令长度为4字节，因此epc加4返回，从而越过非法异常指令



