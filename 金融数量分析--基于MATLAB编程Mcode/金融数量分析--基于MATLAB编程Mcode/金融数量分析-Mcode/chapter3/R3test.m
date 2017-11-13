StartPayAge=30;
EndPayAge=40;
OutPayment=15940;
Rate=0.03;
DeadAge=41;
%PV=InsureOutFlowPV(StartPayAge,EndPayAge,DeadAge,OutPayment,Rate)
%%
%DeadAge=[35,45,61,75,89,95];
DeadAge=31:100;
PVI=zeros(1,length(DeadAge));
PVO=zeros(1,length(DeadAge));
for i=1:length(DeadAge)
    PVI(i)=InsureInFlowPV(StartPayAge,DeadAge(i),OutPayment,Rate);
    PVO(i)=InsureOutFlowPV(StartPayAge,EndPayAge,DeadAge(i),OutPayment,Rate)
end
plot(31:100,PVI,'-*',31:100,PVO,'-o')
legend('InsureInFlowPV','InsureOutFlowPV')
