
figure;    % 新建图形窗口
% 箱线图的标签
boxlabel = {'沪深300指数'};    
% 绘制带有刻槽的水平箱线图
boxplot(Hs300Rate,boxlabel,'notch','on','orientation','horizontal')
% 为X轴加标签
xlabel('收益率'); 
