.data
msg1: .asciiz "Digite a primeira nota: "
msg2: .asciiz "Digite a segunda nota: "
msg3: .asciiz "Digite a terceira nota: "
msg4: .asciiz "Digite a quarta nota: "
resultado: .asciiz "\nA media do aluno e: "
aprovado: .asciiz "\nAPROVADO"
exame: .asciiz "\nEXAME"
retido: .asciiz "\nRETIDO"

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

    add $t4, $t0, $t1
    add $t4, $t4, $t2
    add $t4, $t4, $t3
    div $t4, $t4, 4

    li $v0, 4
    la $a0, resultado
    syscall

    li $v0, 1
    move $a0, $t4
    syscall

    bge $t4, 6, aprovado_msg
    bge $t4, 3, exame_msg
    j retido_msg

aprovado_msg:
    li $v0, 4
    la $a0, aprovado
    syscall
    j fim

exame_msg:
    li $v0, 4
    la $a0, exame
    syscall
    j fim

retido_msg:
    li $v0, 4
    la $a0, retido
    syscall

fim:
    li $v0, 10
    syscall