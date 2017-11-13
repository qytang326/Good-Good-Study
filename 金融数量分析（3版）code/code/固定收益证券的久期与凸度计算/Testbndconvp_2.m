%三支债券的到期收益率 
Yield=[0.04;0.05;0.06];
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
[YearConvexity, PerConvexity] = bndconvp(Yield,...
CouponRate, Settle, Maturity, Period, Basis)