.data
msg1: .asciiz "Enter first number "
msg2: .asciiz "\nEnter second number "
msg3: .asciiz "\nEnter the operation (a for add, b for sub, c for mul, d for div): "
result_msg: .asciiz "\nCalculation: "
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

li $v0, 4
la $a0, msg3
syscall

 li $v0, 12
syscall
move $t2, $v0


beq $t2, 97, op1
beq $t2, 98, op2
beq $t2, 99, op3
beq $t2, 100, op4

op1:
    add $t3, $t0, $t1      
    j print_result

op2:
    sub $t3, $t0, $t1    
    j print_result

op3:
    mul $t3, $t0, $t1       
    j print_result

op4:     
    div $t0, $t1            
    mflo $t3                
    j print_result


print_result:
    li $v0, 4               
    la $a0, result_msg      
    syscall

    li $v0, 1           
    move $a0, $t3           
    syscall

exit:
    li $v0, 10              #
    syscall




