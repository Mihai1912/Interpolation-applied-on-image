function [Am Bm Cm] = Adapt_R_block_lanczos(A,B,C,sigma1,sigma2,tol)
  H0 = eye(p);
  eps = 1;
  m = 1;
  while(eps > tol)
    [Vm  Wm] = R_block_lanczos(A , B , C , sigma);
    Am = Wm'  * A * Vm;
    Bm = Wm' * B;
    Cm = C * Vm;
    Hm_prev = Hm;
    Hm = ... ;
    eps = norm(Hm - Hm_prev);
    m++;
  endwhile
endfunction