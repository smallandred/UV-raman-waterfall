function height = getPeakHeight(rawData, centerWaveNumber, sign)

X = rawData(:,1);
Y = rawData(:,2);

zone = find( X > (centerWaveNumber - 4) & X < (centerWaveNumber + 4));

if sign > 0
    [C,peakpos] = max(Y(zone));
else
    [C,peakpos] = min(Y(zone));
    
end

height = C;