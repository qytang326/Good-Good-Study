function X=RandSumOne(M,N,method)
%生成N个和为1的随机数且每个随机数大于0
%code by ariszheng 2012-5-7
if method==1
    X=zeros(M,N);
    for i=1:M
        %生成均匀分布的随机数
        X(i,:)=rand(1,N);
        %随机数除以和，使其和为1
        X(i,:)=X(i,:)/sum(X(i,:));
    end
elseif  method==2
      X=zeros(M,N);
    for i=1:M
        %生成正态分布的随机数
        X(i,:)=abs(randn(1,N));
        %随机数除以和，使其和为1
        X(i,:)=X(i,:)/sum(X(i,:));
    end
else
    error('please Input method')
end
