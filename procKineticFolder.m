function procKineticFolder()
%Batch smoothing and fluorescence removal in the current folder.
%non-recursive.
%
%Input param: none.

fileList = dir;

for j = 1:size(fileList)
    if fileList(j).isdir == 0
        fileName = fileList(j).name;
        processkinetics(fileName,0);
        
        propertyeditor( 'on' );
        figTitle = strrep(fileName, '_', ',');
        title(figTitle);
    end
end