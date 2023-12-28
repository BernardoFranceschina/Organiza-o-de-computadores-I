.data

A: .space 4096
B: .space 4096
MAX: .word 32
block_size: .word 4

.text

.global main

main:

# Declara as variáveis para os loops
la $t0, MAX
la $t1, A
la $t2, B

# Entrada das matrizes A e B
loop_input_A:
beq $t0, $zero, end_input_A
sll $t3, $t0, 2
add $t4, $t1, $t3
add $t5, $t2, $t3

loop_input_A_inner:
sll $t6, $t2, 2
add $t7, $t5, $t6
lw $s0, 0($t4)
sw $s0, 0($t7)
addi $t4, $t4, 4
addi $t7, $t7, 4
bne $t2, $t0, loop_input_A_inner
addi $t0, $t0, -4
j loop_input_A

end_input_A:

loop_input_B:
beq $t0, $zero, end_input_B
sll $t3, $t0, 2
add $t4, $t1, $t3
add $t5, $t2, $t3

loop_input_B_inner:
sll $t6, $t2, 2
add $t7, $t5, $t6
lw $s0, 0($t4)
sw $s0, 0($t7)
addi $t4, $t4, 4
addi $t7, $t7, 4
bne $t2, $t0, loop_input_B_inner
addi $t0, $t0, -4
j loop_input_B

end_input_B:

# Loop principal
loop_main:
beq $t0, $zero, end_main
sll $t3, $t0, 2
add $t4, $t1, $t3

loop_main_inner:
beq $t1, $zero, end_loop_main_inner
sll $t5, $t1, 2
add $t6, $t2, $t5

loop_block:
beq $t3, $zero, end_loop_block
beq $t6, $zero, end_loop_block
sll $t7, $t6, 2
add $t8, $t4, $t7
add $t9, $t5, $t3

loop_block_inner:
lw $s0, 0($t8)
lw $s1, 0($t9)
add $s0, $s0, $s1
sw $s0, 0($t8)
addi $t8, $t8, 4
addi $t9, $t9, 4
bne $t3, $zero, loop_block_inner_end
j loop_block_inner_end

loop_block_inner_else:
lw $s0, 0($t9)
lw $s1, 0($t8)
add $s0, $s0, $s1
sw $s0, 0($t9)
addi $t9, $t9, 4
addi $t8, $t8, 4
j loop_block_inner

loop_block_inner_end:
bne $t3, $zero, loop_block
addi $t6, $t6, -4
j loop_block

end_loop_block:
bne $t1, $zero, loop_main_inner
addi $t1, $t1, -4
j loop_main_inner

end_loop_main_inner:
addi $t0, $t0, -4
j loop_main

end_main:

# Saída da matriz A
loop_output:
beq $t0, $zero, end
