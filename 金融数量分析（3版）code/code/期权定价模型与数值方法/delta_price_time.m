%标底资产价格
Price=60:1:100;
%执行价格
Strike=95; 
%无风险收益率（年化）
Rate=0.1;%10%
%剩余时间
Time=(1:1:12)/12;
%年化波动率
Volatility=0.5;
[Price,Time]=meshgrid(Price,Time);
[Calldelta, Putdelta] = blsdelta(Price, Strike, Rate, Time, Volatility);
%mesh(Price, Time, Calldelta);
mesh(Price, Time, Putdelta);
xlabel('Stock Price ');
ylabel('Time (year)');
zlabel('Delta');

