1;
function y = trapezium(f, a, b, n)
  h = (b-a)/n;
  xi = a:h:b;
  len = length(xi);
  y = h/2*(f(a)+f(b)+2*sum(f(xi(2:len-1))));
endfunction

a = 1;
b = 2;

f = @(x) x .* log(x);

n = 1;

v = trapezium(f, a, b, n);
correct = 0.636294368858383;
while abs(v - correct) > 7e-4
  n = n + 1;
  v = trapezium(f, a, b, n);
endwhile

printf("Approximation %d was reached for n = %d \n", v, n);