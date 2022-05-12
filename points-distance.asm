%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global points_distance
    extern printf

points_distance:
    ;; DO NOT MODIFY
    
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; points
    mov eax, [ebp + 12]     ; distance
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    xor ecx, ecx
    xor edx, edx
    ; salvez in registrii dx si cx valorile lui x1, respectiv x2
    mov dx, [ebx]     ; x1
    mov cx, [ebx + 4] ; x2
    ; daca cele doua valori nu sunt egale, calculez distanta dintre ele
    cmp cx, dx
    je do_y
    jl lower
    jmp higher
do_y:
    ; altfel, calculez distanta dintre valorile y1 si y2
    mov dx, [ebx + 2] ; y1
    mov cx, [ebx + 6] ; y2
    cmp cx, dx
    jg higher
    ; cu urmatoarele doua etichete calculez modulul distantei dintre doua puncte
lower:
    sub edx, ecx
    mov ecx, edx
    jmp give_val
higher:
    sub ecx, edx

give_val:
    ; salvez distanta calculata la adresa pointata de catre eax
    mov dword [eax], ecx

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret

    ;; DO NOT MODIFY