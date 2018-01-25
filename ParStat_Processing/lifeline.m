function returnedkinetics = lifeline(spectra, watchlist)

listlength = length(watchlist);
%legendlist = num2str( watchlist);
kineticlength = length(spectra(1,:))-1;
wavenumber = spectra(:,1);
figure;
colormap hot;
colorseries = colormap;

returnedkinetics = zeros(listlength, kineticlength+1);

for i = 1:listlength
    current_dataindex = max(find(wavenumber < watchlist(i) & wavenumber > (watchlist(i)-2)));
    returnedkinetics(i,1) = watchlist(i);
    returnedkinetics(i,2:(kineticlength+1)) = spectra(current_dataindex, 2:(kineticlength+1));
    
    hold on;
    hplot = plot((1:1:length(spectra(1,:))-1)*15, returnedkinetics(i,2:(kineticlength+1)),'LineWidth', 3, 'color', colorseries(i*6, :));
    %legend(legendlist(i));
    hold on;
    
end




    