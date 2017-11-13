
%载入数据
load funddata
%funddata的数据序列
%'Hs300','博时主题','嘉实300','南方绩优'
Rate=price2ret(funddata);
hs300=Rate(:,1);
js300=Rate(:,3);
%每年交易日数量，
%若一共488个数据，假设前244个为2007年数据，后244为2008年数据
%分别计算每年的sharp比率
daynum=fix(length(Rate)/2);
%无风险年华收益率为1.98%，将起日化
Cash=(1+0.0198)^(1/daynum)-1;
%日收益率序列，假设每日都一样，标准可以使用
%shibor每日利率，债券回购利率
%业绩基准95%的沪深300+5%的同业存款利率
benchmark=0.95*hs300+0.05*Cash;
[RatioJS2007,TEJS2007] = inforatio(js300(1:daynum),benchmark(1:daynum))
[RatioJS2008,TEJS2008] = inforatio(js300(daynum+1:2*daynum), benchmark(daynum+1:2*daynum))