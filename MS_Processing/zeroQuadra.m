function processed  = zeroQuadra( data, zeroPoint )

dataSize = size(data);
massCount = dataSize(2);

processed = zeros(dataSize);

for i = 2:massCount
    currentColumn = data(:,i) - data(zeroPoint,i);
    processed(:,i) = currentColumn;
end

processed(:,1) = data(:,1);
