function processed  = processMID ( fileName )

currentFileID = fopen(fileName, 'r');
length = 0;

currentLine = fgets(currentFileID);
while ~feof(currentFileID)
   
       length  = length + 1;
       currentLine = fgets(currentFileID);
end

length = length - 10; % last segments do not count

processed = zeros(length, 4);

fseek(currentFileID, 0, 'bof');

currentLine = fgets(currentFileID);
while isempty(regexp(char(currentLine), 'MeOH', 'match'))
    currentLine = fgets(currentFileID);
end

currentLine = fgets(currentFileID);

for i = 1:length
    
    currentLine = fgets(currentFileID);
    charCurrentLine = strrep(char(currentLine), '/', '0');
    charCurrentLine = strrep(charCurrentLine, ':', '0');
    charCurrentLine = strrep(charCurrentLine, 'P', ' ');
    charCurrentLine = strrep(charCurrentLine, 'M', ' ');
    charCurrentLine = strrep(charCurrentLine, 'A', ' ');
    numCurrentLine = str2num(charCurrentLine);
    processed(i,:) = [numCurrentLine(3)/3600, numCurrentLine(4), numCurrentLine(8), 0];
end

processed(:,4) = processed(:,3)./processed(:,2);

outputFileName = [strrep( fileName, '.asc',''), 'Activity.asc'];
csvwrite(outputFileName, processed);

figure('color', [1,1,1]);
plot(processed(:,1), processed(:,4));

fclose(currentFileID);