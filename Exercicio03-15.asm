
.data
    msg1: .asciiz "Digite o primeiro valor inteiro: "
    msg2: .asciiz "Digite o segundo valor inteiro: "
    msg3: .asciiz "\nO maior e: "
    msg4: .asciiz "\nA diferenca e: "

.text
.globl main

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

    bgt $t0, $t1, Se
    move $s0, $t1
    j calcular

Se:
    move $s0, $t0

calcular:
    sub $t2, $t0, $t1
    bgez $t2, mostrar_diferenca
    sub $t2, $zero, $t2

mostrar_diferenca:

    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 1
    move $a0, $s0
    syscall

    li $v0, 4
    la $a0, msg4
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 10
    syscall
