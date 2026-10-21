.data
msg1: .asciiz "Digite um numero (negativo encerra): "
msg2: .asciiz "Numero invalido! Digite de 0 a 100.\n"
msg3: .asciiz "\nIntervalo 0 a 25: "
msg4: .asciiz "\nIntervalo 26 a 50: "
msg5: .asciiz "\nIntervalo 51 a 75: "
msg6: .asciiz "\nIntervalo 76 a 100: "

.text
.globl main
main:
    li $s0, 0
    li $s1, 0
    li $s2, 0
    li $s3, 0

ler_numero:
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0

    bltz $t0, mostrar

    li $t1, 100
    bgt $t0, $t1, invalido

    li $t1, 25
    ble $t0, $t1, intervalo1

    li $t1, 50
    ble $t0, $t1, intervalo2

    li $t1, 75
    ble $t0, $t1, intervalo3

    addi $s3, $s3, 1
    j ler_numero

intervalo1:
    addi $s0, $s0, 1
    j ler_numero

intervalo2:
    addi $s1, $s1, 1
    j ler_numero

intervalo3:
    addi $s2, $s2, 1
    j ler_numero

invalido:
    li $v0, 4
    la $a0, msg2
    syscall
    j ler_numero

mostrar:
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
    move $a0, $s1
    syscall

    li $v0, 4
    la $a0, msg5
    syscall
    li $v0, 1
    move $a0, $s2
    syscall

    li $v0, 4
    la $a0, msg6
    syscall
    li $v0, 1
    move $a0, $s3
    syscall

    li $v0, 10
    syscall