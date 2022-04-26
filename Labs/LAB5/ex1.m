t = [0 3 5 8 13];
d = [0 225 383 623 993];
v = [75 77 80 74 72];
value = 10;

l=length(t);
   
z=zeros(1,2*l);  z(1:2:end)=t; z(2:2:end)=t;
f=zeros(1,2*l);  f(1:2:end)=d; f(2:2:end)=d;

#compute divided difference table
diff=zeros(2*l,2*l);
diff(:,1)=f';
diff(1:2:end,2)=v';
diff(2:2:2*l-1,2)=(d(2:l)-d(1:l-1))./(t(2:l)-t(1:l-1));
for k=3:2*l
  for i=1:2*l-k+1
    diff(i,k)=(diff(i+1,k-1)-diff(i,k-1))/(z(i+k-1)-z(i));
  endfor
endfor

p=1;
s=diff(1,1);

# Hermite formula
for i=1:2*l-1
  p=p*(value-z(i));
  s=s+p(j)*diff(1,i+1);
endfor
  
printf("Distance: %d\n", s) 
printf("Speed: d / t = %d\n", s / value)