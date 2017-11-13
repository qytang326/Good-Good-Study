%读取数据
load HS300Data
%画两个蜡烛图，一个是2010年的，一个2010年6月的
subplot(2,1,1)
%2010年的数据，根据时间数据的年份判断
Idx2010=find(year(Date)==2010);
candle(HighPrice(Idx2010), LowPrice(Idx2010), ClosePrice(Idx2010),...
    OpenPrice(Idx2010),[],Date(Idx2010),12);%时间格式为 “月/年”
title('2010年K线')
%2010年交易量
subplot(2,1,2)
bar(Date(Idx2010),Vol(Idx2010))
dateaxis('x',12)
%设置数据使得两个子图的X轴对齐
axis([Date(Idx2010(1)), Date(Idx2010(end)), 0, max(Vol(Idx2010))])
title('2010年交易量')


