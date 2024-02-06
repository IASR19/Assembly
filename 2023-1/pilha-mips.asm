.data
stack:
    .space 1000    # aloca 1000 bytes de memória para a pilha

.text
main:
    # inicializa o ponteiro de pilha
    la $sp, stack
    # inicializa o ponteiro de quadro
    addi $fp, $sp, 1000

    # insere valores na pilha
    li $t0, 0    # inicializa o índice do topo da pilha
    li $t2, 1    # define o número máximo de valores para inserir na pilha
    addi $t3, $zero, 10    # define o valor padrão a ser inserido na pilha
    loop:
        # solicita entrada do usuário
        li $v0, 5    # código da syscall read_int
        syscall
        # armazena o valor na pilha
        addi $sp, $sp, -4    # decrementa o ponteiro de pilha
        sw $v0, ($sp)    # armazena o valor na pilha
        addi $t0, $t0, 1    # incrementa o índice do topo da pilha
        # verifica se atingiu o limite de valores para inserir
        bne $t0, $t2, loop    # volta ao início do loop se ainda não atingiu o limite
        # caso contrário, pula para o próximo passo

    # remove valores da pilha
    li $t1, 0    # inicializa o índice do topo da pilha
    loop2:
        # remove o valor do topo da pilha
        lw $t4, ($sp)    # carrega o valor do topo da pilha
        addi $sp, $sp, 4    # incrementa o ponteiro de pilha
        # exibe o valor removido da pilha
        li $v0, 1    # código da syscall print_int
        move $a0, $t4    # move o valor removido para $a0
        syscall
        addi $t1, $t1, 1    # incrementa o índice do topo da pilha
        # verifica se todos os valores foram removidos
        bne $t1, $t2, loop2    # volta ao início do loop se ainda não foram removidos
        # caso contrário, pula para o próximo passo

    # saída do programa
    li $v0, 10    # código da syscall exit
    syscall
