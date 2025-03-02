.data
msg1: .asciiz "This is sum of floating numbers"
num1: .float 1.2
num2: .float 1.2
.text
la $a0, msg1
li $v0, 4
syscall

l.s $f1, num1
l.s $f2, num2

add.s $f0, $f1, $f2

li $v0,2
move $a0, $f0
syscall

li $v0, 10
syscall