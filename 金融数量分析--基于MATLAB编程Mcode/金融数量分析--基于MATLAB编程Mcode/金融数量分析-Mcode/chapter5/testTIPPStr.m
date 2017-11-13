%%
%to generate Browm random number
LengthOfDay=250;
testNum=100;
Mean=0.2/LengthOfDay;
Std=0.3/sqrt(LengthOfDay);
SData=BrownM(LengthOfDay,Mean,Std,1);
%%
%set value
PortValue=100; %Portfoilo Value
Riskmulti=2;   
GuarantRatio=1.00;
GuarantRatioMark=0.05;
GuarantRatioAdjust=0.03;
TradeDayTimeLong=250;
TradeDayOfYear=250;
adjustCycle=10;
RisklessReturn=0.05;
TradeFee=0.005;
%%
%to computer
[F,E,A,G,GuarantRatio,SumTradeFee,portFreez]=TIPPStr(PortValue,Riskmulti,GuarantRatio,GuarantRatioMark,...
    GuarantRatioAdjust,TradeDayTimeLong,TradeDayOfYear,adjustCycle,RisklessReturn,TradeFee,SData);
%%
%to plot
figure;
subplot(2,1,1)
plot(SData)
legend('Hs300-Simulation')
subplot(2,1,2)
plot(A,'-*')  
hold on
plot(E,'-o')
plot(F,'-k')  
plot(G,'-x')
legend('PortValue','RiskAssect','GuarantLine','RisklessAssect')
R=( A(TradeDayTimeLong+1)-A(1))/A(1)
GuarantRatio
SumTradeFee   
    
    
    
    