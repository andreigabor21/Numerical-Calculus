1;
function divided_diff = diff(x, f)
  n = length(x);
  divided_diff = [f', zeros(n, n-1)];
  for k = 2:n 
    for i = 1:n-k+1
      divided_diff(i,k) = (divided_diff(i+1,k-1)-divided_diff(i,k-1))/(x(i+k-1)-x(i)); 
    endfor
  endfor
endfunction

function N=newton(x,f,xx)
  n=length(x)-1;

  % divided differences table
  m=diff(x, f);

  lx=length(xx);
  p=ones(1,lx);
  s=m(1,1)*ones(1,lx);
  for j=1:lx
    for i=1:n
      p(j)=p(j)*(xx(j)-x(i));
      s(j)=s(j)+p(j)*m(1,i+1);
    end
  end
  N=s;
endfunction

x = linspace(0,6,13);
f = @(x)(exp(sin(x)));
y = f(x);

xx = 0:0.1:6;
N = newton(x, y, xx);

hold on
plot(x, f(x),'o') % interpolation points
plot(xx, f(xx)) % function plot
plot(xx, N, "g") % Newton interpolation polynomial