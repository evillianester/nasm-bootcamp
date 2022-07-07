section .data
    msg db 'Factorial 3 is '
    len equ $ - msg

section .bss
    factorial resb 1

section .text
    global _start

_start:
    mov bx, 3
    call proc_factorial
    add ax, 30h
    mov [factorial], ax

    mov edx, len
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov edx, 1
    mov ecx, factorial
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax, 1
    int 0x80

proc_factorial:
    cmp bl, 1
    jg do_calculation
    mov ax, 1
    ret

do_calculation:
    dec bl
    call proc_factorial
    inc bl
    mul bl
    ret

