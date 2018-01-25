function processed = processEC( )

%Electrochemical Raman processing script.

filelist  = dir;

filecount = 0;
for j = 1:size(filelist)
    if filelist(j).isdir == 0
        filecount = filecount + 1;
    end
end

filenamelist = cell(1,filecount);
potentiallist = zeros(1,filecount);

i = 0;

for j = 1:size(filelist)
    
    if filelist(j).isdir == 0
        
        i = i + 1;
        S = filelist(j).name;
        filenamelist(i) = cellstr(S);
        
        T = regexp(S, '\d\.\dV','match');
        
        if ~isempty(T)
            Tstring = char(T);
            potentialcell = regexp(Tstring, '\d.\d', 'match');
            potential = str2double(char(potentialcell));
        
            potentiallist(i) = potential;
        
        else
            if ~isempty(regexp(S, 'OC'))
                potentiallist(i) = -1;
            
            end
        
        end
        
    end
end

[B, index] = sort(potentiallist);

ocdata = dlmread(char(filenamelist(index(1))));
processed = zeros(size(ocdata,1)-439,filecount+1);

processed(:,1) = ocdata(400:size(ocdata,1)-40,1);
X = processed(:,1);

figure;
colormap default;
colorseries = colormap;

for i=1:filecount
    hold on;
    dataincoming = dlmread(char(filenamelist(index(i))));
    datatemp = dataincoming(400:size(ocdata,1)-40,2);
    
    %datatemp = RMFL(X, datatemp);
    %datatemp = spectrumsmoothingneg(X, datatemp);
    datatemp = normalize1(datatemp) + i*0.2;
    
    processed(:,i+1) = datatemp;
    
    plot(X,datatemp,'color',colorseries(mod(50,i*7),:));
    hold on;
end

graphtitle = char(filenamelist(1));
title(strrep(graphtitle, '_', ','));

labellist = cell(1, filecount);
for i = 1:filecount
    labellist(i) = cellstr(num2str(B(i)));%B is already sorted!
end
labellist(1) = cellstr('OC');

legend(labellist);


    
    
    
    
    
    
    %filenamelist(i) = 
    %potentialist(i) = 



