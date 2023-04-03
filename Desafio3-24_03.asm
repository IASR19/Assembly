.data
a: .byte 54  # define a variável a como um byte com valor 54
b: .byte 45  # define a variável b como um byte com valor 45
result: .asciiz "Resultado: "  # define a string "Resultado:"

.text
.globl main

main:
    # carrega a variável a em $s0
    la $t0, a
    lb $s0, ($t0)

    # carrega a variável b em $s1
    la $t1, b
    lb $s1, ($t1)

    # soma os valores de a e b e armazena em $s2
    add $s2, $s0, $s1

    # imprime a string "Resultado:" na tela
    la $a0, result
    li $v0, 4
    syscall

    # imprime o valor de $s2 (resultado da soma) na tela
    li $v0, 1
    move $a0, $s2
    syscall

    # retorna 0
    li $v0, 10
    syscall
