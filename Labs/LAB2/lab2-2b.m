function chebyshev(N)
  hold on
  t0 = @(x) ones(size(x));
  fplot(t0, [-1,1])
  t1 = @(x) x;
  fplot(t1, [-1,1])
  
  for i=2:N
    aux = t1;
    t1 = @(x) 2*x.*t1(x)-t0(x);
    t0=aux;
    fplot(t1, [-1,1])
  endfor
endfunction


chebyshev(7)