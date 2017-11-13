%载入数据
load funddata
%funddata的数据序列
%'Hs300','博时主题','嘉实300','南方绩优'
%将资产价格转换为资产收益率
Rate=price2ret(funddata);
js300=Rate(:,3);
bszt=Rate(:,2);
nfjy=Rate(:,4);
%每年交易日数量，
%若一共488个数据，假设前244个为2007年数据，后244为2008年数据
daynum=fix(length(Rate)/2);
%计算2007 组合的Var值
%计算组合日均收益期望
BsPortReturn=mean(bszt(1:daynum));
%计算组合日收益序列的标准差
BsPortRisk=std(bszt(1:daynum));
JsPortReturn=mean(js300(1:daynum));
JsPortRisk=std(js300(1:daynum));
NfPortReturn=mean(nfjy(1:daynum));
NfPortRisk=std(nfjy(1:daynum));
%置信水平99%，95%，90%
RiskThreshold=[0.01,0.05,0.10];
%资产价值为1.00，结果为Var比例值
PortValue=1;
BsValueAtRisk2007 = portvrisk(BsPortReturn, BsPortRisk, RiskThreshold,PortValue)
JsValueAtRisk2007 = portvrisk(JsPortReturn, JsPortRisk, RiskThreshold,PortValue)
NfValueAtRisk2007 = portvrisk(NfPortReturn, NfPortRisk, RiskThreshold,PortValue)
%%
%计算2008Var值
%计算日均收益期望、日收益率的标准差
BsPortReturn=mean(bszt(daynum+1:2*daynum));
BsPortRisk=std(bszt(daynum+1:2*daynum));
JsPortReturn=mean(js300(daynum+1:2*daynum));
JsPortRisk=std(js300(daynum+1:2*daynum));
NfPortReturn=mean(nfjy(daynum+1:2*daynum));
NfPortRisk=std(nfjy(daynum+1:2*daynum));
%置信水平99%，95%，90%
RiskThreshold=[0.01,0.05,0.10];
%资产价值为1.00，结果为Var比例值
PortValue=1;
BsValueAtRisk2008 = portvrisk(BsPortReturn, BsPortRisk, RiskThreshold,PortValue)
JsValueAtRisk2008 = portvrisk(JsPortReturn, JsPortRisk, RiskThreshold,PortValue)
NfValueAtRisk2008 = portvrisk(NfPortReturn, NfPortRisk, RiskThreshold,PortValue)
