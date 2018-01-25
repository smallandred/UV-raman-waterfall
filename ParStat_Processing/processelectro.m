function processed = processelectro(filename, count)
%PROCESSKINETICS(filename, count) batch processing of operando Raman data, including
%fluorescence substraction, smoothing and plotting.
%
%input pamams:
%   filename: a string indicating thefilename of a kinetic series.
%   count: no. of spectra to be processed. 0 to process all spectra, 
%           -1 to discard the last spectrum, 7 to process first 7
%           spectra,etc.
%
%output params:
%   processed: a matrix holding the processed Raman data.

%read and clip data
rawdatafile = dlmread(filename);
rawdatafile = rawdatafile(:, :);


%allocate the output matrix
datasize = size(rawdatafile);
    
if count == 0
    columncount = datasize(2);
else
    if count < 0
        columncount = datasize(2) + count;
    else
        columncount = count+1;
    end
end

if columncount < 10
    colormultiplier = 4;
else
    if columncount < 15
        colormultiplier = 3;
    else
        colormultiplier = 1;
    end
end

processed = zeros(datasize);
hplot = zeros(1,columncount);

processed(:,1) = rawdatafile(:,1);

figure;
colormap hot;
colorseries = colormap;

for dataindex = 2:columncount
    
    %process each data column    
    processed(:, dataindex) = RMFL(rawdatafile(:,1), rawdatafile(:,dataindex));
    processed(:, dataindex) = spectrumsmoothing(rawdatafile(:,1), processed(:, dataindex)) ;
    processed(:, dataindex) = processed(:,dataindex)/max(processed(:,dataindex))+ 0.9*dataindex;
    
    %plot
    hold on;
    %hplot(dataindex-1) = plot(processed(:, 1), processed(:, dataindex), 'b');
    hplot(dataindex-1) = plot(processed(:, 1), processed(:, dataindex), 'color', colorseries(dataindex*colormultiplier, :));
    hold on;
    %legend(hplot(dataindex-1), num2str(dataindex-1));
end
title(filename);

csvwrite([pwd,'\','Series',filename], processed);







