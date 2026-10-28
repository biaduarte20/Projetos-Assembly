.data
msg1: .asciiz "Digite o valor de A: "
msg2: .asciiz "\nDigite o valor de B: "
msg3: .asciiz "\nDigite o valor de C: "
msg4: .asciiz "\nDUAS RAIZES REAIS"
msg5: .asciiz "\nUMA RAIZ REAL"
msg6: .asciiz "\nNAO EXISTEM RAIZES REAIS"

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

    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 5
    syscall
    move $t2, $v0

    mul $t3, $t1, $t1

    li $t4, 4
    mul $t5, $t4, $t0
    mul $t5, $t5, $t2

    sub $t6, $t3, $t5

    bgt $t6, $zero, duas_raizes
    beq $t6, $zero, uma_raiz
    j sem_raizes

duas_raizes:
    li $v0, 4
    la $a0, msg4
    syscall
    j fim

uma_raiz:
    li $v0, 4
    la $a0, msg5
    syscall
    j fim

sem_raizes:
    li $v0, 4
    la $a0, msg6
    syscall

fim:
    li $v0, 10
    syscall