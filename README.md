# TinyCPU
A custom CPU and assembler I created as a fun practical application of my CPU designing knowladge. 

## Hardware Description:
For those who will like run their own code, a Logisim implementation of the CPU is provided.

The CPU is non-pipelined and has 4 registers and a 256-byte call stack.

The address space is 12 bit.

### The instruction set is as follows:
* MOV Rg1,Rg2
Copies the value of Rg1 to Rg2
* ADD Rg1,Rg2
Sets value of Rg2 to Rg1 + accumulator
* SUB Rg1,Rg2
Sets value of Rg2 to Rg1 - accumulator
* AND Rg1,Rg2
Sets value of Rg2 to Rg1 & accumulator
* OR Rg1,Rg2
Sets value of Rg2 to Rg1 + accumulator
* XOR Rg1,Rg2
Sets value of Rg2 to Rg1 ⊕ accumulator
* SHL Rg1,Rg2
Shifts the value of Rg1 to the right by 1 bit and places result in Rg2
* SHR Rg1,Rg2
Shifts the value of Rg1 to the left by 1 bit and places result in Rg2
* LDA Address
Loads a value from memory to the accumulator
* STA Address
Stores a value from accumulator to the memory
* SNC
Skips the next 2 bytes if the carry flag is not set
* SNZ
Skips the next 2 bytes if the zero flag is not set
* JMP Address
Jumps execution to the given address
* CAL Address
Executes JMP but pushes a return address to the call stack
* RET
Executes JMP but the address is popped from the call stack
* HLT
Halts the CPU clock

## The Assembler: TCASM
TinyCpu ASeMbler

A python program that takes an input text file and creates either a binary file to transfer to the CPU via UART, or a RAM image for the logisim implementation.

This should be simple enough to use just by looking at it, so I will omit the explanation.
