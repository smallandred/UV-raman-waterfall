function processed  = processQuadra( filename )

%PROCESSQUADRA Read an exported Quadra MS text data file into memory.
%   M = PROCESSQUADERA('FILENAME') reads a comma separated value formatted file
%   FILENAME.  The result is returned in processed.

width = findMSWidth( filename );
length = findMSLength( filename );
%spectraInterval = findMSInterval( fileName );

currentFileID = fopen(filename);
outputFileName = [strrep( filename, '.asc',''), '_AllMasses.asc']; 

%outputFileID = fopen( outputFileName, 'w+'); %Check ifexist to be added

if width == 50
    spectraInterval = 1.243;
else if width == 150
        spectraInterval = 3.663;
    end
end
%currentTime = 0;

processed = zeros(length, width+1);

i = 1;
while i < (length+1)
    currentLine = fgets(currentFileID);
    
    if ~isempty(regexp(char(currentLine), 'amu', 'match'))
        processed(i,1) = spectraInterval * (i-1);
        
        currentLine = fgets(currentFileID);
        
        while ~isempty(regexp(char(currentLine), '\d', 'match'))
            if ~isempty(regexp(char(currentLine), '\d\d?\.00\t', 'match'))
                currentData = str2num(char(currentLine));
                currentAmu = currentData(1);
                currentCurrent = currentData(2);
                processed(i, currentAmu + 2) = currentCurrent;
                
            end
            
            currentLine = fgets(currentFileID);
        end
        
         i = i + 1;

    end
    
       
%    while ischar(currentLine) && isempty(regexp(char(currentLine), '[a-z][a-z]', 'match'))
%        if ~isempty(regexp(char(currentLine), '\d\d?\.00\t', 'match')) && isempty(regexp(char(currentLine), '[a-z][a-z]', 'match'));
%            currentData = str2num(char(currentLine));
%            currentAmu = currentData(1);
%            currentCurrent = currentData(2);
%            
%            
%            processed(i, currentAmu + 2) = currentCurrent;
%       end
%        currentLine = fgets(currentFileID);
%    end
end

csvwrite(outputFileName, processed);
fclose(currentFileID);