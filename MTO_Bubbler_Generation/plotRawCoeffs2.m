function processed = plotRawCoeffs2( coeffList, peakCount )

classCoeff = classifyCoeffs2( coeffList );

processed = plotClassifiedCoeffs( classCoeff, peakCount );