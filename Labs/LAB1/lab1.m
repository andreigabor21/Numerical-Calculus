a = [1,2,3]
b = [4;5;6]
c = a * b

d = b'
size(a)
length(a)
m = mean(a)

a = [1,2,13;4,5,6;7,8,9]
b = [4,8,12;-1,0,5;2,3,8]
mx = 3;
my = 3;
%the transpose matrix of b
t = b'
c = a*b
d = a.*b
e = a.^2
size(a)
length(a)
m = mean(a)
triu(a)

% polynomial
p = [2 -5 0 8]
polyval(p,2) 
roots(p)

% graphs
x = 0:0.01:1
f = exp(10 * x .* (x-1)) .* sin(12 * pi * x);
#plot(x,f);
g = 3 * exp(5 * x.^2 - 1) .* cos(12 * pi * x);
%plot(f, 'r', g, 'g');


%2)
t = 0 : 0.01 : 10*pi;
a = 12;
b = 87;
x = (a + b) * cos(t) - b * cos((a/b + 1) * t);
y = (a + b) * sin(t) - b * sin((a/b + 1) * t);
%plot(x, y);

%3)
x = 0: 0.001: 2*pi;
f1 = cos(x);
f2 = sin(x);
f3 = cos(2*x);
%plot(x, f1, x, f2, x, f3);


%4)
x = -1:0.001:0
y = 0:0.001:1
f1 = x.^3 + sqrt(1 - x);
f2 = y.^3 - sqrt(1 - y);
%plot(x, f1, y, f2);

%5)
x = 0:2:50;
y = 1:2:50;
f1 = x/2;
f2 = 3*y+1;
%plot(x, f1, "x", y, f2, "x");

%6)
k = 50;
a = 1 + 1/2;
V = [a];
for c = 1:k
a = 1 + 1/a;
V = [V a];
end
V
%plot(V);

%7)
x = -2 : 0.01 : 2;
y = -4 : 0.01 : 4;
[x, y] = meshgrid(x, y);
g = exp(-((x - 1/2).^2 .+ (y - 1/2).^2));
mesh(x, y, g)




