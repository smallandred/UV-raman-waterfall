function height = getGasHeight(rawData, centerWaveNumber, columnNum)

X = rawData(:,1);
Y = rawData(:,columnNum);

zone = find( X > (centerWaveNumber - 3) & X < (centerWaveNumber + 3));
[C,peakpos] = max(Y(zone));
peakpos = zone(peakpos);

peakLeft = Y((peakpos-16):(peakpos-7));
peakRight = Y((peakpos+7):(peakpos+16));

baseLine = (sum(peakLeft) + sum(peakRight))/20;
height = C - baseLine;