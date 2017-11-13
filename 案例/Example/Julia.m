function Julia(x,y,n)
for i=1:n
    plot(x,y)
    hold on
    m=x;
    n=y;
    x=m.^2-n.^2;
    y=m.*n.*2-0.05;
end
plot(x,y)
end


   
    
