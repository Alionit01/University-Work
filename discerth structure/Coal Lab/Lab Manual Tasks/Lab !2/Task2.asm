#Modify the program to explicitly handle the case where the user inputs 0, returning 1 as the factorial. 
.data
prompt: .asciiz "Enter a number: "
negativeMsg: .asciiz "The number is negative.\n"
factorialMsg: .asciiz "The factorial is: "
newline: .asciiz "\n"
.text
.globl main

main:
    li $v0, 4              
    la $a0, prompt         
    syscall

    li $v0, 5              
    syscall
    move $t0, $v0          

    bltz $t0, negative    

    beqz $t0, zero_case

    li $t1, 1              
    li $t2, 1              
factorial_loop:
    mul $t1, $t1, $t2      
    addi $t2, $t2, 1       
    bgt $t2, $t0, print_factorial
    j factorial_loop

zero_case:
    li $t1, 1              
    j print_factorial

print_factorial:
    li $v0, 4              
    la $a0, factorialMsg    
    syscall

    li $v0, 1              
    move $a0, $t1          
    syscall

    li $v0, 4              
    la $a0, newline        
    syscall

    li $v0, 10
    syscall

negative:
    li $v0, 4              
    la $a0, negativeMsg    
    syscall

    li $v0, 10
    syscall
