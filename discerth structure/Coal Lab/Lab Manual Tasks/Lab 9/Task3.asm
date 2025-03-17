.data
    prompt1: .asciiz "Enter an integer: "
    prompt2: .asciiz "Enter a floating-point number: "
    equalMsg: .asciiz "The values are equal.\n"
    notEqualMsg: .asciiz "The values are not equal.\n"
    intGreaterMsg: .asciiz "The integer is greater.\n"
    floatGreaterMsg: .asciiz "The floating-point number is greater.\n"

.text
    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0         # Store integer in $t0

    li $v0, 4
    la $a0, prompt2
    syscall

    li $v0, 6
    syscall
    mov.s $f2, $f0        # Store floating-point number in $f2

    # Cast the integer to float by moving it into a floating-point register
    mtc1 $t0, $f4         # Move integer from $t0 to floating-point register $f4
    cvt.s.w $f4, $f4      # Convert the integer in $f4 to float

    # Compare the integer (casted to float) and the floating-point number
    c.eq.s $f4, $f2       # Compare $f4 (casted integer) with $f2 (float)
    bc1t equal            # If equal, branch to equal

    # If they are not equal, check which one is greater
    c.lt.s $f4, $f2       # Check if integer (casted) is less than floating-point number
    bc1t floatGreater     # If true, branch to floatGreater

    li $v0, 4
    la $a0, intGreaterMsg
    syscall
    j end

floatGreater:
    li $v0, 4
    la $a0, floatGreaterMsg
    syscall
    j end

equal:
    li $v0, 4
    la $a0, equalMsg
    syscall
    j end

end:
    li $v0, 10
    syscall
