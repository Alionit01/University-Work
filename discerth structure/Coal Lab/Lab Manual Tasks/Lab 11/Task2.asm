.data
num: .word 10
newline: .asciiz "\n"

.text
.globl main

main:
    lw $t0, num
    li $v0, 1

loop:
    blez $t0, exit
    move $a0, $t0
    syscall
    la $a0, newline
    li $v0, 4
    syscall
    subi $t0, $t0, 2
    j loop

exit:
    li $v0, 10
    syscall
