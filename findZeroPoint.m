function zeroIndex  = findZeroPoint(data, zeroPoint)

zeroIndex = 1;
 while (data(zeroIndex)) < zeroPoint
     zeroIndex = zeroIndex + 1;
 end