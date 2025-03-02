.data
num1: .float 1.2
num2: .float 1.2
msg1: .asciiz "THis is equal"
.text
main:
	lwc1 $f2, num1
	lwc1 $f4, num2
	
	c.eq.s $f2, $f4
	bc1t equal
	
	li $v0, 10
	syscall
equal:
	la $a0, msg1
	li $v0, 4
	syscall	
