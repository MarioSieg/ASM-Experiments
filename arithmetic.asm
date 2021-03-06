extern printf
section .data
    number1 dq 128
    number2 dq 22
    neg_num dq -12
    fmt db "x=%ld, y=%ld", 10, 0
    fmtint db "%s &ld", 10, 0
    sumi db "sum: ", 0
    difi db "diff: ", 0
    inci db "inc: ", 0
    deci db "dec: ", 0
    sali db "shift left 2: ", 0
    sari db "shift right 2: ", 0
    sariex db "shift right 2 with sign ext: ", 0
    multi db "product: ", 0
    divi db "quotient: ", 0
    remi db "modulo: ", 0

section .bss
    resulti resq 1
    modulo resq 1

section .text
    global main
main:
    push rbp
    mov rbp, rsp
    mov rdi, fmt
    mov rsi, [number1]
    mov rdx, [number2]
    xor rax, rax
    call printf
    mov rax, [number1]
    add rax, [number2]
    mov [resulti], rax
    mov rdi, fmtint
    mov rsi, sumi
    mov rdx, [resulti]
    xor rax, rax
    call printf
    mov rax, [number1]
    sub rax, [number2]
    mov [resulti], rax
    mov rdi, fmtint
    mov rsi, difi
    mov rdx, [resulti]
    xor rax, rax
    call printf
    mov rax, [number1]
    inc rax
    mov [resulti], rax
    mov rdi, fmtint
    mov rsi, inci
    mov rdx, [resulti]
    xor rax, rax
    call printf
    mov rax, [number1]
    dec rax
    mov [resulti], rax
    mov rdi, fmtint
    mov rsi, deci
    mov rdx, [resulti]
    xor rax, rax
    call printf
    mov rax, [number1]
    sal rax, 2
    mov [resulti], rax
    mov rdi, fmtint
    mov rsi, sali
    mov rdx, [resulti]
    mov rax, 0
    call printf
    mov rax, [number1]
    sar rax, 2
    mov [resulti], rax
    mov rdi, fmtint
    mov rsi, sari
    mov rdx, [resulti]
    xor rax, rax
    call printf
    mov rax, [neg_num]
    sar rax, 2
    mov [resulti], rax
    mov rdi, fmtint
    mov rsi, sariex
    mov rdx, [resulti]
    xor rax, rax
    call printf
    mov rax, [number1]
    imul qword[number2]
    mov [resulti], rax
    mov rdi, fmtint
    mov rsi, multi
    mov rdx, [resulti]
    xor rax, rax
    call printf
    mov rax, [number1]
    xor rdx, rdx
    idiv qword [number2]
    mov [resulti], rax
    mov [modulo], rdx
    mov rdi, fmtint
    mov rsi, divi
    mov rdx, [resulti]
    xor rax, rax
    call printf
    mov rdi, fmtint
    mov rsi, remi
    mov rdx, [modulo]
    xor rax, rax
    call printf
    mov rsp, rbp
    pop rbp
    ret