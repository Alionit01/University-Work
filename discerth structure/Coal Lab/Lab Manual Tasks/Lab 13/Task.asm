#Enhance the program to display the total sum of the entered numbers before showing the average. 

#Expected Output: 
#For inputs 5, 10, 15, 0, the output should include: 
#"Total Sum: 30, Average: 10" 
.data
prompt: .asciiz "Enter a number: "
sumMsg: .asciiz "Total Sum: "
avgMsg: .asciiz "Average: "
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
