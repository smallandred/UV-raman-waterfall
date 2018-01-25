function ReturnedMatrix = removeladder( inputSpectra, period, height )
%REMOVELADDER Remove the 200*index background created for 2d plotting and
%generates a 3d mesh plot.
%
%input params:
%   inputSpectra: a matrix from processkinetics command.

%output params:
%   ReturnedMatrix: a matrix with ladder removed .

spectraSize = size(inputSpectra);
ReturnedMatrix = zeros(spectraSize);
ReturnedMatrix(:,1) = inputSpectra(:,1);

columnCount = spectraSize(2);

if height == 0
    height = 200;
end

for i = 2:columnCount
    ReturnedMatrix(:,i) = inputSpectra(:,i)-height*i;

end

figure('color', [1,1,1]);
mesh(((2:columnCount)-2)*period,inputSpectra(:,1),ReturnedMatrix(:,2:columnCount), 'LineStyle','none','EdgeLighting','flat',...
    'FaceLighting','none',...
    'LineStyle','none',...
    'FaceColor','interp',...
    'EdgeColor','interp');
shading interp;
axis([0, (columnCount-2)*period,1300, 1700]);
view(90,90);

%colorbar('peer','EastOutside');
colormapeditor

