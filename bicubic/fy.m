function r = fy(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de y a lui f in punctul (x, y).
    % =========================================================================
    
    % TODO: Calculeaza derivata.
    [m n nr_col] = size(f);
    if (y == 1) 
      r = 0;
      return;
    endif
    if (y == m)
      r = 0;
      return;
    endif
      r = (f(y+1,x)-f(y-1,x))/2;
    
endfunction