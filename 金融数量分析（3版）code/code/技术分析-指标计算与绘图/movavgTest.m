%%读取数据
load HS300Data
%计算移动平均值
Lead=3;
lag=20;
Alpha=0;
[Short, Long] = movavg(ClosePrice, Lead, lag, Alpha);
%画图
plot(Date,ClosePrice);
hold on
plot(Date(Lead:end),Short(Lead:end),'r--');
plot(Date(lag:end),Long(lag:end),'b.-');
dateaxis('x',12)
%标记线型
legend('ClosePrcie','ShortMovavg','LongMovavg')
%X轴名称
xlabel('date')
%Y轴名称
ylabel('price')
%标题
title('Movavg')
