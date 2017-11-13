%定义符合变量x
syms x
%画布被分为2*2的格子，格子顺序为“从左向右，从上向下”
%画第1个子图
subplot(2,2,1)
%调用 fplot函数，
fplot('x^2',[0,1])
%画第2个子图
subplot(2,2,2)
%定义符合函数
f='abs(exp(x))'
fplot(f,[0,2*pi])
%画第3个子图
subplot(2,2,3)
fplot('sin(1./x)',[0.01,0.1],1e-3)
%画第4个子图
subplot(2,2,4)
