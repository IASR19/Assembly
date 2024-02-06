.data
msg: .asciiz "Insira um numero: "
result: .asciiz "A soma dos numeros maiores que 10 e: "

.text
.globl main
main:
li $t0, 0
li $t1, 0
la $a0, msg
li $v0, 4
syscall

loop:
li $v0, 5
syscall
addi $t1, $t1, 1
ble $v0, 10, skip
add $t0, $t0, $v0

skip:
bne $t1, 10, loop
la $a0, result
li $v0, 4
syscall
move $a0, $t0
li $v0, 1
syscall
li $v0, 10
syscall