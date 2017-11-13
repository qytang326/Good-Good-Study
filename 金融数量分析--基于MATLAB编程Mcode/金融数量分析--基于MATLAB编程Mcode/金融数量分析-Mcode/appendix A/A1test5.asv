%%
F=@(x)1./(x.^3-2*x-5);
Q=quad(F,0,2)
%%
F=@(x,y)y*sin(x)+x*cos(y);
Q=dblquad(F,pi,2*pi,0,pi)
%%
syms x y %中间为空格，不能为逗号
s=int(int('x*y','x',0,1),'y',1,2)% 引号可省略
%%
a=[1 2 3 3 3 7 8 9];
b=diff(a) %一次微分
%%
a=[1 2 3 3 3 7 8 9];
bb=diff(a,2) %二次微分
%%
syms x t a
f =cos(a*x)
df =diff(f) % 由findsym的规则，隐式的指定对x进行微分
dfa=diff(f,'a') %指定对变量a进行微分
dfa=diff(f,'a',3) %三次微分
%%
syms a x
A=[cos(a*x),sin(a*x),-sin(a*x),cos(a*x)];
dA=diff(A)


