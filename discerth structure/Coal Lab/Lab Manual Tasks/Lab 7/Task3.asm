#Create a MIPS program that allows the user to input a value and store it in the 3rd index of the array. 
#After storing the value, display the entire array to confirm the modification. 
.data
array:  .space 40
prompt: .asciiz "Enter a value: "
newline: .asciiz "\n"

.text
.globl main

main:
    la $t0, array
    li $t1, 0

init_loop:
    sw $t1, 0($t0)
    addi $t0, $t0, 4
    addi $t1, $t1, 1
    blt $t1, 10, init_loop

    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall

    la $t0, array
    li $t1, 3
    mul $t1, $t1, 4
    add $t2, $t0, $t1
    sw $v0, 0($t2)

    la $t0, array
    li $t1, 0

display_loop:
    lw $a0, 0($t0)
    li $v0, 1
    syscall
    la $a0, newline
    li $v0, 4
    syscall
    addi $t0, $t0, 4
    addi $t1, $t1, 1
    blt $t1, 10, display_loop

    li $v0, 10
    syscall
