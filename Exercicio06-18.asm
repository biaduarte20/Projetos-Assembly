.data
msg1: .asciiz "Digite um numero positivo: "
msg2: .asciiz "\nNumero negativo! Digite novamente."
maior: .asciiz "\nO maior valor e: "
menor: .asciiz "\nO menor valor e: "

.text

main:
    li $t0, 0       

ler_numero:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t1, $v0   
    
    bltz $t1, numero_negativo

    beq $t0, $zero, primeiro_numero

    bgt $t1, $t2, atualizar_maior

verificar_menor:

    blt $t1, $t3, atualizar_menor
    j contar

atualizar_maior:
    move $t2, $t1
    j verificar_menor

atualizar_menor:
    move $t3, $t1
    j contar

primeiro_numero:
    move $t2, $t1   
    move $t3, $t1   
    j contar

numero_negativo:
    li $v0, 4
    la $a0, msg2
    syscall
    j ler_numero

contar:
    addi $t0, $t0, 1
    blt $t0, 10, ler_numero

    # Mostrar o maior valor
    li $v0, 4
    la $a0, maior
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, menor
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 10
    syscall