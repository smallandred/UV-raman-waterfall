function plotTafel( )

[filecount, fileNameList] = countFile('Tafel.*txt');

figure;
colormap default;
colorseries = colormap;

%processed = cell(1,2*filecount);

for i=1:filecount
    hold on;
    dataincoming = dlmread(char(fileNameList(i)));
        
    %processed(i) = dataincoming(:,1);
    %processed(i+1) = dataincoming(:,2);
    
    plot(log10(abs(dataincoming(:,2))), dataincoming(:,1), 'color', colorseries(mod(i*5,64),:), 'LineWidth', 2.5);
    hold on;
end

graphtitle = 'Tafel Ensemble';
title(graphtitle);

%labellist = cell(1, filecount);
%for i = 1:filecount
%    labellist(i) = cellstr(num2str(B(i)));%B is already sorted!
%end
%labellist(1) = cellstr('OC');

labelList = cell(1,filecount);
for i = 1:filecount
    currentLabel = strrep(char(fileNameList(i)), '_', ',');
    currentLabel = strrep(currentLabel, '.txt', '');
    labelList(i) = cellstr(currentLabel);
end

legend(labelList, 'Location', 'SouthEast');

grid on
grid minor
set(gca, 'GridLineStyle' ,':');
set(gca, 'XColor', [0.5, 0.5, 0.5]);
set(gca, 'YColor', [0.5, 0.5, 0.5]);
axis([-10 -2 -0.2 0.9]);

