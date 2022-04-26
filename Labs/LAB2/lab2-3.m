function taylor(N)
  hold on;
  T = @(x) 1;
  fplot(T, [-1, 3]);
  for k = 1 : N
    T = @(x) T(x) + (x.^k) / factorial(k);
    fplot(T, [-1, 3]);
  endfor
  
endfunction

taylor(6)