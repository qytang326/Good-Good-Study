%载入 
load funddata
%数据列顺序为'Hs300','博时主题','嘉实300','南方绩优'
%生成一个空白图
figure;
%在一个页面上画多个曲线，hold on
hold on
%funddata（:,1）/funddata(1,1)使得四条线的起点对齐
%'-.'，'o'，'--'为各种线条样式
plot(funddata(:,1)/funddata(1,1),'k')
plot(funddata(:,2)/funddata(1,2),'r-.')
plot(funddata(:,3)/funddata(1,3),'bo')
plot(funddata(:,4)/funddata(1,4),'g--')
%X坐标轴为时间
xlabel('time')
%Y坐标轴为价格
ylabel('price')
%线标记
legend('沪深300','博时主题','嘉实300','南方绩优')
