1;
function z = aitken(x,y,val)
  er=1e-3; 
  [z, I] = sort(abs(x - val));
  x = x(I);
  y = y(I);
  n=length(x);

  matrix=zeros(n,n);
  matrix(:,1)=y';
  for i=1:n
      for j=1:i-1
        det = (matrix(j,j) * (x(i)-val) - matrix(i,j) * (x(j)-val));
        matrix(i,j+1) = (1 / (x(i) - x(j))) * det;
      endfor
      if i>1 && abs(matrix(i-1,i-1)-matrix(i,i)) <= er
        z = matrix(i,i);
        printf("Iteration stopped with i = %d\n", i);        
        return
      endif
  endfor
endfunction

x = [16 25 64 81 100 121 144 169];
y = [4 5 8 9 10 11 12 13];

val = 115;

ans = aitken(x,y,val);
printf("Result of Aitken approximation: %d\n", ans);

err = abs(ans-sqrt(val));
printf("With error: %d\n", err);
