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
%to generate random number
Mean=1.2^(1/TradeDayOfYear)-1;
Std=0.3/sqrt(TradeDayOfYear);
Price0=100;
SData=RandnPrice(Price0,Mean,Std,TradeDayOfYear);
SData=[Price0;SData];
%%
%to computer
[F,E,A,G,SumTradeFee,portFreez]=CPPIStr(PortValue,Riskmulti,GuarantRatio,...
    TradeDayTimeLong,TradeDayOfYear,adjustCycle,RisklessReturn,TradeFee,SData);
%%
%to plot
figure;
subplot(2,1,1)
plot(SData)
xlabel('t');
ylabel('price')
legend('Hs300-Simulation')
subplot(2,1,2)
plot(A,'-.')  
hold on
plot(E,'--')
plot(F,'-k')  
plot(G,'-x')
legend('PortValue','RiskAssect','GuarantLine','RisklessAssect')
xlabel('t');
ylabel('price')
SumTradeFee;   
    
    
    
    