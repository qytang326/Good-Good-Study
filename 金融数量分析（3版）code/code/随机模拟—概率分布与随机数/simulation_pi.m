%simulation pi
%正方形便上为2R，其内切圆的半径为R
%正方形的面积为4R^2, 内切圆的面积Pi*R^2
%正方形的面积/内切圆的面积=4/pi
%pi=4*内切圆的面积/正方形的面积
%先进投点模拟，投店次数为10万次
TestNum=1e5;
%生成[-1,1]*[-1,1]上服从均匀分布的随机数
%rand为[0,1]上均匀分布，2*(a-0.5）的方式将起改变为
%[-1,1]上的均匀分布
X=2*(rand(TestNum,2)-0.5);
%落到园内的点的数量
CircleNum=0;
%进行投点模拟
for i=1:TestNum
    if X(i,1)^2+X(i,2)^2<=1
        CircleNum=CircleNum+1;
    end
end
%计算（圆周率）Pi值
SPi=4*CircleNum/TestNum