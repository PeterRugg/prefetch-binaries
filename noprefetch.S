li t0, 0x100000000
li t3, 0x110000000
li t2, 0
csrr a0, mcycle
.begin:
bge t0, t3, .escape
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
