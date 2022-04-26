1;
function y = simpsons(f, a, b, n)
   h = (b - a) / n;
   xi = a : h : b;
   len = length(xi);
   y = h / 6 * (f(a) + f(b) + 4 * sum(f((xi(1 : len - 1 ) +  xi(2 : len)) / 2)) + 2 * sum(f(xi(1 : len - 1))));
endfunction

n1 = 10;
n2 = 30;

a = 0;
b = pi;

f = @(x) 1./(4+sin(20.*x));

printf("For n = %d the integral evaluates to %d \n", n1, simpsons(f,a,b,n1));

printf("For n = %d the integral evaluates to %d \n", n2, simpsons(f,a,b,n2));