# Loop for 9 turns
        li $t9, 0  # turn = 0
game_loop:
        # Display the grid
        move $a0, $t0  # z1
        move $a1, $t1  # z2
        move $a2, $t2  # z3
        move $a3, $t3  # z4
        move $t0, $t4  # z5
        move $t1, $t5  # z6
        move $t2, $t6  # z7
        move $t3, $t7  # z8
        move $t4, $t8  # z9
        li $v0, 4  # syscall for printing string
        la $a0, grid_format
        syscall

        # Determine whose turn it is (Player X or Player Y)
        andi $t5, $t9, 1  # Check if turn is even or odd
        beqz $t5, player_x_turn

        # Player Y's turn
        li $v0, 4
        la $a0, player2_prompt
        syscall
        li $v0, 5
        syscall  # get move
        move $t6, $v0  # player move in $t6
        j player_move

player_x_turn:
        # Player X's turn
        li $v0, 4
        la $a0, player1_prompt
        syscall
        li $v0, 5
        syscall  # get move
        move $t6, $v0  # player move in $t6

player_move:
        # Validate and process the move
        li $t7, 1  # z1
        li $t8, 2  # z2
        li $t9, 3  # z3
        bgtz $t6, move1
        j invalidd_move

move1:
        beq $t6, 1, valid_move_z1
        j move2
valid_move_z1:
        beqz $t7, player_move  # Check if z1 is available (not 1)
        move $t7, $t6 # If available, make the move
        j end_move

move2:
        beq $t6, 2, valid_move_z2
        j move3
valid_move_z2:
        beqz $t8, player_move  # Check if z2 is available
        move $t8, $t6
        j end_move

move3:
        beq $t6, 3, valid_move_z3
        j move4
valid_move_z3:
        beqz $t9, player_move  # Check if z3 is available
        move $t9, $t6
        j end_move

move4:
        beq $t6, 4, valid_move_z4
        j move5
valid_move_z4:
        beqz $t7, player_move
        move $t7, $t6
        j end_move

move5:
        beq $t6, 5, valid_move_z5
        j move6
valid_move_z5:
        beqz $t8, player_move
        move $t8, $t6
        j end_move

move6:
        beq $t6, 6, valid_move_z6
        j move7
valid_move_z6:
        beqz $t9, player_move
        move $t9, $t6
        j end_move

move7:
        beq $t6, 7, valid_move_z7
        j move8
valid_move_z7:
        beqz $t7, player_move
        move $t7, $t6
        j end_move

move8:
        beq $t6, 8, valid_move_z8
        j move9
valid_move_z8:
        beqz $t8, player_move
        move $t8, $t6
        j end_move

move9:
        beq $t6, 9, valid_move_z9
        j invalidd_move
valid_move_z9:
        beqz $t9, player_move
        move $t9, $t6

end_move:
        # Increase turn counter
        addi $t9, $t9, 1
        # Check if game is over
        bge $t9, 9, game_over_display
        j game_loop

invalidd_move:
        # Print invalid move message
        li $v0, 4
        la $a0, invalidd_move
        syscall
        j game_loop

game_over_display:
        # Print "Game over!" message
        li $v0, 4
        la $a0, game_over
        syscall
        # Exit program
        li $v0, 10
        syscall
