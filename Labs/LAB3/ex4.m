clear 

function z = compute_A_i(i,x)
  m = length(x);
  p = 1;
  for j = 1:m
    if i~=j
      p = p*(x(i)-x(j));
    endif
  end
  z = 1/p;
endfunction

function L = lagrange(x,y,xx)  
  m = length(x);
  P = zeros(1,m);
  N = length(xx);
  L = zeros(1,N);
  for j = 1:N
    s1 = 0;
    s2 = 0;
    for i = 1:m
      P(i) = compute_A_i(i,x);
      s1 = s1 + P(i)*y(i)/(xx(j)-x(i));
      s2 = s2 + P(i)/(xx(j)-x(i));
    endfor
  L(j) = s1/s2;
  end
endfunction

f = @(a) 1 ./ (1 + a .^ 2);

function max = compute_E_n(f, y, n, L)
  max = 0;
  for i = 1:100
    calcul = abs(f(i / 10 - 5) - L(i));
    if (calcul > max)
      max = calcul;
    endif
  endfor
endfunction

hold on;

N = 2:2:8;
for n = N
  x = linspace(-5, 5, n + 1);
  y = f(x);
  xx = linspace(-5, 5, 101);
  L = lagrange(x, y, xx);
  e = compute_E_n(f, y, n, L)
  subplot(2, 2, n / 2);
  plot(xx, L);
  title(strcat("n=", num2str(n), " e=", num2str(e)))
endfor
    
    
    
    
    
    
    




