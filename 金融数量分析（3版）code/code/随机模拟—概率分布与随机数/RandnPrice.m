function Price=RandnPrice(Price0,mu,sigma,N)
%code by ariszheng.com 
%2012-5-7
%生成均值方差为mu,sigma的正态分布的随机收益率
Rate=normrnd(mu,sigma,N,1);
%使用cumprod函数进行累乘
Price=Price0*cumprod(Rate+1);
