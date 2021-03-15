function plotData( ME1D, ME2D, SD )
    %% Model Estimation 1D
    X = ME1D.X;
    figure( ME1D.fig );
    
    subplot( ME1D.sub1 );
    plot( X, normpdf( X, ME1D.A.PE_G.mu, ME1D.A.PE_G.sigma ) )
    plot( X, exppdf( X, ME1D.A.PE_E ) )
    yline( ME1D.A.PE_U, 'LineWidth', 2 )
    plot( X, ME1D.A.NPE1 )
    plot( X, ME1D.A.NPE2 )
    legend( 'True', 'PE - Gaussian', 'PE - Exponential', 'PE - Uniform', 'NPE - Parzan 0.1', 'NPE - Parzen 0.4' );
    
    subplot( ME1D.sub2 );
    plot( X, normpdf( X, ME1D.B.PE_G.mu, ME1D.B.PE_G.sigma ) )
    plot( X, exppdf( X, ME1D.B.PE_E ) )
    yline( ME1D.B.PE_U, 'LineWidth', 2 )
    plot( X, ME1D.B.NPE1 )
    plot( X, ME1D.B.NPE2 )
    legend( 'True', 'PE - Gaussian', 'PE - Exponential', 'PE - Uniform', 'NPE - Parzan 0.1', 'NPE - Parzen 0.4' );
    
    %% Model Estimation 2D
    X = ME2D.X;
    Y = ME2D.Y;
    L = ME2D.L;
    
    figure( ME2D.fig );
%     contour( X, Y, ME2D.Grid.PE );
    legend();
    
    %% Sequential Discriminants
end