%三支债券的价格(必须）列向量
Price=[104.8106;99.9951;95.4384];
%表面利率都为5%
CouponRate=0.05;
%交割日为1997-1-20
Settle='20-Jan-1997';
%到期日为2002-6-15
Maturity='15-Jun-2002';
%利息分配为一年两次
Period=2;
%计息方式为（实际值／实际值）
Basis=0;
%调用bnddurp函数
[ModDuration, YearDuration, PerDuration] = bnddurp(Price,...
CouponRate, Settle, Maturity, Period, Basis)