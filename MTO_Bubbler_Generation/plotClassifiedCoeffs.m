function processed = plotClassifiedCoeffs( classifiedCoeffs, peakCount )

listSize = size(classifiedCoeffs);
timeCount = listSize(1);

if peakCount == 0
    peakCount = 4;
end

processed = zeros(peakCount*timeCount, 3);

for i = 1 : timeCount
    for j = 1 : peakCount
        currentLine = (i-1)*peakCount + j;
        processed(currentLine,2) = classifiedCoeffs(i,1);
        processed(currentLine,1) = classifiedCoeffs(i,2*j + 1);
        processed(currentLine,3) = classifiedCoeffs(i,2*j);
        
    end
end

figure('color', [1,1,1]);
scatter3(processed(:,1),processed(:,2),processed(:,3),0.03*processed(:,3), processed(:,3), 'filled');
set(gca, 'YDir','reverse');
 xlabel('Raman Shift/cm-1');
ylabel('Time on Stream/sec');
view(0,90);

colorseries = csvread('C:\Users\smallandred\Documents\MATLAB\Bubble_Colorseries.txt');
colormap(colorseries);

colormapeditor;