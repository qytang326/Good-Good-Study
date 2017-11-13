%TestImpliedVolatility
Price=100;
Strike=95;
Rate=0.10;
Time=1.0;
CallPrice=15.0;
PutPrice=7.0;
[Vc,Vp,Cfval,Pfval]=ImpliedVolatility(Price,Strike,Rate,Time,CallPrice,PutPrice)