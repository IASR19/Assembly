.data

msg: .asciiz "Digite um n�mero para calcular o fatorial: "
saida: .asciiz "O fatorial �: "

.text

    # Imprime a mensagem de msg e l� o n�mero do usu�rio
    li $v0, 4
    la $a0, msg
    syscall
    li $v0, 5
    syscall
    move $t0, $v0 # Salva o n�mero em $t0

    # Inicializa $t1 com 1 (o fatorial de 0 � 1)
    li $t1, 1
   
verdade:
	mul $t1, $t1, $t0
    	addi $t0, $t0, -1
    	j fim

fim:
    # Testa se o n�mero � maior que 1
    bgt $t0, 1, verdade
    

    # Se o n�mero � 1, imprime o saidaado e termina
    li $v0, 4
    la $a0, saida
    syscall
    move $a0, $t1
    li $v0, 1
    syscall
    li $v0, 10
    syscall

