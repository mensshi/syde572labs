function est = MICD2( x, y, C, D, E )
    est = 0;
    distC = getMICD( x, y, C);
    distD = getMICD( x, y, D);
    distE = getMICD( x, y, E);
    
    diffCD = distC - distD;
    diffDE = distD - distE;
    diffEC = distE - distC;

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