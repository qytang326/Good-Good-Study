function PV=InsureInFlowPV(StartPayAge,DeadAge,OutPayment,Rate)
%code by ariszheng@gmail.com
%2009-6-15
%InPayment vector
temppay=1:0.06:1.78;
temppay=repmat(temppay,3,1);
tempay =reshape(temppay,1,42);
InPayment=zeros(1,100);
InPayment(60:100)=1e4*tempay(1:41);
%%
if DeadAge<StartPayAge
    error('DeadAge must bigger than StartPayAge')
elseif StartPayAge <DeadAge & DeadAge<=40
    PV=max( ((DeadAge-StartPayAge)*OutPayment+1e5)/(1+Rate)^(DeadAge-StartPayAge),...
        pvfix(Rate, DeadAge-StartPayAge,OutPayment));
elseif 40<DeadAge & DeadAge<60
    PV=max( (10*OutPayment+1e5)/(1+Rate)^(DeadAge-StartPayAge),...
        pvfix(Rate,10,OutPayment));
elseif 60<=DeadAge & DeadAge<80
    PV=pvvar(InPayment(60:DeadAge),Rate)/(1+Rate)^30+...
        max(0,(234200-sum(InPayment(60:DeadAge))))/(1+Rate)^(DeadAge-30);
elseif  80<=DeadAge & DeadAge<88
    PV=pvvar(InPayment(60:DeadAge),Rate)/(1+Rate)^30;
else
    PV=pvvar(InPayment(60:DeadAge),Rate)/(1+Rate)^30+1e5/(1+Rate)^58;
end
    
