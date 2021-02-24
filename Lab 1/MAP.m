% MAP Classifier

function est = MAP( x, y, classes_in_case, probability )
    est = 0;
    
    %% Case 1
    if length(classes_in_case) == 2
        A = classes_in_case(1);
        B = classes_in_case(2);

        threshold = log( probability(2) / probability(1) );
        
        p_x_A = mvnpdf( [x, y], A.mu', A.sigma );
        p_x_B = mvnpdf( [x, y], B.mu', B.sigma );
        
        I = log( p_x_A / p_x_B );
        
        if I > threshold
            est = 1;
        elseif I < threshold
            est = 2;
        end
        
    %% Case 2
    else
        C = classes_in_case(1);
        D = classes_in_case(2);
        E = classes_in_case(3);
    end
end