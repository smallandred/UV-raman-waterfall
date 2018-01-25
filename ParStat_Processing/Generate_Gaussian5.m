function [coeffList, peakData] = Generate_Gaussian5( fileName )


origData = dlmread( fileName );
X = origData( 582:910, 1 );
Y = origData( 582:910, 2 );

baseLine = polyfit([X(1),X(329)],[Y(1),Y(329)],1);
Y = Y - polyval(baseLine, X);

peakData = zeros(length(X), 8);
peakData(:,1) = X;
peakData(:,8) = Y;


fitResult = FitEC_Gaussian5( fileName );

coeffList = coeffvalues(fitResult);

for i = 1:5
   hold on;
   
   peakData(:,(i+1)) = coeffList(3*i-2) * exp(-((X-coeffList(3*i-1))/coeffList(3*i)).^2); %a1*exp(-((x-b1)/c1)^2)
   %plot(X, Y, 'color', colorseries(mod(i*4,64),:), 'LineWidth', 1);
   
end

peakData(:,7) = feval(fitResult, X);

csvwrite([strrep(fileName, '.txt', ''),'_FittedCurves.txt'], peakData);
csvwrite([strrep(fileName, '.txt', ''),'_Coeffs.txt'], coeffList);