%ObjFunWithPara
a=[1,1];
x0=[0,0];
[x,fval,exitflag,output] = fminunc(@(x) ObjFunWithPara(x,a),x0)
