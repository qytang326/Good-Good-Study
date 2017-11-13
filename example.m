V='(2*x.^2+4*y.^2)';
xmax=10;
ymax=5;
line=20;
xplot=linspace(-xmax,xmax,line);
[x,y]=meshgrid(xplot);
Vplot=eval(V);
pause
[Explot,Eyplot]=gradient(-Vplot);
meshc(Vplot);
xlabel('x');
ylabel('y');
zlabel('µçÎ»');
pause
axis([-xmax,xmax,-ymax,ymax]);
a=contour(x,y,Vplot);
clabel(a);
hold on;
pause
quiver(x,y,Explot,Eyplot);
xlabel('x');
ylabel('y');
hold off
pause