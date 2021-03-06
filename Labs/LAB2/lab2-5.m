x2 = [2 4 6 8];
f2 = [4 8 14 16];

function div_diff = ex5(x, f)
  n = length(x)
  div_diff = [f', NaN * ones(n, n - 1)];
  for k = 2:n
    for i = 1:n-k+1
      div_diff(i,k) = (div_diff(i+1,k-1)-div_diff(i,k-1))/(x(i+k-1)-x(i));
    endfor
  endfor
  div_diff = [x', div_diff];
endfunction

t5 = ex5(x2, f2);
t5