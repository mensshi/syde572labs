% MICD classifier for case 1

function est = MICD1( x, y, A, B )
    est = 0;
    distA = getMICD( x, y, A);
    distB = getMICD( x, y, B);

    if (distA < distB)
        est = 1;
    elseif (distA > distB)
        est = 2;
    end
end
