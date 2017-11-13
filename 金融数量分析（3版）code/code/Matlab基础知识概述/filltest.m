x=0:0.1:10;
y=sin(x);
subplot(1,3,1)
fill([x,10],[y,0],[1,0,0])
subplot(1,3,2)
fill([x,10],[y,0],[0,1,0])
subplot(1,3,3)
fill([x,10],[y,0],[0,0,1])
