function length = findMSLength( fileName )

currentFileID = fopen(fileName, 'r');
length = 0;

currentLine = fgets(currentFileID);
while ~feof(currentFileID)
   if ~isempty(regexp(char(currentLine), 'Task Name', 'match')) 
       length  = length + 1;
   end
   
   currentLine = fgets(currentFileID);
end

length = length - 1; % last segment does not count

fclose(currentFileID);