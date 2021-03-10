.extern printf

.data
fmt1: .asciz "Scalar SSE %f + %f = %f\n"
fmt2: .asciz "Scalar SSE %f * %f = %f\n"
fmt3: .asciz "Scalar SSE %f - %f = %f\n"
fmt4: .asciz "Scalar SSE %f / %f = %f\n"
pi: .single 3.1415

.text
.globl main
main:
    pushq %rbp              # prologue
    movq %rsp, %rbp         # prologue

    movss (pi), %xmm0       # load pi
    movss %xmm0, %xmm1      # copy 32-bit scalar from xmm0 to xmm1
    movss %xmm0, %xmm2      # copy 32-bit scalar from xmm0 to xmm2
    addss %xmm2, %xmm2      # add 32-bit scalar from xmm2 to xmm2 and store in xmm2
    cvtss2sd %xmm0, %xmm0   # convert 32-bit single to 64-bit double
    cvtss2sd %xmm1, %xmm1   # convert 32-bit single to 64-bit double
    cvtss2sd %xmm2, %xmm2   # convert 32-bit single to 64-bit double

    movq $fmt1, %rdi        # message ptr
    xorl %esi, %esi         # no arg
    movb $3, %al            # print 3 64-bit scalar doubles: xmm0-xmm2
    callq printf            # print

    movss pi, %xmm0       # load pi
    movss %xmm0, %xmm1      # copy 32-bit scalar from xmm0 to xmm1
    movss %xmm0, %xmm2      # copy 32-bit scalar from xmm0 to xmm2
    mulss %xmm2, %xmm2      # multiply 32-bit scalar from xmm2 with xmm2 and store in xmm2
    cvtss2sd %xmm0, %xmm0   # convert 32-bit single to 64-bit double
    cvtss2sd %xmm1, %xmm1   # convert 32-bit single to 64-bit double
    cvtss2sd %xmm2, %xmm2   # convert 32-bit single to 64-bit double

    movq $fmt2, %rdi        # message ptr
    xorl %esi, %esi         # no arg
    movb $3, %al            # print 3 64-bit scalar doubles: xmm0-xmm2
    callq printf            # print

    movss pi, %xmm0       # load pi
    movss %xmm0, %xmm1      # copy 32-bit scalar from xmm0 to xmm1
    movss %xmm0, %xmm2      # copy 32-bit scalar from xmm0 to xmm2
    subss %xmm2, %xmm2      # multiply 32-bit scalar from xmm2 with xmm2 and store in xmm2
    cvtss2sd %xmm0, %xmm0   # convert 32-bit single to 64-bit double
    cvtss2sd %xmm1, %xmm1   # convert 32-bit single to 64-bit double
    cvtss2sd %xmm2, %xmm2   # convert 32-bit single to 64-bit double

    movq $fmt3, %rdi        # message ptr
    xorl %esi, %esi         # no arg
    movb $3, %al            # print 3 64-bit scalar doubles: xmm0-xmm2
    callq printf            # print

    movss pi, %xmm0       # load pi
    movss %xmm0, %xmm1      # copy 32-bit scalar from xmm0 to xmm1
    movss %xmm0, %xmm2      # copy 32-bit scalar from xmm0 to xmm2
    divss %xmm2, %xmm2      # multiply 32-bit scalar from xmm2 with xmm2 and store in xmm2
    cvtss2sd %xmm0, %xmm0   # convert 32-bit single to 64-bit double
    cvtss2sd %xmm1, %xmm1   # convert 32-bit single to 64-bit double
    cvtss2sd %xmm2, %xmm2   # convert 32-bit single to 64-bit double

    movq $fmt4, %rdi        # message ptr
    xorl %esi, %esi         # no arg
    movb $3, %al            # print 3 64-bit scalar doubles: xmm0-xmm2
    callq printf            # print

    movq %rbp, %rsp         # epilogue
    popq %rbp               # epilogue

    movq $60, %rax          # exit
    xorl %edi, %edi         # success
    syscall
