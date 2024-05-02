.data
msg: .asciiz "Insira um numero: "
result: .asciiz "A diferenca entre o quadrado da soma e a soma dos quadrados eh: "

.text
.globl main

main:
    li $t0, 0      
    li $t1, 0      
    li $t2, 0      

    la $a0, msg
    li $v0, 4
    syscall

    li $v0, 5
    syscall
    move $t3, $v0  

loop:
    add $t0, $t0, $t2  
    mul $t4, $t2, $t2  
    add $t1, $t1, $t4  

    addi $t2, $t2, 1   
    blt $t2, $t3, loop 

    mul $t4, $t0, $t0  
    sub $t4, $t4, $t1  

    la $a0, result
    li $v0, 4
    syscall

    move $a0, $t4
    li $v0, 1
    syscall

    li $v0, 10
    syscall