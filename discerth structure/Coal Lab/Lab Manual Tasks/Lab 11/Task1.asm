#Modify the existing while loop program to decrement the value of num by 2 instead of 1. 
.data
num: .word 10

.text
.globl main

main:
    lw $t0, num
    li $v0, 1

loop:
    blez $t0, exit
    move $a0, $t0
    syscall
    subi $t0, $t0, 2
    j loop

exit:
    li $v0, 10
    syscall
#What is the output when you run the modified program? 