%标底资产价格
Price=100;
%执行价格
Strike=95; 
%无风险收益率（年化）
Rate=0.1;%10%
%剩余时间
Time=1;%;
%看涨期权市价10元 
Value=15;
%看涨期权 
Volatility = blsimpv(Price, Strike, Rate, Time, Value)