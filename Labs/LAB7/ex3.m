rectangle('Position', [0 0 3 5])

[x, y] = ginput(10); # Take the input from graph

# Returns the coefficients for a polynomial p(x) of degree 2 that is a best fit (in a least-squares sense) 
p = polyfit(x, y, 2); 

hold on

range = 0:0.001:3;
plot(x, y, 'x')
plot(range, polyval(p, range), 'g');