%test BrownM
LengthOfDay=250;
testNum=100;
SData=zeros(testNum,LengthOfDay+1);
Mean=0.2/LengthOfDay;
Std=0.3/sqrt(LengthOfDay);
for i=1:testNum
    SData(i,:)=BrownM(LengthOfDay,Mean,Std,1);
end
figure
hold on
for i=1:testNum
    plot(SData(i,:))
end
