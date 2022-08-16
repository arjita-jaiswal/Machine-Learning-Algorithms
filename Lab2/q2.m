%Compute l 0 , l 1 , l 2 , and l ∞ norms of vector (1,2,0,2,0)
clc
clear
v=[1,2,0,2,0];
a=size(v);
l0=0;
for i=1:a(2)
  if v(i)~=0
    l0=l0+1;
  end
end
disp("l0 norm")
disp(l0)
l1=0;
for i=1:a(2)
  l1=l1+abs(v(i));
end
disp("l1 norm=")
disp(l1)
l2=0;
for i=1:a(2)
  l2=l2+(abs(v(i))^2);
end
disp("l2 norm=")
disp((l2)^(1/2))
disp(norm(v,2))
max=-9999999999;
for i=1:a(2)
  if max<v(i)
    max=v(i);
  end
end
disp("l∞ norm=")
disp(max)
disp(norm(v,0))