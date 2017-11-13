%读取数据
load HS300Data
%画两个蜡烛图，一个是2010年的，一个2010年6月的
subplot(2,1,1)
%2010年的数据，根据时间数据的年份判断
Idx2010=find(year(Date)==2010);
candle(HighPrice(Idx2010), LowPrice(Idx2010), ClosePrice(Idx2010),...
    OpenPrice(Idx2010),[],Date(Idx2010),12);%时间格式为 “月/年”
title('2010年K线')
%2010年6月的K线
subplot(2,1,2)
%在2010年的时间数据中选取月份为6的数据
Idx=find(month(Date(Idx2010))==6);
Idx2010_06=Idx2010(Idx);
candle(HighPrice(Idx2010_06), LowPrice(Idx2010_06), ClosePrice(Idx2010_06),...
    OpenPrice(Idx2010_06),[],Date(Idx2010_06),12);%时间格式为 “月/年”
title('2010年6月K线')
