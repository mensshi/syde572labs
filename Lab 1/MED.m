% MED Classifier

function est = MED( x, y, classes_in_case)
    est = 0;
    
    %% Case 1
    if length(classes_in_case) == 2
        
        dist_A = ( x - classes_in_case(1).mu(1) )^2 + ( y - classes_in_case(1).mu(2) )^2 ;
        dist_B = ( x - classes_in_case(2).mu(1) )^2 + ( y - classes_in_case(2).mu(2) )^2 ;

        if (dist_A < dist_B)
            est = 1;
        elseif (dist_A > dist_B)
            est = 2;
        end
    
    %% Case 2
    else
        
        dist_C = ( x - classes_in_case(1).mu(1) )^2 + ( y - classes_in_case(1).mu(2) )^2 ;
        dist_D = ( x - classes_in_case(2).mu(1) )^2 + ( y - classes_in_case(2).mu(2) )^2 ;
        dist_E = ( x - classes_in_case(3).mu(1) )^2 + ( y - classes_in_case(3).mu(2) )^2 ;

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