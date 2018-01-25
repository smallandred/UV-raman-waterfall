function processed = M2DCokeQuanti( start, final, multi )

processed = zeros(final-start+1,2);

for i = start:final
    fileName = ['K', num2str(i), '.asc', num2str(multi), 'x_sum.txt'];
    processed(i-start+1,1) = i;
    
    if exist(fileName, 'file')
        currentData = csvread(fileName);
        
        carbonHeight = getPeakHeight(currentData, 1597, 1) - getPeakHeight(currentData, 1700, -1);
        zeoHeight = getPeakHeight(currentData, 376, 1) - getPeakHeight(currentData, 517, -1);
        ratio = carbonHeight / zeoHeight;
        processed(i-start+1,2) = ratio;
    end
end

figure('color', [1 1 1]);
plot(processed(:,1), processed(:,2));

outputFileName = ['Ratios_', num2str(start), '_to_', num2str(final), '.txt'];
csvwrite(outputFileName, processed);