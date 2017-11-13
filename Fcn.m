function f= Fcn(x)
%函数方程
%此处显示详细说明
f=cumsum((x-1./(1:100)).^2);
f=f(100);



end

