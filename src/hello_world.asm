.data
    msg: .asciz "Hello, World"

.text
.globl _main

_main:
    movq $1, %rax       # 1 = write
    movq $1, %rdi       # 1 = to stdout
    movq $msg, %rsi     # string ptr
    movq $12, %rdx      # length of string, without null terminator
    syscall             # call kernel

    movq $60, %rax      # 60 = exit
    xorq %rdi, %rdi     # 0 = exit code for success
    syscall             # call kernel
