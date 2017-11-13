%%读取数据
load HS300Data
%K线图 移动平均线 布林带 MACD
%使用循环方式画图（也可以采用触发的方式）
%画2010-2011年前100个交易日的动态图，将这100个数据视作Tick数据（6秒）
%从第51个数据开始绘图（一般绘图需要历史数据）
%画图
figure

for i=51:100
    %价格
    subplot(2,2,1)
    plot(Date(1:i),ClosePrice(1:i),'b');
    hold on
    %将图像的长度设定为100个数据点
    %可根据实际情况调整，3个小时若每6秒一个数据，数据长度为1800
    plot(Date(100),ClosePrice(100));
    dateaxis('x',12)
    title('价格')
    legend('Price')
    drawnow
    %移动平均线
    subplot(2,2,2)
    [Short, Long] = movavg(ClosePrice(1:i), 3, 20, 0);
    %画图
    plot(Date(1:i),ClosePrice(1:i));
    hold on
    plot(Date(3:i),Short(3:i),'r--');
    plot(Date(20:i),Long(20:i),'b.-');
    plot(Date(100),ClosePrice(100));
    dateaxis('x',12)
    %将图像的长度设定为100个数据点
    %可根据实际情况调整，3个小时若每6秒一个数据，数据长度为1800
    
    %标记线型
    legend('ClosePrcie','ShortMovavg','LongMovavg')
    title('移动平均线')
    drawnow
    %布林带
    subplot(2,2,3)
    wsize=20;
    [mid, uppr, lowr] = bollinger(ClosePrice(1:i), 20, 0, 2);
    plot(Date(1:i),ClosePrice(1:i),'k');
    hold on
    plot(Date(wsize:i),mid(wsize:i),'b-');
    plot(Date(wsize:i),uppr(wsize:i),'r.-');
    plot(Date(wsize:i),lowr(wsize:i),'r.-');
    %将图像的长度设定为100个数据点
    %可根据实际情况调整，3个小时若每6秒一个数据，数据长度为1800
    plot(Date(100),ClosePrice(100));
    dateaxis('x',12)
    %标记线型
    legend('ClosePrcie','mid','uppr','lowr')
    title('bollinger')
    drawnow
    %MACD
    subplot(2,2,4)
    [macdvec, nineperma] = macd(ClosePrice(1:i));
    plot(Date(1:i),macdvec(1:i),'r');
    hold on
    plot(Date(1:i),nineperma(1:i),'b--');
    legend('Macdvec','Nineperma')
    %将图像的长度设定为100个数据点
    %可根据实际情况调整，3个小时若每6秒一个数据，数据长度为1800
    plot(Date(100),0);
    dateaxis('x',12);
    title('MACD')
    drawnow
    
    %暂停6S
    pause(6)
    %显示运行阶段 
    sprintf('Now run %d',i)
end