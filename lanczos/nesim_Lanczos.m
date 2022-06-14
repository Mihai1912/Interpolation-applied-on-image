function [V_1 W_1] = nesim_Lanczos(A , V , W , m)
  [n n] = size(A);
  [n n] = size(V);
  V_1 = zeros(n , n);
  W_1 = zeros(n , n);
  V_2 = zeros(n , n);
  W_2 = zeros(n , n);
  W_tr = W';
  [Q R] = GSMod(W_tr*V);
  R_inv = inversare(R);
  V_1 = V * R_inv;
  W_1 = W * Q;
  V_2 = A * V_1;
  W_2 = (A') * W_1;
  
  for i = 1 : m
    
    a = (W_1') * V_2;
    V_2 = V_2 - V_1 * a;
    W_2 = W_2 - W_1 * (a');
    
    [b_v2 s_v2] = GSMod(V_2);
    [b_w2 s_w2] = GSMod(W_2);
    
    V_1_next = b_v2;
    W_1_next = b_w2;
    
    s_w2 = s_w2';
    
    [U1 S1 V1] = svd((W_1_next')*V_1_next);
    
    s_w2 = s_w2 * U1 * sqrt(S1);
    s_v2 = sqrt(S1) * V1 * s_v2;
    
    V_1_next = V_1_next * (V1') * sqrt(inversare(S1));
    W_1_next = W_1_next * U1 * sqrt(inversare(S1));
    V_2 = A * V_1_next - V_1 * s_w2;
    W_2 = (A') * W_1_next - W_1 * (s_v2');
    
  endfor
endfunction