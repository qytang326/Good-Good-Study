%标底资产价格
Price=100;
%执行价格
Strike=95; 
%无风险收益率（年化）
Rate=0.1;%10%
%剩余时间
Time=6/12;%;
%看涨期权 
flag=1;
%每阶段间个1个月
Increment=1/12;
%波动率 
Volatility=0.5;
[AssetPrice, OptionValue] = binprice(Price, Strike, Rate, Time, Increment, Volatility, flag)