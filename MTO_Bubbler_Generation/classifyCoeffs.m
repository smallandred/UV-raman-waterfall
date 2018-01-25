function processed = classifyCoeffs( coeffList )

% Input Params:
    % coeffList : List of Gaussian13 fit coefficients from fitSeries();
% Output Params:
    % processed: an N*9 matrix, whose first column holds time on stream,
        % follwing columns holds intensity-position pairs.

ridges = [1600, 1550, 1526.5, 1480];

coeffSize = size( coeffList );
coeffLength = coeffSize(1);

processed = zeros( coeffLength, 9 );
processed(:,1) = coeffList(:,1);

for i = 1:coeffLength
    
    aromaList = [0,0,0,0,0];
    aromaIndex = 1;
    aromaPosition = 0;
    aromaSum = 0;
    aromaIntensity = 0;
    
    alkeneList = [0,0,0,0,0];
    alkeneIndex = 1;
    alkenePosition = 0;
    alkeneSum = 0;
    alkeneIntensity = 0;
    
    lightList = [0,0,0,0,0];
    lightIndex = 1;
    lightPosition = 0;
    lightSum = 0;
    lightIntensity = 0;
    
    propylList = [0,0,0,0,0];
    propylIndex = 1;
    propylPosition = 0;
    propylSum = 0;
    propylIntensity = 0;
    
    for j = 1:13
        if coeffList(i, 13+j) > ridges(1)
            aromaList(aromaIndex) = j;
            aromaIndex = aromaIndex + 1;
            aromaIntensity = aromaIntensity + coeffList(i,j);
            aromaSum = aromaSum + coeffList(i,j) * coeffList(i,j+13);
        else
            if coeffList(i, 13+j) > ridges(2)
                alkeneList(alkeneIndex) = j;
                alkeneIndex = alkeneIndex + 1;
                alkeneIntensity = alkeneIntensity + coeffList(i,j);
                alkeneSum = alkeneSum + coeffList(i,j) * coeffList(i,j+13);
            else
                if coeffList(i, 13+j) > ridges(3)
                    lightList(lightIndex) = j;
                    lightIndex = lightIndex + 1;
                    lightIntensity = lightIntensity + coeffList(i,j);
                    lightSum = lightSum + coeffList(i,j) * coeffList(i,j+13);
                else
                    if coeffList(i, 13+j) > ridges(4)
                        propylList(propylIndex) = j;
                        propylIndex = propylIndex + 1;
                        propylIntensity = propylIntensity + coeffList(i,j);
                        propylSum = propylSum + coeffList(i,j) * coeffList(i,j+13);

                    end
                end
            end
        end
    end
    
    aromaPosition = aromaSum / aromaIntensity;
    processed(i,2) = aromaIntensity;
    processed(i,3) = aromaPosition;
    
    if aromaIndex == 1
        processed(i,3) = 1615;
        processed(i,2) = 10;
    end
    
    alkenePosition = alkeneSum / alkeneIntensity;
    processed(i,4) = alkeneIntensity;
    processed(i,5) = alkenePosition;
    
    if alkeneIndex == 1
        processed(i,5) = 1575;
        processed(i,4) = 10;
    end
    
    lightPosition = lightSum/ lightIntensity;
    processed(i,6) = lightIntensity;
    processed(i,7) = lightPosition;
    
    if lightIndex == 1
        processed(i,7) = 1545;
        processed(i,6) = 10;
    end
    
    propylPosition = propylSum / propylIntensity;
    processed(i,8) = propylIntensity;
    processed(i,9) = propylPosition;
    
    if propylIndex == 1
        processed(i,9) = 1505;
        processed(i,8) = 10;
    end
end