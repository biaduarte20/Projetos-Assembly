.data
msg1: .asciiz "Digite o valor em dolar: "
resultado: .asciiz "\nValor em reais: R$ "

.text
main:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $t1, 5
    mul $t2, $t0, $t1

    li $v0, 4
    la $a0, resultado
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 10
    syscall