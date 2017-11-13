figure(1);

Np=320;%格点数
sigma=10;k0=0.5;%波包宽度和中心波数
x0=80;
time=1200;
d_t=0.2;
v(1:Np)=0;v(145:155)=0.18;%方势垒

A=diag(2i+d_t*(-2-v))+diag(d_t*ones(Np-1,1),1)+diag(d_t*ones(Np-1,1),1);

Phi0(1)=0;Phi0(Np)=0;

for x=2:Np-1
    Phi0(x)=exp(k0*1i*x)*exp(-(x-x0)^2/sigma^2)*1.35;
end

Phi(:,1)=Phi0.';

for y=2:time
    chi(:,y)=4i*(A\Phi(:,y-1));
    Phi(:,y)=chi(:,y)-Phi(:,y-1);
end

mo=moviein(time);
xx=1:Np;
for j=1:time
    yy=abs(Phi(:,j)).^2/norm(Phi(:,j)).^2;
    plot(xx,yy',xx,v);
    mo(:,j)=getframe;
end

movie(mo);