section .text
    global _start

_start:
    mov edx, msg_len
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov edx, 10
    mov ecx, stars 
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov edx, space_len
    mov ecx, space
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax, 1
    int 0x80

section .data

msg db 'Displaying 10 stars', 0xa
msg_len equ $ - msg
stars times 10 db '*'
space db '', 0xa
space_len equ $ - space
