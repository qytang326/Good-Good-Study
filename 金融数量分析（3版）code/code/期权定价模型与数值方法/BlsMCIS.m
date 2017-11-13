function [Price,VarPrice,CI] = BlsMCIS(S0,K,r,T,sigma,NRepl)
%设置随机数状态
randn('state',0);
%生成布朗运动路径
nuT = (r - 0.5*sigma^2)*T;
siT = sigma * sqrt(T);
ISnuT = log(K/S0) - 0.5*sigma^2*T;
%生成服从N（0，1）的随机数
Veps = randn(NRepl,1);
VY = ISnuT + siT*Veps;
ISRatios = exp( (2*(nuT - ISnuT)*VY - nuT^2 + ISnuT^2)/2/siT^2);
%收益率计算
DiscPayoff = exp(-r*T)*max(0, (S0*exp(VY)-K));
%用正态分布函数normfit对模拟结果进行拟合
[Price, VarPrice, CI] = normfit(DiscPayoff.*ISRatios);
