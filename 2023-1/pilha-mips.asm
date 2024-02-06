.data
stack:
    .space 1000    # aloca 1000 bytes de mem�ria para a pilha

.text
main:
    # inicializa o ponteiro de pilha
    la $sp, stack
    # inicializa o ponteiro de quadro
    addi $fp, $sp, 1000

    # insere valores na pilha
    li $t0, 0    # inicializa o �ndice do topo da pilha
    li $t2, 1    # define o n�mero m�ximo de valores para inserir na pilha
    addi $t3, $zero, 10    # define o valor padr�o a ser inserido na pilha
    loop:
        # solicita entrada do usu�rio
        li $v0, 5    # c�digo da syscall read_int
        syscall
        # armazena o valor na pilha
        addi $sp, $sp, -4    # decrementa o ponteiro de pilha
        sw $v0, ($sp)    # armazena o valor na pilha
        addi $t0, $t0, 1    # incrementa o �ndice do topo da pilha
        # verifica se atingiu o limite de valores para inserir
        bne $t0, $t2, loop    # volta ao in�cio do loop se ainda n�o atingiu o limite
        # caso contr�rio, pula para o pr�ximo passo

    # remove valores da pilha
    li $t1, 0    # inicializa o �ndice do topo da pilha
    loop2:
        # remove o valor do topo da pilha
        lw $t4, ($sp)    # carrega o valor do topo da pilha
        addi $sp, $sp, 4    # incrementa o ponteiro de pilha
        # exibe o valor removido da pilha
        li $v0, 1    # c�digo da syscall print_int
        move $a0, $t4    # move o valor removido para $a0
        syscall
        addi $t1, $t1, 1    # incrementa o �ndice do topo da pilha
        # verifica se todos os valores foram removidos
        bne $t1, $t2, loop2    # volta ao in�cio do loop se ainda n�o foram removidos
        # caso contr�rio, pula para o pr�ximo passo

    # sa�da do programa
    li $v0, 10    # c�digo da syscall exit
    syscall
