x0 = [-5; -5];
a=2;
b=2;
options=optimset('Display','iter');  
[x,fval] = fsolve(@(x) CEqfun(x,a,b),x0,options)  