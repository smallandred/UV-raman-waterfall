function processed = processTafel( )

filelist = dir;

filecount = 0;
for j = 1:size(filelist)
    if filelist(j).isdir == 0 && ~isempty(regexp(filelist(j).name,'.par', 'match'))
        filecount = filecount + 1;
    end
end

filenamelist = cell(1,filecount);
i = 0;

for j = 1:size(filelist)
    
    if filelist(j).isdir == 0 && ~isempty(regexp(filelist(j).name,'.par', 'match'))
       
        i = i + 1;
        S = filelist(j).name;
        filenamelist(i) = cellstr(S);
        
    end
end

for i = 1 : filecount
   
    currentFileName = char(filenamelist(i));
    currentFileID = fopen(currentFileName);
    currentFileName = strrep(currentFileName, '.par','');
    outputXMLName = [currentFileName, '_XML.xml'];
    
    outputXMLFID = fopen(outputXMLName, 'w+');
    fwrite(outputXMLFID, ['<?xml   version="1.0"   encoding="GB2312"?>',char(10)]);
    fwrite(outputXMLFID, ['<Main>',char(10)]);
    
    eofFlag = 0;
    while eofFlag == 0
        currentLine = fgets(currentFileID);
        
        if ~ischar(currentLine)
            eofFlag = 1;
        end
        
        if isempty(regexp(char(currentLine), 'Limits', 'match')) && eofFlag == 0
            fwrite(outputXMLFID, currentLine);
        end
    end
    
    fwrite(outputXMLFID, '</Main>');
    fclose(outputXMLFID);
    currentNode = xmlread(outputXMLName);
    
    dataString = char(currentNode.getElementsByTagName('Segment1').item(0).getFirstChild.getData);
    dataStartIndex = min(regexp(dataString, '0,0'));
    dataString = dataString(dataStartIndex:length(dataString));
    
    processed = str2num(dataString);
    
    processed = processed(:,3:4);
    
    csvwrite([currentFileName, '.txt'], processed);
    
    
end

    
    
    
end