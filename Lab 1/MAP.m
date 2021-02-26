% MAP Classifier

function est = MAP( x, y, classes_in_case, threshold )
    est = 0;
    
    %% Case 1
    if length(classes_in_case) == 2
        A = classes_in_case(1);
        B = classes_in_case(2);
        
        l = l_class( x, y, B ) - l_class( x, y, A );
        
        if l > threshold
            est = 1;
        elseif l < threshold
            est = 2;
        end
        
    %% Case 2
    else
        C = classes_in_case(1);
        D = classes_in_case(2);
        E = classes_in_case(3);
        
        l_C_D = l_class( x, y, D ) - l_class( x, y, C );
        l_D_E = l_class( x, y, E ) - l_class( x, y, D );
        l_E_C = l_class( x, y, C ) - l_class( x, y, E );
                       
        if  l_C_D > threshold.C_D && l_E_C < threshold.E_C
            est = 1;
        elseif  l_D_E > threshold.D_E && l_C_D < threshold.C_D
            est = 2;
        elseif  l_E_C > threshold.E_C && l_D_E < threshold.D_E
            est = 3;

        % Else est = 0
        end
        
    end
end

%% Helper function
% exponent part of p_x_class * -2
function l_class = l_class( x, y, class )
    diff = [x y]' - class.mu;
    l_class = diff' * class.invSigma * diff ;
end