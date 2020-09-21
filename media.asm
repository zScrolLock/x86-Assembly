;1 - Crie um programa em Assembly que calcule a média de três valores.
section .data

    msg1 DB "Digite o valor de A: "
    tam_msg1 equ $ - msg1

    msg2 DB "Digite o valor de B: "
    tam_msg2 equ $ - msg2

    msg3 DB "Digite o valor de C: "
    tam_msg3 equ $ - msg3

    msg4 DB "Digite o valor que deseja dividir: "
    tam_msg4 equ $ - msg4

    msg7 DB "Resultado: "
    tam_msg7 equ $ - msg7

    barra DB "/"
    tam_barra equ $ - barra

    igual DB " = "
    tam_igual equ $  - igual

section .bss

    a RESB 1
    b RESB 1
    c RESB 1
    divisao RESB 1
    res RESB 1
    res1 RESB 1
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
        mov ecx, divisao  
        mov edx, 2
        int 0x80

        mov al, [a]
        mov bl, [b]
        sub al, '0'
        sub bl, '0'
        add al, bl
        add al, '0'
        mov [a], al
        int 0x80

        mov al, [a]
        mov bl, [c]
        sub al, '0'
        sub bl, '0'
        add al, bl
        add al, '0'
        mov [res1], al
        int 0x80

        mov eax, 4 ;Escrita
        mov ebx, 1 ;Saida
        mov ecx, res1
        mov edx, 1
        int 0x80

        mov eax, 4 ;Escrita
        mov ebx, 1 ;Saida
        mov ecx, barra
        mov edx, tam_barra
        int 0x80

        mov eax, 4 ;Escrita
        mov ebx, 1 ;Saida
        mov ecx, divisao
        mov edx, 1
        int 0x80

        mov eax, 4 ;Escrita
        mov ebx, 1 ;Saida
        mov ecx, igual
        mov edx, tam_igual
        int 0x80

        mov al, [res1]
        mov bl, [divisao]
        sub al, '0'
        sub bl, '0'
        div bl
        add al, '0'
        add ah, '0'
        mov [res], al
        mov [resto], ah
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