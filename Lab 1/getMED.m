function dist = getMED( x, y, class )
    dx = x - class.mu(1);
    dy = y - class.mu(2);
    dist = sqrt( dx^2 + dy^2 );
end