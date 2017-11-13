%%
%set value
PortValue=100; %Portfoilo Value
Riskmulti=2;   
GuarantRatio=1.00;
TradeDayTimeLong=250;
TradeDayOfYear=250;
adjustCycle=10;
RisklessReturn=0.05;
TradeFee=0.005;
%%
%to generate Browm random number
Mean=0.2/TradeDayOfYear;
Std=0.3/sqrt(TradeDayOfYear);
SData=BrownM(TradeDayOfYear,Mean,Std,1);

%%
%to computer
[F,E,A,G,SumTradeFee,portFreez]=CPPIStr(PortValue,Riskmulti,GuarantRatio,...
    TradeDayTimeLong,TradeDayOfYear,adjustCycle,RisklessReturn,TradeFee,SData);
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
SumTradeFee   
    
    
    
    