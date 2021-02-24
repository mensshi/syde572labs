function est = MED1( x, y, A, B)
    est = 0;
    distA = pdist( [ x y; A.mu(1) A.mu(2) ], 'euclidean' );
    distB = pdist( [ x y; B.mu(1) B.mu(2) ], 'euclidean' );

    if (distA < distB)
        est = 1;
    elseif (distA > distB)
        est = 2;
    end
end