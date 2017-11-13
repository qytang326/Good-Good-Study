year=1900:10:2000;
number=100*sort(random('logn',0,1,1,length(year)));
x=1900:1:2000;
y=interp1(year,number,x,'spline'); 
plot(year,number,'*',x,y);
grid on

