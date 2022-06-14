function R = bicubic_resize(I, p, q)
    % =========================================================================
    % Se scaleaza imaginea folosind algoritmul de Interpolare Bicubic?.
    % Transforma imaginea I din dimensiune m x n in dimensiune p x q.
    % =========================================================================

    I = double(I);
    [m n nr_colors] = size(I);

    % TODO: Initializeaza matricea finala drept o matrice nula.
    R = zeros(p,q);
    out = zeros(p,q);

    % daca imaginea e alb negru, ignora
    if nr_colors > 1
        R = -1;
        return
    endif

    % Obs:
    % Atunci cand se aplica o scalare, punctul (0, 0) al imaginii nu se va deplasa.
    % In Octave, pixelii imaginilor sunt indexati de la 1 la n.
    % Daca se lucreaza in indici de la 1 la n si se inmulteste x si y cu s_x
    % respectiv s_y, atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
    % De aceea, trebuie lucrat cu indici in intervalul [0, n - 1]!


    % TODO: Calculeaza factorii de scalare
    % Obs: Daca se lucreaza cu indici in intervalul [0, n - 1], ultimul pixel
    % al imaginii se va deplasa de la (m - 1, n - 1) la (p, q).
    % s_x nu va fi q ./ n
    s_x = (q-1)./(n-1);
    s_y = (p-1)./(m-1);

    % TODO: Defineste matricea de transformare pentru redimensionare.
    T = [s_x , 0 ; 0 , s_y];

    % TODO: Calculeaza inversa transformarii.
    T_inv = inversare(T);

    % TODO: Precalculeaza derivatele.
    [Ix, Iy, Ixy] = precalc_d(I);

    % Parcurge fiecare pixel din imagine.
    for y = 0 : p - 1
        for x = 0 : q - 1
            % TODO: Aplica transformarea inversa asupra (x, y) si calculeaza x_p si y_p
            % din spatiul imaginii initiale.
            vect_p = T_inv*[x;y];
            x_p = vect_p(1,1);
            y_p = vect_p(2,1);

            % TODO: Trece (xp, yp) din sistemul de coordonate 0, n - 1 in
            % sistemul de coordonate 1, n pentru a aplica interpolarea.
            xp = x_p + 1;
            yp = y_p + 1;

            % TODO: Gaseste cele 4 puncte ce inconjoara punctul x, y
            r_x = round(xp);
            f_x = floor(xp);
            r_y = round(yp);
            f_y = floor(yp);
            x1 = f_x;
            y1 = f_y;
            x2 = x1 + 1;
            y2 = y1 + 1;
            if (r_x >= n)
              x1 = n-1;
              x2 = n;
            endif
            if (r_y >= m)
              y1 = m-1;
              y2 = m;
            endif
            

            % TODO: Calculeaza coeficientii de interpolare A.
            A = bicubic_coef(I, Ix, Iy, Ixy, x1, y1, x2, y2); 

            % TODO: Trece coordonatele (xp, yp) in patratul unitate, scazand (x1, y1).
            xp = xp - x1;
            yp = yp - y1;

            % TODO: Calculeaza valoarea interpolata a pixelului (x, y).
            % Obs: Pentru scrierea in imagine, x si y sunt in coordonate de
            % la 0 la n - 1 si trebuie aduse in coordonate de la 1 la n.
            out(y+1, x+1) = [1 xp xp*xp xp*xp*xp]*A*[1; yp; yp*yp; yp*yp*yp];
            
        endfor
    endfor

    % TODO: Transforma matricea rezultata în uint8 pentru a fi o imagine valida.
    R = uint8(out);
endfunction





