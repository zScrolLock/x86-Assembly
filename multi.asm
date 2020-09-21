;Crie programas em Assembly que executem a seguinte expressão: a * {b * [(c + d) * (e - f)]}
section .data
    msg DB "expressão: a * {b * [(c + d) * (e - f)]}", 0xa ;Quebra de linha
    tam_msg equ $ - msg

    msg1 DB "Digite o valor de A: "
    tam_msg1 equ $ - msg1

    msg2 DB "Digite o valor de B: "
    tam_msg2 equ $ - msg2

    msg3 DB "Digite o valor de C: "
    tam_msg3 equ $ - msg3

    msg4 DB "Digite o valor de D: "
    tam_msg4 equ $ - msg4

    msg5 DB "Digite o valor de E: "
    tam_msg5 equ $ - msg5

    msg6 DB "Digite o valor de F: "
    tam_msg6 equ $ - msg6

    msg7 DB "Resultado: "
    tam_msg7 equ $ - msg7

section .bss

    a RESB 1
    b RESB 1
    c RESB 1
    d RESB 1
    e RESB 1
    f RESB 1
    res RESB 1

section .text

    global _start

    _start:

        mov eax, 4 ;Escrita
        mov ebx, 1 ;Saida
        mov ecx, msg
        mov edx, tam_msg
        int 0x80
        
        mov eax, 4 ;Escrita
        mov ebx, 1 ;Saida
        mov ecx, msg1
        mov edx, tam_msg1
        int 0x80
        
        mov eax, 3  ;Leitura
        mov ebx, 0  ;Teclado
        mov ecx, a  ;Leitura de A
        mov edx, 2
        int 0x80

        mov eax, 4 ;Escrita
        mov ebx, 1 ;Saida
        mov ecx, msg2
        mov edx, tam_msg2
        int 0x80
        
        mov eax, 3  ;Leitura
        mov ebx, 0  ;Teclado
        mov ecx, b  ;Leitura de B
        mov edx, 2
        int 0x80

        mov eax, 4 ;Escrita
        mov ebx, 1 ;Saida
        mov ecx, msg3
        mov edx, tam_msg3
        int 0x80
        
        mov eax, 3  ;Leitura
        mov ebx, 0  ;Teclado
        mov ecx, c  ;Leitura de C
        mov edx, 2
        int 0x80

        mov eax, 4 ;Escrita
        mov ebx, 1 ;Saida
        mov ecx, msg4
        mov edx, tam_msg4
        int 0x80
        
        mov eax, 3  ;Leitura
        mov ebx, 0  ;Teclado
        mov ecx, d  ;Leitura de D
        mov edx, 2
        int 0x80

        mov eax, 4 ;Escrita
        mov ebx, 1 ;Saida
        mov ecx, msg5
        mov edx, tam_msg5
        int 0x80
        
        mov eax, 3  ;Leitura
        mov ebx, 0  ;Teclado
        mov ecx, e  ;Leitura de E
        mov edx, 2
        int 0x80

        mov eax, 4 ;Escrita
        mov ebx, 1 ;Saida
        mov ecx, msg6
        mov edx, tam_msg6
        int 0x80
        
        mov eax, 3  ;Leitura
        mov ebx, 0  ;Teclado
        mov ecx, f  ;Leitura de f
        mov edx, 2
        int 0x80
        
        mov al, [e]
        mov bl, [f]
        sub al, '0'
        sub bl, '0'
        sub al, bl
        sub al, '0'
        mov [e], al
        int 0x80

        mov al, [c]
        mov bl, [d]
        sub al, '0'
        sub bl, '0'
        add al, bl
        sub al, '0'
        mov [c], al
        int 0x80

        mov eax, [c]
        mov ebx, [e]
        sub eax, '0'
        sub ebx, '0'
        mul ebx
        sub eax, '0'
        mov [c], eax
        int 0x80
        
        mov eax, [b]
        mov ebx, [c]
        sub eax, '0'
        sub ebx, '0'
        mul ebx
        sub eax, '0'
        mov [b], eax
        int 0x80

        mov eax, [a]
        mov ebx, [b]
        sub eax, '0'
        sub ebx, '0'
        mul ebx
        add eax, '0'
        mov [res], eax
        int 0x80

        mov eax, 4 ;Escrita
        mov ebx, 1 ;Saida
        mov ecx, msg7
        mov edx, tam_msg7
        int 0x80

        mov eax, 4 ;Escrita
        mov ebx, 1 ;Saida
        mov ecx, res
        mov edx, 1
        int 0x80

        mov eax, 4 ;Escrita
        mov ebx, 1 ;Saida
        mov [ecx], byte 0xa
        mov edx, 1
        int 0x80
        
    exit:
        mov eax, 1
        int 0x80