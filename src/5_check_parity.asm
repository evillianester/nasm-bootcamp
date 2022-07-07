section .data
    askMsg db 'Enter a digit: '
    lenAskMsg equ $ - askMsg

    oddMsg db 'The digit is odd!', 0xa
    lenOddMsg equ $ - oddMsg

    evenMsg db 'The digit is even!', 0xa
    lenEvenMsg equ $ - evenMsg

section .bss
    digit resb 1

section .text
    global _start

_start:
    mov edx, lenAskMsg
    mov ecx, askMsg
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov edx, 1
    mov ecx, digit
    mov ebx, 2
    mov eax, 3
    int 0x80

    mov ax, [digit]

    and ax, 1
    jz even

    mov edx, lenOddMsg
    mov ecx, oddMsg
    mov ebx, 1
    mov eax, 4
    int 0x80
    jmp exit

even:
    mov edx, lenEvenMsg
    mov ecx, evenMsg
    mov ebx, 1
    mov eax, 4
    int 0x80
    
exit:
    mov eax, 1
    mov ebx, 0
    int 0x80

