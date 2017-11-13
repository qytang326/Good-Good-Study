OPTIONS = optimset('LargeScale','off','MaxFunEvals',250,'display','iter');
x=[-1.9,2];
[x,fval,exitflag,output] = fminunc (@BanaFun,x,OPTIONS)
