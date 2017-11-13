a=2;
b=1;
theta1=linspace(0,pi,100);
theta2=linspace(pi,2*pi,100);
r1=a*(1+cos(b*theta1));
r2=a*(1+cos(b*theta2));
polar(theta1,r1,'r');hold on
polar(theta2,r2,'b.')


