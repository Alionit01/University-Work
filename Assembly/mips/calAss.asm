.data
msg1: .asciiz "Enter first number "
msg2: .asciiz "\nEnter second number "
result1: .asciiz "\nAddition: "
result2: .asciiz "\nSubstraction: "
result3: .asciiz "\nMultiplication: "
result4: .asciiz "\nDivision: "

.text

li $v0, 4
la $a0, msg1
syscall

li $v0,5
syscall
move $t0, $v0

li $v0, 4
la $a0, msg2
syscall

li $v0, 5
syscall
move $t1, $v0


    add $t3, $t0, $t1  
        
   li $v0, 4
   la $a0, result1
   syscall
   
    li $v0, 1
   move $a0, $t3
   syscall
   

    sub $t3, $t0, $t1    
    
    li $v0, 4
   la $a0, result2
   syscall
   
    li $v0, 1
   move $a0, $t3
   syscall


    mul $t3, $t0, $t1       
   li $v0, 4
   la $a0, result3
   syscall
   
    li $v0, 1
   move $a0, $t3
   syscall
   
    div $t0, $t1            
    mflo $t3                
   li $v0, 4
   la $a0, result4
   syscall
   
    li $v0, 1
   move $a0, $t3
   syscall

exit:
    li $v0, 10              
    syscall




