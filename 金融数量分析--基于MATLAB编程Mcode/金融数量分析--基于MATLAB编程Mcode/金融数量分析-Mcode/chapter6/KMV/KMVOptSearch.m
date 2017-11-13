function [Va,AssetTheta]=KMVOptSearch(E,D,r,T,EquityTheta)
%KMVOptSearch
%code by ariszheng@gmail.com
EtoD=E/D;
x0=[1,1];%À—Àÿ≥ı ºµ„
VaThetaX=fsolve(@(x) KMVfun(EtoD,r,T,EquityTheta,x), x0);
Va=VaThetaX(1)*E;
AssetTheta=VaThetaX(2);
% F=KMVfun(EtoD,r,T,EquityTheta,x)