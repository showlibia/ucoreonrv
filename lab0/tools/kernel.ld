/* Simple linker script for the ucore kernel.
   See the GNU ld 'info' manual ("info ld") to learn the syntax. */

/* set the target(riscv) architecture for the linked output. */
OUTPUT_ARCH(riscv)
/* entry point, the first point of execution when the kernel start */
ENTRY(kern_entry)

BASE_ADDRESS = 0x80200000;

SECTIONS
{
    /* Load the kernel at this address: "." means the current address */
    . = BASE_ADDRESS;

    /* holds executable code */
    .text : {
        *(.text.kern_entry .text .stub .text.* .gnu.linkonce.t.*)
    }

    PROVIDE(etext = .); /* Define the 'etext' symbol to this value */

    /* holds read-only data */
    .rodata : {
        *(.rodata .rodata.* .gnu.linkonce.r.*)
    }

    /* Adjust the address for the data segment to the next page */
    . = ALIGN(0x1000);

    /* The data segment , holds initialized global and static variables */
    .data : {
        *(.data)
        *(.data.*)
    }

    /* small data, used for small data objects that are optimized for quicker access. */
    .sdata : {
        *(.sdata)
        *(.sdata.*)
    }

    /* marking the end of the data section */
    PROVIDE(edata = .);

    /* holds uninitialized global and static variables. */
    .bss : {
        *(.bss)
        *(.bss.*)
        *(.sbss*)
    }

    PROVIDE(end = .);

    /*  discard certain sections .eh_frame for exception handling and stack unwinding and .note.GNU-stack for informational section */
    /DISCARD/ : {
        *(.eh_frame .note.GNU-stack)
    }
}
