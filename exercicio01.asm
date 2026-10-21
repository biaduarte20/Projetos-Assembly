.data
msg1: .asciiz "Digite a base: "
msg2: .asciiz "Digite a altura: "
msg3: .asciiz "Area do terreno: "

.text
.globl main
main:
    # Ler a base
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    # Ler a altura
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    # area = base * altura
    mul $t2, $t0, $t1

    # Mostrar resultado
    li $v0, 4
    la $a0, msg3
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 10
    syscall