function errorSD( SD )
    total = size( SD.A.samples, 2 ) + size( SD.B.samples, 2 );

    J_errors = zeros( 5, 4 );
    J_errors_undetermined = zeros( 5, 4 );
    for J = 1:5
        error_rates = zeros( 1, 20 );
        error_rates_undetermined = zeros( 1, 20 );
        
        for i = 1:20
            A = SD.A.samples;
            B = SD.B.samples;
            SC = getSC( A, B, J );
            
            for j = 1:size( SC, 2 )
                G = SC(j);
                pnt_A = G.pnt_A;
                pnt_B = G.pnt_B;
               
                if G.n_a_B == 0
                    B = applyG( B, pnt_A, pnt_B, 2 );
                end

                if G.n_b_A == 0
                    A = applyG( A, pnt_A, pnt_B, 1 );
                end
            end
            
            error_rates_undetermined(i) = size(A,1) + size(B,1);
            
            if SC(end).n_a_B == 0
                error_rates(i) = size(B,1);
            else
                error_rates(i) = size(A,1);
            end
            
        end
        avg_e = sum(error_rates) / 20 / total;
        min_e = min(error_rates) / total;
        max_e = max(error_rates) / total;
        std_e = std(error_rates) / total;
        J_errors(J,:) = [ avg_e, min_e, max_e, std_e ];
        
        avg_e_undetermined = sum(error_rates_undetermined) / 20 / total;
        min_e_undetermined = min(error_rates_undetermined) / total;
        max_e_undetermined = max(error_rates_undetermined) / total;
        std_e_undetermined = std(error_rates_undetermined) / total;
        J_errors_undetermined(J,:) = [ avg_e_undetermined, min_e_undetermined, max_e_undetermined, std_e_undetermined ];
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
    
    figure
    plot( X, J_errors_undetermined(:,1) );
    hold on
    plot( X, J_errors_undetermined(:,2) );
    plot( X, J_errors_undetermined(:,3) );
    plot( X, J_errors_undetermined(:,4) );
    
    title( 'Error Rates of Varying J values (Undetermined)' );
    legend( 'Average', 'Minimum', 'Maximum', 'Standard Deviation' );
    
    
end