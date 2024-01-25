# TinyCPU
A custom CPU and assembler I created as a fun practical application of my CPU designing knowladge. 

**For in-depth information about everything TinyCPU or TCASM related, see "TinyCPU Public Report.pdf".**

## Hardware Description:
For those who want to run their own code, a Logisim implementation of the CPU is provided.

The CPU is multi-cycle, with 4 registers and a 256-byte call stack.

The data width is 8 bit, and the address space is 12 bit.

## The Assembler: TCASM
TinyCpu ASeMbler

A python program (with GUI!) that takes an input text file and creates either a binary file to transfer to the CPU via UART, or a RAM image for the logisim implementation.
