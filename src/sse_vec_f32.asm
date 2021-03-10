.extern printf

.data
.align 16
quad:
.single 1.0
.single 2.0
.single 3.0
.single 4.0

fmt: .asciz "SSE F32: %f %f %f %f\n"

.text
.globl main

main:
    pushq %rbp          # prologue
    movq %rsp, %rbp     # prologue

    movaps quad, %xmm0  # load four 32-bit singles
    movaps %xmm0, %xmm1 # copy from xmm0 to xmm1
    addps %xmm1, %xmm0  # add single from xmm1 to xmm0
    movaps %xmm0, quad  # copy back to memory

    cvtss2sd %xmm0, %xmm0       # convert 1st single to double
    cvtss2sd quad+4, %xmm1    # convert 2nd single to double 
    cvtss2sd quad+8, %xmm2    # convert 3rd single to double 
    cvtss2sd quad+12, %xmm3   # convert 4th single to double 

    movq $fmt, %rdi     # format string ptr
    xorl %esi, %esi     # no arg
    movb $4, %al        # 4 floats
    callq printf

    movq %rbp, %rsp     # epilogue
    popq %rbp           # epilogue

    movb $60, %al       # 60 = exit
    xorl %edi, %edi     # excode 0
    syscall             # call kernel

    ret
