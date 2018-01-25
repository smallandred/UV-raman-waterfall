function returnedmatrix = plotspectra(input, colorindex)

colormap hot;
colorseries = colormap;

returnedmatrix = zeros(length(input(:,1)),2);

returnedmatrix(:,1) = input(:,1);

returnedmatrix(:,2) = RMFL(input(:,1), input(:,2));
%returnedmatrix(:,1) = input(:,1);
%returnedmatrix(:,2) = spectrumsmoothing(input(:,1), tempmatrix(:,2));

hold on;
plot(returnedmatrix(:,1), returnedmatrix(:,2), 'LineWidth', 2, 'color', colorseries(colorindex*6, :));