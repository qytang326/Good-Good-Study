%债券的价格(必须）列向量
Price=[98.04;100.05;101.3;95.6;103.6];
%表面利率列向量
CouponRate=[0.05;0.06;0.062;4.50;6.30];
%交割日为2012-5-29
Settle='2012-5-29';
%到期日为
Maturity=['2025-1-1';'2018-7-1';'2014-7-1';'2016-7-1';'2020-9-1'];
%利息分配为一年两次
Period=2;
%计息方式为（实际值／实际值）
Basis=0;
%调用bnddurp函数
[~, YearDuration, ~] = bnddurp(Price,...
CouponRate, Settle, Maturity, Period, Basis);
%调用bndconvp函数
[YearConvexity, ~] = bndconvp(Price,...
CouponRate, Settle, Maturity, Period, Basis)
%显示结果
[YearDuration,YearConvexity];
%%进行线性规划求解 
%目标函数组合凸度最小,系数为每个债券的凸度
%YearConvexity为列向量，’表示转置为行向量
f=YearConvexity';
%优化模型没有线性不等式约束
A=[];
b=[];
%优化模型等式约束，久期为4且系数和为1
%Aeq等式约束系数为YearDuration为列向量，’表示转置为行向量
%Aeq*x=beq
Aeq=[YearDuration';ones(1,5)];
beq=[4;1];
%变量上下届
lb=[0,0,0,0,0];
ub=[1,1,1,1,1];
%给定搜索初始向量
x0=[0;0;0;0;0];
%调用linprog求解线性规划 
x = linprog(f,A,b,Aeq,beq,lb,ub,x0)