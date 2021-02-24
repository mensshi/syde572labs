function est = MED1( x, y, A, B)
    est = 0;
    distA = getMED( x, y, A);
    distB = getMED( x, y, B);

    if (distA < distB)
        est = 1;
    elseif (distA > distB)
        est = 2;
    end
end