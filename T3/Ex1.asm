# Bernardo C. Franceschina (20203080)
.data
	est: 	.double 1.0	
	x: 	.double 81.0
	div2:	.double 2.0
.text
	# Pega o numero N
	li 	$v0, 5
	syscall
	move 	$a0, $v0
	
	jal raiz_quadrada
	
	# Printa resultado
	li $v0, 3
	mov.d $f12, $f2
	syscall
	
	sqrt.d $f12, $f0
	
	li $v0, 3
	syscall
	
	li $v0, 10
	syscall
	
raiz_quadrada:	
	addi 	$sp, $sp, -4
	sw 	$ra, 0($sp)
  	
 	# contador
  	li 	$t1, 0
  	
  	# Numero X
  	ldc1  	$f0, x 
  	# Começa a estimativa = 1
  	ldc1  	$f2, est
  	# Load nmr 2
  	ldc1  	$f4, div2
  
loop:
  	# Incrementa o contador de iterações
  	addi 	$t1, $t1, 1
  	
  	div.d	$f6, $f0, $f2 # x / estimativa
  	add.d	$f6, $f6, $f2 # res + estimativa 
  	div.d	$f2, $f6, $f4 # res / 2
  	
  	# N < contador
	blt  	$t1, $a0, loop
	
	# Restaura o ponteiro $ra
	lw 	$ra, 0($sp)
	
	jr 	$ra
