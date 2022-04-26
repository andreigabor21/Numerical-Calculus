1;
function y = simpsons(f, a, b, n)
   h = (b - a) / n;
   xi = a : h : b;
   len = length(xi);
   y = h / 6 * (f(a) + f(b) + 4 * sum(f((xi(1 : len - 1 ) +  xi(2 : len)) / 2)) + 2 * sum(f(xi(1 : len - 1))));
endfunction

a = 0;
const = 2./sqrt(pi);

int = @(t) exp(-1 .* (t .^ 2));

erf = @(x, n) const .* simpsons(int, a, x, n);

n1 = 4;
n2 = 10;

correct = 0.520499876;

r1 = erf(0.5, n1);
err1 = abs(r1-correct);
printf("Result for n = %d, with accuracy %d\n", n1, err1);

r2 = erf(0.5, n2);
err2 = abs(r2-correct);
printf("Result for n = %d, with accuracy %d\n", n2, err2);
