%% Compute Value at Risk for a given portfolio
% This script computes the Value at Risk for a portfolio using 3 different
% techniques, historical simulation, parametric, and Monte Carlo
% simulation.  
%   Copyright 2008-2009 The MathWorks, Inc.
%   Edited: Jeremy Barry 09/11/2009
%% Convert price series to return series and visualize historical returns
% This step illustrates converting a price series to a return series using
% the function TICK2RET from the Financial Toolbox.  This function allows
% for calculating simple or logarithmic returns (continuous).  
%
% THIS SECTION REQUIRES THE FOLLOWING MATHWORKS PRODUCTS AND THEIR
% RESPECTIVE DEPENDENCIES:
% * Financial Toolbox

clear variables
load MATdata/heatmapVariables.mat

returnsSecurity = tick2ret(pricesSecurity,[],'Continuous');
totalReturns = sum(returnsSecurity);

% The heatmap makes use of MATLAB's graphics capabilities.  For more
% information edit the M-file "makeHeatmap.m"
makeHeatmap(totalReturns(end, :),tickersPortfolio, numDays, 'returns', 'matlab');

%% Historical Simulation visually
%
% THIS SECTION REQUIRES THE FOLLOWING MATHWORKS PRODUCTS AND THEIR
% RESPECTIVE DEPENDENCIES:
% * Financial Toolbox
% 
clearvars -except pricesSecurity;
load MATdata/historicalVariables.mat

% To calculate the historical value at risk we need the returns of the
% portfolio over the range of date we have.  

% Get the portfolio positions from historical data
positionsPortfolio = getNewPositions(pricesIndex, pricesSecurity);

% Prices for the total portfolio over the time period
pricesPortfolio = pricesSecurity*positionsPortfolio;

% Returns for the total portfolio
returnsPortfolio = tick2ret(pricesPortfolio, [], 'continuous');

% Calculate the market value of the portfolio on the last observed day.
marketValuePortfolio = pricesSecurity(end,:)*positionsPortfolio;

% Create a visualization of the monetary returns and a histogram of the
% returns themselves
simulationResults = visualizeVar(returnsPortfolio, marketValuePortfolio);

%% Historical Simulation programatically
% To calculate the historical value at risk we need the returns of the
% portfolio over the range of dates we have.
%
% THIS SECTION REQUIRES THE FOLLOWING MATHWORKS PRODUCTS AND THEIR
% RESPECTIVE DEPENDENCIES:
% * Financial Toolbox

clearvars -except pricesPortfolio returnsPortfolio marketValuePortfolio ...
    pricesSecurity;
load MATdata/historicalVariables.mat

% Return at the 1% and 5% confidence levels
confidence = prctile(returnsPortfolio, [1 5]);

% Visualize the simulated historical returns
figure;
hist2color(returnsPortfolio, confidence(2), 'r', 'b');

% Historical daily 99% and 95% value at risk 
hVar = -marketValuePortfolio*confidence;
displayVar(hVar(1), hVar(2), 'hs');

%% Parametric
% To compute the parametric value at risk we need the expected value of the
% portfolio and the volatility of the portfolio.  With these we can create
% a normal distribution and calculate the value at risk from that.  We make
% use of the function PORTVRISK which computes the value at risk for us,
% using a normal distribution.
%
% THIS SECTION REQUIRES THE FOLLOWING MATHWORKS PRODUCTS AND THEIR
% RESPECTIVE DEPENDENCIES:
% * Financial Toolbox

clearvars -except pricesPortfolio pricesSecurity returnsPortfolio ...
    marketValuePortfolio;
load MATdata/parametricVariables.mat

% Compute the parametric daily 99% and 95% value at risk for the portfolio
pVar = portvrisk(mean(returnsPortfolio), std(returnsPortfolio), [.01 .05],...
    marketValuePortfolio);

displayVar(pVar(1), pVar(2), 'p')

%% Monte Carlo Simulations

%% Monte Carlo using portsim
% This simulation takes advantage of the built in function PORTSIM which
% simulates a portfolio using geometric brownian motion.  To generate the
% returns 
%
% THIS SECTION REQUIRES THE FOLLOWING MATHWORKS PRODUCTS AND THEIR
% RESPECTIVE DEPENDENCIES:
% * Financial Toolbox

clearvars -except returnsSecurity pricesSecurity;
load MATdata/montecarloVariables.mat;

[marketValuePortfolio, weightsPortfolio, ~, ~] = getPortfolioWeights(pricesSecurity,...
    positionsPortfolio);

numSim = 10000;
tic
[mVar mVals] = monteCarloVar(returnsSecurity,pricesSecurity, ...
    marketValuePortfolio, weightsPortfolio, numSim, 'portsim');
toc
%% Visualize the simulated portfolios
plotMonteCarlo(mVals)

%% Value at Risk
displayVar(mVar(1), mVar(2), 'mcp')

%% Monte Carlo using a GBM object
% We could also simulate the portfolio using a Geometric Brownian Motion
% object from the Econometrics toolbox and use the build in simulation method
% provided.
%
% THIS SECTION REQUIRES THE FOLLOWING MATHWORKS PRODUCTS AND THEIR
% RESPECTIVE DEPENDENCIES:
% * Econometrics

clearvars -except returnsSecurity pricesSecurity marketValuePortfolio ...
    weightsPortfolio numSim;
load MATdata/montecarloVariables.mat;

[gbmVar gbmVals] = monteCarloVar(returnsSecurity, pricesSecurity, ...
    marketValuePortfolio, weightsPortfolio, numSim, 'econometrics', 'gbm');

%% Visualize the simulated portfolios
plotMonteCarlo(gbmVals)
%% Value at Risk
displayVar(gbmVar(1), gbmVar(2), 'mcg')