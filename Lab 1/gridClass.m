function [ grid, classes_in_case, threshold ] = gridClass( Case )

    classes_in_case = Case.classes_in_case;
        
    grid.MED =  zeros(length( Case.XAxis ),length( Case.YAxis ));
    grid.MICD = zeros(length( Case.XAxis ),length( Case.YAxis ));
    grid.MAP =  zeros(length( Case.XAxis ),length( Case.YAxis ));
    grid.NN =   zeros(length( Case.XAxis ),length( Case.YAxis ));
    grid.kNN =  zeros(length( Case.XAxis ),length( Case.YAxis ));
     
    %% Case 1
    if length( classes_in_case ) == 2
                
        classes_in_case(1).probability = classes_in_case(1).N / Case.total;
        classes_in_case(2).probability = classes_in_case(2).N / Case.total;

        threshold = getThreshold( classes_in_case(1), classes_in_case(2) );

    %% Case 2
    else
        classes_in_case(1).probability = classes_in_case(1).N / Case.total;
        classes_in_case(2).probability = classes_in_case(2).N / Case.total;
        classes_in_case(3).probability = classes_in_case(3).N / Case.total;

        threshold.C_D = getThreshold( classes_in_case(1), classes_in_case(2) );
        threshold.D_E = getThreshold( classes_in_case(2), classes_in_case(3) );
        threshold.E_C = getThreshold( classes_in_case(3), classes_in_case(1) );

    end
            
    % classify grid
    for i = 1:length( Case.XAxis )
        for j = 1:length( Case.YAxis )
            
            % coordinates for every point in a case
            x = Case.XAxis(i);
            y = Case.YAxis(j);
            
            % MED
            grid.MED(j,i) = MED( x, y, classes_in_case );
            
            % MICD
            grid.MICD(j,i) = MICD( x, y, classes_in_case );
            
            % MAP            
            grid.MAP(j,i) = MAP( x, y, classes_in_case, threshold );
            
            % NN
            grid.NN(j,i) = NN( x, y, classes_in_case );
            
            % kNN
            grid.kNN(j,i) = kNN( x, y, classes_in_case );
            
        end
    end
end

%% Helper Function

% greater class is assigned label if greater than threshold
% lesser class is assigned label is lower than threshold
function threshold = getThreshold( greater_class, lesser_class )
    g_prob = greater_class.probability;
    g_det =     greater_class.det;
    
    l_prob =    lesser_class.probability;
    l_det = 	lesser_class.det;
    
    threshold = 2 * log( l_prob * sqrt(g_det) / g_prob / sqrt(l_det) ) ;
end
