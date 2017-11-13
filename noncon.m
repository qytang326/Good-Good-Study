function [c,ceq] = noncon( x )
%非线性约束条件
% 此处显示详细说明
c=x(1)+x(2)+x(3)-72;        %不等式约束
ceq=[];                     %登时约束


end

