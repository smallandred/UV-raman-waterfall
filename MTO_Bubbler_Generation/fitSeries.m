function processed = fitSeries( data, startColumn, count, interval )

processed = zeros(count, 40);

mkdir('frames');
cd frames;

for i = startColumn:startColumn + count - 1
    [fitRes, gof] = MTOFitFromSeries(data, i, 5);
    processed(i - startColumn+1,1) = interval * ( i - startColumn );
    coeffList = coeffvalues(fitRes);
    processed(i-startColumn+1, 2:40) = coeffList;
    
end

bubble = transformCoeff(processed, 13);

figure('color', [1,1,1]);
scatter3(bubble(:,1), bubble(:,2),bubble(:,3),0.03*bubble(:,3), bubble(:,3), 'filled');
set(gca, 'YDir','reverse');
view(0,90);
xlabel('Raman Shift/cm-1');
ylabel('Time on Stream/sec');

colorseries = csvread('C:\Users\smallandred\Documents\MATLAB\Bubble_Colorseries.txt');
colormap(colorseries);

colormapeditor; 