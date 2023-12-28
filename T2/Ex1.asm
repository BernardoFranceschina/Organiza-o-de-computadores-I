# Bernardo C. Franceschina (20203080)

.data
   
A: .word 1 2 3
   .word 0 1 4
   .word 0 0 1

B: .word 1 -2 5
   .word 0 1 -4
   .word 0 0 1

C: .word 0 0 0
   .word 0 0 0
   .word 0 0 0
  
.text
	
	jal transpor_matriz
	jal multiplica_matriz
	j saida
	
transpor_matriz:
	# Carrega endereço da matriz A
	la $t0, B

	# --- A[0][2] <--> A[1][1] ---
	lw $t1, 4($t0)  	# A[0][2]
	lw $t2, 12($t0) 	# A[1][1]

	sw $t2, 4($t0)  # Armazena na memória a troca
	sw $t1, 12($t0)

	# --- A[1][3] <--> A[3][1]
	lw $t1, 8($t0)  	# A[1][3]
	lw $t2, 24($t0) 	# A[3][1]

	sw $t2, 8($t0) 		# Armazena na memória a troca
	sw $t1, 24($t0)

	# --- A[2][3] <--> A[3][2]
	lw $t1, 20($t0) 	# A[2][3]
	lw $t2, 28($t0) 	# A[3][2]

	sw $t2, 20($t0) 	# Armazena na memória a troca
	sw $t1, 28($t0)

	# Fim transposição
	jr $ra

