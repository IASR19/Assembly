.data
prompt: .asciiz "Digite sua idade: "
result: .asciiz "Sua idade daqui 30 anos sera: "

.text
.globl main

main:
    # imprime o prompt na tela
    li $v0, 4
    la $a0, prompt
    syscall

    # lê a idade do usuário do teclado
    li $v0, 5
    syscall
    move $s0, $v0  # armazena a idade em $s0

    # calcula a idade do usuário daqui a 30 anos
    addi $s1, $s0, 30

    # imprime o resultado na tela
    li $v0, 4
    la $a0, result
    syscall

    li $v0, 1
    move $a0, $s1
    syscall

    # termina o programa
    li $v0, 10
    syscall
