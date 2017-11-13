function data=BrownM(Npoints,Mean,Std,Opt)
%code by ariszheng@gmail.com
%2009-6-13
dt=1;
if Opt==1
%%
% standard Brownian motion
    data=[0 cumsum(dt^0.5.*random('Normal',Mean,Std,1,Npoints))]; 
    %figure
    %plot(0:Npoints,data);
elseif Opt==2
    %figure
    data = cumsum([zeros(1, 3); dt^0.5*random('Normal',Mean,Std,Npoints-1,3)]);
    %plot3(data(:, 1), data(:, 2), data(:, 3), 'k');
    %pcol = (data-repmat(min(data), Npoints, 1))./ ...
    %         repmat(max(data)-min(data), Npoints, 1);
    %hold on;
    %scatter3(data(:, 1), data(:, 2),data(:, 3), ...
    %         10, pcol, 'filled');
    %grid on;
    %hold off;
else
    error('Opt=1 or Opt=2')
end
