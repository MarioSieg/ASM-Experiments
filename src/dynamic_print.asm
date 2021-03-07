.data 
    msg1: .asciz "Ohohohohohohohooh!\n"
    .equ msg1_len, .-msg1-1 # . = current address - address of msg1 minus 1 for null terminator

.text
.globl main
    
main:
    push %rbp                   # prologue
    movq %rsp, %rbp             # prologue

    movq $1, %rax           # 1 = write
    movq $1, %rdi           # 1 = to stdout
    movq $msg1, %rsi        # string ptr
    movq $msg1_len, %rdx    # length
    syscall

    pop %rbp                    # epilogue
    movq %rbp, %rsp             # epilogue

    movq $60, %rax              # 60 = exit
    xorl %edi, %edi             # 0 = success exit code
    syscall                     # call kernel
