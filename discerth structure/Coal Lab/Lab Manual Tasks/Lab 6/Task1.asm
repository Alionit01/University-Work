#Write a MIPS program that takes two numbers from the user,
#divides the first number by the second, and displays the quotient. 
.data
msg1: .asciiz "Enter 1st number: "
msg2: .asciiz "Enter 2nd number: "
msg_result: .asciiz "The quotient is: "

.text
main:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    div $t0, $t1
    mflo $t2

    li $v0, 4
    la $a0, msg_result
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 10
    syscall

