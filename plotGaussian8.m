function plotGaussian8(X, Y, fitRes, count)


figure('color', [1,1,1] );

h = plot( fitRes, X, Y );
legend( h, 'Data', 'fit', 'Location', 'NorthWest' );
%Label axes
xlabel( 'Wavenumber/cm-1' );
ylabel( 'Intensity/a.u.' );
grid on;

colorseries = csvread('C:\Users\smallandred\Documents\MATLAB\lineColorSeries1.txt');

coeffList = coeffvalues(fitRes);

for i = 1:count
   hold on;
   
   Y = coeffList(3*i-2) * exp(-((X-coeffList(3*i-1))/coeffList(3*i)).^2); %a1*exp(-((x-b1)/c1)^2)
   plot(X, Y, 'color', colorseries(mod(i*4,64),:), 'LineWidth', 1);
   
end
propertyeditor( 'on' );