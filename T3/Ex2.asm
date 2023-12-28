# Bernardo C. Franceschina (20203080)
.data

.text
	
	li 	$a2, 5		# Carrega o numero de termos que a série vai ter
	jal 	calcula
	
	move 	$a0, $v0
	li	$v0, 1
	syscall 
	
	li 	$v0, 10
	syscall
	
calcula:
	addi 	$sp, $sp, -4
	sw 	$ra, 0($sp)
 	
  	li 	$t1, 0		# contador
  	
  	jal 	loop
  	
  	jr 	$ra
  
loop:
  	addi 	$t1, $t1, 1	# Incrementa o contador de iterações
  	
  	li 	$a1, 5		# Fatorial
	jal 	fact
	move	$t0, $v0	# t0 = fatorial de a1

	li	$a0, 2
	li	$a1, 3
	li 	$v0, 1		# $v0 precisa ser 1 para que a multiplicação com o resultado parcial funcione corretamente
	jal 	pow
	move 	$t2, $v0	# t1 = a0 elevado a a1
  	
	blt  	$t1, $a2, loop	# N < contador

	lw 	$ra, 0($sp)	# Restaura o ponteiro $ra
	addi 	$sp, $sp, 4
	jr 	$ra

# ------------------------------ Fatorial ------------------------------
				# Calcula Fatorial de $a1 e retorna no $v0 
fact:
    	addi    $sp, $sp, -8	# Salva resultado parcial e $ra
    	sw      $s0, 4($sp)
    	sw      $ra, 0($sp)
    	bne     $a1, 0, fact_else
    	addi    $v0, $zero, 1	# Return 1
    	j 	fact_return
fact_else:
    	move    $s0, $a1	# salva $a1
    	addi    $a1, $a1, -1 	# x -= 1
    	jal     fact
    				
    	multu   $s0, $v0 	# $v0 = Fact(x-1)
    	mflo    $v0		# return x*Fact(x-1)
fact_return:
    	lw      $s0, 4($sp)
    	lw      $ra, 0($sp)	# Restaura o ponteiro $ra
    	addi    $sp, $sp, 8
    	jr      $ra

# ------------------------------ END ------------------------------

# ------------------------------ Pow ------------------------------
				# Calcula $a0 elevado a $a1  e retorna no $v0 
pow:
	addi    $sp, $sp, -8	# Salva resultado parcial e $ra
    	sw      $s0, 4($sp)
    	sw      $ra, 0($sp)
  	jal 	pow_loop
  	jr 	$ra
  
pow_loop:
  	addi 	$a1, $a1, -1	# Incrementa o contador de iterações
  	
  	multu   $a0, $v0
    	mflo    $v0
 
	bgtz  	$a1, pow_loop
	lw      $s0, 4($sp)
    	lw      $ra, 0($sp)	# Restaura o ponteiro $ra
	jr 	$ra
# ------------------------------ END ------------------------------
