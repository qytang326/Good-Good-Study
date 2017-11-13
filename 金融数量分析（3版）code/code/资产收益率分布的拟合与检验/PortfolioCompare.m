%载入数据并计算沪深300收益率 
load TestData
%将指数价格转换为收益率
figure;    % 新建图形窗口
%2007年的比较图
idx2007=find(year(Date)==2007)
Hs300Rate1=price2ret(Hs300(idx2007));
BSZTRate1=price2ret(BSZT(idx2007));
subplot(2,1,1)
% 沪深300收益序列经验分布函数图
F1 = cdfplot(Hs300Rate1);
% 设置线宽为2，颜色为红色
set(F1,'LineWidth',2,'Color','r')
hold on
% 博时主题收益序列经验分布函数图
F2 = cdfplot(BSZTRate1);
% 设置线型为点划线，线宽为2，颜色为黑色
set(F2,'LineStyle','-.','LineWidth',2,'Color','k')
% 为图形加标注框，标注框的位置在坐标系的左上角
legend('沪深300','博时主题',...
          'Location','NorthWest')
title('2007年')
%%
idx2008=find(year(Date)==2008)
Hs300Rate2=price2ret(Hs300(idx2008));
BSZTRate2=price2ret(BSZT(idx2008));
subplot(2,1,2)
% 沪深300收益序列经验分布函数图
F1 = cdfplot(Hs300Rate2);
% 设置线宽为2，颜色为红色
set(F1,'LineWidth',2,'Color','r')
hold on
% 博时主题收益序列经验分布函数图
F2 = cdfplot(BSZTRate2);
% 设置线型为点划线，线宽为2，颜色为黑色
set(F2,'LineStyle','-.','LineWidth',2,'Color','k')
% 为图形加标注框，标注框的位置在坐标系的左上角
legend('沪深300','博时主题',...
          'Location','NorthWest')
title('2008年')