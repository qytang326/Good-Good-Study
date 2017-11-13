%%
%CPPI simulation
PortValue=100; %Portfoilo Value
TradeDayTimeLong=250;
TradeDayOfYear=250;
RisklessReturn=0.05;
TradeFee=0.005;
Riskmulti=[2,2.5,3,3.5,4]; 
GuarantRatio=[0.95,1.00];
adjustCycle=[1,5,10,20];
CPPITestMatrix=zeros(length(GuarantRatio)*length(Riskmulti)*length(adjustCycle),7);
%CPPIResult=[GuarantRatio,Riskmulti,adjustCycle,Return,Volatility,SumTradeFee,portFreez]
%%
num=0;
for i=1:length(GuarantRatio)
    for j=1:length(Riskmulti);
        for k=1:length(adjustCycle)
            num=num+1;
            CPPITestMatrix(num,1:3)=[GuarantRatio(i),Riskmulti(j),adjustCycle(k)];
        end
    end
end
%%
testNum=1000;
%to generate random numbe
Mean=1.2^(1/TradeDayTimeLong)-1;
Std=0.3/sqrt(TradeDayTimeLong);
Price0=100;
SDataMatrix=zeros(testNum,TradeDayTimeLong+1);
for i=1:testNum
    SData=RandnPrice(Price0,Mean,Std,TradeDayTimeLong);
    SDataMatrix(i,:)=[Price0;SData];
end

%%
%CPPI compute
SumTradeFee=zeros(testNum,1);
portFreez=zeros(testNum,1);
testReturn=zeros(testNum,1);
testVolatility=zeros(testNum,1);
for testNo=1:length(CPPITestMatrix)
    for i=1:testNum
        %CPPIResult=[GuarantRatio,Riskmulti,adjustCycle,Return,Volatility,
        %SumTradeFee]
        TRiskmulti=CPPITestMatrix(testNo,2);
        TGuarantRatio=CPPITestMatrix(testNo,1);
        TadjustCycle=CPPITestMatrix(testNo,3);
        [F,E,A,G,SumTradeFee(i),portFreez(i)]=CPPIStr(PortValue,TRiskmulti,TGuarantRatio,TradeDayTimeLong,...
            TradeDayOfYear,TadjustCycle,RisklessReturn,TradeFee,SDataMatrix(i,:));
        testReturn(i)=( A(TradeDayTimeLong+1)-A(1) )/A(1);
        testVolatility(i)=std( price2ret( A ) )*sqrt(TradeDayOfYear);
    end
    CPPITestMatrix(testNo,4)=sum(testReturn)/testNum;
    CPPITestMatrix(testNo,5)=sum(testVolatility)/testNum;
    CPPITestMatrix(testNo,6)=sum(SumTradeFee)/testNum;
    CPPITestMatrix(testNo,7)=sum(portFreez)/testNum;
end
CPPITestMatrix;