clear

function a_i = compute_A_i(i,x)
  m = length(x);
  p = 1;
  for j = 1:m
    if i~=j
      p = p*(x(i)-x(j));
    endif
  end
  a_i = 1/p;
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

x = [16 121 400];
y = [4 11 20];
xx = [115];
  
printf("Raspunsul este: %d \n", lagrange(x,y,xx))