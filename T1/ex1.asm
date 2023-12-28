# Bernardo C. Franceschina (20203080)

# EXERCÍCIO
# a = b + 35;
# c = d – a + e;

.data
	A: .word 0
	B: .word 13
	C: .word 0
	D: .word 57
	E: .word 7
.text
	lw $t0, B
	lw $t1, D
	lw $t2, E
	
	addi $s0, $t0, 35 # B + 35
	sw $s0, A 
	
	add $t3, $s0, $t2 # A + E
	sub $s1, $t1, $t3 # D - (A+E)
	sw $s1, C