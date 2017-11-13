%RandSumOneTest
M=100;
N=3;
method=1;
X1=RandSumOne(M,N,method);
method=2;
X2=RandSumOne(M,N,method);
%预期收益率向量
ExpReturn = [0.1 0.2 0.15]; 
%协方差矩阵 
ExpCovariance = [0.0100   -0.0061    0.0042 
                -0.0061    0.0400   -0.0252 
                 0.0042   -0.0252    0.0225 ];
%变量初始化
PortRisk1=zeros(M,1);
PortReturn1=zeros(M,1);
PortRisk2=zeros(M,1);
PortReturn2=zeros(M,1);
for i=1:M
    [PortRisk1(i), PortReturn1(i)] = portstats(ExpReturn, ExpCovariance,X1(i,:));
    [PortRisk2(i), PortReturn2(i)] = portstats(ExpReturn, ExpCovariance,X2(i,:));
end
plot(PortRisk1, PortReturn1,'r.')
hold on
plot(PortRisk2, PortReturn2,'bo')
xlabel('PortRisk')
ylabel('PortReturn')
legend('X1','X2')