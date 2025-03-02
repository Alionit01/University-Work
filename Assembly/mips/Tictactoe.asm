.data
board:      .asciiz "1|2|3\n4|5|6\n7|8|9\n"
instructions: .asciiz "\nEnter position (1-9): "
invalid:    .asciiz "\nInvalid move, try again.\n"
player1:    .asciiz "\nPlayer 1's turn (X): "
player2:    .asciiz "\nPlayer 2's turn (O): "
win_msg:    .asciiz "\nWe have a winner!\n"
draw_msg:   .asciiz "\nIt's a draw!\n"

.text
main:
    # Game Initialization
    la $s0, board        # Load the board into $s0
    li $t0, 1            # Player 1 (X)
    li $t1, 0            # Winner flag (0 = no winner)

game_loop:
    # Display the Board
    li $v0, 4
    la $a0, board
    syscall

    # Prompt Player
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
    # Prompt for input
    li $v0, 4
    la $a0, instructions
    syscall

    # Read input
    li $v0, 5           # Read integer syscall
    syscall
    move $t2, $v0       # Save input in $t2

    # Validate input (1-9)
    li $t3, 1
    li $t4, 9
    blt $t2, $t3, invalid_input
    bgt $t2, $t4, invalid_input

    # Update Board
    # Convert input to board position
    sub $t2, $t2, 1         # Zero-indexed
    li $t5, 3               # Board width
    div $t6, $t2, $t5       # Row index
    mfhi $t7                # Column index
    # TODO: Update board logic goes here

    # Check for Win/Draw
    # TODO: Implement win/draw checking logic

    # Switch Player
    beq $t0, 1, switch_to_player2
    beq $t0, 0, switch_to_player1

switch_to_player2:
    li $t0, 0
    j game_loop

switch_to_player1:
    li $t0, 1
    j game_loop

invalid_input:
    li $v0, 4
    la $a0, invalid
    syscall
    j get_input

# End of Game
end_game:
    # Display result
    li $v0, 4
    beq $t1, 1, display_winner
    beq $t1, 0, display_draw

display_winner:
    la $a0, win_msg
    syscall
    j exit

display_draw:
    la $a0, draw_msg
    syscall
    j exit

exit:
    li $v0, 10  # Exit syscall
    syscall
