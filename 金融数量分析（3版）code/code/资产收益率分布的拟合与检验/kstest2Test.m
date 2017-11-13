%载入数据并计算沪深300收益率 
load TestData
%计算2007年沪深300指数的收益率数据
%日期年份为2007的数据
Idx2007=find(year(Date)==2007);
IndexPrice2007=Hs300(Idx2007);
%将价格序列转换为收益率序列
IndexRate2007=price2ret(IndexPrice2007);
%计算2008年沪深300指数的收益率数据
%日期年份为2008的数据
Idx2008=find(year(Date)==2008);
IndexPrice2008=Hs300(Idx2008);
%将价格序列转换为收益率序列
IndexRate2008=price2ret(IndexPrice2008);
% 调用kstest2函数检验两个班的总成绩是否服从相同的分布
[h,p,ks2stat] = kstest2(IndexRate2007,IndexRate2008)

figure;    % 新建图形窗口
% 绘制2007年收益序列经验分布函数图
F1 = cdfplot(IndexRate2007);
% 设置线宽为2，颜色为红色
set(F1,'LineWidth',2,'Color','r')
hold on
% 绘制2008年收益序列经验分布函数图
F2 = cdfplot(IndexRate2008);
% 设置线型为点划线，线宽为2，颜色为黑色
set(F2,'LineStyle','-.','LineWidth',2,'Color','k')
% 为图形加标注框，标注框的位置在坐标系的左上角
legend('2007年','2008年',...
          'Location','NorthWest')
