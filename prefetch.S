.text
.globl _start
_start:

li t0, 0x100000000
li t4, 0x120000000
li t2, 0
csrr a0, mcycle
.begin:
lw t1, 0(t0)
lw x0, 0x100(t0)

#include LOOPFILE

addi t0, t0, 0x100
blt t0, t4, .begin

.escape:
csrr a1, mcycle
sub a0, a1, a0
ebreak
.globl _off_end
_off_end:
j _off_end
