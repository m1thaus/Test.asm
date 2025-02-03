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
    msg db 'Hello World', 0Ah  ; Mensagem + newline
    msg_len equ $ - msg  ; Calcula o tamanho da string
    
