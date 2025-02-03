# Test.asm

Assembly: Exemplo de Saída no Terminal

Este repositório contém um programa simples em Assembly x86 que imprime uma mensagem no terminal utilizando chamadas de sistema do Linux.

Descrição

O programa faz uso da syscall sys_write para exibir a mensagem "Ola galera de cowboy" no terminal e, em seguida, utiliza sys_exit para encerrar a execução.

Requisitos

NASM (Netwide Assembler)

GNU Linker (ld)

Ambiente Linux (x86 32 bits ou compatibilidade com 32 bits ativada)

Como Compilar e Executar

Compile o código Assembly usando o NASM:

nasm -f elf32 programa.asm -o programa.o

Link o objeto gerado para criar o executável:

ld -m elf_i386 programa.o -o programa

Execute o programa:

./programa

Código Fonte

section .text
    global _start

_start:
    ; Chamada de sistema para escrever (sys_write)
    mov eax, 4       ; syscall number: sys_write
    mov ebx, 1       ; file descriptor: stdout
    mov ecx, msg     ; endereço da string
    mov edx, msg_len ; comprimento da string
    int 0x80         ; chamada de interrupção do kernel

    ; Chamada de sistema para sair (sys_exit)
    mov eax, 1       ; syscall number: sys_exit
    xor ebx, ebx     ; código de saída 0
    int 0x80         ; chamada de interrupção do kernel

section .data
    msg db 'Ola galera de cowboy', 0Ah  ; Mensagem + newline
    msg_len equ $ - msg  ; Calcula o tamanho da string

Licença

Este projeto está licenciado sob a MIT License - veja o arquivo LICENSE para mais detalhes.
