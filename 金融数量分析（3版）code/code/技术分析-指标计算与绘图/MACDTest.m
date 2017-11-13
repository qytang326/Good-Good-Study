%%%读取数据
load HS300Data
%计算MACD
[macdvec, nineperma] = macd(ClosePrice);
%画图
subplot(2,1,1) %沪深300收盘价图
plot(Date,ClosePrice);
legend('ClosePrice')
dateaxis('x',12);
subplot(2,1,2);%沪深300MACD指标
plot(Date,macdvec,'r');
hold on
plot(Date,nineperma,'b--');
legend('Macdvec','Nineperma')
dateaxis('x',12);
