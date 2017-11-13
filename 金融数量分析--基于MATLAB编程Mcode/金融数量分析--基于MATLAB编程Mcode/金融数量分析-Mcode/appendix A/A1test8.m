%%
syms x t
ezplot('t*cos(t)','t*sin(t)',[0,4*pi])
%%
syms x	
subplot(2,2,1),fplot('humps',[0,1])
f='abs(exp(x*(0:9))*ones(10,1))'
subplot(2,2,2),fplot(f,[0,2*pi])
subplot(2,2,3),fplot('sin(1./x)',[0.01,0.1],1e-3)
%%
x=1:10
y=sin(x)
plot(x,y,'--rs')
%%
t=0:pi/20:2*pi;
y=exp(sin(t));
plotyy(t,y,t,y,'plot','stem')%stem为二维杆图
%%
t=0:pi/50:15*pi;
plot3(sin(t),cos(t),t,'r*') 
v=axis %返回各个轴的范围
text(0,0,0,'origin') %在某个坐标点加入文字
%%
[x,y]=meshgrid([-2:0.1:2]);
z=x.*exp(-x.^2-y.^2);
subplot(1,2,1)
plot3(x,y,z)
subplot(1,2,2)
surf(x,y,z) 
%%
[x,y,z]=peaks(30);
contour3(x,y,z,16,'g')
%%
[x,y,z]=peaks(30);
pcolor(x,y,z); %伪彩色 
shading interp %颜色插值，使颜色平均渐变
hold on,contour(x,y,z,20,'k')%画等值线
colorbar('horiz') %水平颜色标尺
c=contour(x,y,z,8);
clabel(c) %标注等高线 
%%
[x,y]=meshgrid(-2:.2:2,-1:.15:1);
z=x.*exp(-y.^2);
[px,py]=gradient(z,.2,.15);
contour(x,y,z);
hold on,quiver(x,y,px,py)
axis image
%%
x=0:0.1:10;
y=sin(x);
fill([x,10],[y,0],'r')
%%
x=0:0.1:10;
y=sin(x);
subplot(1,3,1)
fill([x,10],[y,0],[1,0,0])
subplot(1,3,2)
fill([x,10],[y,0],[0,1,0])
subplot(1,3,3)
fill([x,10],[y,0],[0,0,1])



