clc
clear
%l0 norm
%{
x=-1:0.01:1;
y=-1:0.01:1;
figure
plot(x,0)
plot(0,y)
hold on
%}
%l1 norm 
x=-1:0.01:1;
plot(x,1-abs(x))
hold on
plot(x,abs(x)-1)
hold on
%l2 norm
theta = 0:pi/100:2*pi;
plot(cos(theta),sin(theta),'b','linewidth',2)

%l inf norm
P=[cos(theta); sin(theta)];
normP_inf=max(abs(P));
pinf=P;
pinf(1,:)=P(1,:)./normP_inf;
pinf(2,:)=P(2,:)./normP_inf;

plot(pinf(1,:),pinf(2,:),'r','linewidth',2)