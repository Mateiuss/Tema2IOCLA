%include "../include/io.mac"

section .text
    global is_square
    extern printf

is_square:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; dist
    mov eax, [ebp + 12]     ; nr
    mov ecx, [ebp + 16]     ; sq
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    push eax
    mov eax, ecx
    pop ecx
    ; am inversat valorile registrilor eax si ecx cu scopul de a folosi
    ; registrul ecx in executarea unui loop

    ; bucla cu ajutorul careia parcurg vectorul de distante
bucla1:
    mov edx, [ebx + ecx * 4 - 4]
    mov esi, -1
    cmp edx, 0
    je put_1
    ; in aceasta bucla parcurg fiecare numar mai mic decat distanta data din
    ; unu in unu si ma opresc in cazul in care patratul numarului a depasit
    ; distanta sau este fix egal cu distanta data
bucla2:
    inc esi
    push eax
    push edx
    mov eax, esi
    mul esi
    pop edx
    cmp eax, edx
    pop eax
    je put_1
    jg put_0
    jmp bucla2

put_0:
    mov dword [eax + ecx * 4 - 4], 0
    jmp out_bucla1
put_1:
    mov dword [eax + ecx * 4 - 4], 1

out_bucla1:
    loop bucla1  

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY