# lab1

## 练习1

中断执行流：

加电 -> OpenSBI启动 -> 跳转到 0x80200000 (`kern/init/entry.S`）->进入`kern_init()`函数（`kern/init/init.c`) -> 调用`idt_init()`初始化中断向量表，将__alltraps的地址写入`stvec`也就是中断向量表基址

```c
/**
 * @brief      Load supervisor trap entry in RISC-V
 */
void idt_init(void) {
    extern void __alltraps(void);
    /* Set sscratch register to 0, indicating to exception vector that we are
     * presently executing in the kernel */
    write_csr(sscratch, 0);
    /* Set the exception vector address */
    write_csr(stvec, &__alltraps);
}
```

调用`intr_enable()`设置`sstatus`寄存器中的SIE位为1（使能信号）(`kern/driver/intr.c`) -> 异常产生 -> 进入中断入口`trapentry.S`(`kern/trap/trapentry.S`) 

```assembly
__alltraps:
    SAVE_ALL

    move  a0, sp
    jal trap
    # sp should be the same as before "jal trap"

    .globl __trapret
__trapret:
    RESTORE_ALL
    # return from supervisor call
    sre
```

-> 保存当前CPU状态（保存通用寄存器)`SAVE_ALL`宏 -> 跳转调用`trap()`函数(`kern/trap/trap.c`) 进入具体的中断异常处理逻辑 -> 根据中断异常类型调用处理函数，例如系统调用、时钟中断等 -> 处理完成后恢复上下文 -> 返回用户态或继续执行内核态代码。

## 练习2

在代码中保存了所有的寄存器，目的是为了

- 保证中断前的上下文不被破坏。

- 支持中断嵌套，确保多次中断处理时每个上下文都能正确恢复。

- 中断处理程序可以自由使用寄存器而不会影响中断发生前的程序执行。

## 练习3

可以在任意地方调用`mret`指令

我这里选择在init.c中调用

```c
    asm volatile("mret" ::);
```

随后进入trap()函数

```c
void trap(struct trapframe *tf) {
    // cprintf("interrupt reason: %d\n", tf->cause);
    trap_dispatch(tf);
}
```

这里利用tf->cause打印出类型并在`riscv.h`中查找相应类型，可知是`CAUSE_ILLEGAL_INSTRUCTION`因此在`exception_handler()`函数中编写相应代码：

```c
void exception_handler(struct trapframe *tf) {
    switch (tf->cause) {
        ···
        case CAUSE_ILLEGAL_INSTRUCTION:
            cprintf("interrupt instruction address: 0x%016llx\n", tf->epc);
            tf->epc += 2;
            break;
        ···
    }
}
```

最终结果：
![](https://raw.githubusercontent.com/showlibia/img/main/image-20240922023237077.png)

