function est = MED2( x, y, C, D, E )
    est = 0;
    distC = getMED( x, y, C);
    distD = getMED( x, y, D);
    distE = getMED( x, y, E);
    diffCD = distC-distD;
    diffDE = distD-distE;
    diffEC = distC-distE;

    % Covers cases with 0 diff, but closer to third
    if      diffCD == 0 && diffE < diffC
        est = 5;
    elseif  diffDE == 0 && diffC < diffD
        est = 3;
    elseif  diffEC == 0 && diffD < diffE
        est = 4;

    % Finds max
    elseif  distC > distD && distC > distE
        est = 3;
    elseif  distD > distC && distD > distE
        est = 4;
    elseif  distE > distC && distE > distD
        est = 5;

    % Else est = 0
    end
end