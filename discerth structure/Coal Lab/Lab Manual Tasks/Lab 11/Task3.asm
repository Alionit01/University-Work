#Modify the program to print only even numbers from the initial value of num down to zero.
#What adjustments did you make to achieve this output? 
.data
num: .word 6

.text
.globl main

main:
    lw $t0, num
    li $v0, 1

loop:
    blez $t0, exit
    andi $t1, $t0, 1
    beqz $t1, print_num
    subi $t0, $t0, 2
    j loop

print_num:
    move $a0, $t0
    syscall
    subi $t0, $t0, 2
    j loop

exit:
    li $v0, 10
    syscall
