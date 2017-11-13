function f= FcnTest( x )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
n=length(hfunarray);
syms x y
for i=1:n
    hf=hfunarray{i};
    v=[x,y];
    grad=jacobian(hf,v);
    Y(i,:)=subs(grad,v,X);
end
end

