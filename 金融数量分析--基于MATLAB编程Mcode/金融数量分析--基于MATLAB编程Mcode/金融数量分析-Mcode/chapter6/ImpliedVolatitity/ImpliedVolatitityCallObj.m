function f=ImpliedVolatitityCallObj(Volatility, Price, Strike, Rate, Time, Callprice)
%ImpliedVolatitityCallObj
%code by ariszheng@gmail.com 2009-8-3
[Call,Put] = blsprice(Price, Strike, Rate, Time, Volatility);
%fc(ImpliedVolatitity)=Call-Callprice=0
f=Call-Callprice;