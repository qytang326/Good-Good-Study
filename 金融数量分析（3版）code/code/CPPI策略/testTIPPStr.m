%%
%to generate random number
Mean=1.2^(1/TradeDayOfYear)-1;
Std=0.3/sqrt(TradeDayOfYear);
Price0=100;
SData=RandnPrice(Price0,Mean,Std,TradeDayOfYear);
SData=[Price0;SData];
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
xlabel('t');
ylabel('price')
subplot(2,1,2)
plot(A,'-.')  
hold on
plot(E,'--')
plot(F,'-k')  
plot(G,'-x')
legend('PortValue','RiskAssect','GuarantLine','RisklessAssect')
xlabel('t');
ylabel('price')
R=( A(TradeDayTimeLong+1)-A(1))/A(1);
GuarantRatio;
SumTradeFee;   
    
    
    
    