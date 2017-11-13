f = [-1,-1,-1]  %目标函数系数
A= [7, 3, 9; 8, 5, 4; 6, 9, 5]; %不等式约束的系数矩阵
b= [1, 1, 1]   %不等式约束的b
Aeq=[]      %等式约束的系数矩阵（该问题无等式约束Aeq为空）
beq=[]      %等式约束的beq（该问题无等式约束beq为空）
lb=[0, 0, 0]   %变量的下届
ub=[]        %变量得上界（无上界约束，ub为空）
[x,fval,exitflag,output,lambda] = linprog(f,A,b,Aeq,beq,lb,ub)

