function countx=count(a,b,x)
countx=0;
[m,n]=size(x);
for i=1:n
    if (x(i)>=a)&(x(i)<=b)
        countx=countx+1;
    end
end
