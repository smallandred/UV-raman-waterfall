function plotGaussian13(X, Y, fitRes)

figure('color', [1,1,1] );

h = plot( fitRes, X, Y );
legend( h, 'Data', 'fit', 'Location', 'NorthWest' );
%Label axes
xlabel( 'Wavenumber/cm-1' );
ylabel( 'Intensity/a.u.' );
grid on;

colorseries = csvread('C:\Users\smallandred\Documents\MATLAB\lineColorSeries1.txt');

coeffList = coeffvalues(fitRes);

for i = 1:13
   hold on;
   
   Y = coeffList(i) * exp(-((X-coeffList(13+i))/coeffList(26+i)).^2); %a1*exp(-((x-b1)/c1)^2)
   plot(X, Y, 'color', colorseries(mod(i*4,64),:), 'LineWidth', 1);
   
end