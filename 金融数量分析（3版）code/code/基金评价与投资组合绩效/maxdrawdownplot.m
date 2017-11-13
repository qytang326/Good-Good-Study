
%载入数据
load funddata
%funddata的数据序列
%沪深300价格
HS300price=funddata(:,1);
%数据长度
N=length(HS300price);
RetraceRatio=zeros(N,1);
%计算T，交T之前最大收益的回撤比例
for i=2:N
    C = max(HS300price(1:i));
    if C == HS300price(i)
    %若现在是最大，则回撤比例为0
        RetraceRatio(i) = 0;
    else
    %当前点与之前最高点回撤比例
        RetraceRatio(i) = (HS300price(i)-C)/C;
    end
end
%画图
TRate=HS300price/HS300price(1)-1;
f=figure;
fill([1:N,N],[RetraceRatio;0],'r')
hold on
plot(TRate);
%坐标轴设置
xlabel('time')
ylabel('Rate/RetraceRatio')

