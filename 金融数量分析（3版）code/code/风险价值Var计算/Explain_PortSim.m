%% Monte Carlo simulation for 90 days
numObs = 89; % Number of observation
numSim = 1000; % Number of simulation
expReturn = mean(returnsSecurity); % Expected mean and covariance of the returns
expCov = cov(returnsSecurity);
simulatedAssetReturns = portsim(expReturn,expCov,numObs,1,numSim, 'Expected');
% simulatedAssetReturns = portsim(expReturn,expCov,numObs,1,numSim, 'Exact');

%% Visualize Monte Carlo simulation of AAPL
montecarloAAPL = squeeze(simulatedAssetReturns(:,2,:));
priceAAPL = HistPrices(:, 2);
montecarloAAPLPrices = ret2tick(montecarloAAPL, priceAAPL(end));
plot([repmat(priceAAPL, 1, size(montecarloAAPLPrices, 2)); ...
    montecarloAAPLPrices]);  

%% 
cumAssetReturns = sum(simulatedAssetReturns);
cumAssetReturns = squeeze(cumAssetReturns); % Make the return series two dimensional
mVals = cumAssetReturns'*weightsPortfolio';
mVar = -prctile(mVals*marketValuePortfolio, [1 5]);