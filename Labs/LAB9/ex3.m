1;
function y = simpsons(f, a, b, n)
   h = (b-a)/n; 
   xi = a:h:b;
   len = length(xi);
   y = (h/6).*(f(a)+f(b)+4*sum(f((xi(2:len) + xi(1:len-1)) ./ 2))+2*sum(f(xi(2:len-1))));
endfunction 

#  an adaptive quadrature algorithm for Simpson's for
function y=adquad(a, b, f, err, n)
  y1 = simpsons(f, a, b, n);
  y2 = simpsons(f, a, (a+b)./2, n) + simpsons(f, (a+b)./2, b, n);
  
  if abs(y1 - y2) < 15 .* err
    y = y2;
    return;
  else
    y = adquad(a, (a+b)./2, f, err./2,n) + adquad((a+b)./2, b, f, err./2,n);
  end
endfunction

f = @(x) (100./(x.^2)) .* sin(10./x);

a = 1;
b = 3;
fplot(f, [a b]);

eps = 1e-4;

exact = -1.4260247818

# Compare the obtained result with the one obtained
# applying repeated Simpsonís formula for n = 50 and 100
n1 = 50;
n2 = 100;

aq1 = adquad(a,b, f, eps,n1)
aq2 = adquad(a,b, f, eps,n2)

s1 = simpsons(f, a, b, n1)
s2 = simpsons(f,a,b,n2)