# Tema2 PCLP2 - Dudu Matei-Ioan 313CB

In acest fisier voi explica mai in detaliu implementarile din fisierele aferente task-urilor date:

## simple.asm

* Pentru aceasta functie am parcurs fiecare caracter din plain, l-am adunat cu pasul dat si daca am depasit caracterul 'Z' am scazut din rezultat valoarea 26. Astfel am obtinut caracterul criptat.

## points_distance.asm

struct point{
    short x;
    short y; 
};

* Pentru doua astfel puncte (ca in modelul de mai sus) am verificat mai intai valorile din x1 si x2. Daca acestea erau egale, calculam distanta dintre punctele y1 si y2, in caz contrar calculam distanta dintre x1 si x2.
* Pentru a calcula modului distantei am verificat mai intai care dintre cele doua valori a caror distanta voiam sa o gasesc este mai mare si scadeam din valoarea mai mare pe cea mai mica.

## road.asm

* In aceasta functie am luat punctele consecutive, doua cate doua, si adresa zonei de memorie in care voiam sa salvez rezultatul si le dadeam ca parametrii functiei points_distance.

## is_square.asm

* Pentru a rezolva aceasta functie am parcurs fiecare element din vectorul de distante. 
* Pentru a verifica daca un element este patrat perfect am pornit cu valoarea 0 intr-un registru si l-am incrementat pana cand patratul valoarei ori a depasit distanta, ori era fix egal cu distanta. Pentru primul caz rezultatul este 0, iar pentru cel de-al doilea rezultatul este 1.

## beaufort.asm

* Am rezolvat aceast task fara a ma folosit de matricea tabula_recta.
* La fiecare pas, scadeam din valoarea key[curr] pe plain[curr]. Daca rezultatul este mai mic strict decat 0 il adun cu 26, in caz contrar nu fac nimic.
* La final adun cu valoarea caracterului 'A' pentru a obtine rezultatul final, anume valoarea caracterului criptat, pe care o salvez ulterior in sirul enc.

## spiral.asm
* Pentru a putea rezolva acest ultim task, am pornit de la scheletul unui program in C care parcurge o matrice in spirala, pentru a avea o mai buna vizualizare a modalitatii de rezolvare (program pe care l-am adaptat la cerintele temei):

while (k < m && l < n) {
    for (i = l; i < n; ++i) {
        printf("%d ", a[k][i]);
    }
    k++;

    for (i = k; i < m; ++i) {
        printf("%d ", a[i][n - 1]);
    }
    n--;

    if (k < m) {
        for (i = n - 1; i >= l; --i) {
            printf("%d ", a[m - 1][i]);
        }
        m--;
    }

    if (l < n) {
        for (i = m - 1; i >= k; --i) {
            printf("%d ", a[i][l]);
        }
        l++;
    }
}

* Inainte de a incepe, am copiat valorile din sirul plain in sirul enc_string. Ca urmare a acestui fapt, am putut sa folosesc registrul ebx ca sa salvez valoarea corespunzatoare lui 'm' din programul de mai sus (care totodata este egala cu n la inceput, avand o matrice patratica).
* Registrii corespunzatori celorlalte variabile din programul de mai sus sunt:

eax = n
ebx = m
esi = k
edi = l
ecx = a
