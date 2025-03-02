.data
intro:    .asciiz "Tic Tac Toe\n"
bar:      .asciiz "   |"
floor:    .asciiz "\n---|---|---\n"
newline:  .asciiz "\n"
z1:       .asciiz "1"
z2:       .asciiz "2"
z3:       .asciiz "3"
z4:       .asciiz "4"
z5:       .asciiz "5"
z6:       .asciiz "6"
z7:       .asciiz "7"
z8:       .asciiz "8"
z9:       .asciiz "9"
askX:     .asciiz "Player X trun"
askY:     .asciiz "Player Y trun"
buffer: .space 100  

.text
main:
    # Print intro
    la $a0, intro
    li $v0, 4
    syscall

    # Print row 1: 1 | 2 | 3
    la $a0, z1
    li $v0, 4
    syscall
    
    la $a0, bar
    li $v0, 4
    syscall
    
    la $a0, z2
    li $v0, 4
    syscall
    
    la $a0, bar
    li $v0, 4
    syscall
    
    la $a0, z3
    li $v0, 4
    syscall

    # Print floor
    la $a0, floor
    li $v0, 4
    syscall

    # Print row 2: 4 | 5 | 6
    la $a0, z4
    li $v0, 4
    syscall
    
    la $a0, bar
    li $v0, 4
    syscall
    
    la $a0, z5
    li $v0, 4
    syscall
    
    la $a0, bar
    li $v0, 4
    syscall
    
    la $a0, z6
    li $v0, 4
    syscall

    # Print floor
    la $a0, floor
    li $v0, 4
    syscall

    # Print row 3: 7 | 8 | 9
    la $a0, z7
    li $v0, 4
    syscall
    
    la $a0, bar
    li $v0, 4
    syscall
    
    la $a0, z8
    li $v0, 4
    syscall
    
    la $a0, bar
    li $v0, 4
    syscall
    
    la $a0, z9
    li $v0, 4
    syscall

    # Print final newline
    la $a0, newline
    li $v0, 4
    syscall
    
    la $a0, askX
    li $v0, 4
    syscall
    
      # Take string input
    la $a0, buffer     # Load the address of the buffer
    li $a1, 100        # Max length of the string
    li $v0, 8          # System call for read string
    syscall
    
     la $a0, buffer          # Load address of the buffer containing user input
    li $v0, 4               # System call for print string
    syscall

exit:
    li $v0, 10
    syscall
