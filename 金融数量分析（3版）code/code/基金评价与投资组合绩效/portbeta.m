function beta=portbeta(portReturn,maketReturn)
%code by ariszheng@gmail.com 2012-5-17
%协方差矩阵计算
temp_cov=cov(portReturn,maketReturn);
%组合与市场的协方差/市场的方差
beta=temp_cov(1,2)/temp_cov(2,2);