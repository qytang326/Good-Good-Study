function pixels = makeHeatmap(returnsPeriod, tickerSymbols, numDays, inputType, varargin)
% Inputs
%   returnsPeriod = Row vector of values 收益率
%   tickerSymbols = Row vector of lables 名称

if strcmpi(inputType, 'prices')
    returns = tick2ret(returnsPeriod, [], 'continuous');
    returnsPeriod = sum(returns);
end


% Convert continuous returns to simple return percentage
returnsPeriod = -(1-exp(returnsPeriod))*100;

% for colormap
% zero point
zeroPoint = round(abs(min(sort(returnsPeriod))));
% max point
maxPoint = max(returnsPeriod);
% min point
minPoint = min(returnsPeriod);

% Determine the dimensions for the square
mapDimensions = ceil(sqrt(size(returnsPeriod,2)));
%颜色
heatmap =zeros(mapDimensions);

% If the inputs aren't square, pad the vectors to be square
numZeros = mapDimensions^2-length(returnsPeriod);
if numZeros > 0
    returnsPeriod(end+numZeros) = 0;
    tickerSymbols{end+numZeros} = '';
end

% reshape the vectors to square matrices
heatmap = reshape(returnsPeriod, size(heatmap))';
labels = reshape(tickerSymbols, size(heatmap))';

% plot the heatmap values
h = figure;
imagesc(heatmap);

% add the text for the securities
xInd = 1:mapDimensions;
for yInd = 1:mapDimensions
    text(xInd, repmat(yInd, size(xInd)), labels(yInd, :), 'FontSize',8,'HorizontalAlignment','Center');
end

axis on;
grid on;

% Add the color bar to the figure
c = moneymap(zeroPoint,maxPoint);
set(gcf,'Colormap',c);
% cb  = colorbar('ytick', yt);

% Get the ticks from the colorbar to rewrite them as percentages
% yt = [-100:10:40];
yt = linspace(minPoint, maxPoint, 7);
cb  = colorbar('ytick', yt);
% set(cb, 'Ytick', yt)

percentLabels = arrayfun(@(x) [num2str(x) '%'], yt, 'uniformoutput', 0);
set(cb, 'YTickLabel', percentLabels);
set(gca,'FontSize',8);

% Add the title to the heatmap
title(['Heat Map of Portfolio Returns for ' num2str(numDays) ' Days'],'FontSize',14);

% Add the dashed lines to smaxPointarate the blocks
ticks = [0 .5:1:mapDimensions+.5];
set(gca, 'Ytick', ticks, 'Xtick', ticks, 'YTicklabel', [], 'XTicklabel', [], 'TickLength', [0 0])

% Make a copy of the image for Excel to grab
if nargin == 5
    print -dmeta;
    pixels = [];
else
% Make a webfigure for Java
    pixels = webfigure(h);
end

function cmap = moneymap(zeroPoint, maxPoint)
% Function to make the heatmap have the green, white and red effect

colors = [1 0 0; 1 1 1;0 1 0];
% stmaxPoints = [1 zeroPoint zeroPoint+maxPoint];

redPercentage = zeroPoint/(zeroPoint+maxPoint);
stmaxPoints = [1 redPercentage*256 256];

cmap = zeros(256,3);
for k = 1:3
    interpMap = interp1(stmaxPoints',colors(:,k),1:256);
    cmap(:,k) = interpMap';
end

