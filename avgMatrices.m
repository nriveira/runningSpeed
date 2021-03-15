function spectra = avgMatrices(inputSpectra)
% Average the matrices across 
    spectra = [];
    
    for i = 1:length(inputSpectra)
        spectra = [spectra inputSpectra{i}];
    end
    
    spectra = mean(spectra, 2);
end