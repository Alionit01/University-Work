
.data
array:      .space 40
msg:        .asciiz "Even number: \n"

.text
.globl main

main:
    li $t0, 0
    li $t1, 0
    la $t2, array

loop:
    sw $t1, 0($t2)
    addi $t2, $t2, 4
    addi $t1, $t1, 2
    addi $t0, $t0, 1
    blt $t0, 10, loop

    la $t2, array
    li $t0, 0

print_loop:
    lw $a0, 0($t2)
    li $v0, 1
    syscall
    la $a0, msg
    li $v0, 4
    syscall
    addi $t2, $t2, 4
    addi $t0, $t0, 1
    blt $t0, 10, print_loop

    li $v0, 10
    syscall
