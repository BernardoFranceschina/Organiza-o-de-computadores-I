# Bernardo C. Franceschina (20203080)

# EXERCÍCIO
# a = (input) + 35;
# c = d – a + e;

.data
	A: .word 0
	B: .word 0
	C: .word 0
	D: .word 57
	E: .word 7
.text
	lw $t1, D
	lw $t2, E
	
	li $v0, 5
    	syscall
    	move $s0, $v0
	sw $s0, B # amazena valor do input
	
	addi $s1, $s0, 35 # A = B + 35
	sw $s1, A 
	
	add $t3, $s1, $t2 # t3 = A + E
	sub $s2, $t1, $t3 # D - t3
	sw $s2, C
	
	li $v0, 1
	move $a0, $s2
	syscall