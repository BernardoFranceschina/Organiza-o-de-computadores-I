# Bernardo C. Franceschina (20203080)
.data
    MAX:    .word  0       # Variável para armazenar MAX
    A:      .space 1000
    B:      .space 1000

.text
        li $v0, 5          
        syscall
        sw $v0, MAX         # Armazenar o valor de MAX

        lw $t0, MAX         
        li $t1, 0           # inicializa j (coluna)
        
    outer_loop:
        bge $t1, $t0, exit_outer  # se j >= MAX, sair do loop externo

        li $t2, 0           # inicializa i (linha)
        
    inner_loop:
        bge $t2, $t0, exit_inner  # se i >= MAX, sair do loop interno

      
        mul $t3, $t2, $t0    # $t3 = i * MAX
        add $t3, $t3, $t1    # $t3 = i * MAX + j
        mul $t4, $t1, $t0    # $t4 = j * MAX
        add $t4, $t4, $t2    # $t4 = j * MAX + i

        lw $t5, A($t3)       # carrega A[i][j]
        lw $t6, B($t4)       # carrega B[j][i]

        add $t5, $t5, $t6    # A[i][j] = A[i][j] + B[j][i]

        sw $t5, A($t3)       # armazena de volta em A[i][j]

        addi $t2, $t2, 1     # i++
        j inner_loop

    exit_inner:
        addi $t1, $t1, 1     # j++
        j outer_loop

    exit_outer:
