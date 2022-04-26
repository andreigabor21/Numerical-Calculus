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

x=[1 1.5 2 3 4];
f=[0 0.17609 0.30103 0.47712 0.60206];
first=[2.5, 3.25];
N = newton(x, f, first);
printf("lg 2.5 = %d, lg 3.25 = %d \n", N(1), N(2));

i = 10:35;
yi = i./10;
N = newton(x, f, yi);
E = max(abs(log10(yi)-N));
printf("maximum interpolation error E = %d\n", E);