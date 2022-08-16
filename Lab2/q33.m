clear;
clc;
x = -1:0.01:1;
y = sqrt(1 - x .^ 2);
plot(x, y)
hold on
plot(x, -y)

theta = 0:pi/100:2*pi;
plot(cos(theta),sin(theta),'b','linewidth',2)
axis equal

P=[cos(theta); sin(theta)]
normP_inf=max(abs(P));
pinf=P;
pinf(1,:)=P(1,:)./normP_inf;
pinf(2,:)=P(2,:)./normP_inf;

plot(pinf(1,:),pinf(2,:),'r','linewidth',2)

normP_1=sum(abs(P));
p1=P;
p1(1,:)=p1(1,:) ./ normP_1;
p1(2,:)=p1(2,:) ./ normP_1;

plot(p1(1,:),p1(2,:),'g','linewidth',2)
