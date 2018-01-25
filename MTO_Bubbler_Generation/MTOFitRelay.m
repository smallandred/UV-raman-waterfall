function [fitresult, gof] = MTOFitRelay(X, Y, count)
%CREATEFIT(X,Y)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : X
%      Y Output: Y
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 01-Apr-2017 16:13:36


[fitresult, gof] = MTOFit1(X,Y);
%title([figName,' Fit 1',',rsquare ', num2str(gof.rsquare)]);

ft = fittype( 'a1*exp(-((x-b1)/c1)^2) + a2*exp(-((x-b2)/c2)^2) + a3*exp(-((x-b3)                      /c3)^2) + a4*exp(-((x-b4)/c4)^2) + a5*exp(-((x-b5)/c5)                      ^2) + a6*exp(-((x-b6)/c6)^2) + a7*exp(-((x-b7)/c7)^2)                       + a8*exp(-((x-b8)/c8)^2) + a9*exp(-((x-b9)/c9)^2)                       + a10*exp(-((x-b10)/c10)^2) + a11*exp(-((x-b11)/c11)^2) + a12*exp(-((x-b12)/c12)^2) + a13*exp(-((x-b13)/c13)^2)', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( ft );
opts.Display = 'Off';
opts.Lower = [0 0 0 0 0 0 0 0 0 0 0 0 0 1600 1585 1575 1554 1527 1498 1488 1459 1436 1407 1393 1357 1346 0 0 0 0 0 0 0 0 0 0 0 0 0];
opts.MaxFunEvals = 46600;
opts.MaxIter = 40000;
opts.Upper = [Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf 1635 1620 1615 1594 1567 1538 1528 1499 1476 1447 1433 1397 1386 Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf];
[xData, yData] = prepareCurveData( X, Y );



for i = 2:count
    coeffList = coeffvalues(fitresult);
    
    opts.StartPoint = coeffList;
    [fitresult, gof] = fit( xData, yData, ft, opts );
    
    %figure( 'Name', [figName,' Fit',' ', num2str(i)], 'color', [1,1,1] );
    %h = plot( fitresult, xData, yData );
    %legend( h, 'Y vs. X', 'fit', 'Location', 'NorthWest' );
    % Label axes
    %xlabel( 'X' );
    %ylabel( 'Y' );
    %title([figName,' Fit',' ', num2str(i), ',rsquare ', num2str(gof.rsquare)]);
    %grid on

    %plotGaussian13(X, fitresult);


end


%% Fit: 'untitled fit 1'.

