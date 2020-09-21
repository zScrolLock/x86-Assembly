section .data                                       

    msg1 DB "Digite seu nome: "
    tam_msg1 equ $ - msg1
     
    msg2 DB "Digite seu idade: "
    tam_msg2 equ $ - msg2

    msg3 DB "Boa tarde "
    tam_msg3 equ $ - msg3
    
    msg4 DB "sua idade e "
    tam_msg4 equ $ - msg4
   
section .bss
    nome RESB 1
    idade RESB 1
section .text                                     

global _start

_start:

        mov eax, 4
        mov ebx, 1
        mov ecx, msg1
        mov edx, tam_msg1
        int 0x80

        mov eax, 3
        mov ebx, 2
        mov ecx, nome
        mov edx, 10
        int 0x80
           
        mov eax, 4
        mov ebx, 1
        mov ecx, msg3
        mov edx, tam_msg3
        int 0x80
            
        mov eax, 4
        mov ebx, 1
        mov ecx, nome
        mov edx, 10
        int 0x80
        
        mov eax, 4
        mov ebx, 1
        mov ecx, msg2
        mov edx, tam_msg2
        int 0x80
        
        mov eax, 3
        mov ebx, 2
        mov ecx, idade
        mov edx, 2
        int 0x80
          
        mov eax, 4
        mov ebx, 1
        mov ecx, msg4
        mov edx, tam_msg4
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, idade
        mov edx, 2
        int 0x80


exit:
        mov eax, 1
        int 0x80

