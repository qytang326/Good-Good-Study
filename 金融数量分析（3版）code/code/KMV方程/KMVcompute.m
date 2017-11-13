%test KMV
%r: risk-free rate
r=0.0225;

%T: Time to expiration
T=1;%输入 月数

%DP:Defaut point
%SD: short debt,  LD: long debt
SD=1e8;%输入
LD=4e7;%输入
%计算违约点
DP=SD+0.5*LD;

%D:Debt maket value
D=DP;%债务的市场价值，可以修改


%theta: volatility
%PriceTheta:  volatility of stock price
PriceTheta=0.2893;%(输入）
%EquityTheta: volatility of Theta value
EquityTheta=PriceTheta;
%AssetTheta: volatility of asset

%E:Equit maket value
E=141276427;
%Va: Value of asset

%to compute the Va and AssetTheta
[Va,AssetTheta]=KMVOptSearch(E,D,r,T,EquityTheta)

%计算违约距离
DD=(Va-DP)/(Va*AssetTheta)
%计算违约率
EDF=normcdf(-DD)