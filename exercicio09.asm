.data
msg1: .asciiz "Digite o primeiro numero: "
msg2: .asciiz "Digite o segundo numero (diferente de zero): "
msg3: .asciiz "Erro! O divisor nao pode ser zero.\n"
msg4: .asciiz "Quociente inteiro: "
msg5: .asciiz "\nResto: "

.text
.globl main
main:
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0

ler_divisor:
    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    bne $t1, $zero, dividir

    li $v0, 4
    la $a0, msg3
    syscall
    j ler_divisor

dividir:
    div $t0, $t1
    mflo $t2
    mfhi $t3

    li $v0, 4
    la $a0, msg4
    syscall
    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, msg5
    syscall
    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 10
    syscall