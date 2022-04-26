x = -1:0.01:1;
hold on

T1=@(t) cos(1.*acos(t));
plot(x, T1(x), 'r')

T2=@(t) cos(2.*acos(t));
plot(x, T2(x), 'x')

T3=@(t) cos(3.*acos(t));
plot(x, T3(x), 'y')

