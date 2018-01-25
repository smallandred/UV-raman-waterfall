function processed = processssitkauv(filename)

%Process the UV-Raman O2 / N2 gas exchange data

rawData = csvread(filename);

i = 0;
while rawData(1,(i+2)) > 10 && i < 180
    i = i + 1;
end

spectraNum = i;

%data format: time, oxygen, nitrogen, degree of exchange
processed = zeros(spectraNum, 4);
processed(:,1) = (-15:5:(5 * (spectraNum - 1) - 15));

i = 1;
while rawData(1,(i+1)) > 10 && i < 180
    oxygenHeight = getGasHeight( rawData, 1550, (i+1) );
    processed(i,2) = oxygenHeight;
    nitrogenHeight = getGasHeight( rawData, 2320, (i+1) );
    processed(i,3) = nitrogenHeight;
    
    degOfExchg = nitrogenHeight*1.94/(nitrogenHeight*1.94 + oxygenHeight);
    processed(i,4) = degOfExchg;
    i = i + 1;
end

