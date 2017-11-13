%载入数据并计算沪深300收益率 
load TestData
Hs300Rate=price2ret(Hs300);
figure;    % 新建图形窗口
% 绘制经验分布函数图，并返回图形句柄h和结构体变量stats，
% 结构体变量stats有5个字段，分别对应最小值、最大值、平均值、中位数和标准差
[h,stats] = cdfplot(Hs300Rate)
% 设置线条颜色为黑色，线宽为2
set(h,'color','k','LineWidth',2);  
% 产生一个新的横坐标向量x  
x = -0.1:0.001:0.1;    
% 计算均值为stats.mean，标准差为stats.std的正态分布在向量x处的分布函数值
y = normcdf(x,stats.mean,stats.std);
hold on
% 绘制正态分布的分布函数曲线，并设置线条为品红色虚线，线宽为2
plot(x,y,':m','LineWidth',2);
% 添加标注框，并设置标注框的位置在图形窗口的左上角
legend('经验分布函数','理论正态分布','Location','NorthWest');
