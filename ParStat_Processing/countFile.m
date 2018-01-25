function [filecount, filenamelist] = countFile(str)

filelist = dir;

filecount = 0;
for j = 1:size(filelist)
    if filelist(j).isdir == 0 && ~isempty(regexp(filelist(j).name, str, 'match'))
        filecount = filecount + 1;
    end
end

filenamelist = cell(1,filecount);
i = 0;

for j = 1:size(filelist)
    
    if filelist(j).isdir == 0 && ~isempty(regexp(filelist(j).name, str , 'match'))
       
        i = i + 1;
        S = filelist(j).name;
        filenamelist(i) = cellstr(S);
        
    end
end

