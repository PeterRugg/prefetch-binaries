.text
.globl _start
_start:

li t0, 0x100000000
li t3, 0x110000000
li t4, 0x1000
li t2, 0
csrr a0, mcycle
.begin:
bge t0, t3, .escape
add t5, t4, t0
lw x0, 0(t5)
lw t1, 0(t0)
add t2, t2, t1
addi t0, t0, 0x100
j .begin

.escape:
csrr a1, mcycle
sub a0, a1, a0
ebreak
.globl _off_end
_off_end:
j _off_end
