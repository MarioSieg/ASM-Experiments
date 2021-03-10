.extern printf

.data
fmt: .asciz "AVX F32: %f %f %f %f %f %f %f %f\n"

.align 32
octa:
.single 1.0
.single 2.0
.single 3.0
.single 4.0
.single 5.0
.single 6.0
.single 7.0
.single 8.0

.text
.globl main
main:
    pushq %rbp      # prologue
    movq %rsp, %rbp # prologue

    vmovaps octa, %ymm0         # load 8 singles
    vmovaps %ymm0, %ymm1        # copy from ymm0 to ymm1
    vmulps %ymm1, %ymm0, %ymm0  # multiply ymm0 with ymm1 and store in ymm0
    vmovaps %ymm0, octa         # copy back to memory

    cvtss2sd octa, %xmm0      # convert 1st single to double
    cvtss2sd octa+4, %xmm1    # convert 2nd single to double
    cvtss2sd octa+8, %xmm2    # convert 3rd single to double
    cvtss2sd octa+12, %xmm3   # convert 4th single to double
    cvtss2sd octa+16, %xmm4   # convert 5th single to double
    cvtss2sd octa+20, %xmm5   # convert 6th single to double
    cvtss2sd octa+24, %xmm6   # convert 7th single to double
    cvtss2sd octa+28, %xmm7   # convert 8th single to double

    movq $fmt, %rdi             # format string ptr
    xorl %esi, %esi             # no arg
    movb $8, %al                # 8 floats
    callq printf

    movq %rbp, %rsp             # epilogue
    popq %rbp                   # epilogue

    movb $60, %al               # 60 = exit
    xorl %edi, %edi             # excode 0
    syscall                     # call kernel

    ret
