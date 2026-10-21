.data
msg1: .asciiz "Digite o primeiro numero: "
msg2: .asciiz "Digite o segundo numero: "
msg3: .asciiz "O menor numero nao pode ser zero!\n"
msg4: .asciiz "Resto da divisao: "

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

    bge $t0, $t1, verificar_zero

    move $t2, $t0
    move $t0, $t1
    move $t1, $t2

verificar_zero:
    bne $t1, $zero, calcular

    li $v0, 4
    la $a0, msg3
    syscall
    j fim

calcular:
    div $t0, $t1
    mflo $t2

    mul $t3, $t2, $t1
    sub $t4, $t0, $t3

    li $v0, 4
    la $a0, msg4
    syscall
    li $v0, 1
    move $a0, $t4
    syscall

fim:
    li $v0, 10
    syscall