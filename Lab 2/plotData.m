function plotData( ME1D, ME2D )
    %% Model Estimation 1D
    X = ME1D.X;
    Grid_A = ME1D.A.Grid;
    Grid_B = ME1D.B.Grid;
    figure( ME1D.fig );
    
    subplot( ME1D.sub1 );
    area( X, Grid_A.true );
    hold on
    plot( X, Grid_A.PE_G )
    plot( X, Grid_A.PE_E )
    yline( ME1D.A.PE_U, 'LineWidth', 2 )
    plot( X, Grid_A.NPE1 )
    plot( X, Grid_A.NPE2 )
    legend( 'True', 'PE - Gaussian', 'PE - Exponential', 'PE - Uniform', 'NPE - Parzan 0.1', 'NPE - Parzen 0.4' );
    
    subplot( ME1D.sub2 );
    area( X, Grid_B.true );
    hold on
    plot( X, Grid_B.PE_G )
    plot( X, Grid_B.PE_E )
    yline( ME1D.B.PE_U, 'LineWidth', 2 )
    plot( X, Grid_B.NPE1 )
    plot( X, Grid_B.NPE2 )
    legend( 'True', 'PE - Gaussian', 'PE - Exponential', 'PE - Uniform', 'NPE - Parzan 0.1', 'NPE - Parzen 0.4' );
    
    %% Model Estimation 2D
    X = ME2D.X;
    Y = ME2D.Y;
    L = ME2D.L;
    
    figure( ME2D.fig );
%     contour( X, Y, ME2D.Grid.PE );
    legend();
end