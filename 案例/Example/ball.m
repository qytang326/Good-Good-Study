function ball(v0)

conv=pi/180;
grav=-9.82;
range=zeros(1,91); 

for ii=1:91
    theta=ii-1;
    vx0=v0*cos(theta*conv);
    vy0=v0*sin(theta*conv);
    max_time=-2*vy0/grav;
    range(ii)=vx0*max_time;
end

fprintf('Range versus angle theta''\n');
for ii=1:5:91
    theta=ii;
    fprintf('%2d %8.4f\n',theta,range(ii));
end

[maxrange index]=max(range);
maxangle=index-1;
fprintf('\n Max range is %8.4f at %2d degress.\n',maxrange,maxangle);

for ii=5:10:80
    theta=ii;
    vx0=v0*cos(theta*conv);
    vy0=v0*sin(theta*conv);
    max_time=-2*vy0/grav;
    
    x=zeros(1,21);
    y=zeros(1,21);
    
    for jj=1:21
        time=(jj-1)*max_time/20;
        x(jj)=vx0*time;
        y(jj)=vy0*time+0.5*grav*time.^2;
    end
    
    plot(x,y,'g');
    if ii==5
        hold on
    end
end

title('\bf Trajectory of Ball vs Initial Angle \theta');
xlabel('\bf\itx \rm\bf(meters)');
ylabel('\bf\ity \rm\bf(meters)');
axis([0 max(range)+5 0 -v0^2/2/grav]);
grid on;

vx0=v0*cos(maxangle*conv);
vy0=v0*sin(maxangle*conv);
max_time=-2*vy0/grav;

x=zeros(1,21);
y=zeros(1,21);
    
for jj=1:21
   time=(jj-1)*max_time/20;
   x(jj)=vx0*time;
   y(jj)=vy0*time+0.5*grav*time.^2;
end

comet(x,y,0.01)%,'color',[0.1 0.5 0.5],'Linewidth',2);
hold off









