a=20;
b=2;
theta1=linspace(0,0.5*pi,100);
theta2=linspace(pi,2*pi,100);
r1=a*sin(b*theta1);
r2=a*(1+cos(b*theta2));
polar(theta1,r1,'r');hold on
% polar(theta2,r2,'b.')


