function [encall,varprice,ci]=blsmc1(s0,E,r,T,sigma,Nu)
%ÉèÖÃËæ»úÊı×´Ì¬
randn('state',0);
nuT=(r-0.5*sigma^2)*T;
sit=sigma*sqrt(T);
rand=randn(Nu,1);
discpayoff=exp(-r*T)*max(0,s0*exp(nuT+sit*rand)-E);
discpayoff1=exp(-r*T)*max(0,s0*exp(nuT+sit*(-rand))-E);
[encall,varprice,ci]=normfit([discpayoff; discpayoff1]);
