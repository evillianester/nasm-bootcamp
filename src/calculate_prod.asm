section .data
    msg db 'The product is '
    len equ $ - msg

section .bss
    prod resb 1

section .text
    global _start

_start:
    mov al, '3'
    mov bl, '2'

    sub al, '0'
    sub bl, '0'

    mul bl

    add al, '0'

    mov [prod], al

    mov edx, len
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov edx, 1
    mov ecx, prod
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax, 1
    int 0x80

