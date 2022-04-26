t = [1 2];
d = [0 0.6931];
v = [1 0.5];
x = 1.5;

l=length(t);
 
z=zeros(1,2*l);  z(1:2:end)=t; z(2:2:end)=t; 
f=zeros(1,2*l);  f(1:2:end)=d; f(2:2:end)=d;

% compute divided difference table
m=zeros(2*l,2*l); 
m(:,1)=f';
m(1:2:end,2)=v';
m(2:2:2*l-1,2)=(d(2:l)-d(1:l-1))./(t(2:l)-t(1:l-1));
for k=3:2*l
    for i=1:2*l-k+1
        m(i,k)=(m(i+1,k-1)-m(i,k-1))/(z(i+k-1)-z(i));
    end
end

% compute Hermite 
p=1;
lx=1;
s=m(1,1)*ones(lx,1); 
for j=1:lx
  for i=1:2*l-1
    p=p*(x(j)-z(i));
    s(j)=s(j)+p*m(1,i+1);
  end
end

printf("ln(1.5) = %d\n", s);
printf("absolute approximation error: %d\n", abs(log(x) - s));