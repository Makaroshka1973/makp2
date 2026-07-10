MEMORY
{
    RAM (rwx) : ORIGIN = 0x00000000, LENGTH = 16M
}

SECTIONS
{
    .text :
    {
        _stext = .;
        KEEP(*(.text.entry))   /* crt0.s runs first */
        *(.text .text.*)
        *(.rodata .rodata.*)
        _etext = .;
    } > RAM

    .data :
    {
        _sdata = .;
        __global_pointer$ = . + 0x800;
        *(.data .data.*)
        _edata = .;
    } > RAM

    .bss :
    {
        _sbss = .;
        __bss_start__ = .;
        *(.bss .bss.*)
        *(COMMON)
        _ebss = .;
        __bss_end__ = .;
    } > RAM

    _estack = ORIGIN(RAM) + LENGTH(RAM);
    _end = .;
}
