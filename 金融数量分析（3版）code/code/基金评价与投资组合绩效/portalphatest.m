
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
Cash=(1+0.03)^(1/daynum)-1;
%日收益率序列，假设每日都一样，标准可以使用
%shibor每日利率，债券回购利率
Cash=Cash*ones(daynum,1);
%开始计算,采用'capm'模型,'daynum*'将alpha年华
RatioJS2007 = daynum*portalpha(js300(1:daynum), hs300(1:daynum),Cash,'capm')
RatioJS2008 = daynum*portalpha(js300(daynum+1:2*daynum),hs300(daynum+1:2*daynum), Cash,'capm')
%%
RatioBS2007 = daynum*portalpha(bszt(1:daynum), hs300(1:daynum),Cash,'capm')
RatioBS2008 = daynum*portalpha(bszt(daynum+1:2*daynum),hs300(daynum+1:2*daynum), Cash,'capm')
%%
RatioNF2007 = daynum*portalpha(nfjy(1:daynum), hs300(1:daynum),Cash,'capm')
RatioNF2008 = daynum*portalpha(nfjy(daynum+1:2*daynum), hs300(daynum+1:2*daynum),Cash,'capm')
