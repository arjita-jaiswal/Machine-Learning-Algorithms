clc
clear
x= [1   1   2   3   3   5   6];
y=[1   3   3   1   5   1   5];
X=mean(x);
Y=mean(y);
m1=0;
m2=0;
a=size(x);
for i=1:a(2)
  m1 = m1+((x(i)-X)*(y(i)-Y));
  m2 = m2+((x(i)-X)^2);
end
m=m1/m2;
b=Y-m*X;
scatter(x,y,35,'b','filled')
hold on
plot(x,m*x+b,'r','LineWidth',2)
hold on
e1=0;
for i=1:a(2)
  e1=e1+((y(i)-(m*x(i)+b))^2);
end
disp("error before adding (10,10) :")
disp(e1)

x1= [1   1   2   3   3   5   6 10];
y1=[1   3   3   1   5   1   5 10];
X1=mean(x1);
Y1=mean(y1);
m11=0;
m21=0;
b=size(x1);
for i=1:b(2)
  m11 = m11+((x1(i)-X1)*(y1(i)-Y1));
  m21 = m21+((x1(i)-X1)^2);
end
m1=m11/m21;
b1=Y1-m1*X1;
scatter(x1,y1,35,'k','filled')
hold on
plot(x1,m1*x1+b1,'g','LineWidth',2)
e2=0;
for i=1:b(2)
  e2=e2+((y1(i)-(m1*x1(i)+b1))^2);
end
disp("error after adding (10,10) :")
disp(e2)