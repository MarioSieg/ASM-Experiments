.data
msg: .asciz "Hello, World\n"

.text
.globl main

main:
    movq $3, %rcx      # number of iterations

L0:
    pushq %rcx          # preserve rcx
    movq $1, %rax       # 1 = write
    movq $1, %rdi       # 1 = to stdout
    movq $msg, %rsi     # string ptr
    movq $13, %rdx      # length of string, without null terminator
    syscall             # call kernel
    popq %rcx           # restore rcx
    loop L0
L1:
    movq $60, %rax      # 60 = exit
    xorl %edi, %edi     # 0 = exit code for success
    syscall             # call kernel
