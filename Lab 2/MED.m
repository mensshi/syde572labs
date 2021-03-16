function est = MED( point, A, B )
    est = 0;
    x = point(1);
    y = point(2);
    
    dist_A = ( x - A(1) )^2 + ( y - A(2) )^2 ;
    dist_B = ( x - B(1) )^2 + ( y - B(2) )^2 ;

    if (dist_A < dist_B)
        est = 1;
    elseif (dist_A > dist_B)
        est = 2;
    end
end