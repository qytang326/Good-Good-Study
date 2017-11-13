% [x,fval,exitflag,output,population,score] = MinTE(nvars,Aeq,beq)
% MinTE 
%code by ariszheng@gmail.com 2009-8-6
%%
options = gaoptimset;
% Modify options setting
options = gaoptimset(options,'Display', 'iter');
%‘off’为不显示迭代过程，‘iter’为显示迭代过程
options = gaoptimset(options,'Generations', 50);
%迭代次数100
options = gaoptimset(options,'PopulationSize', 100)
%种群规模100
options = gaoptimset(options,'PlotFcns', {  @gaplotbestf @gaplotbestindiv });
%%
%x1+x2+…+x10=1
Aeq=ones(1,10);
beq=1.0;
%x1+x2+…+x10>=0
lb=zeros(1,10);
%IndexPrice,StockPrice
load stockdata;
%初始投资资金1亿元
Money=1e8;
nvars=10;
[x,fval,exitflag,output,population,score] = ...
ga(@(x) TEobj(x,IndexPrice,StockPrice,Money),nvars,[],[],Aeq,beq,lb,[],[],options)
