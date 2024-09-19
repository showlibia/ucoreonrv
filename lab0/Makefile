PROJ	:= lab1
EMPTY	:=
SPACE	:= $(EMPTY) $(EMPTY)
SLASH	:= /

V       := @

#ifndef GCCPREFIX
GCCPREFIX := riscv64-unknown-elf-
#endif

ifndef QEMU
QEMU := qemu-system-riscv64
endif


# eliminate default suffix rules
.SUFFIXES: .c .S .h

# delete target files if there is an error (or make is interrupted)
.DELETE_ON_ERROR:

# define compiler and flags
HOSTCC		:= gcc  
HOSTCFLAGS	:= -Wall -O2

GDB		:= $(GCCPREFIX)gdb

CC		:= $(GCCPREFIX)gcc -g
# Werror: make all warnings into errors
# Wno-unused: disables warning about unused variables
# -mcmodel=medany: use medium code model, specify for the code model for RISC-V target, allows the code to be placed anywhere in the address space
CFLAGS  := -mcmodel=medany -std=gnu99 -Wno-unused -Werror 

# -fno-builtin: Prevents GCC from replacing standard library functions (like memcpy, printf) with its optimized built-in versions.
# -nostdinc: Do not search the standard system directories for header files.
CFLAGS	+= -fno-builtin -Wall -O2 -nostdinc $(DEFS)

# -fno-stack-protector: Disable stack smashing protection
# -ffunction-sections: Place each function into its own section in the output file
# -fdata-sections: Place each data item into its own section in the output file
CFLAGS	+= -fno-stack-protector -ffunction-sections -fdata-sections


CTYPE	:= c S

LD      := $(GCCPREFIX)ld

# -m elf64lriscv: specify the target architecture
LDFLAGS	:= -m elf64lriscv

# -nostdlib: Do not use the standard system startup files or libraries when linking
# --gc-sections: Remove unused sections from the output file
LDFLAGS	+= -nostdlib --gc-sections

OBJCOPY := $(GCCPREFIX)objcopy
OBJDUMP := $(GCCPREFIX)objdump

COPY	:= cp
MKDIR   := mkdir -p
MV		:= mv
RM		:= rm -f
AWK		:= awk
SED		:= sed
SH		:= sh
TR		:= tr
TOUCH	:= touch -c

OBJDIR	:= obj
BINDIR	:= bin

ALLOBJS	:=
ALLDEPS	:=
TARGETS	:=

# include another makefile
include tools/function.mk

# call function to generate a list of files in CTYPES
listf_cc = $(call listf,$(1),$(CTYPE))

# for cc
# $1 is the list of files to be added
# $2 is the target name, file or library
# $3 is the CFLAGS
# $4 is the OBJDIR
add_files_cc = $(call add_files,$(1),$(CC),$(CFLAGS) $(3),$(2),$(4))
create_target_cc = $(call create_target,$(1),$(2),$(3),$(CC),$(CFLAGS))

# for hostcc
add_files_host = $(call add_files,$(1),$(HOSTCC),$(HOSTCFLAGS),$(2),$(3))
create_target_host = $(call create_target,$(1),$(2),$(3),$(HOSTCC),$(HOSTCFLAGS))

# patsubst, a Makefile function for pattern substitution, is used to replace the target file $(1) extension .$(2) with .$(3)
cgtype = $(patsubst %.$(2),%.$(3),$(1))

# toobj, a Makefile function, is used to convert $(1) to an object file
objfile = $(call toobj,$(1))

# use the cgtype function to generate the assembly file, output file, and symbol file based on file .o
asmfile = $(call cgtype,$(call toobj,$(1)),o,asm)
outfile = $(call cgtype,$(call toobj,$(1)),o,out)
symfile = $(call cgtype,$(call toobj,$(1)),o,sym)

# for match pattern
# pipeline pass $(2) to AWK, and use AWK to match $(1) with each word in $(2)
match = $(shell echo $(2) | $(AWK) '{for(i=1;i<=NF;i++){if(match("$(1)","^"$$(i)"$$")){exit 1;}}}'; echo $$?)

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# include kernel/user

INCLUDE	+= libs 

# add -I in front of each element in INCLUDE
CFLAGS	+= $(addprefix -I,$(INCLUDE))

LIBDIR	+= libs

$(call add_files_cc,$(call listf_cc,$(LIBDIR)),libs,)

