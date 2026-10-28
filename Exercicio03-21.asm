.data
msg1: .asciiz "Digite o mes de nascimento: "
msg2: .asciiz "\nDigite o ano de nascimento: "
msg3: .asciiz "\nDigite o mes atual: "
msg4: .asciiz "\nDigite o ano atual: "
resultado: .asciiz "\nIdade em meses: "

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

    li $v0, 4
    la $a0, msg4
    syscall

    li $v0, 5
    syscall
    move $t3, $v0

    sub $t4, $t3, $t1
    li $t5, 12
    mul $t4, $t4, $t5

    sub $t6, $t2, $t0
    add $t4, $t4, $t6

    li $v0, 4
    la $a0, resultado
    syscall

    li $v0, 1
    move $a0, $t4
    syscall

    li $v0, 10
    syscall