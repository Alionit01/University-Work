#Modify the program to check if the user inputs a negative number and prompt them to enter a valid number. 

#Expected Output: 
#"For input -5, the output should be: 
#"Invalid input! Please enter a non-negative number. 
.data
prompt: .asciiz "Enter a number: "
sumMsg: .asciiz "Total Sum: "
avgMsg: .asciiz "Average: "
invalidMsg: .asciiz "Invalid input! Please enter a non-negative number.\n"
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

    li $t1, 0              
    li $t2, 0              

input_loop:
    bltz $t0, invalid_input   # If input is negative, prompt for valid input

    beqz $t0, calculate    # If the input is 0, exit loop

    add $t1, $t1, $t0      # Add input to total sum
    addi $t2, $t2, 1       # Increment the count

    li $v0, 4              
    la $a0, prompt         
    syscall

    li $v0, 5              
    syscall
    move $t0, $v0          

    j input_loop

invalid_input:
    li $v0, 4              
    la $a0, invalidMsg     
    syscall

    li $v0, 5              
    syscall
    move $t0, $v0          
    j input_loop

calculate:
    li $v0, 4              
    la $a0, sumMsg         
    syscall

    li $v0, 1              
    move $a0, $t1          
    syscall

    li $v0, 4              
    la $a0, newline        
    syscall

    div $t1, $t2           # Divide sum by count for average
    mflo $t3               # Get the quotient (average)

    li $v0, 4              
    la $a0, avgMsg         
    syscall

    li $v0, 1              
    move $a0, $t3          
    syscall

    li $v0, 4              
    la $a0, newline        
    syscall

    li $v0, 10
    syscall
