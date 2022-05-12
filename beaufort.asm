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

    ; am rezolvat acest task fara a ma folosi de matricea tabula_recta. Mai multe
    ; explicatii se gasesc mai jos

    xor esi, esi
    xor edi, edi
bucla:
    ; verific daca am ajuns la finalul sirului plain. In caz ca am ajuns, ies din bucla
    cmp esi, eax
    je afara
    ; verific daca am ajuns la finalul sirului key. In cazul in care am ajuns, 
    ; reinitializez valoarea lui edi cu 0
    cmp edi, ecx
    jne still_ok
    xor edi, edi
still_ok:
    ; preiau valorile curente din plain si din key
    mov ah, [ebx + esi]
    mov al, [edx + edi]
    sub al, ah
    ; scad din valoarea din key valoarea din plain, iar daca rezultatul este
    ; mai mic decat 0 adun 26 la acesta
    cmp al, 0
    jge greater
    add al, 26
greater:
    ; adun la rezultatul obtinut anterior valoarea caracterului 'A'
    add al, "A"
    push edi
    mov edi, esi
    push esi
    mov esi, [ebp + 28]
    ; salvez rezultatul in enc
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
