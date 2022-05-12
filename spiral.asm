%include "../include/io.mac"

section .data
    count dd 0

section .text
    global spiral
    extern printf

; void spiral(int N, char *plain, int key[N][N], char *enc_string);
spiral:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; N (size of key line)
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; key (address of first element in matrix)
    mov edx, [ebp + 20] ; enc_string (address of first element in string)
    ;; DO NOT MODIFY
    ;; TODO: Implement spiral encryption
    ;; FREESTYLE STARTS HERE

    push ecx
    push eax
    push edx
    mul eax
    pop edx
    mov ecx, eax
    pop eax
make_enc_equal_to_plain:
    push eax
    mov eax, ebx
    add eax, ecx
    dec eax
    mov byte al, [eax]
    mov byte [edx + ecx - 1], al
    ; PRINTF32 `%c \x0`, [edx + ecx - 1]
    pop eax
    loop make_enc_equal_to_plain

    pop ecx

    mov ebx, eax

    ; EBX has become m = n

    xor esi, esi ; k
    xor edi, edi ; l
main_loop:
    cmp esi, ebx
    jge out_main_loop
    cmp edi, eax
    jge out_main_loop
    ; Conditii de intrare in main_loop

    push edi
loop1:
    cmp edi, eax
    jge out_loop1

    push eax
    mov eax, edx
    add eax, [count]
    inc dword [count]

    ; enc[poz] = plain[poz] 

    push ebx
    mov ebx, 4
    push eax
    push edx
    mov eax, [ebp + 8]
    mul ebx
    mul esi
    pop edx
    mov ebx, eax
    pop eax
    add ebx, edi
    add ebx, edi
    add ebx, edi
    add ebx, edi
    add ebx, ecx
    mov ebx, [ebx]
    add [eax], bl
    pop ebx

    pop eax
    inc edi
    jmp loop1
out_loop1:
    pop edi
    inc esi

    push esi
loop2:
    cmp esi, ebx
    jge out_loop2
    
    push ebx
    mov ebx, edx
    add ebx, [count]
    inc dword [count]

    push edi
    push eax
    push edx
    mov eax, 4
    mul dword [ebp + 8]
    mul esi
    mov edi, eax
    pop edx
    pop eax
    add edi, ecx
    add edi, eax
    add edi, eax
    add edi, eax
    add edi, eax
    sub edi, 4
    mov edi, [edi]
    push eax
    mov eax, edi

    add byte [ebx], al

    pop eax


    pop edi
    pop ebx
    inc esi
    jmp loop2
out_loop2:
    pop esi
    dec eax

if1:
    cmp esi, ebx
    jge out_if1

    push esi
    mov esi, eax
    dec esi
loop3:
    cmp esi, edi
    jl out_loop3

    push edx
    add edx, [count]
    inc dword [count]

    push eax
    push edx
    mov eax, 4
    mul dword [ebp + 8]
    dec ebx
    mul ebx
    inc ebx
    pop edx
    add eax, ecx
    add eax, esi
    add eax, esi
    add eax, esi
    add eax, esi
    mov eax, [eax]

    add [edx], al

    pop eax
    pop edx
    dec esi
    jmp loop3
out_loop3:
    pop esi
    dec ebx

out_if1:

if2:
    cmp edi, eax
    jge out_if2

    push ebx
    dec ebx
loop4:
    cmp ebx, esi
    jl out_loop4

    push esi
    mov esi, edx
    add esi, [count]
    inc dword [count]

    push eax
    push edx
    mov eax, 4
    mul dword [ebp + 8]
    mul ebx
    add eax, ecx
    add eax, edi
    add eax, edi
    add eax, edi
    add eax, edi
    mov eax, [eax]
    pop edx

    add byte [esi], al

    pop eax
    pop esi
    dec ebx
    jmp loop4
out_loop4:
    pop ebx
    inc edi

out_if2:

    jmp main_loop
out_main_loop:

    mov dword [count], 0

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
