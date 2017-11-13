%%读取数据
load HS300Data
%计算移动平均值
wsize=20;
wts=0; 
nstd=2;
[mid, uppr, lowr] = bollinger(ClosePrice, wsize, wts, nstd);
%画图
plot(Date,ClosePrice,'k');
hold on
plot(Date(wsize:end),mid(wsize:end),'b-');
plot(Date(wsize:end),uppr(wsize:end),'r.-');
plot(Date(wsize:end),lowr(wsize:end),'r.-');
dateaxis('x',12)
%标记线型
legend('ClosePrcie','mid','uppr','lowr')
%X轴名称
xlabel('date')
%Y轴名称
ylabel('price')
%标题
title('bollinger')
