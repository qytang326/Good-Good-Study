Compounding = 1;%连续计息规范 
ValuationDate = '01-01-2000';%估值日期
StartDate = ['01-01-2000'; '01-01-2001'; '01-01-2002'; '01-01-2003'...
    ; '01-01-2004'];%开始日期
EndDates = ['01-01-2001'; '01-01-2002'; '01-01-2003'; '01-01-2004'; ...
    '01-01-2005'];%结束日期
Rates = [.1; .11; .12; .125; .13];%远期利率说明
Volatility = [.2; .19; .18; .17; .16];%波动率说明
CurveTerm = [1; 2; 3; 4; 5]; %?ú??????
%利用hjmvolspec函数创建波动率结构说明
HJMVolSpec = hjmvolspec('Stationary', Volatility , CurveTerm);
%创建利率期限结构说明
RateSpec = intenvset('Compounding', Compounding,...
           'ValuationDate', ValuationDate,...
           'StartDates', StartDate,...
           'EndDates', EndDates,...
           'Rates', Rates);
%创建时间结构说明
HJMTimeSpec = hjmtimespec(ValuationDate, EndDates, Compounding);
%生成HJM模型二叉树
HJMTree = hjmtree(HJMVolSpec, RateSpec, HJMTimeSpec);
treeviewer(HJMTree)
