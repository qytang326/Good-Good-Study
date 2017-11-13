%标底资产价格
Price=100;
%执行价格
Strike=95; 
%无风险收益率（年化）
Rate=0.1;%10%
%剩余时间
Time=3/12;%=0.25;
%年化波动率
Volatility=0.1:0.01:0.5;
N=length(Volatility)
Call=zeros(1,N);
Put=zeros(1,N);
for i=1:N
    [Call(i), Put(i)] = blsprice(Price, Strike, Rate, Time, Volatility(i)); 
end
plot(Call,'b--');
hold on
plot(Put,'b');
xlabel('Volatility')
ylabel('price')
legend('Call','Put')