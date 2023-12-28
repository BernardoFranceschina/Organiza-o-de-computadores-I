# Bernardo C. Franceschina (20203080)
.data

.text
	li	$v0, 5		# Input do usuário
	syscall
	move	$a1, $v0

	jal 	fatorial	# Chama fatorial e salva em a0
	move	$a0, $v0

	li 	$v0, 1		# Imprime resultado
	syscall

	li	$v0, 10		# Fim do programa
	syscall

# ------------------------------ Fatorial ------------------------------
				# Calcula Fatorial de $a1 e retorna no $v0
fatorial:
    	addi    $sp, $sp, -8	# Salva resultado parcial e $ra
    	sw      $s0, 4($sp)
    	sw      $ra, 0($sp)
    	bne     $a1, 0, fat_else
    	addi    $v0, $zero, 1	# Return 1
    	j 	fat_return
fat_else:
    	move    $s0, $a1	# salva $a1
    	addi    $a1, $a1, -1 	# x -= 1
    	jal     fatorial

    	multu   $s0, $v0 	# $v0 = Fact(x-1)
    	mflo    $v0		# return x*Fact(x-1)
fat_return:
    	lw      $s0, 4($sp)
    	lw      $ra, 0($sp)	# Restaura o ponteiro $ra
    	addi    $sp, $sp, 8
    	jr      $ra
