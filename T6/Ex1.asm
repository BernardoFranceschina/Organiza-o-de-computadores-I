# Bernardo C. Franceschina (20203080)
.data

.text
	li	$v0, 5		# Input do usuário
	syscall
	move	$t0, $v0
	
	li	$a0, 1		# Inicio do resultado

loop:	
	beqz	$t0, saida
	
	mult 	$a0, $t0	# N*(N-1)
	mflo	$a0
	
	addi	$t0, $t0, -1	# N-1
	j	loop

saida:
	li 	$v0, 1		# Imprime resultado
	syscall
	
	li	$v0, 10		# Fim do programa
	syscall
	
