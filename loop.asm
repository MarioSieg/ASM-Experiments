extern printf
section .data
    number dq 32
    fmt db "0...%ld=%ld"

section .bss

section .text
    global main

main:
    push rbp
    mov rbp, rsp
    mov rcx, [number]
    xor rax, rax

lloop:
    add rax, rcx
    loop lloop
    mov rdi, fmt
    mov rsi, [number]
    mov rdx, rax
    xor rax, rax
    call printf
    mov rsp, rbp
    pop rbp
    ret