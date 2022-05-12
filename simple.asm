%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here

    ; bucla cu care iterez prin sirul de carcatere
bucla:
    ; preiau elementul din sir
    mov byte bl, [esi + ecx - 1]
    ; il maresc cu pasul dat
    add bl, dl
    ; verific daca carcaterul marit este mai mare decat 'Z'
    cmp bl, "Z"
    jle lower
    ; daca este mai mare decat 'Z', il dai inapoi cu 26 de pozitii
    sub bl, 26 
lower:
    ; altfel, il adaug in sirul criptat
    mov byte [edi + ecx - 1], bl
    loop bucla

    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
