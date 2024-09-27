# lab1

## 练习1：描述处理中断异常的流程

加电 -> OpenSBI启动 -> 跳转到 0x80200000 (`kern/init/entry.S`）->进入`kern_init()`函数（`kern/init/init.c`)

在`kern_init()`中调用` trap.c()`中的` idt_init() `以初始化中断向量表.

```c
void idt_init(void) {
    extern void __alltraps(void);
    /* Set sscratch register to 0, indicating to exception vector that we are
     * presently executing in the kernel */
    write_csr(sscratch, 0);
    /* Set the exception vector address */
    write_csr(stvec, &__alltraps);
}
```

- 清空**sscratch**寄存器

- 将**\__alltraps**的地址写给**stvec**寄存器

检查**sstatus**寄存器的SIE和UIE，如果SIE数值为0，且cpu运行在S态，则禁用所有中断。如果UIE为0，则禁用用户态所有中断的产生。

当中断产生后，查询**stvec**寄存器，判断其低2位：

- 如果低2位是00，说明其高位存储的是中断处理程序的地址，直接跳转运行。

- 如果低2位是01，说明其高位存储的是中断向量表基址，结合异常原因并查询中断向量表。跳转运行中断处理程序。

在处理中断时，硬件会自动设置**sepc**与**scause**，分别存储触发中断的指令的地址和中断发生的原因。

## 练习2：对于任何中断，都需要保存所有寄存器吗？为什么？

不是，在`trapentry.S`恢复上下文的代码中并没有保存并恢复所有寄存器,只恢复了`status`和`epc`寄存器。因为`badaddr`寄存器和`cause`寄存器中保存的分别是出错的地址以及出错的原因，处理完这个中断的时候，也就不需要这两个寄存器中保存的值，可以不用恢复这两个寄存器。

## 练习3：触发、捕获、处理异常

在函数**trap()**中添加如下打印语句：

```c
    cprintf("tf->cause == %d\n",  tf->cause);
    cprintf("tf->epc == %d\n", tf->epc);
```

同时注释**kern\_init**函数中的时钟中断函数，` make qemu`后发现可以成功打印

![](..\pics\lab1\3.1.png)

![](..\pics\lab1\3.2.png)
