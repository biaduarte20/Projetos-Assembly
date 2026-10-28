.data
msg1: .asciiz "Digite o valor da compra (1000 a 9999): "
msg2: .asciiz "\nValor invalido! Digite novamente."
msg3: .asciiz "\nDigite o valor da parcela (100 a 500): "
msg4: .asciiz "\nQuantidade de parcelas: "

.text
main:
ler_compra:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    blt $t0, 1000, compra_invalida
    bgt $t0, 9999, compra_invalida
    j ler_parcela

compra_invalida:
    li $v0, 4
    la $a0, msg2
    syscall
    j ler_compra

ler_parcela:
    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    blt $t1, 100, parcela_invalida
    bgt $t1, 500, parcela_invalida
    j calcular

parcela_invalida:
    li $v0, 4
    la $a0, msg2
    syscall
    j ler_parcela

calcular:
    div $t0, $t1
    mflo $t2
    mfhi $t3

    beq $t3, $zero, mostrar
    addi $t2, $t2, 1

mostrar:
    li $v0, 4
    la $a0, msg4
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 10
    syscall