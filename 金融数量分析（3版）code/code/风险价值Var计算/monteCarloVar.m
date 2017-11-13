function [valueAtRisk simulatedPortfolioReturns] = monteCarloVar(securityReturns, securityPrices, portfolioMarketValue, portfolioWeights, numSim, varargin)
if isempty(varargin{1})
    method = 'portsim';
else
    method = varargin{1};
end

% The number of observations, in our case we look 1 day ahead
numObs = 1; 


% Expected mean and covariance of the returns
expReturn = mean(securityReturns);

switch method
    case 'portsim'
        expCov = cov(securityReturns);
        %         % Simulate the returns of the portfolio numSim times
        %         simulatedAssetReturns = portsim(expReturn,expCov,numSim,1,numObs, 'Exact');
        %
        %         % Make the return series two dimensional
        %         simulatedAssetReturns = squeeze(simulatedAssetReturns);
        %         simulatedPortfolioReturns = simulatedAssetReturns*portfolioWeights';
        
        % Simulate the returns of the portfolio numSim times
        simulatedAssetReturns = portsim(expReturn,expCov,numObs,1,numSim, 'Exact');
        % simulatedAssetReturns = portsim(expReturn,expCov,numObs,1,numSim, 'Expected');
        
        % Make the return series two dimensional
        simulatedAssetReturns = squeeze(simulatedAssetReturns);
        simulatedPortfolioReturns = simulatedAssetReturns'*portfolioWeights';
        
    case 'econometrics'
        sigma = std(securityReturns);
        correlation = corrcoef(securityReturns);
        X = securityPrices(end,:)';
        dt = 1;
        switch varargin{2}

            case 'gbm'
                % Create the GBM object
                GBM = gbm(diag(expReturn), diag(sigma), 'Correlation', correlation, 'StartState', X);

                % Simulate for numSim trials
                [simulatedAssetPrices,T] = GBM.simulate(numObs, 'DeltaTime', dt, 'ntrials', numSim); %#ok
                simulatedAssetReturns = tick2ret(simulatedAssetPrices, [], 'continuous');
                simulatedAssetReturns = squeeze(simulatedAssetReturns);
                simulatedPortfolioReturns = portfolioWeights*simulatedAssetReturns;
            case 'sde'
                % Create the drift and diffusion functions
                F = @(t,X) diag(expReturn) * X;
                G = @(t,X) diag(X) * diag(sigma);

                % Create the SDE object
                SDE = sde(F, G, 'Correlation', correlation, 'StartState', X);
                
                %Simulate for numSim trials
                [simulatedAssetPrices,T] = SDE.simulate(numObs, 'DeltaTime', dt, 'ntrials', numSim); %#ok
                simulatedAssetReturns = tick2ret(simulatedAssetPrices, [], 'continuous');
                simulatedAssetReturns = squeeze(simulatedAssetReturns);
                simulatedPortfolioReturns = portfolioWeights*simulatedAssetReturns;                
        end
end

valueAtRisk = -prctile(simulatedPortfolioReturns*portfolioMarketValue, [1 5]);


