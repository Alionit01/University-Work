.data
    prompt1: .asciiz "Enter the first number: "
    prompt2: .asciiz "Enter the second number: "
    prompt3: .asciiz "Enter the third number: "
    resultMsg: .asciiz "The result of the addition is: "

.text
    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 6
    syscall
    mov.s $f2, $f0

    li $v0, 4
    la $a0, prompt2
    syscall

    li $v0, 6
    syscall
    mov.s $f4, $f0

    li $v0, 4
    la $a0, prompt3
    syscall

    li $v0, 6
    syscall
    mov.s $f6, $f0

    add.s $f12, $f2, $f4
    add.s $f12, $f12, $f6

    li $v0, 4
    la $a0, resultMsg
    syscall

    li $v0, 2
    syscall
