%载入数据并计算沪深300收益率 
load TestData
%将指数价格转换为收益率
Hs300Rate=price2ret(Hs300);
figure;    % 新建图形窗口
[f, xc] = ecdf(Hs300Rate);   % 调用ecdf函数计算xc处的经验分布函数值f
ecdfhist(f, xc, 20);    % 绘制频率直方图
xlabel('沪深300收益率');  % 为X轴加标签
ylabel('f(x)');  % 为Y轴加标签
% 产生一个新的横坐标向量x
x = -0.1:0.001:0.1; 
% 计算均值为stats.mean，标准差为stats.std的正态分布在向量x处的密度函数值
y = normpdf(x,stats.mean,stats.std);
hold on
plot(x,y,'k','LineWidth',2) % 绘制正态分布的密度函数曲线，并设置线条为黑色实线，线宽为2
% 添加标注框，并设置标注框的位置在图形窗口的左上角
legend('频率直方图','正态分布密度曲线','Location','NorthWest');
