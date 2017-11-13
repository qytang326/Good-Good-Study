%载入数据并计算沪深300收益率 
load TestData
%将指数价格转换为收益率
Hs300Rate=price2ret(Hs300);
%计算均值
m=mean(Hs300Rate);
%计算方差
s=std(Hs300Rate);
% 生成cdf矩阵，用来指定分布：均值为m，标准差为s的正态分布
cdf = [Hs300Rate, normcdf(Hs300Rate, m, s)];
% 调用kstest函数，检验总成绩是否服从由cdf指定的分布
[h,p,ksstat,cv] = kstest(Hs300Rate,cdf)
