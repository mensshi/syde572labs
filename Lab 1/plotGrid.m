function plotGrid( classes, cases )

    A = classes(1);
    B = classes(2);
    C = classes(3);
    D = classes(4);
    E = classes(5);
    
    C1 = cases(1);
    C2 = cases(2);
    
    %% Case 1 - Dist 
    
    figure
    plot( A.X1, A.X2, 'b.' )
    hold on
    plot( B.X1, B.X2, 'r.' )
    contour( C1.X1, C1.X2, C1.Grid.MED, 1, 'k:', 'LineWidth', 1.5 )
    contour( C1.X1, C1.X2, C1.Grid.MICD, 1, 'c', 'LineWidth', 1.5 )
    contour( C1.X1, C1.X2, C1.Grid.MAP, 1, 'm--', 'LineWidth', 1.5 )
    
    plot( A.stdContour.X, A.stdContour.Y, 'b', 'MarkerSize', 3 )
    plot( B.stdContour.X, B.stdContour.Y, 'r', 'MarkerSize', 3 )

    title( 'A B (MED, MICD, MAP)' );
    xlabel( 'x1' );
    ylabel( 'x2' );
    legend( 'A', 'B', 'MED', 'MICD', 'MAP' );
    axis equal
    pbaspect([1 1 1])
    
    %% Case 1 - NN
    
    figure
    plot( A.X1, A.X2, 'b.' )
    hold on
    plot( B.X1, B.X2, 'r.' )
    contour( C1.X1, C1.X2, C1.Grid.NN, 2, 'k', 'LineWidth', 1.5 )
    
    plot( A.stdContour.X, A.stdContour.Y, 'b', 'MarkerSize', 3 )
    plot( B.stdContour.X, B.stdContour.Y, 'r', 'MarkerSize', 3 )

    title( 'A B (NN)' );
    xlabel( 'x1' );
    ylabel( 'x2' );
    legend( 'A', 'B', 'NN' );
    axis equal
    pbaspect([1 1 1])
    
    %% Case 1 - kNN
    
    figure
    plot( A.X1, A.X2, 'b.' )
    hold on
    plot( B.X1, B.X2, 'r.' )
    contour( C1.X1, C1.X2, C1.Grid.kNN, 2, 'k', 'LineWidth', 1.5 )
    
    plot( A.stdContour.X, A.stdContour.Y, 'b', 'MarkerSize', 3 )
    plot( B.stdContour.X, B.stdContour.Y, 'r', 'MarkerSize', 3 )

    title( 'A B (kNN)' );
    xlabel( 'x1' );
    ylabel( 'x2' );
    legend( 'A', 'B', 'kNN' );
    axis equal
    pbaspect([1 1 1])
    
    %% Case 2 - Dist
    
    figure
    plot( C.X1, C.X2, 'b.' )
    hold on
    plot( D.X1, D.X2, 'r.' )
    plot( E.X1, E.X2, 'g.' )
    
    contour( C2.X1, C2.X2, C2.Grid.MED, 2, 'k:', 'LineWidth', 1.5 )
    contour( C2.X1, C2.X2, C2.Grid.MICD, 2, 'c', 'LineWidth', 1.5 )
    contour( C2.X1, C2.X2, C2.Grid.MAP, 2, 'm--', 'LineWidth', 1.5 )
    
    plot( C.stdContour.X, C.stdContour.Y, 'b', 'MarkerSize', 3 )
    plot( D.stdContour.X, D.stdContour.Y, 'r', 'MarkerSize', 3 )
    plot( E.stdContour.X, E.stdContour.Y, 'g', 'MarkerSize', 3 )

    title( 'C D E (MED, MICD, MAP)' );
    xlabel( 'x1' );
    ylabel( 'x2' );
    legend( 'C', 'D', 'E', 'MED', 'MICD', 'MAP' );
    axis equal
    pbaspect([1 1 1])
    
    %% Case 2 - NN
    
    figure
    plot( C.X1, C.X2, 'b.' )
    hold on
    plot( D.X1, D.X2, 'r.' )
    plot( E.X1, E.X2, 'g.' )
    
    contour( C2.X1, C2.X2, C2.Grid.NN, 2, 'k', 'LineWidth', 1.5 )
    
    plot( C.stdContour.X, C.stdContour.Y, 'b', 'MarkerSize', 3 )
    plot( D.stdContour.X, D.stdContour.Y, 'r', 'MarkerSize', 3 )
    plot( E.stdContour.X, E.stdContour.Y, 'g', 'MarkerSize', 3 )

    title( 'C D E (NN)' );
    xlabel( 'x1' );
    ylabel( 'x2' );
    legend( 'C', 'D', 'E', 'NN' );
    axis equal
    pbaspect([1 1 1])
    
    %% Case 2 - kNN
    
    figure
    plot( C.X1, C.X2, 'b.' )
    hold on
    plot( D.X1, D.X2, 'r.' )
    plot( E.X1, E.X2, 'g.' )
    
    contour( C2.X1, C2.X2, C2.Grid.kNN, 2, 'k', 'LineWidth', 1.5 )
    
    plot( C.stdContour.X, C.stdContour.Y, 'b', 'MarkerSize', 3 )
    plot( D.stdContour.X, D.stdContour.Y, 'r', 'MarkerSize', 3 )
    plot( E.stdContour.X, E.stdContour.Y, 'g', 'MarkerSize', 3 )

    title( 'C D E (kNN)' );
    xlabel( 'x1' );
    ylabel( 'x2' );
    legend( 'C', 'D', 'E', 'kNN' );
    axis equal
    pbaspect([1 1 1])
    
end