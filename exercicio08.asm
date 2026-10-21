.data
msg1: .asciiz "Digite um numero: "
msg2: .asciiz "Resultado: "

.text
.globl main
main:
    li $v0, 4
    la $a0, msg1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0

    bgtz $t0, positivo
    bltz $t0, negativo

    move $t1, $zero
    j mostrar

positivo:
    sll $t1, $t0, 1
    j mostrar

negativo:
    li $t2, 3
    mul $t1, $t0, $t2

mostrar:
    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 10
    syscall