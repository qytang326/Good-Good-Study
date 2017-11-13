%画Y=sin(x)>0的图形
%变量X为0到10间隔为0.1的向量 
X=0:0.1:10;
%根据X的大小，对Y进行初始化 
N=length(X);
%使用Zeros函数初始化
Y=zeros(1,N);
%使用NaN*Ones函数初始化
YY=NaN*ones(1,N);
%循环计算(为便于理解未使用矩阵方式）
for i=1:N
    if sin(X(i))>0
        Y(i)=sin(X(i));
        YY(i)=sin(X(i));
    end
end
%画图
subplot(2,1,1)
plot(X,Y,'*');
subplot(2,1,2);
plot(X,YY,'*');
