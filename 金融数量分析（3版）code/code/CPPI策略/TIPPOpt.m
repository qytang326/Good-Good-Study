%%
%TIPP simulation
PortValue=100; %Portfoilo Value
TradeDayTimeLong=250;
TradeDayOfYear=250;
RisklessReturn=0.05;
TradeFee=0.005;
Riskmulti=[2,2.5,3,3.5,4]; 
GuarantRatio=[0.95,1.00];
adjustCycle=[1,5,10,20];
GuarantRatioMark=[0.03,0.05];
GuarantRatioAdjust=[0.02,0.03];
TIPPTestMatrix=zeros(length(GuarantRatioMark)*length(GuarantRatio)*length(Riskmulti)...
    *length(adjustCycle),9);
%CPPIResult=[GuarantRatio,GuarantRatioMark,GuarantRatioAdjust,Riskmulti,adjustCycle,Return,
%Volatility,SumTradeFee,portFreez]
%%
num=0;
for i=1:length(GuarantRatio)
    for j=1:length(Riskmulti);
        for k=1:length(adjustCycle)
            for l=1:length(GuarantRatioMark)
            num=num+1;
            TIPPTestMatrix(num,[1,4,5])=[GuarantRatio(i),Riskmulti(j),adjustCycle(k)];
            TIPPTestMatrix(num,[2,3])=[GuarantRatioMark(l),GuarantRatioAdjust(l)];
            end
        end
    end
 end
%%
testNum=1000;
%to generate random number
Mean=1.2^(1/TradeDayTimeLong)-1;
Std=0.3/sqrt(TradeDayTimeLong);
Price0=100;
SDataMatrix=zeros(testNum,TradeDayTimeLong+1);
for i=1:testNum
    SData=RandnPrice(Price0,Mean,Std,TradeDayTimeLong)
    SDataMatrix(i,:)=[Price0;SData];
end

%%
%TIPP compute
SumTradeFee=zeros(testNum,1);
portFreez=zeros(testNum,1);
testReturn=zeros(testNum,1);
testVolatility=zeros(testNum,1);
for testNo=1:length(TIPPTestMatrix)
    for i=1:testNum
        %TIPPResult=[GuarantRatio,GuarantRatioMark,GuarantRatioAdjust,Riskmulti,adjustCycle,Return,
        %Volatility,SumTradeFee,portFreez]
        TRiskmulti=TIPPTestMatrix(testNo,4);
        TGuarantRatio=TIPPTestMatrix(testNo,1);
        TadjustCycle=TIPPTestMatrix(testNo,5);
        TGuarantRatioMark=TIPPTestMatrix(testNo,2);
        TGuarantRatioAdjust=TIPPTestMatrix(testNo,3);
         [F,E,A,G,GuarantRatio,SumTradeFee(i),portFreez(i)]=TIPPStr(PortValue,TRiskmulti,TGuarantRatio,TGuarantRatioMark,...
             TGuarantRatioAdjust,TradeDayTimeLong,TradeDayOfYear,TadjustCycle,RisklessReturn,TradeFee,SDataMatrix(i,:));
        testReturn(i)=( A(TradeDayTimeLong+1)-A(1) )/A(1);
        testVolatility(i)=std( price2ret( A ) )*sqrt(TradeDayOfYear);
    end
    TIPPTestMatrix(testNo,6)=sum(testReturn)/testNum;
    TIPPTestMatrix(testNo,7)=sum(testVolatility)/testNum;
    TIPPTestMatrix(testNo,8)=sum(SumTradeFee)/testNum;
    TIPPTestMatrix(testNo,9)=sum(portFreez)/testNum;
end
TIPPTestMatrix
