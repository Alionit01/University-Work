#Write a MIPS program that retrieves and displays the value at the 5th index of the array. 
#Ensure that the program correctly calculates the index and outputs the value. 
.data
array:  .word 0, 2, 4, 6, 8, 10, 12, 14, 16, 18
.text
.globl main

main:
    la $t0, array
    li $t1, 5
    mul $t1, $t1, 4
    add $t2, $t0, $t1
    lw $t3, 0($t2)
    move $a0, $t3
    li $v0, 1
    syscall
    li $v0, 10
    syscall
