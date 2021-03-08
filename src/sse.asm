.extern printf

.data
fmt1: .asciz "Scalar SSE %f + %f = %f\n"
fmt2: .asciz "Scalar SSE %f * %f = %f\n"
fmt3: .asciz "Scalar SSE %f - %f = %f\n"
fmt4: .asciz "Scalar SSE %f / %f = %f\n"
pi: .double 3.1415

.text
.globl main
main:
    pushq %rbp          # prologue
    movq %rsp, %rbp     # prologue

    movsd (pi), %xmm0   # load pi
    movsd %xmm0, %xmm1  # copy 64-bit scalar from xmm0 to xmm1
    movsd %xmm0, %xmm2  # copy 64-bit scalar from xmm0 to xmm2
    addsd %xmm2, %xmm2  # add 64-bit scalar from xmm2 to xmm2 and store in xmm2

    movq $fmt1, %rdi    # message ptr
    xorl %esi, %esi     # no arg
    movb $3, %al        # print 3 64-bit scalar doubles: xmm0-xmm2
    callq printf        # print

    movsd (pi), %xmm0   # load pi
    movsd %xmm0, %xmm1  # copy 64-bit scalar from xmm0 to xmm1
    movsd %xmm0, %xmm2  # copy 64-bit scalar from xmm0 to xmm2
    mulsd %xmm2, %xmm2  # multiply 64-bit scalar from xmm2 with xmm2 and store in xmm2

    movq $fmt2, %rdi    # message ptr
    xorl %esi, %esi     # no arg
    movb $3, %al        # print 3 64-bit scalar doubles: xmm0-xmm2
    callq printf        # print

    movsd (pi), %xmm0   # load pi
    movsd %xmm0, %xmm1  # copy 64-bit scalar from xmm0 to xmm1
    movsd %xmm0, %xmm2  # copy 64-bit scalar from xmm0 to xmm2
    subsd %xmm2, %xmm2  # multiply 64-bit scalar from xmm2 with xmm2 and store in xmm2

    movq $fmt3, %rdi    # message ptr
    xorl %esi, %esi     # no arg
    movb $3, %al        # print 3 64-bit scalar doubles: xmm0-xmm2
    callq printf        # print

    movsd (pi), %xmm0   # load pi
    movsd %xmm0, %xmm1  # copy 64-bit scalar from xmm0 to xmm1
    movsd %xmm0, %xmm2  # copy 64-bit scalar from xmm0 to xmm2
    divsd %xmm2, %xmm2  # multiply 64-bit scalar from xmm2 with xmm2 and store in xmm2

    movq $fmt4, %rdi    # message ptr
    xorl %esi, %esi     # no arg
    movb $3, %al        # print 3 64-bit scalar doubles: xmm0-xmm2
    callq printf        # print

    movq %rbp, %rsp     # epilogue
    popq %rbp           # epilogue

    movq $60, %rax      # exit
    xorl %edi, %edi     # success
    syscall
