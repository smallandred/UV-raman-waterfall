function processed = plotCoeffKinetics( TList );

processed = 0;

figure('color', [1,1,1]);
colormap(lines);
colorseries = colormap;

curveHandles = zeros(1,8);
legendList = {'Aromatics', 'Heavier Alkenes', 'Lighter Alkenes', 'Isopropyl Carbenium'};

for i = 1:4
    hold on;
    smoothedKinetic = kineticsmoothing(TList(:,1), TList(:,2*i));
    curveHandles(2*i-1) = scatter(TList(:,1), TList(:,2*i), 10,colorseries(i,:), 'Filled');      
    hold on;
    curveHandles(2*i) = plot(TList(:,1), smoothedKinetic, 'color', colorseries(i,:), 'LineWidth', 1.5);
end

legend(curveHandles([2,4,6,8]), legendList, 'location', 'NorthWest');

xlabel('Time on Stream/sec');
ylabel('Intensity/a.u.');
ylim([0 8000]);