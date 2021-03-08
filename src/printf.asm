.extern printf

.data
msg: .asciz "Hey!"
fmt: .asciz "The string is: %s\n"
fmt2: .asciz "X is: %lld\n"
fmt3: .asciz "PI is: %f\n"
val: .quad 123456789
pi: .double 3.1415

.text
.globl main

main:
    pushq %rbp          # prologue
    movq %rsp, %rbp     # prologue

    movq $fmt, %rdi     # format string ptr
    movq $msg, %rsi     # message ptr
    xorl %eax, %eax     # no xmm floats
    callq printf

    movq $fmt2, %rdi    # format string ptr
    movq (val), %rsi    # value
    xorl %eax, %eax     # no xmm floats
    callq printf

    movq $fmt3, %rdi    # format string ptr
    movq (pi), %xmm0    # value
    movq $1, %rax       # using xmm floats
    callq printf

    movq %rbp, %rsp     # epilogue
    popq %rbp           # epilogue

    movq $60, %rax      # exit
    xorl %edi, %edi     # success
    syscall
