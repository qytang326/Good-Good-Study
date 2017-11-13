
% 2.桌腿边缘线延时动画
plot3([25 25 -25 -25 25],[-60 60 60 -60 -60],zeros(1,5),'-')
hold on
axis equal
num = 1;
tt = 0:0.02:2*pi;asin(5/6)
plot(25.*sin(tt),25.*cos(tt))
for alpha = 0:0.02:asin(5/6)
    x = linspace(-25,25,20);                    % 平面分析x坐标
    y = sqrt(625 - x.^2);                       % 平面分析y坐标
    t = sqrt(y.^2+900-60.*cos(alpha).*y);       % 轴到铰链点距离
    cosBelta =( y.^2+t.^2-30^2)./(2*t.*y);
    x1 = x;                                     % 桌脚边缘线x1
    Belta = acos(cosBelta);
    y1 =y - (60-y).*cos(Belta);                 % 桌脚边缘线y1
    z1 = - (60-y).*sin(Belta);                  % 桌脚边缘线z1
    plot3(x1,y1,z1,'r')
    xlabel('x')
    ylabel('y')
    zlabel('z')
    view(-56,22)
    mov(num) = getframe(gcf);
    num = num+1;
end
movie2avi(mov, 'mymovie2.avi', 'compression', 'None')