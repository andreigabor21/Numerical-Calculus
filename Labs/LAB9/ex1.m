1;
function res = rectangle(a, b, f) # the rectangle quadrature rule
  res = (b - a) * f((a + b) / 2);
  endfunction

f = @(x) exp(-x.^2);
a = 1;
b = 1.5;

% a 
rectangle_res = rectangle(a, b, f);
printf("Result of the rectangle formula: %d\n", rectangle_res);

% b 
hold on
fill([a, a, b, b], [0, f((a+b)/2), f((a+b)/2), 0], 'g');
fplot(f, [a b]);

% c 
function res = repeated_rectangle(a, b, n, f) # The repeated rectangle (midpoint) quadrature formula
  h = (b - a) / n;
  x1 = a + h / 2;
  i = [2:n];
  xi = x1 + (i - 1) * h;
  res = h * (f(x1) + sum(f(xi(1:end))));
  endfunction

n1 = 150;
n2 = 500;

rep1 = repeated_rectangle(a,b,n1,f);
printf("Result of the repeated rectangle formula for n = %f: %f\n", n1, rep1);
rep2 = repeated_rectangle(a,b,n2,f);
printf("Result of the repeated rectangle formula for n = %f: %f\n", n2, rep2);