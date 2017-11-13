%读取沪深300数据
load Hs300
Date=Hs300.Date;
IndexPrice=Hs300.Price;
%进行数据选取
%AIndex标记数据中年份大于2005的数据
%year(Date)返回数据的年份
AIndex=find(year(Date)>2005);
%AIndex标记数据中年份小于2008的数据
BIndex=find(year(Date)<2008);
%交集 2006-2007
CIndex=intersect(AIndex,BIndex);
%根据标识筛选出2006-2007的数据
Date2006_2007=Date(CIndex);
Price2006_2007=IndexPrice(CIndex);
subplot(3,1,1)
plot(Date2006_2007,Price2006_2007)
subplot(3,1,2)
xlabel('date')
plot(Date2006_2007,Price2006_2007)
%将坐标轴时间化
dateaxis('x', 6)
xlabel('date')
subplot(3,1,3)
plot(Date2006_2007,Price2006_2007)
%将坐标轴时间化
dateaxis('x', 10)
xlabel('date')

