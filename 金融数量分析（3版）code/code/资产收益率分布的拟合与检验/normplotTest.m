%载入数据并计算沪深300收益率 
load TestData
%将指数价格转换为收益率
Hs300Rate=price2ret(Hs300);
figure;    % 新建图形窗口
normplot(Hs300Rate);    % 绘制正态概率图
