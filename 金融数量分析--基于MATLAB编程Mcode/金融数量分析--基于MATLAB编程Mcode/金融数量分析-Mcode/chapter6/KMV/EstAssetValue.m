function E=EstAssetValue(D,r,T,AssetTheta,Va)
d1=( log(Va/D)+(r+0.5*AssetTheta^2)*T ) / (AssetTheta*sqrt(T));
d2=d1-AssetTheta*sqrt(T);
E=Va*normcdf(d1)-exp(-r*T)*normcdf(d2)*D;