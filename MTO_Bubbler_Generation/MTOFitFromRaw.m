function [fitresult, gof] = MTOFitFromRaw(Data, columnNumber)

X  = Data(:, 1);
Y = Data(:, columnNumber);
curve = [X,Y];

DX = cutByX(curve, 1335, 1680);
