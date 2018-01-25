function [fitresult, gof] = MTOFitFromSeries(Data, columnNumber, flag)

%MTOFITFROMSERIES(Data, columnNumber, flag) fits a column of from an MTO ladder
%data using Gaussian13. 
%input params:
%   Data: an MTO ladder data from processkinetics(filename, flag)
%   columnNumber: the column number of the data to be fitted. (not actually
%   time on stream!)
%
%output params:
%   [fitresult, gof]: result of coefficients and goodness of fit


DX = cutByX(Data, 1335, 1680);
X = DX(:,1);
Y = DX(:,columnNumber);
lengthDX = length(X);

baseLine = polyfit( [X(1), X(lengthDX)], [Y(1), Y(lengthDX)], 1 );
Y = Y - polyval(baseLine, X);

if flag == 1
    [fitresult, gof] = MTOFitHigherStart(X,Y);
    %titleString = ['Column', num2str(columnNumber), ' Analysis'];
    %title(titleString);
else
    if flag == 0
    [fitresult, gof] = MTOFit1(X,Y);
    %titleString = ['Column', num2str(columnNumber), ' Analysis'];
    %title(titleString);
    else
        [fitresult, gof] = MTOFitRelay(X,Y, flag);
    end
end


plotGaussian13(X, Y, fitresult);
titleString = ['Column', num2str(columnNumber), ' Analysis, gof ', num2str(gof.rsquare)];
title(titleString);
propertyeditor('on');

fileNameStr = ['Column', num2str(columnNumber)];
figHandle = gcf;

saveas(figHandle, fileNameStr, 'fig');
saveas(figHandle, fileNameStr,'jpeg');



%outputFileName = ['Column', num2str(columnNumber),  '_coeffList.txt'];
%coeffList = coeffvalues(fitresult);
%csvwrite(outputFileName, coeffList);