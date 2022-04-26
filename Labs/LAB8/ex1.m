1;
function y = simpsons(f, a, b)
   h = b - a;
   y = h / 6 * (f(a) + 4 * f((a + b) / 2) + f(b));   
endfunction

a=0;
b=1;
f=@(x) 2./(1+x.^2);

# a)
trapezium = (b-a)/2*(f(a)+f(b))

# b)
hold on;
fplot(f,[a,b]);
fill([0,0,1,1],[0,f(0),f(1),0],'g')

# c)
printf("Approximation using Simpsons formula: %d\n", simpsons(f, a, b));