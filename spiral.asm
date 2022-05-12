%include "../include/io.mac"

section .data
    ; zona de memorie de patru octeti in care salvez pozitia la care adaug in 
    ; sirul de caractere plain
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

    ; in ceea ce urmeaza mai jos (pana la sfaristul urmatorului loop), salvez
    ; in enc_string valorile care se gasesc in plain. Fac aceasta operatie cu
    ; scopul de a elibera registrul ebx
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
    pop eax
    loop make_enc_equal_to_plain

    pop ecx

    ; salvez in ebx lungimea N, pentru a-l trata ca o adoua dimensiune a matricei
    mov ebx, eax

    xor esi, esi ; k
    xor edi, edi ; l

    ; tratez parcurgerea in spirala ca o serie de pasi in care parcurg laturile
    ; unui patrat cu ajutorul a patru bucle. La fiecare pas parcurg un patrat
    ; care se afla din ce in ce mai interiorul matricei

    ; aceasta este bucla principala, din care se iese atunci cand s-a parcurs
    ; fiecare patrat
main_loop:
    cmp esi, ebx
    jge out_main_loop
    cmp edi, eax
    jge out_main_loop
    ; conditii de intrare in main_loop

    ; bucla care parcurge prima latura a patratului (latura de sus, de la stanga la dreapta)
    push edi
loop1:
    ; voi explica cum am implementat aceasta bulca, intrucat celelalte se aseamana cu aceasta.
    ; conditie de intrare in bucla
    cmp edi, eax
    jge out_loop1

    ; salvez in eax adresa la care trebuie sa adaug caracterul criptat din enc_string
    push eax
    mov eax, edx
    add eax, [count]
    inc dword [count]

    ; salvez in bl valoarea de pe pozitia curenta din key, dupa care o adaug in [eax]
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

    ; bucla care parcurge a doua latura a patratului (latura din dreapta, parcursa de sus in jos)
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

    ; bucla care parcurge latura de jos de la dreapta la stanga
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

    ; bucla care parcurge latura din stanga de jos in sus
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

    ; reinitializez valoarea catre care pointeaza 'count' cu 0
    mov dword [count], 0

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
