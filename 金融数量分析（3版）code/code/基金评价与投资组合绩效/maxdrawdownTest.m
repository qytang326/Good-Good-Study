%maxdrawdowntest.m
%载入数据
load funddata
%funddata的数据序列
%'博时主题'
TRate=funddata(:,2)/funddata(1,2)-1;
[MaxDD, MaxDDIndex] = maxdrawdown(TRate,'arithmetic')
%画出最大回撤发生的位置
plot(TRate)
hold on
plot(MaxDDIndex,TRate(MaxDDIndex),'r-o','MarkerSize',10)
%表示画出的o的大小