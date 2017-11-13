%plot return
load funddata
Hs300P=cumprod(hs300+1);
js300P=cumprod(js300+1);
nfjyP=cumprod(nfjy+1);
bsztP=cumprod(bszt+1);
NumData=length(hs300);
figure,hold on;
plot(1:NumData,Hs300P,'r');
plot(1:NumData,js300P,'b');
plot(1:NumData,nfjyP,'y');
plot(1:NumData,bsztP,'k');
legend('Hs300','js300','nfjy','bsztP')