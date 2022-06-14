function [biort_V biort_W] = R_block_lanczos(A , B , C , sigma)
  [n n] = size(A);
  [n p] = size(C');
  m = length(sigma);
  In = eye(n);
  maximum = intmax;
  S = (inversare(A - sigma(1))) * B;
  R = ((inversare(A - sigma(1)*In))') * C';
  [V H(0)] = GSMod(S);
  [W G(0)] = GSMod(R);
  biort_V = [V];
  biort_W = [W];
  
  for i = 1 : m
    if (i < m)
      if (sigma(i+1) == maximum)
        S = A * V;
        R = A' * W;
      else 
        S = (inversare(A - sigma(i+1)*In)) * V;
        R = ((inversare(A - sigma(i+1)*In))') * W;
      endif
      H = biort_W' * S;
      G = biort_V' * R;
      S = S - (biort_V * H);
      R = R - (biort_W * G);
      [V H(i)] = GSMod(S);
      [W G(i)] = GSMod(R);
      [P D Q] = svd(W' * V);
      V = V * Q' * sqrt(inversare(D));
      W = W * P * sqrt(inversare(D));
      H(i) = sqrt(D) * Q * H(i);
      G(i) = sqrt(D) * P' * G(i);
      biort_V = [biort_V , V];
      biort_W = [biort_W , W];
    else
      if (sigma(m+1) == maximum)
        S = A * B;
        R = A' * C;
      else
        S = inversare(A) * B;
        R = (inversare(A))' * C';
      endif
      H = biort_W' * S;
      G = biort_V' * R;
      S = S - (biort_V*H);
      R = R - (biort_W*G);
      [V H(m)] = GSMod(S);
      [W G(m)] = GSMod(R);
      [P D Q] = svd(W' * V);
      V = V * Q' * sqrt(inversare(D));
      W = W * P * sqrt(inversare(D));
      H(m) = sqrt(D) * Q * H(m);
      G(M) = sqrt(D) * P' * G(m);
      biort_V = [biort_V , V];
      biort_W = [biort_W , W];
    endif
  endfor
  
endfunction