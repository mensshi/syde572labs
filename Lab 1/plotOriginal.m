function cases = plotOriginal( classes )

    A = classes(1);
    B = classes(2);
    C = classes(3);
    D = classes(4);
    E = classes(5);

    %% Case 1
    figure
    plot( A.X1, A.X2, 'b.' )
    hold on
    plot( B.X1, B.X2, 'r.' )
    
    plot( A.stdContour.X, A.stdContour.Y, 'b', 'MarkerSize', 3 )
    plot( B.stdContour.X, B.stdContour.Y, 'r', 'MarkerSize', 3 )

    title( 'A B (Original)' );
    xlabel( 'x1' );
    ylabel( 'x2' );
    legend( 'A', 'B' );
    axis equal
    pbaspect([1 1 1])
    
    axes1 = gca;

    %% Case 2
    figure
    plot( C.X1, C.X2, 'b.', D.X1, D.X2, 'r.', E.X1, E.X2, 'g.' )
    hold on
    plot( D.X1, D.X2, 'r.' )
    plot( E.X1, E.X2, 'g.' )
    
    plot( C.stdContour.X, C.stdContour.Y, 'b', 'MarkerSize', 3 )
    plot( D.stdContour.X, D.stdContour.Y, 'r', 'MarkerSize', 3 )
    plot( E.stdContour.X, E.stdContour.Y, 'g', 'MarkerSize', 3 )
 
    title( 'C D E (Original)' );
    xlabel( 'x1' );
    ylabel( 'x2' );
    legend( 'C', 'D', 'E' );
    axis equal
    pbaspect([1 1 1])
    
    axes2 = gca;
    
    %% Return
    cases = [ getPlotData( axes1 ), getPlotData( axes2 ) ];
    
end

%% Helper functions

function data = getPlotData( axes )

    data.XAxis = axes.XLim(1): (axes.XLim(2)-axes.XLim(1))/100 :axes.XLim(2);
    data.YAxis = axes.YLim(1): (axes.YLim(2)-axes.YLim(1))/100 :axes.YLim(2);
    [data.X1, data.X2] = meshgrid(data.XAxis, data.YAxis);
    data.X = [data.X1(:) data.X2(:)];
    
end