function plotClassifiers( classes, cases )

    A = classes(1);
    B = classes(2);
    C = classes(3);
    D = classes(4);
    E = classes(5);
    
    %% Case 1
    
    figure
    plot( A.X1, A.X2, 'b.', B.X1, B.X2, 'r.' )
    hold on
    
    axes = gca;
    x1 = axes.XLim(1): (axes.XLim(2)-axes.XLim(1))/100 :axes.XLim(2);
    x2 = axes.YLim(1): (axes.YLim(2)-axes.YLim(1))/100 :axes.YLim(2);
    
    NN = zeros(length(x1),length(x2));
    kNN = zeros(length(x1),length(x2));
    for i = 1:length(x1)
        for j = 1:length(x2)
            point = [ x1(i) x2(j) ];
            [idx, dist1] = knnsearch( A.samples, point, 'Distance', 'euclidean' );
            [idx, dist2] = knnsearch( B.samples, point, 'Distance', 'euclidean' );
            NN(i,j) = dist1 - dist2;
        end
    end
    contour(x1,x2,NN)
%     contour(x1,x2,kNN,[0 0], 'k--')

    title( 'A B (Part 2)' );
    xlabel( 'x1' );
    ylabel( 'x2' );
    legend( 'A', 'B', 'NN', 'kNN');
end

function dist = getDist( point1, point2 )
    dx = point1(1)-point2(1);
    dy = point1(2)-point2(2);
    dist = sqrt( dx^2 + dy^2 );
end