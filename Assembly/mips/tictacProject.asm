.data
# Game board: 9 cells
board:      .byte '1', '2', '3', '4', '5', '6', '7', '8', '9'
newline:    .asciiz "\n"
player1:    .asciiz "Player 1 (X), enter your move: "
player2:    .asciiz "Player 2 (O), enter your move: "
invalid:    .asciiz "Invalid move. Try again.\n"
winner:     .asciiz "\nWe have a winner!\n"
draw:       .asciiz "\nIt's a draw!\n"

.text
.globl main

main:
    # Initialize variables
    li $t0, 1            # Player 1 = 1, Player 2 = 0
    li $t1, 0            # Moves counter (max 9 moves)

game_loop:
    # Display the board
    jal display_board

    # Check for draw (all 9 moves used)
    li $t2, 9
    beq $t1, $t2, check_draw

    # Prompt the current player for input
    beq $t0, 1, player1_turn
    beq $t0, 0, player2_turn

player1_turn:
    li $v0, 4              
    la $a0, player1
    syscall
    j get_input

player2_turn:
    li $v0, 4              
    la $a0, player2
    syscall
    j get_input

get_input:
    # Read move (1–9)
    li $v0, 5              # Read integer syscall
    syscall
    move $t3, $v0          # Store input in $t3

    # Validate input (1–9)
    li $t4, 1
    li $t5, 9
    blt $t3, $t4, invalid_move
    bgt $t3, $t5, invalid_move

    # Convert input to board index (0–8)
    subi $t3, $t3, 1       # $t3 = $t3 - 1

    # Check if cell is already taken
    la $t6, board          # Load board base address
    add $t6, $t6, $t3      # Get address of board[$t3]
    lb $t7, 0($t6)         # Load value of board[$t3]
    li $t8, 'X'
    li $t9, 'O'
    beq $t7, $t8, invalid_move
    beq $t7, $t9, invalid_move

    # Update the board with player's symbol
    beq $t0, 1, mark_X
    beq $t0, 0, mark_O

mark_X:
    sb $t8, 0($t6)         
    j next_turn

mark_O:
    sb $t9, 0($t6)         
    j next_turn

invalid_move:
    li $v0, 4              
    la $a0, invalid
    syscall
    j get_input

next_turn:
    # Increment moves counter
    addi $t1, $t1, 1

    # Check for a winner
    jal check_winner

    # Switch player
    beq $t0, 1, switch_to_player2
    beq $t0, 0, switch_to_player1

switch_to_player2:
    li $t0, 0
    j game_loop

switch_to_player1:
    li $t0, 1
    j game_loop

check_draw:
    # If no winner and 9 moves used, it’s a draw
    li $v0, 4
    la $a0, draw
    syscall
    j end_game

check_winner:
    # Check rows, columns, and diagonals for a winner
    la $t6, board

    # Row 1
    lb $t2, 0($t6)         # board[0]
    lb $t3, 1($t6)         # board[1]
    lb $t4, 2($t6)         # board[2]
    beq $t2, $t3, row1_check
    j check_col1

row1_check:
    beq $t3, $t4, declare_winner

check_col1:
    # Additional winner checks (row2, row3, col1, col2, etc.)
    # Can be implemented similarly as above...

    # No winner yet, return to game loop
    jr $ra

declare_winner:
    li $v0, 4
    la $a0, winner
    syscall
    j end_game

display_board:
    # Print the current state of the board
    la $t6, board

    # Print first row
    lb $a0, 0($t6)         # board[0]
    li $v0, 11             # Print character syscall
    syscall
    li $a0, '|'            # Separator
    syscall
    lb $a0, 1($t6)         # board[1]
    syscall
    li $a0, '|'
    syscall
    lb $a0, 2($t6)         # board[2]
    syscall
    li $v0, 4
    la $a0, newline        
    syscall

    # Repeat for rows 2 and 3...
    jr $ra

end_game:
    # Exit program
    li $v0, 10
    syscall
