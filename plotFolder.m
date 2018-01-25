function plotFolder()

fileList = dir;

for j = 1:size(fileList)
    if fileList(j).isdir == 0
        
        figure('color', [1,1,1] );
        fileName = fileList(j).name;
        rawData = dlmread(fileName);
        plot(rawData(:,1), rawData(:,2));
        
        propertyeditor( 'on' );
        figTitle = strrep(fileName, '_', ',');
        title(figTitle);
    end    
end
