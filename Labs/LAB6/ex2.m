[x,y] = ginput(5); # take 5 points
a = min(x);
b = max(x);

to_plot = linspace(a,b,100);

cubic_spline = spline(x, y);

hold on

plot(x, y, 'o')
eval = ppval(cubic_spline, to_plot); # evaluates the piecewise polynomial pp at the query points "to_plot"
plot(to_plot, eval, 'r')

hold off