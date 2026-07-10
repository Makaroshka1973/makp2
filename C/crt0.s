.section .text.entry
.global _start

_start:
    # Initialize stack pointer from linker script
    la sp, _estack

    # Initialize global pointer
    .option push
    .option norelax
    la gp, __global_pointer$
    .option pop

    # Clear BSS segment
    la t0, _sbss
    la t1, _ebss
bss_clear_loop:
    bge t0, t1, bss_clear_done
    sw zero, 0(t0)
    addi t0, t0, 4
    j bss_clear_loop

bss_clear_done:
    # Jump to C entry point
    jal main

# Infinite loop if C's main returns
end_loop:
    j end_loop
