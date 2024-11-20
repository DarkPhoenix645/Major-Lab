.data
prompt: .asciiz "Enter the value of n: "  # Message to prompt user for input

    .text
    .globl main

main:
    # Prompt user for input
    li $v0, 4                   # syscall for print string
    la $a0, prompt              # load address of prompt message
    syscall                     # print the prompt message

    # Read integer n from user
    li $v0, 5                   # syscall for read integer
    syscall                     # read integer into $v0
    move $a0, $v0               # move input to $a0

    # Base cases
    li $t0, 0                   # Fibonacci(0) = 0
    li $t1, 1                   # Fibonacci(1) = 1

    # Check if n is 0 or 1
    beq $a0, 0, base_case_0     # if n == 0, jump to base_case_0
    beq $a0, 1, base_case_1     # if n == 1, jump to base_case_1
    add  $a0, $a0, -1



fibonacci_loop:
    add $t4, $t0, $t1           # $t4 = $t0 + $t1 (next Fibonacci number)
    move $t0, $t1               # update $t0 = $t1
    move $t1, $t4               # update $t1 = $t4
    sub $a0, $a0, 1             # decrement $t2
    bne $a0, $zero, fibonacci_loop # repeat loop if $t2 != 0

    # Store result in $v0
    move $a0, $t1               # $v0 = Fibonacci(n)
    j print_result              # jump to print result

base_case_0:
    li $v0, 0                   # Fibonacci(0) = 0
    j print_result              # jump to print result

base_case_1:
    li $v0, 1                   # Fibonacci(1) = 1
    j print_result              # jump to print result

print_result:
    # Print the result
    li $v0, 1                   # syscall for print integer
    syscall                     # print the integer in $v0

    # Exit
    li $v0, 10                  # syscall for exit
    syscall                     # terminate the program