function plotQuadra( data, watchlist, zeroPoint )

keySet = [31, 28, 55, 45, 41, 32, 39, 4, 56];
valueSet = {'MeOH', 'Ethylene', '55', 'DME', 'Propylene', 'O2', 'Butadiene', 'He', 'Butene'};
mapObj = containers.Map(keySet,valueSet);

dataSize = size(data);

if size(watchlist) == 1
    if dataSize(2) < 60
        watchlist = [31,28, 45, 41 ];
    else    
        watchlist = [31, 28, 45, 41 ]; 
    end
end

legendList = cell(1, length(watchlist));

zeroIndex = findZeroPoint(data(:,1), zeroPoint);

if zeroPoint > 0
   data = zeroQuadra(data, zeroIndex);
end

data(:,1) = data(:,1) - data(zeroIndex, 1);
data(:,30) = data(:,30) - 2.7*data(:,16);% - 0.2278*data(:,33);

figure('color', [1,1,1]);
colorseries = csvread('C:\Users\smallandred\Documents\MATLAB\lineColorSeries1.txt');

for i = 1:length(watchlist)
    hold on;
    currentColumn = watchlist(i) + 2;
    currentData = data(:,currentColumn);
%    dataMin = min(data(:,currentColumn));

    plot(data(:,1), currentData, 'color', colorseries(mod(i*5,64),:), 'LineWidth', 1.5);
    
    if isKey(mapObj, watchlist(i))
        legendList(i) = cellstr(mapObj(watchlist(i)));
    else
        legendList(i) = cellstr(num2str(watchlist(i)));
    end
end



legend(legendList, 'location', 'NorthWest');