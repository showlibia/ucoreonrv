#  练习一： 理解通过make生成执行文件的过程

## **kernel**：

- 这是操作系统的核心可执行文件。生成的内核文件通过链接各种目标文件（`.o` 文件）而来，这些 `.o` 文件是通过编译 `kernel` 源代码（包括 `libs` 和各个子目录中的 C 和汇编文件）生成的。
- 生成过程：
  - 使用编译器 `gcc` 编译源代码为目标文件（`.o`），并通过链接器 `ld` 将这些目标文件与 `tools/kernel.ld` 链接为可执行的内核文件。

```makefile
$(kernel): $(KOBJS)
	@echo + ld $@
	$(V)$(LD) $(LDFLAGS) -T tools/kernel.ld -o $@ $(KOBJS)
	@$(OBJDUMP) -S $@ > $(call asmfile,kernel)
	@$(OBJDUMP) -t $@ | $(SED) '1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d' > $(call symfile,kernel)
```



# **kernel.ld**

### 1. **输出架构和入口点**

```
OUTPUT_ARCH(riscv)
ENTRY(kern_entry)
```

- `OUTPUT_ARCH(riscv)`：指定输出文件的目标架构是 RISC-V。链接器根据这个指令生成适合 RISC-V 架构的可执行文件。
- `ENTRY(kern_entry)`：指定程序的入口函数为 `kern_entry`，即当 CPU 开始执行内核时，将从 `kern_entry` 函数的地址开始。

### 2. **基地址设定**

```
BASE_ADDRESS = 0x80200000;
```

- `BASE_ADDRESS`：内核的基地址是 `0x80200000`，这意味着内核在 RISC-V 的虚拟地址空间中从这个地址开始加载。这个地址通常由系统的内存布局决定。

### 3. **段布局的设定**

```
{
    /* Load the kernel at this address: "." means the current address */
    . = BASE_ADDRESS;
```

- `SECTIONS`：该指令开始定义程序的段布局。
- `.`：这是当前地址指针，表示链接器从 `BASE_ADDRESS`（`0x80200000`） 开始将接下来的代码、数据等放入内存。

#### 3.1 **.text 段**

```
.text : {
    *(.text.kern_entry .text .stub .text.* .gnu.linkonce.t.*)
}
```

- `.text` 段是存储代码的段，它包含所有以 `.text` 开头的段（包括内核入口 `kern_entry` 的代码段）。这意味着所有的代码都从内核基地址 `0x80200000` 开始放置。
- `*` 通配符：匹配所有输入文件中符合模式的段，如 `.text.kern_entry`（内核入口代码）、`.text`（常规代码）、`.stub` 和 `.gnu.linkonce.t.*`（编译器生成的唯一代码段）。

#### 3.2 **etext 符号**

```
PROVIDE(etext = .);
```

- 这个指令定义了 `etext` 符号，其值为当前地址（也就是 `.text` 段结束的位置）。`etext` 是一个常见的符号，用于表示内核中只读代码段（.text 和 .rodata）的末尾。

#### 3.3 **.rodata 段**

```
.rodata : {
    *(.rodata .rodata.* .gnu.linkonce.r.*)
}
```

- `.rodata` 段包含内核的只读数据，如常量字符串、只读数组等。与 `.text` 类似，它收集了所有输入文件中的 `.rodata` 段及相关内容。

#### 3.4 **数据段对齐**

```
. = ALIGN(0x1000);
```

- 这行指令将当前地址对齐到 4KB 边界（`0x1000`），确保接下来的数据段从一个新的页开始。这是为了满足内存管理的需求，因为数据段通常与代码段分开放置，方便分页管理。

#### 3.5 **.data 段**

```
.data : {
    *(.data)
    *(.data.*)
}
```

- `.data` 段包含所有可读写的数据变量，通常包括全局变量和静态变量。在运行时，这些变量会被加载到内存中，并可被修改。

#### 3.6 **.sdata 段**

```
.sdata : {
    *(.sdata)
    *(.sdata.*)
}
```

- `.sdata` 段类似于 `.data`，但是用于存放“较小的”全局变量。编译器可能会将小数据变量放在 `.sdata` 段，以优化访问和存储。

#### 3.7 **edata 符号**

```
PROVIDE(edata = .);
```

- `edata` 符号标记了 `.data` 段的结束位置。与 `etext` 类似，它表示所有已初始化的可读写数据的结束地址。

#### 3.8 **.bss 段**

```
.bss : {
    *(.bss)
    *(.bss.*)
    *(.sbss*)
}
```

- `.bss` 段存放未初始化的全局变量和静态变量，这些变量在运行时会自动初始化为 0。`.bss` 段在 ELF 文件中不占用实际空间，但在内存中会为其分配空间。
- `.sbss*`：包含较小的未初始化数据段。

#### 3.9 **end 符号**

```
PROVIDE(end = .);
```

- `end` 符号标记了内核映像的结束位置，表示内核的 `.bss` 段的末尾。这个符号通常用于表示内核加载的最高地址。

#### 3.10 **DISCARD 段**

```
/DISCARD/ : {
    *(.eh_frame .note.GNU-stack)
}
```

- `DISCARD`：这个段定义表示不要将指定的段包含在最终的可执行文件中。这里排除了 `.eh_frame` 和 `.note.GNU-stack` 段，它们是调试和栈信息，不需要包含在内核映像中。

### 4. **总结内核链接过程**

这个 `kernel.ld` 链接脚本的作用是将内核的不同部分组织成一个可执行文件。具体过程如下：

1. **.text 段**：链接器将所有的代码段加载到 `.text` 段，起始于地址 `0x80200000`。
2. **.rodata 段**：只读数据段紧跟着 `.text` 段。
3. **.data 段**：在对齐到页面边界后，内核的已初始化数据被放在 `.data` 段。
4. **.bss 段**：未初始化的数据放置在 `.bss` 段，运行时会自动初始化为 0。
5. **符号定义**：`etext`、`edata` 和 `end` 分别标记 `.text`、`.data` 和 `.bss` 的结束位置，方便内核在运行时引用这些信息。
6. **丢弃无用段**：使用 `/DISCARD/` 丢弃调试相关的信息。

最终，内核被组织成一个紧凑的二进制映像，其中 `.text` 段包含代码，`.rodata` 包含只读数据，`.data` 和 `.bss` 段用于存储内核的全局变量。



# **ucore.img**：

- 这是最终生成的镜像文件，包含操作系统的二进制表示，可以在仿真器或真实硬件上运行。
- 生成过程：
  - 通过 `objcopy` 工具，将内核 `kernel` 文件转换为二进制格式（`.img`），并去除所有符号表。

```makefile
$(UCOREIMG): $(kernel)
	$(OBJCOPY) $(kernel) --strip-all -O binary $@
```

**其他辅助目标**：

- **clean**: 删除生成的中间文件和目标文件，用于清理构建环境。
- **dist-clean**: 除了 `clean` 外，还删除一些压缩包和打包文件。
- **tags**: 生成代码标签，用于代码浏览工具（如 `cscope` 和 `ctags`）的索引文件。
- **qemu**: 用于运行生成的镜像文件 `ucore.img`，通过 `qemu` 仿真器执行。



# 主引导扇区

标准的MBR分区表结构为前466字节为代码段，紧跟64字节的分区表，最后两个字节为Boot Signature

分别为0x55和0xAA



# 练习二： 分析OpenSBI加载bin格式的OS的过程