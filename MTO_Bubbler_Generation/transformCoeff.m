function processed =  transformCoeff( coeffList, peakCount )

% coeffList: coeffList from fitSeries or classifyCoeffs function.
% peakCount: number of peaks in the fit. 13 for fitSeries, 4 for
%   classifyCoeffs.

listSize = size(coeffList);
timeCount = listSize(1);

if peakCount == 0
    peakCount = 13;
end

processed = zeros(peakCount*timeCount, 3);

for i = 1 : timeCount
    for j = 1 : peakCount
        currentLine = (i-1)*peakCount + j;
        processed(currentLine,2) = coeffList(i,1);
        processed(currentLine,1) = coeffList(i,j+peakCount+1);
        processed(currentLine,3) = coeffList(i,j+1);
        
    end
end
