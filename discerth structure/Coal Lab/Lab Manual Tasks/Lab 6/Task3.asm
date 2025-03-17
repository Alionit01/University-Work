#Modify the existing program to perform addition of three numbers instead of two. 
#Prompt the user to enter three numbers, add them, and display the result of the addition.  
.data 
prompt1: .asciiz "Enter the first number: " 
prompt2: .asciiz "Enter the second number: " 
prompt3: .asciiz "Enter the third number: " 
result_mult: .asciiz "The result of addition is: " 
newline: .asciiz "\n" 

.text 
    li $v0, 4                
    la $a0, prompt1         
    syscall               

    li $v0, 5               
    syscall                 
    move $t0, $v0          

    li $v0, 4               
    la $a0, prompt2          
    syscall                 

    li $v0, 5               
    syscall                 
    move $t1, $v0           

    li $v0, 4               
    la $a0, prompt3         
    syscall                

    li $v0, 5               
    syscall                 
    move $t2, $v0          

    add $t3, $t0, $t1       
    add $t3, $t3, $t2       

    li $v0, 4               
    la $a0, result_mult     
    syscall                 

    move $a0, $t3           
    li $v0, 1               
    syscall                

    li $v0, 4               
    la $a0, newline         
    syscall                 

    li $v0, 10              
    syscall 
