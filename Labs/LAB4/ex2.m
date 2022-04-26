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

x=[1 2 3 4 5];
f=[22 23 25 30 28];

xx = [2.5];

N = newton(x,f,xx);
printf("For 2.5 is %d\n", N); 

plot(x,f,'o')

hold on

full = 0:0.01:6;
graph = newton(x, f, full);

plot(full, graph)