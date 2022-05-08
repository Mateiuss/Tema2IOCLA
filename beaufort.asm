%include "../include/io.mac"

section .text
    global beaufort
    extern printf

; void beaufort(int len_plain, char *plain, int len_key, char *key, char tabula_recta[26][26], char *enc) ;
beaufort:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; len_plain
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; len_key
    mov edx, [ebp + 20] ; key (address of first element in matrix)
    mov edi, [ebp + 24] ; tabula_recta
    mov esi, [ebp + 28] ; enc
    ;; DO NOT MODIFY
    xor esi, esi
    xor edi, edi
bucla:
    cmp esi, eax
    je afara
    cmp edi, ecx
    jne still_ok
    xor edi, edi
still_ok:
    mov ah, [ebx + esi]
    mov al, [edx + edi]
    sub al, ah
    cmp al, 0
    jge greater
    add al, 26
greater
    add al, "A"
    push edi
    mov edi, esi
    push esi
    mov esi, [ebp + 28]
    mov [esi + edi], al
    pop esi
    pop edi
    mov eax, [ebp + 8]
    inc esi
    inc edi
    jmp bucla
afara:

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
