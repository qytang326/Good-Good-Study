options = optimset('LargeScale','off','display','iter');
%参数设置使用中等规模算法，显示迭代过程
A=[-1,-2,-2; %线性不等式约束系数矩阵
    1, 2, 2];
b=[0;72];%线性不等式约束常量向量
x0=[10,10,10];%初始迭代点
[x,fval,exitflag,output]= fmincon(@confun1,x0,A,b,[],[],[],[],[],options)