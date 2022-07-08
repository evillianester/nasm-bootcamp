section .data
    askMsg1 db 'Enter the first number: '
    lenAskMsg1 equ $ - askMsg1

    askMsg2 db 'Enter the second number: '
    lenAskMsg2 equ $ - askMsg2

    msg db 'The greatest number is '
    lenMsg equ $ - msg

section .bss
    number1 resb 2
    number2 resb 2
    result resb 2

section .text
    global _start

_start:
    ; Ask for the fisrt number
    mov edx, lenAskMsg1
    mov ecx, askMsg1
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Store the number
    mov edx, 4
    mov ecx, number1
    mov ebx, 2
    mov eax, 3
    int 0x80

    ; Ask for the second number
    mov edx, lenAskMsg2
    mov ecx, askMsg2
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Store the second number
    mov edx, 4
    mov ecx, number2
    mov ebx, 2
    mov eax, 3
    int 0x80

    ; Display message
    mov edx, lenMsg
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Check if the first number is greter than the second
    mov edx, [number1]
    cmp edx, [number2]
    jg one_is_greatest

    mov edx, [number2]
    mov [result], edx

    jmp print_result

one_is_greatest:
    mov [result], edx

print_result:
    mov edx, 2
    mov ecx, result
    mov ebx, 1
    mov eax, 4
    int 0x80

exit:
    mov eax, 1
    mov ebx, 0
    int 0x80

