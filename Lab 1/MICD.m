% MICD classifier

function est = MICD( x, y, classes_in_case)
    est = 0;
    
    %% Case 1
    if length(classes_in_case) == 2
        
        dist_A = getMICD( x, y, classes_in_case(1) );
        dist_B = getMICD( x, y, classes_in_case(2) );

        if (dist_A < dist_B)
            est = 1;
        elseif (dist_A > dist_B)
            est = 2;
        end
        
    %% Case 2
    else
       
        dist_C = getMICD( x, y, classes_in_case(1) );
        dist_D = getMICD( x, y, classes_in_case(2) );
        dist_E = getMICD( x, y, classes_in_case(3) );

        % Finds min
        % Covers cases with 0 diff, but closer to third
        if  dist_C < dist_D && ( dist_C < dist_E || dist_D - dist_E == 0 )
            est = 1;
        elseif  dist_D < dist_E && ( dist_D < dist_C || dist_E - dist_C == 0 )
            est = 2;
        elseif  dist_E < dist_C && ( dist_E < dist_D || dist_C - dist_D == 0 )
            est = 3;

        % Else est = 0
        end
    end
end

%% Helper functions
function dist = getMICD( x, y, class )
    diff = [x y]' - class.mu;
    dist = (diff'*class.invSigma*diff)^(1/2);
end