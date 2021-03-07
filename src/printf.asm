.extern printf

.data
    msg: .asciz "Hey!"
    fmt: .asciz "The string is: %s\n"

.text
.globl main

main:
    pushq %rbp
    movq %rsp, %rbp

    movq $fmt, %rdi
    movq $msg, %rsi
    xorl %eax, %eax
    callq printf

    movq %rbp, %rsp
    popq %rbp

    movq $60, %rax
    xorl %edi, %edi
    syscall
