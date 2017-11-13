%RandnPriceWithCovTest
Price0=[10,10];
%假设预期年收益率为10%，5%
%每年250个交易日，预期日收益率为mu
mu=[1.1^(1/250)-1,1.05^(1/250)-1];
%收益率的协方差矩阵
%假设预期年波动率为30% 5%
%每年250个交易日，预期日波动率为sigma
%相关系数为-0.05
Tcov=0.3*0.05*(-0.05);
sigma = [0.3^2 Tcov;Tcov  0.05^2]/250; 
%为了2年随机价格
N=2*250;

Price=RandnPriceWithCov(Price0,mu,sigma,N);

plot(Price(:,1),'-.');
hold on
plot(Price(:,2),'-');
xlabel('time')
ylabel('price')
legend('Price1','Price2')