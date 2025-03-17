.data
    prompt1: .asciiz "Enter the first number: "
    prompt2: .asciiz "Enter the second number: "
    resultMsg: .asciiz "The result of the division is: "
    errorMsg: .asciiz "Error: Division by zero is not allowed.\n"

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

    c.eq.s $f4, $f0
    bc1f no_zero

    li $v0, 4
    la $a0, errorMsg
    syscall
    j end

no_zero:
    div.s $f12, $f2, $f4

    li $v0, 4
    la $a0, resultMsg
    syscall

    li $v0, 2
    syscall

end:
    li $v0, 10
    syscall
