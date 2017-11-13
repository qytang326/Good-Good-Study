function y= lagr1(x0,y0,x)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
n=length(x0);
m=length(x);
for i=1:m
    z=x(i);
    s=0.0;
    for k=1:n
        p=1.0;
        for j=1:n
            if j~=k
                p=p*(z-x0(j))/(x0(k)-x0(j));
            end
        end
    end
    s=p*y0(k)+s;
end
y(i)=s;


end

