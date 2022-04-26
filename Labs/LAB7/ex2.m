t = [0, 10, 20, 30, 40, 60, 80, 100];
p = [0.0061, 0.0123, 0.0234, 0.0424, 0.0738, 0.1992, 0.4736, 1.0133];

#a)
coef1 = polyfit(t, p, 3); # coefficients for a polynomial of degree 2
coef2 = polyfit(t, p, 6); # coefficients for a polynomial of degree 4

disp(coef1);
disp(coef2);

eval1 = polyval(coef1,45);
printf("First value in T = 45: %d \n", eval1);

eval2 = polyval(coef2,45);
printf("Second value in T = 45: %d \n", eval2);

actual = 0.095848;

error1 = abs(actual - eval1);
printf("First approximation error: %d \n", error1);
error2 = abs(actual - eval2);
printf("Second approximation error: %d \n", error2);

#b)
hold on
range = [0:0.001:100];

plot(t, p, 'x'); # interpolation points
plot(range, polyval(d1, range), 'r-'); 
plot(range, polyval(d2, range), 'g-');