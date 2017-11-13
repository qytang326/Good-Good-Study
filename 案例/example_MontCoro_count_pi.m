function [count_pi,piancha]=count_pi(N)
count=0;
x=rand(1,N);
y=rand(1,N);
for i=1:N
    if x(i)^2+y(i)^2<=1
        count=count+1;
    end
end
count_pi=count/numel(x)*4;
piancha=abs(count_pi-pi)/pi*100;

