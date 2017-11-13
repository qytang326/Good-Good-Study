function displayVar(onePercent, fivePercent, method)
% Display the Value at Risk as with a percentage and dollar amount.
%
%   Copyright 2008-2009 The MathWorks, Inc.
%   Edited: Jeremy Barry 02/10/2009

switch method
    case 'hs'
        methodString = 'Historical Simulation';
    case 'p'
        methodString = 'Parametric';
    case 'mcp'
        methodString = 'Monte Carlo Simulation (portsim)';
    case 'mcg'
        methodString = 'Monte Carlo Simulation (GBM)';
    case 'mcs'
        methodString = 'Monte Carlo Simulation (SDE)';
    case 'mcsec'
        methodString = 'Monte Carlo Simulation (by security)';
end

outString = sprintf('Value at Risk method: %s \n', methodString);
outString = [outString sprintf('Value at Risk @ 99%% = %s \n', ...
    formatCurrency(onePercent))];
outString = [outString sprintf('Value at Risk @ 95%% = %s \n', ...
    formatCurrency(fivePercent))];

disp(outString)