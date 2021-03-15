function [ ME1D, ME2D, SD ] = loadData()

    %% Load raw data
    load('lab2_1.mat');
    ME1D.A.samples = a';
    ME1D.B.samples = b';
    
    % L = learning set; T = testing set;
    load('lab2_2.mat');
    ME2D.L.A.samples = al;
    ME2D.L.B.samples = bl;
    ME2D.L.C.samples = cl;
    ME2D.T.A.samples = at;
    ME2D.T.B.samples = bt;
    ME2D.T.C.samples = ct;
    
    load('lab2_3.mat');
    SD.A.samples = a;
    SD.B.samples = b;
        
    %% Set plot data
    
    % ME1D
    ME1D.X = linspace( 0, 10 ); % just hard coded
    
    ME1D.fig = figure;
    sgtitle( 'Model Estimation 1D' )
    
    ME1D.sub1 = subplot(1,2,1);
    set(0, 'DefaultLineLineWidth', 2);
    area( ME1D.X, normpdf( ME1D.X, 5, 1 ) ); % true distribution; values from lab
    hold on;
    title( 'Class A' )
    xlabel( 'x1' );
    ylabel( 'x2' );
    
    ME1D.sub2 = subplot(1,2,2);
    set(0, 'DefaultLineLineWidth', 2);
    area( ME1D.X, exppdf( ME1D.X, 1 ) ); % true distribution; values from lab
    hold on;
    title( 'Class B' )
    xlabel( 'x1' );
    ylabel( 'x2' );

    %ME2D
    L = ME2D.L;
    ME2D.fig = figure;
    
    plot( L.A.samples(:,1), L.A.samples(:,2), 'b.' );
    hold on
    plot( L.B.samples(:,1), L.B.samples(:,2), 'r.' );
    plot( L.C.samples(:,1), L.C.samples(:,2), 'g.' );
    
    title( 'Model Estimation 2D' )
    xlabel( 'x1' );
    ylabel( 'x2' );
    axis equal
    pbaspect([1 1 1])
    
    [ ME2D.X, ME2D.Y, ME2D.Meshgrid ] = getPlotData(gca);

    % SD
    SD.fig = figure;
    
    plot( SD.A.samples(:,1), SD.A.samples(:,2), 'b.' );
    hold on
    plot( SD.B.samples(:,1), SD.B.samples(:,2), 'r.' );
    
    title( 'Sequential Discriminants' )
    xlabel( 'x1' );
    ylabel( 'x2' );
    axis equal
    pbaspect([1 1 1])
    
    [ SD.X, SD.Y, SD.Meshgrid ] = getPlotData(gca);

end

%% Helper functions

function [ XAxis, YAxis, X ] = getPlotData( axes )

    XAxis = axes.XLim(1): (axes.XLim(2)-axes.XLim(1))/100 :axes.XLim(2);
    YAxis = axes.YLim(1): (axes.YLim(2)-axes.YLim(1))/100 :axes.YLim(2);
    [X1, X2] = meshgrid(XAxis, YAxis);
    X = [X1(:) X2(:)];
    
end