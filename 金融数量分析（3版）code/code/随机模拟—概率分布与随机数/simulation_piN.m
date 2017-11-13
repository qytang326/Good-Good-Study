%simulation piN
%模拟投点次数从10W到1000W
TestNum=1e5:1e5:1e7;
%模拟的次数
simuNum=length(TestNum);
%生成[-1,1]*[-1,1]上服从均匀分布的随机数
%rand为[0,1]上均匀分布，2*(a-0.5）的方式将起改变为
%[-1,1]上的均匀分布
for k=1:simuNum
    X=2*(rand(TestNum(k),2)-0.5);
    %落到园内的点的数量
    CircleNum=0;
    %进行投点模拟
    for i=1:TestNum(k)
        if X(i,1)^2+X(i,2)^2<=1
            CircleNum=CircleNum+1;
        end
    end
    %计算（圆周率）Pi值
    SPi(k)=4*CircleNum/TestNum(k);
end
plot(SPi)
xlabel('TestNum')
ylabel('pi')