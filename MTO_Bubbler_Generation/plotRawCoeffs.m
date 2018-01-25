function processed = plotRawCoeffs( coeffList, peakCount )

classCoeff = classifyCoeffs( coeffList );

processed = plotClassifiedCoeffs( classCoeff, peakCount );