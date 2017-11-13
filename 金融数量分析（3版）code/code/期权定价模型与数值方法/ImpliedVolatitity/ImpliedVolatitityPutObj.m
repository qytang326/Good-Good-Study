function f=ImpliedVolatitityPutObj(Volatility, Price, Strike, Rate, Time, Putprice)
%ImpliedVolatitityCallObj
%code by ariszheng@gmail.com 2009-8-3
[Call,Put] = blsprice(Price, Strike, Rate, Time, Volatility);
%fp(ImpliedVolatitity)=Put-Putprice=0
f=Put-Putprice;