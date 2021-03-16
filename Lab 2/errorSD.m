function errorSD( SD )
    total = size( SD.A.samples, 2 ) + size( SD.B.samples, 2 );

    J_errors = zeros( 5, 4 );
    for J = 1:5
        error_rates = zeros( 1, 20 );
        for i = 1:20
            A = SD.A.samples;
            B = SD.B.samples;
            SC = getSC( A, B, J );

            G = SC( size( SC, 2 ) );
            error_rates(i) = G.errors;
        end
        avg_e = sum(error_rates) / 20 / total;
        min_e = min(error_rates) / total;
        max_e = max(error_rates) / total;
        std_e = std(error_rates) / total;
        error_rates
        J_errors(J,:) = [ avg_e, min_e, max_e, std_e ];
    end
    
    figure
    X = 1:1:5;
    plot( X, J_errors(:,1) );
    hold on
    plot( X, J_errors(:,2) );
    plot( X, J_errors(:,3) );
    plot( X, J_errors(:,4) );
    
    title( 'Error Rates of Varying J values' );
    legend( 'Average', 'Minimum', 'Maximum', 'Standard Deviation' );
    
    
end