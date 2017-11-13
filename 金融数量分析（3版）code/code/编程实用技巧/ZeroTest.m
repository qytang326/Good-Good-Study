%初始化与不初始化的程序效率 
%采用tic toc计时
%未初始化计算时间
clear
N=1000000;
tic
for i=1:N
    X(i)=i;
end
toc
clear 
%初始化计算时间
N=1e7;
tic
X=zeros(N,1);
for i=1:N
    X(i)=i;
end
toc

