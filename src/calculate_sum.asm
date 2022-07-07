section .data
    msg1 db 'Enter the first digit', 0xA
    len1 equ $ - msg1

    msg2 db 'Enter the second digit', 0xA
    len2 equ $ - msg2

    msg3 db 'The sum is '
    len3 equ $ - msg3

section .bss
    num1 resb 4
    num2 resb 4
    sum resb 8

section .text
    global _start

_start:
    mov edx, len1
    mov ecx, msg1
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov edx, 4
    mov ecx, num1
    mov ebx, 2
    mov eax, 3
    int 0x80

    mov edx, len2
    mov ecx, msg2
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov edx, 4
    mov ecx, num2
    mov ebx, 2
    mov eax, 3
    int 0x80

    mov edx, len3
    mov ecx, msg3
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax, [num1]
    mov ebx, [num2]

    sub eax, '0'
    sub ebx, '0'

    add eax, ebx

    add eax, '0'

    mov [sum], eax

    mov edx, 8
    mov ecx, sum
    mov ebx, 1
    mov eax, 4
    int 0x80

exit:
    
    mov eax, 1
    xor ebx, ebx
    int 0x80

