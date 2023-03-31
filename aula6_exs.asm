.text 

# Deslocamento à direita em 8 bits:

li $t0, 10
srl $t1, $t0, 8 # resultado em $t1 = 0

li $t0, 25
srl $t1, $t0, 8 # resultado em $t1 = 0

li $t0, 43
srl $t1, $t0, 8 # resultado em $t1 = 0

li $t0, 89
srl $t1, $t0, 8 # resultado em $t1 = 0

#------------------------------------------

# Deslocamento à esquerda em 4 bits:


li $t0, 10
sll $t1, $t0, 4 # resultado em $t1 = 160

li $t0, 25
sll $t1, $t0, 4 # resultado em $t1 = 400

li $t0, 43
sll $t1, $t0, 4 # resultado em $t1 = 688

li $t0, 89
sll $t1, $t0, 4 # resultado em $t1 = 1424
