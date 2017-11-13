%生成一组随机数
A=rand(100,1);
%分别计算均值与方差 
A_mean=mean(A);
A_std=std(A);
%邮件的内容要显示计算的结果
content=['The result Mean of A is ',num2str(A_mean),...
    ' Std of A is',num2str(A_std),' is End']