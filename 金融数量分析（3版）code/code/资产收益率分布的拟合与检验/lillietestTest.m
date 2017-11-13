%载入数据并计算沪深300收益率 
load TestData
%将指数价格转换为收益率
Hs300Rate=price2ret(Hs300);
% 调用lillietest函数进行Lilliefors检验，检验总成绩数据是否服从正态分布
[h,p,kstat,critval] = lillietest(Hs300Rate)

