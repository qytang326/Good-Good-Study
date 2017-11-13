load funddata
daynum=length(js300)/2;
%%
%year 2007
BsPortReturn=mean(bszt(1:daynum));
BsPortRisk=std(bszt(1:daynum));
JsPortReturn=mean(js300(1:daynum));
JsPortRisk=std(js300(1:daynum));
NfPortReturn=mean(nfjy(1:daynum));
NfPortRisk=std(nfjy(1:daynum));
RiskThreshold=[0.01,0.05,0.10];
PortValue=1;
BsValueAtRisk2007 = portvrisk(BsPortReturn, BsPortRisk, RiskThreshold,PortValue)
JsValueAtRisk2007 = portvrisk(JsPortReturn, JsPortRisk, RiskThreshold,PortValue)
NfValueAtRisk2007 = portvrisk(NfPortReturn, NfPortRisk, RiskThreshold,PortValue)
%%
%year 2008
BsPortReturn=mean(bszt(daynum+1:2*daynum));
BsPortRisk=std(bszt(daynum+1:2*daynum));
JsPortReturn=mean(js300(daynum+1:2*daynum));
JsPortRisk=std(js300(daynum+1:2*daynum));
NfPortReturn=mean(nfjy(daynum+1:2*daynum));
NfPortRisk=std(nfjy(daynum+1:2*daynum));
RiskThreshold=[0.01,0.05,0.10];
PortValue=1;
BsValueAtRisk2008 = portvrisk(BsPortReturn, BsPortRisk, RiskThreshold,PortValue)
JsValueAtRisk2008 = portvrisk(JsPortReturn, JsPortRisk, RiskThreshold,PortValue)
NfValueAtRisk2008 = portvrisk(NfPortReturn, NfPortRisk, RiskThreshold,PortValue)