%test HurstCompute
testNum=10;
result =zeros(testNum,2);
for i=1:testNum
    n=120*i;
    dt=1;
    y=cumsum(dt^0.5.*randn(1,n)); % standard Brownian motion
    result(i,:)=HurstCompute(log(y));
end
plot(1:testNum,result(:,1),'*')
legend('HurstExponent')
    
    