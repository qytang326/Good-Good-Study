function [F,E,A,G,GuarantRatio,SumTradeFee,portFreez]=TIPPStr(PortValue,Riskmulti,GuarantRatio,GuarantRatioMark,...
    GuarantRatioAdjust,TradeDayTimeLong,TradeDayOfYear,adjustCycle,RisklessReturn,TradeFee,SData)
%code by ariszheng@gmail.com
%2009-6-30
%intput:
%PortValue,Riskmulti,GuarantRatio,GuarantRatioMark,GuarantRatioAdjust,Trade
%DayTimeLong,TradeDayOfYear,adjustCycle,RisklessReturn,TradeFee
%e.g GuarantRatio=100%,GuarantRatioMark=5%,GuarantRatioAdjust=3%
%if return more than GuarantRatioMark,GuarantRatio=GuarantRatio+GuarantRatioAdjust
%SData is simulation index data
%output
%F,E,A,G,SumTradeFee
%SumTradeFee
%portFreez default is 0,  if portFreez=1, portfolio freez  there would have no risk--investment
%%
SumTradeFee=0;
F=zeros(1,TradeDayTimeLong+1);
E=zeros(1,TradeDayTimeLong+1);
A=zeros(1,TradeDayTimeLong+1);
G=zeros(1,TradeDayTimeLong+1);
A(1)=PortValue;
F(1)=GuarantRatio*PortValue*exp(-RisklessReturn*TradeDayTimeLong/TradeDayOfYear);
E(1)=max(0,Riskmulti*(A(1)-F(1)));
G(1)=A(1)-E(1);
%%
portFreez=0; %if portFreez=1, portfolio freez  there would have no risk--investment
GuarantRatioMarklevel=1;
%%
for i=2:TradeDayTimeLong+1
    E(i)=E(i-1)*(1+(SData(i)-SData(i-1))/(1+SData(i-1)));
    G(i)=G(i-1)*(1+RisklessReturn/TradeDayOfYear);
    A(i)=E(i)+G(i);
    F(i)=GuarantRatio*PortValue*exp(-RisklessReturn*(TradeDayTimeLong-i+1)/TradeDayOfYear);
    
    if mod(i,adjustCycle)==0
        if ( A(i)/A(1) ) > (1+GuarantRatioMarklevel*GuarantRatioMark)
            GuarantRatio=GuarantRatio+GuarantRatioAdjust;
            GuarantRatioMarklevel=GuarantRatioMarklevel+1;
        end
        F(i)=GuarantRatio*PortValue*exp(-RisklessReturn*(TradeDayTimeLong-i+1)/TradeDayOfYear);
        temp=E(i);
        E(i)=max(0, Riskmulti*(A(i)-F(i)) );
        SumTradeFee=SumTradeFee + TradeFee*abs(E(i)-temp);
        G(i)=A(i)-E(i)-TradeFee*abs(E(i)-temp);
    end
    
    if E(i)==0
        A(i)=G(i);
        portFreez=1;
    end    
end
 
    
    
    