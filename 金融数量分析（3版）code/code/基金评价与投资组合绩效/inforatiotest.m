
%载入数据
load funddata
%funddata的数据序列
%'Hs300','博时主题','嘉实300','南方绩优'
Rate=price2ret(funddata);
hs300=Rate(:,1);
js300=Rate(:,3);
bszt=Rate(:,2);
nfjy=Rate(:,4);
%每年交易日数量，
%若一共488个数据，假设前244个为2007年数据，后244为2008年数据
%分别计算每年的sharp比率
daynum=fix(length(Rate)/2);
%无风险年华收益率为3%，将起日化
RatioJS2007 = inforatio(js300(1:daynum),hs300(1:daynum))
RatioJS2008 = inforatio(js300(daynum+1:2*daynum), hs300(daynum+1:2*daynum))
%%
RatioBS2007 = inforatio(bszt(1:daynum), hs300(1:daynum))
RatioBS2008 = inforatio(bszt(daynum+1:2*daynum), hs300(daynum+1:2*daynum))
%%
RatioNF2007 = inforatio(nfjy(1:daynum),hs300(1:daynum))
RatioNF2008 = inforatio(nfjy(daynum+1:2*daynum), hs300(daynum+1:2*daynum))