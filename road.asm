%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global road
    extern printf
    extern points_distance

road:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]      ; points
    mov ecx, [ebp + 12]     ; len
    mov ebx, [ebp + 16]     ; distances
    ;; DO NOT MODIFY
   
    ;; Your code starts here
    
    dec ecx
    ; bucla folosita pentru a itera prin vectorul de puncte
bucla:
    ; calculez adresa celui de-al doilea punct
    mov edx, ebx
    add edx, ecx
    add edx, ecx
    add edx, ecx
    add edx, ecx
    sub edx, 4
    push edx
    ; calculez adresa primului punct
    mov edx, eax
    add edx, ecx
    add edx, ecx
    add edx, ecx
    add edx, ecx
    sub edx, 4
    push edx
    ; folosesc prima functie de la task-ul 2 pentru a calcula distantele si pentru
    ; a le salva in vectorul catre care pointeaza ebx
    call points_distance
    add esp, 8
    loop bucla

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY