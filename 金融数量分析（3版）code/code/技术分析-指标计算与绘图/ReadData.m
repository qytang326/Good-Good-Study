%读取数据
filename='HS300.xls';
[num,txt,raw] = xlsread(filename);
%txt的第一列为日期数据
Date=datenum(txt(4:length(txt),1));
%num列依次为{'开盘价','最高价','最低价','收盘价','成交量';}
OpenPrice=num(:,1);
HighPrice=num(:,2);
LowPrice=num(:,3);
ClosePrice=num(:,4);
Vol=num(:,5);
%存储数据在HS300Data文件中
save HS300Data Date OpenPrice HighPrice LowPrice ClosePrice Vol