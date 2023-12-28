# Bernardo C. Franceschina (20203080)
.data
	matriz: .space 1024
.text
	li	$s0, 0		# Value
	
externo:
	bge 	$t0, 16, saida_externo
			
	j 	interno
	
interno:
	bge 	$t2, 16, saida_interno
	
	sw	$s0, matriz($t3)
	addi 	$t3, $t3, 4	# Calcular proximo endereço
	addi 	$s0, $s0, 1	# Soma valor a ser armazenado	
	
	addi	$t2, $t2, 1 
	j	interno

saida_interno:
	addi 	$t0, $t0, 1	# Contador loop externo ++
	move 	$t2, $zero	# zera contador interno
	j 	externo

saida_externo:
	li	$v0, 10
	syscall
