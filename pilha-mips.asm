.data
stack:
    .space 1000    # aloca 1000 bytes de memória para a pilha

.text
main:
    # inicializa o ponteiro de pilha
    la $sp, stack
    # inicializa o ponteiro de quadro
    addi $fp, $sp, 1000

    # inserir um valor na pilha
    li $t0, 10    # valor a ser inserido na pilha
    addi $sp, $sp, -4    # decrementa o ponteiro de pilha
    sw $t0, ($sp)    # armazena o valor na pilha

    # remover um valor da pilha
    lw $t1, ($sp)    # carrega o valor do topo da pilha
    addi $sp, $sp, 4    # incrementa o ponteiro de pilha
    # agora $t1 contém o valor removido da pilha

    # saída do programa
    li $v0, 10    # código da syscall exit
    syscall
