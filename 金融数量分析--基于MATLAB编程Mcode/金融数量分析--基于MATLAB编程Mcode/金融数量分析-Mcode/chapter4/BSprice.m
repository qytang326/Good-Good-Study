%BSprice.m
Price=20;
Strike=20;
Rate=0.1;
Time=1;
Volatility=0.3;
[Call, Put] = blsprice(Price, Strike, Rate, Time, Volatility)