section .data
    string db 'password'
    len equ $ - string

section .bss
    enc_string resb 10

section .text
    global _start

_start:
    mov ecx, len
    mov esi, string
    mov edi, enc_string

l1:
    lodsb
    add al, 2
    stosb
    loop l1

    cld

    rep movsb

    mov edx, 10
    mov ecx, enc_string
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80

