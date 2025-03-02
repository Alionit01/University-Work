.data
num1: .word 15
num2: .word 15
msg1: .asciiz "Equal"
msg2: .asciiz "Not Equal"
.text
main:
	
	lw $t1, num1 
	lw $t2, num2
	
	beq $t1, $t2, equal
	bne $t1, $t2, notEqual
	
	li $v0, 10
	syscall
	
equal:
	la $a0, msg1
	li $v0, 4
	syscall
	
notEqual: 
	la $a0, msg2
	li $v0, 4
	syscall
	



