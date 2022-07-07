section .data
    achar db '0'

section .text
    global _start

_start:
    call display

    mov eax, 1
    int 0x80

display:
    mov ecx, 256

l1:
    push ecx
    mov edx, 1
    mov ecx, achar
    mov ebx, 1
    mov eax, 4
    int 0x80

    pop ecx
    mov dx, [achar]
    sub dx, '0'
    inc dx
    add dx, '0'
    mov [achar], dx
    loop l1
    ret

