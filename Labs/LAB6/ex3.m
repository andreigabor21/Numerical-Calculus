pkg load spline;

t = [0 3 5 8 13];
d = [0 225 383 623 993];
s = [75 77 80 74 72];

spl = spline(t, [75 d 72], 10);
spl2 = spline(t, [75 d 72], 10);

printf("Distance: %d\n", spl);
printf("Speed: %d\n", spl2);

p_der=fnder(spl2,1);
y_prime=ppval(p_der,10)