function processed = sumM2DFile(filename, count)
%SUMKINETICS(filename, count) Combine adjacant spectra within a kinetics data
%file to improve S/R Ratio.
%
%input pamams:
%   filename: a string indicating thefilename of a kinetic series.
%   count: no. of adjacent spectra to be added together. 

%output params:
%   processed: a matrix holding the processed Raman data.

%read and clip data

warning('off', 'curvefit:fit:equationBadlyConditioned');
rawdatafile = csvread(filename);

X = rawdatafile(:,1);

XMinList = find( X > (296) & X < (302));

if isempty(XMinList) == 0
    [XMinIndex, I] = min(XMinList);
else
    XMinIndex = 120;
end

rawdatasize = size(rawdatafile);
if rawdatasize(1) > 1890
    rawdatafile = rawdatafile(XMinIndex:(XMinIndex+1770), :);
end

datasize = size(rawdatafile);  
columncount = floor(datasize(2)/count) - 1;

hplot = zeros(1,columncount);

%allocate the output matrix
 

processed = zeros(datasize(1),columncount);
processed(:,1) = rawdatafile(:,1);

figure('color', [1 1 1]);

for dataindex = 2:columncount
    
    for i = 1:count
        processed(:,dataindex) = processed(:,dataindex) + rawdatafile(:, count * dataindex - i);
    end

    processed(:, dataindex) = RMFL(rawdatafile(:,1), processed(:,dataindex));
    processed(:, dataindex) = spectrumsmoothing(rawdatafile(:,1), processed(:,dataindex)) + 800*dataindex;
    %processed(:, dataindex) = processed(:, dataindex) + 800*dataindex;
    hold on;
    
    if mod(dataindex, 5) == 2
        hplot(dataindex-1) = plot(processed(:, 1), processed(:, dataindex), 'r');
    %hplot(dataindex-1) = plot(processed(:, 1), processed(:, dataindex), 'color', colorseries(dataindex*colormultiplier, :));
    else
        hplot(dataindex-1) = plot(processed(:, 1), processed(:, dataindex), 'b');
    end
    
    hold on;

end
title(filename);

csvwrite([filename, num2str(count),'x_sum.txt'], processed);