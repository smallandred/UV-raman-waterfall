function processed = cutByX( data, startpoint, endpoint )

%if data(1,1) > data(2,1)
%    reverseFlag = 1;
%else
%    reverseFlag = 0;
%end

dataSize = size(data);
dataLength = dataSize(1);

outputCount = 0;
firstLine = 0;
trigger = 0;

%if reverseFlag == 0
    
    for i = 1:dataLength
        if data(i,1) > startpoint && data(i,1) < endpoint
            outputCount = outputCount + 1;
            if trigger == 0
                firstLine = i;
                trigger = 1;
            end
        end
        
    end
    
    processed = data(firstLine:(firstLine + outputCount - 1), :);
    
    
%else
%    for i = 1:dataLength
%        if data(i,1) > startpoint || data(i,1) < endpoint
%            outputCount = outputCount + 1;
% %            if trigger == 0
%                 firstLine = i;
%                 trigger = 1;
%             end
%         end
%         
%     end
%     
%     processed = data(firstLine:(firstLine + outputCount - 1), :);
%     
% end