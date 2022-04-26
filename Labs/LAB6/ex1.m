x = [0, pi / 2, pi, (3 * pi) / 2, 2 * pi]; # nodes
fx = sin(x); # function f(x) = sin(x)

t = spline(x, fx); # returns a piecewise polynomial structure for use by ppval
natural = ppval(t, pi / 4); # evaluates the piecewise polynomial pp at the query point pi/4
printf("the value of the cubic natural spline: %d\n", natural);

t1 = spline(x, [1, fx, 1]); # Use clamped or complete spline interpolation when endpoint slopes are known
clamped = ppval(t1, pi / 4);
printf("the value of the cubic clamped spline: %d\n", clamped);

interval = linspace(0,2*pi,50);

hold on;

plot(interval, sin(interval), 'r');

natural = ppval(t, interval);
plot(interval, natural, 'b');

clamped = ppval(t1, interval);

plot(interval, clamped, 'g');
