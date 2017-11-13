function hist2color(Y,cutoff,left_color,right_color)
% Highlight a specific set of bins in a histogram.
%
%   Copyright 2008-2009 The MathWorks, Inc.
%   Edited: Jeremy Barry 02/10/2009

% Organize Returns into historgram bins
[count,bins] = hist(Y,100);

% Create 2nd data set that is zero above cutoff point
count_cutoff = count.*(bins < cutoff);

% Plot full data set
bar(bins,count,right_color);
hold on;
% Plot cutoff data set
bar(bins,count_cutoff,left_color);
grid on;
hold off;
