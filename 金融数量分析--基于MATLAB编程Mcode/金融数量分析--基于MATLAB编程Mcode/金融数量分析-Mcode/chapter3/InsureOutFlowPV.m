function PV=InsureOutFlowPV(StartPayAge,EndPayAge,DeadAge,OutPayment,Rate)
%code by ariszheng@gmail.com
%2009-6-16
if DeadAge<StartPayAge
    error('DeadAge must bigger than StartPayAge')
elseif DeadAge < EndPayAge
    PV = pvfix(Rate, DeadAge-StartPayAge, OutPayment);
else
    PV = pvfix(Rate, EndPayAge-StartPayAge,OutPayment);
end