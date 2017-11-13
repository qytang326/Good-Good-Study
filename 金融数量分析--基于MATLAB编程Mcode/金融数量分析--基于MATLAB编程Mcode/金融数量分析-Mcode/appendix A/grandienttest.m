 [x,y]=meshgrid(-2:.2:2,-2:.2:2);
 z=x.*exp(-x.^2-y.^2);
 [px,py]=gradient(z,.2,.2);
 contour(z),hold on %ª≠µ»÷µœﬂ
 quiver(px,py)
