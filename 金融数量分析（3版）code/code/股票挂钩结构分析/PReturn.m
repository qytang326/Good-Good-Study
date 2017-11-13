ZSreturn=-0.5:0.05:0.5
Preturn=max(0,-ZSreturn*125.94/100);
plot(ZSreturn,Preturn)
xlabel('招行收益率')
ylabel('产品收益率')
hold on
plot(0,-0.2,'.')