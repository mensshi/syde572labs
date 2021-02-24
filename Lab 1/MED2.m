function est = MED2( x, y, C, D, E )
    est = 0;
    distC = pdist( [ x y; C.mu(1) C.mu(2) ], 'euclidean' );
    distD = pdist( [ x y; D.mu(1) D.mu(2) ], 'euclidean' );
    distE = pdist( [ x y; E.mu(1) E.mu(2) ], 'euclidean' );
    
    diffCD = distC-distD;
    diffDE = distD-distE;
    diffEC = distC-distE;
    
    % Covers cases with 0 diff, but closer to third
    if      diffCD == 0 && distE < distC
        est = 5;
    elseif  diffDE == 0 && distC < distD
        est = 3;
    elseif  diffEC == 0 && distD < distE
        est = 4;

    % Finds min
    elseif  distC < distD && distC < distE
        est = 3;
    elseif  distD < distC && distD < distE
        est = 4;
    elseif  distE < distC && distE < distD
        est = 5;

    % Else est = 0
    end
end