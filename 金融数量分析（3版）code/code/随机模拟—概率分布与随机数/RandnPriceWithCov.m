function Price=RandnPriceWithCov(Price0,mu,sigma,N)
%生成收益率服从正态分布且具有一定相关性的随机价格序列
%code by ariszheng  2012-5-7
R = chol(sigma);
%生成均值方差为mu,sigma的正态分布的随机收益率
%且随机序列间具有一定相关性
Rate=repmat(mu,N,1)+randn(N,2)*R;
mu-mean(Rate)
sigma-cov(Rate)
%使用cumprod函数进行累乘
Num=length(mu);
Price=zeros(N,Num);
for i=1:Num
    Price(:,i)=Price0(i).*cumprod(Rate(:,i)+1);
end