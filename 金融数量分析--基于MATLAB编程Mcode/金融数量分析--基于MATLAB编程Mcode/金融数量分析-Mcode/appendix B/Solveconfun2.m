options = optimset('LargeScale','off','display','off');
%参数设置使用中等规模算法，不显示迭代过程
lb=zeros(1,5);%lb=[0,0,....,0]
ub=10*ones(1,5); %ub=[10,10,....,10]
a=[1,2,3,4,5];
b=15;
x0=ones(1,5);%x0=[1,1,....,1]
[x,fval,exitflag,output]= fmincon(@(x) confun2(x,a),x0,[],[],[],[],lb,ub,@(x)mycon2(x,b),options)