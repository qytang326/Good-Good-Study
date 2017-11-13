function [portfolioMarketValue portfolioWeights securityMarketValue lastPrice] = getPortfolioWeights(prices, positions)
% Compute the portfolio market value, the security market value, the weight
% for each security in the portfolio and the last price of the security.

%   Copyright 2008-2009 The MathWorks, Inc.
%   Edited: Jeremy Barry 02/10/2009

portfolioMarketValue = prices(end,:)*positions;

securityMarketValue = prices(end,:) .* positions';
portfolioWeights = securityMarketValue / portfolioMarketValue;
lastPrice = prices(end,:);

