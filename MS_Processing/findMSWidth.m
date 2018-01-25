function width = findMSWidth( fileName )

currentFileID = fopen(fileName, 'r');

for i = 1:6
    currentLine = fgets(currentFileID);
end

widthText = regexp(currentLine, '\d\d\d?\.\d\d', 'match');
width = str2double(char(widthText));

fclose(currentFileID);