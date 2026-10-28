.data
msg1: .asciiz "Digite o primeiro numero: "
msg2: .asciiz "\nDigite o segundo numero: "
maior: .asciiz "\nO maior numero e: "
resultado: .asciiz "\nA soma dos impares e: "

.text

main:

    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    bge $t0, $t1, primeiro_maior

    move $t2, $t1
    move $t3, $t0
    j mostrar_maior

primeiro_maior:
    move $t2, $t0
    move $t3, $t1

mostrar_maior:

    li $v0, 4
    la $a0, maior
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    move $t4, $zero
    addi $t3, $t3, 1

loop:
    bge $t3, $t2, fim_soma

    li $t5, 2
    div $t3, $t5
    mfhi $t6

    beq $t6, $zero, proximo

    add $t4, $t4, $t3

proximo:
    addi $t3, $t3, 1
    j loop

fim_soma:

    li $v0, 4
    la $a0, resultado
    syscall

    li $v0, 1
    move $a0, $t4
    syscall

    li $v0, 10
    syscall