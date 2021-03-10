.extern printf

.data
msg: .asciz "SSE I32: "
fmt: .asciz "%d "
nl: .asciz "\n"

.align 16
quad:
.long 1
.long 2
.long 3
.long 4

.text
.globl main

main:
    pushq %rbp
    movq %rsp, %rbp

    movq $msg, %rdi # fmt ptr
    xorq %rsi, %rsi # no arg
    xorq %rax, %rax # no floats
    callq printf

    movdqa quad, %xmm0
    paddd %xmm0, %xmm0
    movdqa %xmm0, quad

    movq $fmt, %rdi
    movq quad, %rsi
    xorb %al, %al
    callq printf

    movq $fmt, %rdi
    movq quad+4, %rsi
    xorb %al, %al
    callq printf

    movq $fmt, %rdi
    movq quad+8, %rsi
    xorb %al, %al
    callq printf

    movq $fmt, %rdi
    movq quad+12, %rsi
    xorb %al, %al
    callq printf

    movq $nl, %rdi
    xorq %rsi, %rsi
    xorb %al, %al
    callq printf

    movq %rbp, %rsp
    popq %rbp

    movb $60, %al
    xorq %rdi, %rdi
    syscall

    ret
