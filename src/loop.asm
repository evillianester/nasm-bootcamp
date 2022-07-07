section .bss
    counter resb 1

section .text
    global _start

_start:
    mov ecx, 9
    mov eax, 1

l1:
    add eax, '0'
    mov [counter], eax

    mov edx, 1
    push ecx
    mov ecx, counter
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax, [counter]
    sub eax, '0'
    inc eax
    pop ecx
    loop l1

exit:
    mov eax, 1
    int 0x80

