.data
msg1: .asciiz "Digite o salario atual: "
resultado: .asciiz "\nNovo salario: "

.text
main:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $t1, 25
    mul $t2, $t0, $t1
    li $t3, 100
    div $t2, $t3
    mflo $t2

    add $t4, $t0, $t2

    li $v0, 4
    la $a0, resultado
    syscall

    li $v0, 1
    move $a0, $t4
    syscall

    li $v0, 10
    syscall