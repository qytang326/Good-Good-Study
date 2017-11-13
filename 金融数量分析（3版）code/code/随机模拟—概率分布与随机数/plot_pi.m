%plot
%测试次数为10万
TestNum=1e4;
%生成[-1,1]*[-1,1]上服从均匀分布的随机数
%rand为[0,1]上均匀分布，2*(a-0.5）的方式将起改变为
%[-1,1]上的均匀分布
X=2*(rand(TestNum,2)-0.5);
%落到园内的点的数量
CircleNum=0;
%进行投点模拟
figure
hold on
for i=1:TestNum
    if X(i,1)^2+X(i,2)^2<=1
        CircleNum=CircleNum+1;
        plot(X(i,1),X(i,2),'r.')
    else
        plot(X(i,1),X(i,2),'bo')
    end
    
end
%计算（圆周率）Pi值
SPi=4*CircleNum/TestNum;