# -------------------------------------------------------------------
# kernel

KINCLUDE	+= kern/debug/ \
			   kern/driver/ \
			   kern/trap/ \
			   kern/libs/\
			   kern/mm/ \
			   kern/arch/

KSRCDIR		+= kern/init \
			   kern/debug \
			   kern/libs \
			   kern/driver \
			   kern/trap \
			   kern/mm

KCFLAGS		+= $(addprefix -I,$(KINCLUDE))

$(call add_files_cc,$(call listf_cc,$(KSRCDIR)),kernel,$(KCFLAGS))

# read packet from kernel libs
KOBJS	= $(call read_packet,kernel libs)

# create kernel target
kernel = $(call totarget,kernel)

# specifies a dependency for the $(kernel) target. 
$(kernel): tools/kernel.ld

#  the kernel depends on the object files listed in $(KOBJS)
$(kernel): $(KOBJS)
# print a message: the linker ld is being invoked to build the kernel, $@ for the target name
	@echo + ld $@
	$(V)$(LD) $(LDFLAGS) -T tools/kernel.ld -o $@ $(KOBJS)
	@$(OBJDUMP) -S $@ > $(call asmfile,kernel)
# Calls objdump with the -t flag to produce a symbol table for the kernel binary.
	@$(OBJDUMP) -t $@ | $(SED) '1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d' > $(call symfile,kernel)

$(call create_target,kernel)

# -------------------------------------------------------------------
# create ucore.img
UCOREIMG	:= $(call totarget,ucore.img)


$(UCOREIMG): $(kernel)
	$(OBJCOPY) $(kernel) --strip-all -O binary $@

$(call create_target,ucore.img)

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

$(call finish_all)

IGNORE_ALLDEPS	= clean \
				  dist-clean \
				  grade \
				  touch \
				  print-.+ \
				  handin

ifeq ($(call match,$(MAKECMDGOALS),$(IGNORE_ALLDEPS)),0)
-include $(ALLDEPS)
endif

# files for grade script

TARGETS: $(TARGETS)
# set the default goal of makefile
.DEFAULT_GOAL := TARGETS

.PHONY: qemu 
qemu: $(UCOREIMG) $(SWAPIMG) $(SFSIMG)
#	$(V)$(QEMU) -kernel $(UCOREIMG) -nographic
# V for @ , suppresses the echoing of the command that follows.
# -manchine virt: use the virt machine
# -nographic: disable graphical output so that QEMU runs in the terminal
# -bios default: use the default BIOS
# -device loader: load the kernel image to the specified address
	$(V)$(QEMU) \
		-machine virt \
		-nographic \
		-bios default \
		-device loader,file=$(UCOREIMG),addr=0x80200000

# for handing in the homework and grading
.PHONY: grade touch

GRADE_GDB_IN	:= .gdb.in
GRADE_QEMU_OUT	:= .qemu.out
HANDIN			:= proj$(PROJ)-handin.tar.gz

TOUCH_FILES		:= kern/trap/trap.c

MAKEOPTS		:= --quiet --no-print-directory

grade:
	$(V)$(MAKE) $(MAKEOPTS) clean
	$(V)$(SH) tools/grade.sh

touch:
	$(V)$(foreach f,$(TOUCH_FILES),$(TOUCH) $(f))

print-%:
	@echo $($(shell echo $(patsubst print-%,%,$@) | $(TR) [a-z] [A-Z]))

.PHONY: clean dist-clean handin packall tags
clean:
	$(V)$(RM) $(GRADE_GDB_IN) $(GRADE_QEMU_OUT) cscope* tags
	-$(RM) -r $(OBJDIR) $(BINDIR)

dist-clean: clean
	-$(RM) $(HANDIN)

handin: packall
	@echo Please visit http://learn.tsinghua.edu.cn and upload $(HANDIN). Thanks!

packall: clean
	@$(RM) -f $(HANDIN)
	@tar -czf $(HANDIN) `find . -type f -o -type d | grep -v '^\.*$$' | grep -vF '$(HANDIN)'`

tags:
	@echo TAGS ALL
	$(V)rm -f cscope.files cscope.in.out cscope.out cscope.po.out tags
	$(V)find . -type f -name "*.[chS]" >cscope.files
	$(V)cscope -bq 
	$(V)ctags -L cscope.files
