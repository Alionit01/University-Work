
    .data 
    result:
        .asciiz "The result is: "
        
   .text
     .globl main
     main: 
     
        li $t0, 5
        li $t1, 7
        
        add $t2, $t0, $t2
         
        li $v0, 4
        la $a0, result
        syscall
        
                
        li $v0, 1
        move $a0, $t2
        syscall
        
         li $v0, 10
     syscall 