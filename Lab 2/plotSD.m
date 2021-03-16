function plotSD( SD )
    for i = 1:size( SD.SC, 2 )       
        SC = SD.SC(i);
        SC = SC{1};
        
        figure
        plot( SD.A.samples(:,1), SD.A.samples(:,2), 'b.' );
        hold on
        plot( SD.B.samples(:,1), SD.B.samples(:,2), 'r.' );

        title( sprintf( 'Sequential Discriminants Classifier %d', i ))
        xlabel( 'x1' );
        ylabel( 'x2' );
        axis equal
        pbaspect([1 1 1])
        
        axes = gca;
        XLim = axes.XLim;
        YLim = axes.YLim;
        leg = cell( 1, 2 + size(SC,2) );
        leg{1} = 'Class A';
        leg{2} = 'Class B';

        for j = 1:size( SC, 2)
            G = SC(j);
            pnt_A = G.pnt_A;
            pnt_B = G.pnt_B;
            slope = pnt_A - pnt_B;
            slope = - slope(1)/slope(2);
            midpnt = ( pnt_A + pnt_B ) / 2;
            left_y = slope* ( XLim(1) - midpnt(1) ) + midpnt(2) ;
            right_y = slope* ( XLim(2) - midpnt(1) ) + midpnt(2) ;
            plot( XLim, [ left_y, right_y ] );
            leg{j+2} = sprintf( 'G %d', j );
        end
        
        axes.XLim = XLim;
        axes.YLim = YLim;
        legend( leg );
    end
end