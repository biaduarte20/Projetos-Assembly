.data
msg1: .asciiz "Digite a altura da pessoa em centimetros: "
msg2: .asciiz "\nMenor altura: "
msg3: .asciiz "\nMaior altura: "

.text
.globl main
main:
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall

    move $s0, $v0
    move $s1, $v0

    li $t0, 1

loop:
    li $t1, 15
    beq $t0, $t1, mostrar

    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    move $t2, $v0

    bge $t2, $s0, verificar_maior
    move $s0, $t2

verificar_maior:
    ble $t2, $s1, continuar
    move $s1, $t2

continuar:
    addi $t0, $t0, 1
    j loop

mostrar:
    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 1
    move $a0, $s0
    syscall

    li $v0, 4
    la $a0, msg3
    syscall
    li $v0, 1
    move $a0, $s1
    syscall

    li $v0, 10
    syscall