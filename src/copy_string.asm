section .data
    string db 'Hello, World!', 0
    len equ $ - string

section .bss
    destination_string resb 20

section .text
    global _start

_start:
    mov ecx, len
    mov esi, string
    mov edi, destination_string
    
    cld

    rep movsb

    mov edx, len
    mov ecx, destination_string
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax, 1
    int 0x80

