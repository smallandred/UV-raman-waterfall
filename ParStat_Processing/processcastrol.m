function processed = processcastrol(filename, baselinecount)
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
rawdatafile = csvread(filename);
rawdatafile = rawdatafile(120:1890, :);


%allocate the output matrix
datasize = size(rawdatafile);

processed = zeros(datasize);

processed(:,1) = rawdatafile(:,1);
    
    %process each data column
    processed(:, 2) = partialRMFL(rawdatafile(:,1), rawdatafile(:,2), baselinecount);
    processed(:, 2) = spectrumsmoothing(rawdatafile(:,1), processed(:, 2));
    
    %plot
    figure;
    hold on;
    plot(processed(:, 1), processed(:, 2), 'b');
    %hplot(dataindex-1) = plot(processed(:, 1), processed(:, dataindex), 'color', colorseries(dataindex*colormultiplier, :));
    hold on;
    %legend(hplot(dataindex-1), num2str(dataindex-1));

csvwrite([pwd,'\','DeFL',filename], processed);