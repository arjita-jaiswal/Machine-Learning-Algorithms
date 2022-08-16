clc;
clear;
A=input("Enter matrix")
m=size(A,1);
n=size(A,2);
max=-99999;
for j=1:n
  sum=0;
  for i=1:m
    sum=sum+A(i,j);
  end
  if max<sum
    max=sum;
  end
end
disp("A1 norm:")
disp(max)
%disp(norm(A,1))


%inf
max_r=-9999;
for i=1:n
  sum=0;
  for j=1:m
    sum=sum+A(i,j);
  end
  if max_r<sum
    max_r=sum;
  end
end
disp("A infinity norm:")
disp(max_r)
%disp(norm(A,Inf))
%f 
sum=0;
for i=1:m
  for j=1:n
    sum=sum+(A(i,j).^2);
  end
end
disp("F norm of A:")
disp(sum^(1/2))
%disp(norm(A,'fro'))
[U,S,V]=svd(A);
disp(trace(S))
%disp(A,'Spectral')
