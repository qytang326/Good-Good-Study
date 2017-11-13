%载入数据并计算沪深300收益率 
load TestData
%将指数价格转换为收益率
Hs300Rate=price2ret(Hs300);
% 调用jbtest函数进行Jarque-Bera检验
[h,p,jbstat,critval] = jbtest(Hs300Rate)
