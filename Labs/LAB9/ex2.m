1;
function res = romberg(a, b, f, k)
  h = b - a;
  if k == 0
    res = h / 2 * (f(a) + f(b));
  else
    q_prev = romberg(a, b, f, k-1);
    coef = (2 * [1:2^(k-1)] - 1) ./ 2^k;
    s = sum(f(a + coef .* h));
    res = 1/2 * q_prev + h / 2^k * s;
  endif
endfunction

f = @(x) 2./(1+x.*x);

a = 0;
b = 1;

k=0;
# The Romberg algorithm for trapezium formula
res = romberg(a,b,f,k)
