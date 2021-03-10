.extern printf

.data
msg: .asciz "AVX I32: "
fmt: .asciz "%d "
nl: .asciz "\n"

.align 32
octa:
.long 1
.long 2
.long 3
.long 4
.long 5
.long 6
.long 7
.long 8

.text
.globl main
main:
    pushq %rbp
    movq %rsp, %rbp

    movq $msg, %rdi
    xorq %rsi, %rsi
    xorq %rax, %rax
    callq printf    # print welcome message

    vmovdqa octa, %ymm0             # copy 256-bit packaged integer octa vector
    vmovdqa %ymm0, %ymm1            # copy ymm0 to ymm1
    vpaddd %ymm1, %ymm0, %ymm0      # add ymm0 to ymm1 and store in ymm0
    vmovaps %ymm0, octa             # copy back in memory

    movq $fmt, %rdi                 # print result octa vector element 0
    movl octa, %esi
    xorq %rax, %rax
    callq printf

    movq $fmt, %rdi                 # print result octa vector element 1
    movl octa+4, %esi
    xorq %rax, %rax
    callq printf

    movq $fmt, %rdi                 # print result octa vector element 2
    movl octa+8, %esi
    xorq %rax, %rax
    callq printf

    movq $fmt, %rdi                 # print result octa vector element 3
    movl octa+12, %esi
    xorq %rax, %rax
    callq printf

    movq $fmt, %rdi                 # print result octa vector element 4
    movl octa+16, %esi
    xorq %rax, %rax
    callq printf

    movq $fmt, %rdi                 # print result octa vector element 5
    movl octa+20, %esi
    xorq %rax, %rax
    callq printf

    movq $fmt, %rdi                 # print result octa vector element 6
    movl octa+24, %esi
    xorq %rax, %rax
    callq printf

    movq $fmt, %rdi                 # print result octa vector element 7
    movl octa+28, %esi
    xorq %rax, %rax
    callq printf

    movq $nl, %rdi                  # print \n
    xorq %rsi, %rsi
    xorq %rax, %rax
    callq printf

    movq %rbp, %rsp
    popq %rbp

    movb $60, %al
    xorq %rdi, %rdi
    syscall
    ret
