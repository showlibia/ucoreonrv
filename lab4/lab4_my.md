## 练习1：分配并初始化一个进程控制块
### alloc_proc 函数（位于 kern/process/proc.c 中）负责分配并返回一个新的struct proc_struct结构，用于存储新建立的内核线程的管理信息。ucore 需要对这个结构进行最基本的初始化，你需要完成这个初始化过程。

```c
static struct proc_struct *
alloc_proc(void) {
    struct proc_struct *proc = kmalloc(sizeof(struct proc_struct));
    if (proc != NULL) {
        proc->state = PROC_UNINIT;            // 初始化进程状态为未初始化
        proc->pid = -1;                       // 进程 ID，默认值 -1，稍后在do_fork中会分配真正的 PID
        proc->runs = 0;                       // 运行次数初始化为 0
        proc->kstack = 0;                     // 进程的内核栈，初始设为 0，稍后会分配真正的内核栈
        proc->need_resched = 0;               // 不需要调度，初始设置为 false
        proc->parent = NULL;                  // 父进程，初始设置为 NULL
        proc->mm = NULL;                      // 进程的内存管理结构，初始设为 NULL
        memset(&(proc->context), 0, sizeof(struct context)); // 初始化上下文为 0
        proc->tf = NULL;                      // 中断 trapframe，初始设为 NULL
        proc->cr3 = 0;                        // CR3 寄存器，初始化为 0
        proc->flags = 0;                      // 进程标志位，初始设置为 0
        memset(proc->name, 0, PROC_NAME_LEN + 1); // 进程名称初始化为空字符串

    }
    return proc;
}
```

### 请在实验报告中简要说明你的设计实现过程。并说明 proc_struct 中struct context context和struct trapframe *tf成员变量含义和在本实验中的作用是啥？（提示：通过看代码和编程调试可以判断出来）

①context作用：进程的上下文，主要作用是保存进程在上下文切换时的状态。当调度器切换进程时，会使用 context 来保存和恢复每个进程的寄存器状态，确保进程能够从中断的地方继续执行。

②tf：中断帧的指针，总是指向内核栈的某个位置：当进程从用户空间跳到内核空间时，中断帧记录了进程在被中断前的状态。当内核需要跳回用户空间时，需要调整中断帧以恢复让进程继续执行的各寄存器值。除此之外，uCore内核允许嵌套中断。因此为了保证嵌套中断发生时tf 总是能够指向当前的trapframe，uCore 在内核栈上维护了 tf 的链。

## 练习二：为新创建的内核线程分配资源

```c
int
do_fork(uint32_t clone_flags, uintptr_t stack, struct trapframe *tf) {
    int ret = -E_NO_FREE_PROC;
    struct proc_struct *proc;
    if (nr_process >= MAX_PROCESS) {
        goto fork_out;
    }
    ret = -E_NO_MEM;
    proc = alloc_proc();
    if (proc == NULL) 
    {
        goto fork_out;
    }
    if (setup_kstack(proc) != 0)
    {
        goto bad_fork_cleanup_proc;
    }
    if (copy_mm(clone_flags, proc) != 0) 
    {
        goto bad_fork_cleanup_kstack;
    }
    copy_thread(proc, stack, tf);
    
    local_intr_save(intr_flag);//屏蔽中断，intr_flag置为1
    {
        proc->pid = get_pid();//获取当前进程PID
        hash_proc(proc); //建立hash映射
        list_add(&proc_list, &(proc->list_link));//加入进程链表
        nr_process ++;
    local_intr_restore(intr_flag);//恢复中断

    proc->state = PROC_RUNNABLE;


    //    7. set ret vaule using child proc's pid
    ret = proc->pid;
   // cprintf("%d*****\n",ret);

  

fork_out:
    return ret;

bad_fork_cleanup_kstack:
    put_kstack(proc);
bad_fork_cleanup_proc:
    kfree(proc);
    goto fork_out;
}

```


###  请说明 ucore 是否做到给每个新 fork 的线程一个唯一的 id？请说明你的分析和理由。

做到了

1.在每次调用get_pid时，使用
```c
local_intr_save(intr_flag);//屏蔽中断，intr_flag置为1
//
//
local_intr_restore(intr_flag);//恢复中断
```
屏蔽中断，防止同时多个进程申请进程号


2.在get_pid函数中，通过遍历所有进程的 pid，代码确保了当前 last_pid 不会与已分配的 pid 冲突，并且通过自增 last_pid，会找到一个未被占用的 pid。在找到重复时，它会递增 last_pid 并继续遍历，直到找到一个未占用的 pid。


## 练习三：理解proc_run函数和调用的函数如何完成进程切换的

### 在本实验的执行过程中，创建且运行了几个内核线程？
创建并运行了idle和init两个内核线程

### 语句local_intr_save(intr_flag);....local_intr_restore(intr_flag);在这里有何作用?请说明理由

作用分别是屏蔽中断和打开中断，防止在进程切换时同时发生其他进程的调度，保护进程切换不会被中断，相当于互斥锁。在获得新fork的子进程号以及将新进程加入链表的时候也用到这两个函数，起到了防止多个进程同时进行相同工作导致的冲突。