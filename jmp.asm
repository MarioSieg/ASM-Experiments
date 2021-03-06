extern printf
section .data
    number1 dq 1234
    number2 dq 1233
    fmt1 db "NUMBER1 > = NUMBER2", 10, 0
    fmt2 db "NUMBER1 < NUMBER2", 10, 0

section .bss

section .text
    global main
    
main:
    push rbp
    mov rbp, rsp
    mov rax, [number1]
    mov rax, [number2]
    cmp rax, rbx
    jge greater
    mov rdi, fmt2
    xor rax, rax
    call printf
    jmp exit

greater:
    mov rdi, fmt1
    xor rax, rax
    call printf

exit:
    mov rsp, rbp
    pop rbp
    ret