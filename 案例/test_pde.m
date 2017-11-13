%(1)问题定义 
g='circleg';        %单位圆 
b='circleb1';       %边界上为零条件 
c=1;a=0;f=1; 
%（2）产生初始的三角形网格 
[p,e,t]=initmesh(g);  
%（3）迭代直至得到误差允许范围内的合格解 
error=[]; err=1; 
while err > 0.01, 
[p,e,t]=refinemesh(g,p,e,t); 
u=assempde(b,p,e,t,c,a,f);  %求得数值解 
exact=(1-p(1,:).^2-p(2,:).^2)/4; 
err=norm(u-exact',inf); 
error=[error err]; 
end 
%结果显示 
subplot(2,2,1),pdemesh(p,e,t); 
subplot(2,2,2),pdesurf(p,t,u) 
subplot(2,2,3),pdesurf(p,t,u-exact')