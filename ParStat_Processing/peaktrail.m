function trail = peaktrail(spectra, peakpos)

wavenumber = spectra(:,1);
kinetic_length = length(spectra(1,:))-1;
trail = zeros(1,kinetic_length);

dataindex = max(find(wavenumber < (peakpos+1) & wavenumber > (peakpos-1)));

for i = 1:kinetic_length
    max_value = max(spectra(dataindex-20:dataindex+20,i+1));
    max_index = find(spectra(:,i+1) == max_value);
    trail(i) = spectra(max_index, 1);
end