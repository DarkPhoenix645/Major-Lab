.data
    num1:   .word 5      # First number
    num2:   .word 3      # Second number
    resultAdd: .asciiz "Addition result: "
    resultSub: .asciiz "Subtraction result: "
    newline:  .asciiz "\n"   # Newline for printing

.text
    .globl main

main:
    # Load numbers
    lw $t0, num1          # Load num1 into register $t0
    lw $t1, num2          # Load num2 into register $t1

    # Add numbers
    add $t2, $t0, $t1     # Store result in $t2

    # Print Addition result
    li $v0, 4
    la $a0, resultAdd
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    # Print newline
    li $v0, 4
    la $a0, newline
    syscall

    # Subtraction
    sub $t3, $t0, $t1     # Store result in $t3

    # Print Subtraction result
    li $v0, 4
    la $a0, resultSub
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    # Exit the program
    li $v0, 10            # syscall to exit
    syscall
