function [Vc,Vp,Cfval,Pfval]=ImpliedVolatility(Price,Strike,Rate,Time,CallPrice,PutPrice)
%ImpliedVolatility
%code by ariszheng@gmail.com 2009-8-3
%优化算法初始迭代点;
Volatility0=1.0;
%CallPrice对应的隐含波动率
[Vc,Cfval] =fsolve(@(Volatility) ImpliedVolatitityCallObj(Volatility, Price, Strike,...
    Rate, Time, CallPrice),Volatility0);
%CallPrice对应的隐含波动率
[Vp,Pfval] =fsolve(@(Volatility) ImpliedVolatitityPutObj(Volatility, Price, Strike, ...
    Rate, Time, PutPrice),Volatility0);


