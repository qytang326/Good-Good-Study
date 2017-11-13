%一个例子

%提取Microsoft Corporation数据,  其代码MSFT，可以在finance.yahoo.com找到
[DateV,PriceV]=YahooData('000001.ss', '01/01/2000', '10/31/2015', 'd');
%画图
%Dates= datestr(DateV);
plot(DateV,PriceV);