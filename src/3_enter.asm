section .data
    usrMsg db 'Please, enter a number: '
    lenUsrMsg equ $ - usrMsg

    displayMsg db 'You have entered: '
    lenDisplayMsg equ $ - displayMsg

section .bss
    number resb 8

section .text
    global _start

_start:
    mov edx, lenUsrMsg
    mov ecx, usrMsg
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov edx, 8
    mov ecx, number
    mov ebx, 2
    mov eax, 3
    int 0x80

    mov edx, lenDisplayMsg
    mov ecx, displayMsg
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov edx, 8
    mov ecx, number
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80

