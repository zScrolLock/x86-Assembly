;3 - Crie um programa que leia dois números e imprima a soma, substração, multiplicação e divisão entre esses números.
section .data

    msg1 DB "Digite o valor de A: "
    tam_msg1 equ $ - msg1

    msg2 DB "Digite o valor de B: "
    tam_msg2 equ $ - msg2

    msg3 DB "Soma: "
    tam_msg3 equ $ - msg3

    msg4 DB "Subtracao: "
    tam_msg4 equ $ - msg4

    msg5 DB "Multiplicacao: "
    tam_msg5 equ $ - msg5

    msg6 DB "Divisao: "
    tam_msg6 equ $ - msg6


section .bss

    a RESB 1
    b RESB 1
    soma RESB 1
    subt RESB 1
    multi RESB 1
    divi RESB 1
    resto RESB 1

section .text

    global _start

    _start:
        
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

        mov al, [a]
        mov bl, [b]
        sub al, '0'
        sub bl, '0'
        div bl
        add al, '0'
        add ah, '0'
        mov [divi], al
        mov [resto], ah
        int 0x80

        mov eax, 4 ;Escrita
        mov ebx, 1 ;Saida
        mov ecx, msg6
        mov edx, tam_msg6
        int 0x80

        mov eax, 4 ;Escrita
        mov ebx, 1 ;Saida
        mov ecx, divi ;Apresenta Divisao
        mov edx, 1
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov [ecx], byte 0xa
        mov edx, 1
        int 0x80
        
        mov al, [a]
        mov bl, [b]
        sub al, '0'
        sub bl, '0'
        sub al, bl
        add al, '0'
        mov [subt], al
        int 0x80

        mov eax, 4 ;Escrita
        mov ebx, 1 ;Saida
        mov ecx, msg4
        mov edx, tam_msg4
        int 0x80

        mov eax, 4 ;Escrita
        mov ebx, 1 ;Saida
        mov ecx, subt ;Apresenta subtração
        mov edx, 1
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov [ecx], byte 0xa
        mov edx, 1
        int 0x80

        mov al, [a]
        mov bl, [b]
        sub al, '0'
        sub bl, '0'
        add al, bl
        add al, '0'
        mov [soma], al
        int 0x80

        mov eax, 4 ;Escrita
        mov ebx, 1 ;Saida
        mov ecx, msg3
        mov edx, tam_msg3
        int 0x80

        mov eax, 4 ;Escrita
        mov ebx, 1 ;Saida
        mov ecx, soma ;Apresenta Soma
        mov edx, 1
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov [ecx], byte 0xa
        mov edx, 1
        int 0x80

        mov eax, [a]
        mov ebx, [b]
        sub eax, '0'
        sub ebx, '0'
        mul ebx
        add eax, '0'
        mov [multi], eax
        int 0x80

        mov eax, 4 ;Escrita
        mov ebx, 1 ;Saida
        mov ecx, msg5
        mov edx, tam_msg5
        int 0x80

        mov eax, 4 ;Escrita
        mov ebx, 1 ;Saida
        mov ecx, multi ;Apresenta Multiplicacao
        mov edx, 2
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov [ecx], byte 0xa
        mov edx, 1
        int 0x80
        
    exit:
        mov eax, 1
        int 0x80