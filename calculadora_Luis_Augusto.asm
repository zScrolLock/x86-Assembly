section .data
    msg DB "****************************** CALCULADORA 0 - 9  ******************************"
    tam_msg equ $ - msg

    msg1 DB "Digite o Primeiro Numero: "
    tam_msg1 equ $ - msg1

    msg2 DB "Digite o Segundo Numero: "
    tam_msg2 equ $ - msg2

    sinais DB " + (Soma) | - (Subtracao) | x (Multiplicacao) | / (Divisao) | 0 - SAIR DO PROGRAMA "
    tam_sinais equ $ - sinais

    numeros1 DB "                                 | 7 | 8 | 9 | " 
    tam_numeros1 equ $ - numeros1

    numeros2 DB "                                 | 4 | 5 | 6 | " 
    tam_numeros2 equ $ - numeros2

    numeros3 DB "                                 | 1 | 2 | 3 | " 
    tam_numeros3 equ $ - numeros3

    numeros0 DB "                                 |     0     | " 
    tam_numeros0 equ $ - numeros0

    msg3 DB "Digite o sinal da operacao que deseja fazer: "
    tam_msg3 equ $ - msg3

    divisao equ "/"

    soma equ "+"

    subtracao equ "-"

    multiplicacao equ "x"

    zero equ 0

    msg_soma DB "Resultado da Soma: "
    tam_msg_soma equ $ - msg_soma

    msg_sub DB "Resultado da Subtracao: "
    tam_msg_sub equ $ - msg_sub
    
    msg_mul DB "Resultado da Multiplicacao: "
    tam_msg_mult equ $ - msg_mul

    msg_div DB "Resultado da Divisao: "
    tam_msg_div equ $ - msg_div

    feito DB "                      Feito/Desenvolvido por Luis Augusto"
    tam_feito equ $ - feito

section .bss

    a RESB 2
    b RESB 2
    res_soma RESB 1
    res_sub RESB 1
    res_multi RESB 1
    res_divi RESB 1
    resto RESB 1
    sinal RESB 2

section .text

    global _start

    _start:
        ;Mensagem Boas Vindas
        mov eax, 4
        mov ebx, 1
        mov ecx, msg
        mov edx, tam_msg
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov [ecx], byte 0xa
        mov edx, 1
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov [ecx], byte 0xa
        mov edx, 1
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, numeros1
        mov edx, tam_numeros1
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov [ecx], byte 0xa
        mov edx, 1
        int 0x80
        
        mov eax, 4
        mov ebx, 1
        mov ecx, numeros2
        mov edx, tam_numeros2
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov [ecx], byte 0xa
        mov edx, 1
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, numeros3
        mov edx, tam_numeros3
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov [ecx], byte 0xa
        mov edx, 1
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, numeros0
        mov edx, tam_numeros0
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov [ecx], byte 0xa
        mov edx, 1
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov [ecx], byte 0xa
        mov edx, 1
        int 0x80
        
        mov eax, 4
        mov ebx, 1
        mov ecx, sinais
        mov edx, tam_sinais
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov [ecx], byte 0xa
        mov edx, 1
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, feito
        mov edx, tam_feito
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov [ecx], byte 0xa
        mov edx, 1
        int 0x80

    LOOP:
        mov eax, 4
        mov ebx, 1
        mov [ecx], byte 0xa
        mov edx, 1
        int 0x80

        ;Digite o Primeiro Numero
        mov eax, 4
        mov ebx, 1
        mov ecx, msg1
        mov edx, tam_msg1
        int 0x80

        mov eax, 3
        mov ebx, 0
        mov ecx, a
        mov edx, 2
        int 0x80

        ;Digite o Segundo Numero
        mov eax, 4
        mov ebx, 1
        mov ecx, msg2
        mov edx, tam_msg2
        int 0x80
        
        mov eax, 3
        mov ebx, 0
        mov ecx, b
        mov edx, 2
        int 0x80

        ;Lista com sinais
        mov eax, 4
        mov ebx, 1
        mov ecx, sinais
        mov edx, tam_sinais
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov [ecx], byte 0xa
        mov edx, 1
        int 0x80

        ;Digite o Sinal da Operacao
        mov eax, 4
        mov ebx, 1
        mov ecx, msg3
        mov edx, tam_msg3
        int 0x80
        
        mov eax, 3
        mov ebx, 0
        mov ecx, sinal
        mov edx, 2
        int 0x80

        mov al, [sinal]
        cmp al, soma
        je SOMAR

        cmp al, subtracao
        je SUBTRAI

        cmp al, multiplicacao
        je MULTIPLICA

        cmp al, divisao
        je DIVIDIR

        cmp al, zero
        jmp SAIR
        
    SOMAR:
        mov al, [a]
        mov bl, [b]
        sub al, '0'
        sub bl, '0'
        add al, bl
        add al, '0'
        mov [res_soma], al
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, msg_soma
        mov edx, tam_msg_soma
        int 0x80

        mov eax, 4 ;Escrita
        mov ebx, 1 ;Saida
        mov ecx, res_soma ;Apresenta Soma
        mov edx, 1
        int 0x80

        jmp LOOP

    SUBTRAI:
        mov al, [a]
        mov bl, [b]
        sub al, '0'
        sub bl, '0'
        sub al, bl
        add al, '0'
        mov [res_sub], al
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, msg_sub
        mov edx, tam_msg_sub
        int 0x80

        mov eax, 4 ;Escrita
        mov ebx, 1 ;Saida
        mov ecx, res_sub ;Apresenta subtração
        mov edx, 1
        int 0x80

        jmp LOOP

    MULTIPLICA:
        mov eax, [a]
        mov ebx, [b]
        sub eax, '0'
        sub ebx, '0'
        mul ebx
        add eax, '0'
        mov [res_multi], eax
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, msg_mul
        mov edx, tam_msg_mult
        int 0x80

        mov eax, 4 ;Escrita
        mov ebx, 1 ;Saida
        mov ecx, res_multi ;Apresenta Multiplicacao
        mov edx, 1
        int 0x80

        jmp LOOP

    DIVIDIR: 
        mov al, [a]
        mov bl, [b]
        sub al, '0'
        sub bl, '0'
        div bl
        add al, '0'
        add ah, '0'
        mov [res_divi], al
        mov [resto], ah
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, msg_div
        mov edx, tam_msg_div
        int 0x80

        mov eax, 4 ;Escrita
        mov ebx, 1 ;Saida
        mov ecx, res_divi ;Apresenta Divisao
        mov edx, 1
        int 0x80

        jmp LOOP
    
    SAIR:

    exit:
        mov eax, 1
        int 0x80