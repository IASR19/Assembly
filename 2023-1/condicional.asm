.text
#$s0 -> a
li $s1, 5 #b
li $s2, 3 #c
li $t0,2 #x
li $t1,3 #y
bne $t0, $t1, true # ($t0 != $t1
add $s0, $s1, $s2
j exit

true: 
	sub $s0, $s1, $s2

exit:
	