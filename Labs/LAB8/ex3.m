1;
function y = trapezium(f, a, b, n)
  h = (b-a)/n;
  xi = a:h:b;
  len = length(xi);
  y = h/2*(f(a)+f(b)+2*sum(f(xi(2:len-1))));
endfunction

n1 = 4; 
n2 = 9;

r = 110; 
p = 75; 
a = 0; 
b = 2 * pi;

coef = 60 * r / (r * r - p * p);

f = @(x) sqrt(1 - (p / r) ^ 2 * sin(x));

v1 = trapezium(f, a, b, n1);
v2 = trapezium(f, a, b, n2);

printf("For n = %d the integral evaluates to %d \n", n1, coef * v1);
printf("For n = %d the integral evaluates to %d \n", n2, coef * v2);