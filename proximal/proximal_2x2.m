function out = proximal_2x2(f, STEP = 0.1)
    % ===================================================================================
    % Aplica Interpolare Proximala pe imaginea 2 x 2 f cu puncte intermediare echidistante.
    % f are valori cunoscute în punctele (1, 1), (1, 2), (2, 1) ?i (2, 2).
    % Parametrii:
    % - f = imaginea ce se va interpola;
    % - STEP = distan?a dintre dou? puncte succesive.
    % ===================================================================================
    
    % TODO: Defineste coordonatele x si y ale punctelor intermediare.
    aux_i_1 = 1;
    aux_j_1 = 1;
    x_int = 1:STEP:2;

    % Se afl? num?rul de puncte.
    n = length(x_int);
    mij = fix(n/2);
    % TODO: Cele 4 puncte încadratoare vor fi aceleasi pentru toate punctele din interior.
    
    f11 = f(1,1);
    f12 = f(1,2);
    f21 = f(2,1);
    f22 = f(2,2);

    % TODO: Initializeaza rezultatul cu o matrice nula n x n.
    out = zeros(n);
    
    % Se parcurge fiecare pixel din imaginea finala.
    for i = 1 : n
        for j = 1 : n
            % TODO: Afla cel mai apropiat pixel din imaginea initiala.
            if ((i == 1) && (j == 1)) 
              out(i,j) = f11;
              continue;
            endif
            if ((i == 1) && (j == n)) 
              out(i,j) = f12;
              continue;
            endif
            if ((i == n) && (j == 1)) 
              out(i,j) = f21;
              continue;
            endif
            if ((i == n) && (j == n)) 
              out(i,j) = f22;
              continue;
            endif
            tmp_i = i - aux_i_1;
            tmp_j = j - aux_j_1;
            
            % TODO: Calculeaza pixelul din imaginea finala.
            if (tmp_i < mij && tmp_j < mij)
              out(i,j) = f11;
              continue;
            endif
            if (tmp_i < mij && tmp_j >= mij) 
              out(i,j) = f12;
              continue;
            endif
            if (tmp_i >= mij && tmp_j < mij) 
              out(i,j) = f21;
              continue;
            endif
            if (tmp_i >= mij && tmp_j >= mij) 
              out(i,j) = f22;
              continue;
            endif
    
        end
    end

end