multiplica_matriz:
	# Carrega endereço da matriz B
	la $t1, A

	# Carrega endereço da matriz C
	la $t2, C

	# Multiplicação das matrizes A e B

	# PRIMEIRA LINHA

	# ----- 0, 0
	lw $t3, 0($t1) 		# A[0][0]
	lw $t4, 0($t0) 		# B[0][0]
	mul $t5, $t3, $t4 

	lw $t3, 4($t1) 		# A[0][1]
	lw $t4, 12($t0) 	# B[1][0]
	mul $t6, $t3, $t4 

	lw $t3, 8($t1) 		# A[0][2]
	lw $t4, 24($t0) 	# B[2][0]
	mul $t7, $t3, $t4 

	add $t8, $t5, $t6 	# Faz a soma dos resultados
	add $t9, $t8, $t7

	sw $t9, 0($t2) 		# Armazena na memória a multiplicação
	# -----

	# ----- 0, 1
	lw $t3, 0($t1) 		# A[0][0]
	lw $t4, 4($t0) 		# B[0][1]
	mul $t5, $t3, $t4 

	lw $t3, 4($t1) 		# A[0][1]
	lw $t4, 16($t0) 	# B[1][1]
	mul $t6, $t3, $t4 

	lw $t3, 8($t1) 		# A[0][2]
	lw $t4, 28($t0) 	# B[2][1]
	mul $t7, $t3, $t4 

	add $t8, $t5, $t6 	# Faz a soma dos resultados
	add $t9, $t8, $t7

	sw $t9, 4($t2) 		# Armazena na memória a multiplicação
	# -----

	# ----- 0, 2
	lw $t3, 0($t1)		# A[0][0]
	lw $t4, 8($t0) 		# B[0][2]
	mul $t5, $t3, $t4 

	lw $t3, 4($t1) 		# A[0][1]
	lw $t4, 20($t0) 	# B[1][2]
	mul $t6, $t3, $t4 

	lw $t3, 8($t1) 		# A[0][2]
	lw $t4, 32($t0) 	# B[2][2]
	mul $t7, $t3, $t4 

	add $t8, $t5, $t6 	# Faz a soma dos resultados
	add $t9, $t8, $t7

	sw $t9, 8($t2) 		# Armazena na memória a multiplicação
	# -----

	# SEGUNDA LINHA

	# ----- 1, 0
	lw $t3, 12($t1) 	# A[1][0]
	lw $t4, 0($t0) 		# B[0][0]
	mul $t5, $t3, $t4 

	lw $t3, 16($t1) 	# A[1][1]
	lw $t4, 12($t0) 	# B[1][0]
	mul $t6, $t3, $t4 

	lw $t3, 20($t1) 	# A[1][2]
	lw $t4, 24($t0) 	# B[2][0]
	mul $t7, $t3, $t4 

	add $t8, $t5, $t6 	# Faz a soma dos resultados
	add $t9, $t8, $t7

	sw $t9, 12($t2) 	# Armazena na memória a multiplicação
	# -----

	# ----- 1, 1
	lw $t3, 12($t1) 	# A[1][0]
	lw $t4, 4($t0) 		# B[0][1]
	mul $t5, $t3, $t4 

	lw $t3, 16($t1) 	# A[1][1]
	lw $t4, 16($t0) 	# B[1][1]
	mul $t6, $t3, $t4 

	lw $t3, 20($t1) 	# A[1][2]
	lw $t4, 28($t0) 	# B[2][1]
	mul $t7, $t3, $t4 

	add $t8, $t5, $t6 	# Faz a soma dos resultados
	add $t9, $t8, $t7

	sw $t9, 16($t2) 	# Armazena na memória a multiplicação
	# -----

	# ----- 1, 2
	lw $t3, 12($t1) 	# A[1][0]
	lw $t4, 8($t0) 		# B[0][2]
	mul $t5, $t3, $t4 

	lw $t3, 16($t1) 	# A[1][1]
	lw $t4, 20($t0) 	# B[1][2]
	mul $t6, $t3, $t4 

	lw $t3, 20($t1) 	# A[1][2]
	lw $t4, 32($t0) 	# B[2][2]
	mul $t7, $t3, $t4 

	add $t8, $t5, $t6 	# Faz a soma dos resultados
	add $t9, $t8, $t7

	sw $t9, 20($t2) 	# Armazena na memória a multiplicação
	# -----

	# TERCEIRA LINHA

	# ----- 2, 0
	lw $t3, 24($t1) 	# A[0][2]
	lw $t4, 0($t0) 		# B[0][0]
	mul $t5, $t3, $t4 

	lw $t3, 28($t1) 	# A[1][2]
	lw $t4, 12($t0) 	# B[0][1]
	mul $t6, $t3, $t4 

	lw $t3, 32($t1) 	# A[2][2]
	lw $t4, 24($t0) 	# B[0][2]
	mul $t7, $t3, $t4 

	add $t8, $t5, $t6 	# Faz a soma dos resultados
	add $t9, $t8, $t7

	sw $t9, 24($t2) 	# Armazena na memória a multiplicação
	# -----

	# ----- 2, 1
	lw $t3, 24($t1) 	# A[0][2]
	lw $t4, 4($t0) 		# B[1][0]
	mul $t5, $t3, $t4 

	lw $t3, 28($t1) 	# A[1][2]
	lw $t4, 16($t0) 	# B[1][1]
	mul $t6, $t3, $t4 

	lw $t3, 32($t1) 	# A[2][2]
	lw $t4, 28($t0) 	# B[1][2]
	mul $t7, $t3, $t4 

	add $t8, $t5, $t6 	# Faz a soma dos resultados
	add $t9, $t8, $t7

	sw $t9, 28($t2) 	# Armazena na memória a multiplicação
	# -----

	# ----- 2, 2
	lw $t3, 24($t1) 	# A[0][2]
	lw $t4, 8($t0) 		# B[2][0]
	mul $t5, $t3, $t4 

	lw $t3, 28($t1) 	# A[1][2]
	lw $t4, 20($t0) 	# B[2][1]
	mul $t6, $t3, $t4 

	lw $t3, 32($t1) 	# A[2][2]
	lw $t4, 32($t0) 	# B[2][2]
	mul $t7, $t3, $t4 

	add $t8, $t5, $t6 	# Faz a soma dos resultados
	add $t9, $t8, $t7

	sw $t9, 32($t2) 	# Armazena na memória a multiplicação
	# -----
	# Fim multiplicação
	jr $ra

saida:

