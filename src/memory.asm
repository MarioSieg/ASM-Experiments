.extern printf

.data
x: .quad 0xABC
fmt: .asciz "X = %llx\n"

.text
.globl main

print:
    pushq %rbp
    movq %rsp, %rbp

    movq $fmt, %rdi
    movq (x), %rsi
    xorl %eax, %eax
    callq printf

    movq %rbp, %rsp
    popq %rbp
    retq

main:
    pushq %rbp
    movq %rsp, %rbp

    callq print

    movq $0xFFFF, (x)
    callq print

    leaq (x), %rax
    movq %rax, (x)
    callq print

    movq $5, (x)
    movq (x), %rax
    decq %rax
    movq %rax, (x)
    callq print

    movq $print, %rax
    callq *%rax

    movq %rbp, %rsp
    popq %rbp
