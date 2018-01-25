function [fitresult, gof] = MTOFitFromXY(X, Y, figName)



DX = cutByX([X,Y], 1335, 1680);
Xx = DX(:,1);
Yy = DX(:,2);
lengthDX = length(Xx);

baseLine = polyfit( [Xx(1), Xx(lengthDX)], [Yy(1), Yy(lengthDX)], 1 );
Yy = Yy - polyval(baseLine, Xx);

[fitresult, gof] = MTOFit1(Xx,Yy);

titleString = [figName, ' Analysis'];
title(titleString);
legend({'Data', 'Fit Result'}, 'location', 'northwest' );

outputFileName = [figName,  '_coeffList.txt'];
coeffList = coeffvalues(fitresult);
csvwrite(outputFileName, coeffList);