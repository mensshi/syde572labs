% MAP Classifier

function est = MAP( x, y, classes_in_case, i, j, probability, pdf )
    est = 0;
    
    %% Case 1
    if length(classes_in_case) == 2
        A = classes_in_case(1);
        B = classes_in_case(2);
        
        % testing case where you cannot get easily get the pre-calculated
        % pdf values
        if i == -1 && j == -1
            p_x_A = mvnpdf( [x, y], A.mu', A.sigma );
            p_x_B = mvnpdf( [x, y], B.mu', B.sigma );
        else
            p_x_A = pdf{1}(j,i);
            p_x_B = pdf{2}(j,i);
        end
        
        I = log( p_x_A / p_x_B );
        
        if I > probability.threshold
            est = 1;
        elseif I < probability.threshold
            est = 2;
        end
        
    %% Case 2
    else
        C = classes_in_case(1);
        D = classes_in_case(2);
        E = classes_in_case(3);
        
        % testing case where you cannot get easily get the pre-calculated
        % pdf values
        if i == -1 && j == -1
            p_x_C = mvnpdf( [x, y], C.mu', C.sigma );
            p_x_D = mvnpdf( [x, y], D.mu', D.sigma );
            p_x_E = mvnpdf( [x, y], E.mu', E.sigma );
        else
            p_x_C = pdf{1}(j,i);
            p_x_D = pdf{2}(j,i);
            p_x_E = pdf{3}(j,i);
        end
        
        p_c = p_x_C / probability.C;
        p_d = p_x_D / probability.D;
        p_e = p_x_E / probability.E;
        
        diffPCD = p_c - p_d;
        diffPDE = p_d - p_e;
        diffPEC = p_e - p_c;
        
        if      diffPCD == 0 && p_e > p_c
            est = 3;
        elseif  diffPDE == 0 && p_c > p_d
            est = 1;
        elseif  diffPEC == 0 && p_d > p_e
            est = 2;

        % Finds min
        elseif  p_c > p_d && p_c > p_e
            est = 1;
        elseif  p_d > p_c && p_d > p_e
            est = 2;
        elseif  p_e > p_c && p_e > p_d
            est = 3;

        % Else est = 0
        end
        
    end
end