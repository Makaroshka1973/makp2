# Introduction

## Background

Understanding computer architecture requires more than knowing how instructions work at the software level. It also involves understanding how hardware components interact, how data moves through a processor, and how instructions are executed internally.

Although there are many educational resources available, understanding the actual hardware implementation can still be challenging for beginners. Most existing processor implementations are written in Hardware Description Languages (HDLs), which require additional knowledge and may make it difficult for newcomers to follow the underlying hardware structure.


## Project Motivation

The main motivation behind this project was to create a more accessible way to explore and understand the RISC-V architecture.

Instead of using an HDL-based implementation, this project uses Logisim-Evolution to represent the processor as a visual digital circuit. This allows learners to observe the connections between functional units, follow data paths, and investigate how individual components contribute to instruction execution.

The project is intended to serve as a learning resource for those who want to understand not only how RISC-V instructions work, but also how they are implemented in hardware.


## Project Goals

The primary goal is to develop a functional and understandable model of a RISC-V processor while keeping its hardware implementation as clear as possible.


## Project Scope
The processor is a single-core, single-threaded, single-cycle implementation of the RISC-V architecture.

Its main functional units include a program counter, a memory, a register file, an Arithmetic Logic Unit (ALU), an instruction decoder, and several additional units responsible for instruction processing and system control.

The implementation also includes a Von Neumann memory system, as well as memory-mapped I/O for interaction with external peripherals.

A two-phase clocking scheme is used to separate combinational computation from state updates. This makes the execution process easier to observe and investigate.

The processor supports the RV32I base instruction set and the Zicsr extension, but does not implement the RISC-V M, A, C, or any other extension to keep it simple.

The privileged functionality includes selected Machine-mode and User-mode mechanisms, CSR operations, and interrupt and exception handling. It is not intended to be a complete implementation of the RISC-V privileged architecture specification.

Further details about the architecture, individual components, and implementation decisions are provided in the following documentation.



# Navigation

[< Previous: README](../README.md) | [Next: Architecture >](architecture.md)
