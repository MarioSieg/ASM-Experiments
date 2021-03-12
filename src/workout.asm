.extern printf

.data
fmt: .asciz "Doing situp: %d!\n"
situps: .quad 10

.text
.globl main
main:
    pushq %rbp
    movq %rsp, %rbp
    xorq %r10, %r10
    xorq %r11, %r11
    movq situps, %r11

workout:
    incq %r10
    pushq %r10
    pushq %r11
    movq $fmt, %rdi
    movq %r10, %rsi
    xorl %eax, %eax
    callq printf
    popq %r11
    popq %r10
    cmpq %r11, %r10
    je done
    jmp workout

done:
    movq %rbp, %rsp
    popq %rbp
    movb $60, %al
    xorl %edi, %edi
    syscall
    retq

