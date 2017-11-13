%RandnPriceTest
Price0=10;
%假设预期年收益率为10%
%每年250个交易日，预期日收益率为mu
mu=1.1^(1/250)-1;
%假设预期年波动率为30%
%每年250个交易日，预期日波动率为sigma
sigma=.30/sqrt(250)
%为了2年随机价格
N=250*2;
Price=RandnPrice(Price0,mu,sigma,N)

plot(Price(:,1))
xlabel('time')
ylabel('price')