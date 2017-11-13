function F=KMVfun(EtoD,r,T,EquityTheta,x)
d1=( log(x(1)*EtoD)+(r+0.5*x(2)^2)*T ) / ( x(2)*sqrt(T));
d2=d1-x(2)*sqrt(T);
F=[ x(1)*normcdf(d1)-exp(-r*T)*normcdf(d2)/EtoD-1;
    normcdf(d1)*x(1)*x(2)-EquityTheta];
   