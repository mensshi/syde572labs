function plotGrid( classes, cases )

    A = classes(1);
    B = classes(2);
    C = classes(3);
    D = classes(4);
    E = classes(5);
    
    C1 = cases(1);
    C2 = cases(2);
    
    %% Case 1 - 1
    
    figure
    plot( A.X1, A.X2, 'b.' )
    hold on
    plot( B.X1, B.X2, 'r.' )
    contour( C1.X1, C1.X2, C1.Grid.MED, [0 0], 'k' )
    contour( C1.X1, C1.X2, C1.Grid.MICD, [0 0], 'k--' )
    contour( C1.X1, C1.X2, C1.Grid.MAP, [0 0], 'm:' )
    
    plot( A.stdContour.X, A.stdContour.Y, 'b', 'MarkerSize', 3 )
    plot( B.stdContour.X, B.stdContour.Y, 'r', 'MarkerSize', 3 )

    title( 'A B (MED, MICD, MAP)' );
    xlabel( 'x1' );
    ylabel( 'x2' );
    legend( 'A', 'B', 'MED', 'MICD' );
    axis equal
    
    %% Case 2 - 1
    
    figure
    plot( C.X1, C.X2, 'b.' )
    hold on
    plot( D.X1, D.X2, 'r.' )
    plot( E.X1, E.X2, 'g.' )
    
%     contour( C2.X1, C2.X2, C2.Grid.MED, [0 0], 'k' )
%     contour( C2.X1, C2.X2, C2.Grid.MICD, [0 0], 'k--' )
%     contour( C2.X1, C2.X2, C2.Grid.MAP, [0 0], 'm:' )
    
    surf( C2.X1, C2.X2, C2.Grid.MED )
    
    plot( C.stdContour.X, C.stdContour.Y, 'b')
    plot( D.stdContour.X, D.stdContour.Y, 'r', 'MarkerSize', 3 )
    plot( E.stdContour.X, E.stdContour.Y, 'g', 'MarkerSize', 3 )

    title( 'C D E (MED, MICD, MAP)' );
    xlabel( 'x1' );
    ylabel( 'x2' );
    legend( 'C', 'D', 'E', 'MED', 'MICD' );
    axis equal
    
end