section .data
    boa DB "Boa tarde "
    tam_boa equ $ - boa

    hj DB "Hoje é "
    tam_hj equ $ - hj

    de DB "de "
    tam_de equ $ - de
    
    msg1 DB "Digite seu nome: " ;DB Quantidade de Bytes
    tam_msg1 equ $ - msg1

    dia_msg DB "Digite o dia: " 
    tam_d equ $ - dia_msg

    mes_msg DB "Digite o mes: "
    tam_m equ $ - mes_msg

    ano_msg DB "Digite o ano: "
    tam_a equ $ - ano_msg

    espaco DB ", "
    tam_espaco equ $ - espaco

section .bss

    nome RESB 15 ;15 Pois e a quantidade de caracteres
    dia RESB 5
    mes RESB 10
    ano RESB 5
     
    tam_nome RESB 15
    tam_dia RESB 5
    tam_mes RESB 10
    tam_ano RESB 5

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
        mov ecx, nome
        mov edx, 15
        int 0x80
        mov [tam_nome], eax ;Mover o valor que tem em EAX para a Variavel tam_nome nesse caso a quantidade de caracteres
        
        mov eax, 4 ;Escrita
        mov ebx, 1 ;Saida
        mov ecx, dia_msg
        mov edx, tam_d
        int 0x80
        
        mov eax, 3  ;Leitura
        mov ebx, 0  ;Teclado
        mov ecx, dia
        mov edx, 5
        int 0x80
        mov [tam_dia], eax ;Pega a quantidade de caracteres que o usuario digitou

        mov eax, 4 ;Escrita
        mov ebx, 1 ;Saida
        mov ecx, mes_msg
        mov edx, tam_m
        int 0x80
        
        mov eax, 3  ;Leitura
        mov ebx, 0  ;Teclado
        mov ecx, mes
        mov edx, 10
        int 0x80
        mov [tam_mes], eax

        mov eax, 4 ;Escrita
        mov ebx, 1 ;Saida
        mov ecx, ano_msg
        mov edx, tam_a
        int 0x80
        
        mov eax, 3  ;Leitura
        mov ebx, 0  ;Teclado
        mov ecx, ano
        mov edx, 5
        int 0x80
        mov [tam_ano], eax

        mov eax, 4  ;Escrita
        mov ebx, 1  ;Saida
        mov ecx, boa
        mov edx, tam_boa
        int 0x80

        mov eax, 4  ;Escrita
        mov ebx, 1  ;Saida
        mov ecx, nome
        mov edx, [tam_nome]
        sub edx, 1 ;Subtrair 1, para pegar o ENTER
        int 0x80

        mov eax, 4  ;Escrita
        mov ebx, 1  ;Saida
        mov ecx, espaco
        mov edx, tam_espaco
        int 0x80

        mov eax, 4  ;Escrita
        mov ebx, 1  ;Saida
        mov ecx, hj
        mov edx, tam_hj
        int 0x80

        mov eax, 4  ;Escrita
        mov ebx, 1  ;Saida
        mov ecx, dia
        mov edx, [tam_dia]
        sub edx, 1
        int 0x80

        mov eax, 4  ;Escrita
        mov ebx, 1  ;Saida
        mov ecx, espaco
        mov edx, tam_espaco
        int 0x80

        mov eax, 4  ;Escrita
        mov ebx, 1  ;Saida
        mov ecx, de
        mov edx, tam_de
        int 0x80

        mov eax, 4  ;Escrita
        mov ebx, 1  ;Saida
        mov ecx, mes
        mov edx, [tam_mes]
        sub edx, 1
        int 0x80

        mov eax, 4  ;Escrita
        mov ebx, 1  ;Saida
        mov ecx, espaco
        mov edx, tam_espaco
        int 0x80

        mov eax, 4  ;Escrita
        mov ebx, 1  ;Saida
        mov ecx, de
        mov edx, tam_de
        int 0x80

        mov eax, 4  ;Escrita
        mov ebx, 1  ;Saida
        mov ecx, ano
        mov edx, [tam_ano]
        int 0x80   
    exit:
        mov eax, 1
        int 0x80