#Add a check to handle cases where the user enters a negative number, prompting a suitable message. 
.data
prompt: .asciiz "Enter a number: "
negativeMsg: .asciiz "The number is negative.\n"
.text
.globl main

main:
   
    li $v0, 4              
    la $a0, prompt         
    syscall

   
    li $v0, 5              
    syscall
    move $t0, $v0          

    # Check if the number is negative
    bltz $t0, negative    

    # Exit program if number is not negative
    li $v0, 10              
    syscall

negative:

    li $v0, 4              
    la $a0, negativeMsg    
    syscall


    li $v0, 10
    syscall
