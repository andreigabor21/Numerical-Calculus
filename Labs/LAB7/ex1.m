time = 1:7; 
temperature = [13, 15, 20, 14, 15, 13, 10];
 
A = [sum(time.^2), sum(time); sum(time), length(time)];
B = [sum(time .* temperature); sum(temperature)];

X = linsolve(A,B); # solves the linear system AX = B
fprintf('least squares function: %d x + %d \n', X);
eval1 = polyval(X, 8) # evaluates the polynomial

p = polyfit(time, temperature, 1); # returns the coefficients for a polynomial of degree 1
fprintf('least squares function: %d x + %d \n',p); 
eval2 = polyval(p, 8) # evaluates the polynomial

E_min = sum((temperature - polyval(p, time)).^2)

plot(time, temperature, 'o');#time, temperature
hold on

xp = 1:0.01:8;
plot(xp, polyval(p, xp),'g');#least squares function