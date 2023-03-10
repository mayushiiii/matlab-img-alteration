# Alterarea imaginilor prin interpolare

Algoritmii sunt unii des folositi in lucrul cu redimensionarea imaginilor; cand folosesc o aplicatie de desenat/editat si trebuie sa dau resize unei parti din imagine, am optiunea de a alege daca vreau ca resize-ul sa fie facut bilinear, bicubic, proximal/nearest neighbour sau Lanczos. Desi toate au aceeasi intentie, rezultatele difera; unele compresii sunt mai smooth decat altele. 
Aici se afla niste implementari simplificate, realizate in MATLAB, ale catorva din aceste metode de redimensionare a unei imagini.

## Proximal

Lucrul de tip 2x2 este un caz particular, prin urmare este scris in mod direct pe pixeli.

**Proximal 2x2** are ca atractie principala aproximarea coeficientilor din x si y_int, ale caror valori finale pot fi 1 sau 2. aceasta aproximare se realizeaza cu ajutorul lui round, fiind cea mai directa cale de a face asta.

**Resize** consta in obtinerea 'ingredientelor' necesare in primul rand: factorul de scalare (dat de impartirea intre size ul dorit si cel initial), matricea de transformare si inversa ei, apoi pe baza formulei, o ultima re-scalare(incrementarea cu 1 pt a trece in sistemul de coordonate potrivit) si o aproximare, se afla elementul din imaginea finala.

**Proximal** 2x2 **rgb** este un caz particular din nou; are loc extragerea, aproximarea apoi concatenarea celor 3 canale.

**Resize rgb** e 'copilul' celor doua de mai sus. se extrag datele in acelasi stil ca la proximal rgb, insa se apeleaza resize-ul pt fiecare componenta, apoi se concateneaza.

**Rotate**-ul are la baza determinarea matricii de transformare, a carei inversa este apoi folosita. determinarea de x-uri si y uri este mai fortata la mine datorita unor aproximari trase de coada, deoarece exista cazul in care iesim din imagine cand determinam x2-ul, caz in care ar trebui sa-l ducem inapoi unde trebuie si  de aia scadem 1 din x1 si x2 respectiv (sau y1 si y2). se afla coeficientii a1..4 rezolvand sistemul, iar apoi tot de acolo se aplica formula pentru a afla pixelul(rotit).

**Rotirea** rgb este analog cu resize dar pt rotire.

## Bicubic

fx fy si fxy sunt functii generice pt calculul derivatei pe baza exemplului.

Coef este tot o functie mai mult utilitara, care calculeaza matricea de coeficienti pe baza celor 3 componente de asemenea luate din exemplu. matriceafinala este produsul dintre aceste 3 componente.

**Precalc** returneaza 3 matrici, pentru care se calculeaza, in fiecare caz, alte derivate, in raport cu variabilele pe care le reprezinta (x, y si xy). parcurgerile acestora sunt 'customizate' in functie de pozitiile pe care se gasesc valori diferite de zero( in cazul lui x sunt valori de zero pe prima si ultima coloana, in cazul lui y sunt zerouri pe prima si ultima linie , iar in cazul lui xy pe toate marginile exterioare). 

**Resize** seamana mult ca abordare cu rotirea proximala: se formeaza elementele relevante rezolvarii: matricea de transformare, derivatele, xp si yp, apoi punctele ce le inconjoara, se apeleaza functia pentru calcul de coeficienti bicubici, iar apoi se modifica coordonatele (se trece la patratul unitate) si se calculeaza valoarea finala pe baza formulei.
