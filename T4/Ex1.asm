# Bernardo C. Franceschina (20203080)
.data
  	v1: 	.space 40
  	v2: 	.space 40
  	resA:	.asciiz "Media de A: "
  	resB:	.asciiz "Media de B: "

.text
    	# Leitura do número N
	li 	$v0, 5
    	syscall
    	move	$a0, $v0
	
    	# Inicialização dos vetores
    	li 	$t0, 0
    	li 	$t1, 0

    	# Leitura dos valores do primeiro vetor
input_v1:
      	bge 	$t0, $a0, input_v2
	
      	li 	$v0, 6
      	syscall
      	
      	li 	$t2, 4
	mult 	$t0, $t2	# i*4 para descobrir a posição na memória
	mflo	$t2
	
      	swc1 	$f0, v1($t2) 	# Guarda input na memória

      	addi 	$t0, $t0, 1
      	j 	input_v1

input_v2:
      	bge 	$t1, $a0, fim_inputs

      	li 	$v0, 6	
      	syscall
      	
      	li 	$t2, 4
	mult 	$t1, $t2	# i*4 para descobrir a posição na memória
	mflo	$t2
      	
      	swc1 	$f0, v2($t2)	# Guarda input na memória

      	addi 	$t1, $t1, 1
      	j 	input_v2

fim_inputs:
	jal 	calcula_media_v1
	jal	calcula_media_v2
	
	li	$v0, 4
	la	$a0, resA
	syscall
	
	li	$v0, 2
	mov.s	$f12, $f1
	syscall
	
	li	$v0, 4
	la	$a0, resB
	syscall
	
	li	$v0, 2
	mov.s	$f12, $f4
	syscall
	
	j fim
	
calcula_media_v1:
	addi    $sp, $sp, -4	# Salva resultado parcial e $ra
    	sw      $ra, 0($sp)

    	li	$t0, 0

    	j 	loop_calc_v1

    	jr 	$ra

loop_calc_v1:
	li 	$t2, 4
	mult 	$t0, $t2
	mflo	$t2

	lwc1	$f0, v1($t2)
	add.s	$f1, $f1, $f0
	
	addi	$t0, $t0, 1
	ble  	$t0, $a0, loop_calc_v1

	mtc1 	$a0, $f2	# converte o valor de inputs para float para fazer a média
	cvt.s.w $f2, $f2
	
	div.s	$f1, $f1, $f2
	
	lw      $ra, 0($sp)
	addi 	$sp, $sp, 4
	jr	$ra
	
calcula_media_v2:
	addi    $sp, $sp, -4	# Salva resultado parcial e $ra
    	sw      $ra, 0($sp)

    	li	$t0, 0

    	j 	loop_calc_v2

    	jr 	$ra

loop_calc_v2:
	li 	$t2, 4
	mult 	$t0, $t2
	mflo	$t2

	lwc1	$f5, v2($t2)
	add.s	$f4, $f4, $f5
	
	addi	$t0, $t0, 1
	ble  	$t0, $a0, loop_calc_v2

	div.s	$f4, $f4, $f2
	
	lw      $ra, 0($sp)
	addi 	$sp, $sp, 4
	jr	$ra

fim:
      	li 	$v0, 10
      	syscall
