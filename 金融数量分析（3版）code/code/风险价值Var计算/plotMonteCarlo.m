function plotMonteCarlo(returnSeries)
% Plot all of the simulation returns from the Monte Carlo simulation.
%
%   Copyright 2008-2009 The MathWorks, Inc.
%   Edited: Jeremy Barry 02/10/2009

percentiles = prctile(returnSeries, [1 5]) ;
hist(returnSeries,100)
var1 = line([percentiles(2) percentiles(2)], ylim, 'color','g','linewidth',2, 'displayname', 'VaR @ 5%');
var2 = line([percentiles(1) percentiles(1)], ylim, 'linestyle','--','color','g','linewidth',2, 'displayname', 'VaR @ 1%');
title('Simulated Returns')
xlabel('Simulated Return')
ylabel('Number of Observed Returns')
legend([var1 var2])