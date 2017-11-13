%载入数据并计算沪深300收益率 
load TestData
%将指数价格转换为收益率
Hs300Rate=price2ret(Hs300);
% 进行卡方拟合优度检验
[h,p,stats] = chi2gof(Hs300Rate)
