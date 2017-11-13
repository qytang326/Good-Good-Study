%读取数据并存储数据
filename='funddata.xls'
%num为数值格式的净值
%txt为字符格式
[num,txt,raw] = xlsread(filename);
Date=datenum(txt(4:491,1));
%Hs300指数为第一列
Hs300=num(:,1);
%博时主题为第二列
BSZT=num(:,2);
%将沪深300指数、博时主题净值（复权）、
%日期数据存储在TestData中
save TestData Hs300 BSZT Date
%画图
subplot(2,1,1)
plot(Date,Hs300,'k');
%将时间轴的 数值日期转变为 月/年 格式
dateaxis('x',2)
legend('沪深300')
subplot(2,1,2)
plot(Date,BSZT,'b--');
%将时间轴的 数值日期转变为 月/年 格式
dateaxis('x',2)
legend('博时主题')

%载入数据并计算沪深300收益率 
load TestData
figure %画图
plot(Date,Hs300/Hs300(1),'k',Date,BSZT/BSZT(1),'b--');
%将时间轴的 数值日期转变为 年 格式
dateaxis('x')
%标记
legend('沪深300','博时主题')
xlabel('date')
ylabel('price')
