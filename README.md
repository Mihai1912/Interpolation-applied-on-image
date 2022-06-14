Proximal_2x2:

Pentru inceput am realizat un vector cu elemente de la 1 la 2 cu pasul dat,
apoi am memorat lungimea ecestuia si am calculat mijlocul sau. Am memorat
punctele incadratoare care vor fi aceleas mereu. Am initializat matricea de
output cu o matrice nula de dimensiune n x n (n fiinde lungimea vectorului 
creat anterior). Se parcurge fiecare pixel din imaginea finala (element din
matricea de output) , si daca acesta de afla pe poztia unde unui punct 
incadrator va lua direct valoarea acestuia si se trece la pixelul urmator,
daca acesta nu se afla pe pozitia unui punct incadrator se calculeaza de ce 
pixel incadrator este mai aproape si acesta ia valoarea respectiva.

Proximal_2x2_RGB:

Pentru inceput am stabili fiecare canal de culoare si le-am memorat in 3
matrice (img_r, img_g, img_b) si am aplicat pentru iecare matrice in parte
functia proximal_2x2 si apoi am unit canalele de culare si am optinut .
imaginea finala.

Proximal_resize:

Am incepup prin a initializa matrice de output cu matricea nula de 
dimensiunea dorita pentru resize. Apoi am calculat factorii de scalare
si am creat natrice de transformare pentru redimensionare pe care o 
inversez cu ajutorul metodei de inversare pe care am utilizat-o si la
tema anterioara (cu ajutorul algoritmului Gram–Schmidt si algoritmul SST).
Parcurgem fiecare pixel din imaginea initiala si aplicam transformarea
inversa supra coordonatelor acestuia si le memoram, apoi le trecem din
sistemul 0, n-1 in sistemul 1, n pentru a aplica interpolarea. Calcuam cel
mai  apropiat pixel din imaginea initiala si punem valoarea acestuia in 
matricea finala.

Proximal_resize_RGB:

Pentru inceput am stabili fiecare canal de culoare si le-am memorat in 3
matrice (img_r, img_g, img_b) si am aplicat pentru iecare matrice in parte
functia proximal_resize si apoi am unit canalele de culare si am optinut .
imaginea finala.

Proximal_rotate:

Am inceput prin a calcula sinusul si cosinusul unghiului de rotatie, initializez
matricea de output, creez matricea de transfer si memorez separat de aceasta 
inversa ei, parcurgem fiecare pixel din imagine, aplicam transformarea inversa 
asupra coordonatelor pizelului curent si calcul coordonatele acestuia dar in 
spatiul imaginii initiale, trecem aceste coordonate din sistemul 0, n-1 in 
sistemul 1, n pentru a aplica interpolarea. Daca coordonatele acestea se 
afla in exteriorul imaginii pixelul va fi negru, daca nu, calculam punctele ce il 
inconjoara ,se calculeaza coeficientii de interpolare conform formulei prezente in 
pdf si apoi se calculeaza valoarea interpolata a pixelului.

Proximal_rotate_RGB:

Pentru inceput am stabili fiecare canal de culoare si le-am memorat in 3
matrice (img_r, img_g, img_b) si am aplicat pentru iecare matrice in parte
functia proximal_rotate si apoi am unit canalele de culare si am optinut.

Bicubic_resize:

Voi initializa matricea finala drept o matrice nula. Apoi am calculat factorii de 
scalare si am creat natrice de transformare pentru redimensionare pe care o 
inversez cu ajutorul metodei de inversare pe care am utilizat-o si la
tema anterioara (cu ajutorul algoritmului Gram–Schmidt si algoritmul SST).
Apoi calculez derivatele, parcurgem fiecare pixel din imaginea initiala si aplicam 
transformarea inversa supra coordonatelor acestuia si le memoram, apoi le trecem din
sistemul 0, n-1 in sistemul 1, n pentru a aplica interpolarea. Gasim cele 4 puncte
inconjuratoare, calculez coeficientii de interpolare si in final calculez 
valoare interpolata a pixelului.

Bicubic_resize_RGB:

Pentru inceput am stabili fiecare canal de culoare si le-am memorat in 3
matrice (img_r, img_g, img_b) si am aplicat pentru iecare matrice in parte
functia bicubic_resize si apoi am unit canalele de culare si am optinut.

fxy:

Aproximez derivata fata de x si y a lui f in punctul (x, y).

fy:

Aproximez derivata fata de y a lui f in punctul (x, y).

fx:

Aproximez derivata fata de x a lui f in punctul (x, y).

precalc_d:

Calculeaza derivatele dx , dy , dxy petnru fiecare pixel din imaginea initiala.

Lanczos: 

Am folosit in totalitate pseudocodul prezentat in pdf.