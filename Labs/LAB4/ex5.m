1;
function res = neville(x,f,X)
  y = f(x);

  n = length(x);
  Q = [y'];

  for i = 2:n
    for j = 2:i
      Q(i, j) = ((x(i)-X)*Q(i-1, j-1)+(X-x(i-j+1))*Q(i, j-1)) / (x(i)-x(i-j+1));
    endfor
  endfor
  res = Q;
endfunction

x = [-2 -1 0 1 2];
f = @(x)(3.^x);
X = 1/2;

res = neville(x,f,X)
n = length(x);
printf("Result a): %d\n", res(n, n));


x = [0 1 2 4 5];
f = @(x)(sqrt(x));
X = 3;

res = neville(x,f,X)
n = length(x);
printf("Result b): %d\n", res(n, n))