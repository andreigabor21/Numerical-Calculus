1;
function y = double_trapezium(f, a, b, c, d)
  y = (b - a)*(d-c)/16 * (f(a, c) + f(a, d) + f(b, c) + f(b, d) +
  2*f((a+b)/2, c) + 2*f((a+b)/2, d) + 2*f(a,(c+d)/2) + 2*f(b, (c+d)/2) + 4*f((a+b)/2, (c+d)/2));
endfunction

a=1.4;
b=2;
c=1;
d=1.5;

f = @(x,y) log(x + 2 * y);

result = double_trapezium(f,a,b,c,d);
printf("Result of the double integral is: %d\n", result);