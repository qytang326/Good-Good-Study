function RetraceRatio = RetraceRatio(Equity)
% 计算最大回撤比例
% by liyang 2011/12/13
% farutoliyang@gmail.com
%% 输入参数检查
error(nargchk(1, 1, nargin));

%% 初始化
len = numel(Equity);
RetraceRatio = zeros(len, 1);
%% 计算最大回撤比例
for i = 2:len
    C = max(Equity(1:i));
    if C == Equity(i)
        RetraceRatio(i) = 0;
    else
        RetraceRatio(i) = (Equity(i)-C)/C;
    end
end
%% 
if nargout == 0
    figure;
    
    subplot(2,1,1);
    plot(Equity);
    title('资金权益');
    grid on;
    axis tight;
    
    subplot(2,1,2);
    plot(RetraceRatio);
    title('最大回撤比例');
    grid on;
%     axis([0 len -0.5 0.3]);
    axis tight;
end