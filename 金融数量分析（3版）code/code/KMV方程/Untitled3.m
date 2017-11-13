x0 = [-5; -5];
options=optimset('Display','iter');  
[x,fval] = fsolve(@Eqfun,x0,options) 
