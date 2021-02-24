function [ grid, probability, pdf ] = gridClass( Case )

    classes_in_case = Case.classes_in_case;
        
    grid.MED =  zeros(length( Case.XAxis ),length( Case.YAxis ));
    grid.MICD = zeros(length( Case.XAxis ),length( Case.YAxis ));
    grid.MAP =  zeros(length( Case.XAxis ),length( Case.YAxis ));
    grid.NN =   zeros(length( Case.XAxis ),length( Case.YAxis ));
    grid.kNN =  zeros(length( Case.XAxis ),length( Case.YAxis ));
    
    probability = zeros(length( Case.classes_in_case ));
    pdf = cell(length( Case.classes_in_case ));
     
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
            for k = 1:length( Case.classes_in_case )
                distribution_func = mvnpdf( Case.X, classes_in_case(k).mu', classes_in_case(k).sigma );
                distribution_func = reshape( distribution_func, length( Case.XAxis ), length( Case.YAxis ) );
                pdf{k} = distribution_func;
            end
            
            probability = getProbability( classes_in_case, Case.total );  
            grid.MAP(j,i) = MAP( x, y, classes_in_case, i, j, probability, pdf );
            
            % NN
            grid.NN(j,i) = NN( x, y, classes_in_case );
            
            % kNN
            grid.kNN(j,i) = kNN( x, y, classes_in_case );
            
        end
    end
end

%% Helper Function
function probability = getProbability( classes_in_case, total )
    
    %% Case 1
    if length( classes_in_case ) == 2
        probability.A = classes_in_case(1).N / total;
        probability.B = classes_in_case(2).N / total;
        
        probability.threshold = log( probability.A / probability.B );
        
    %% Case 2
    else
        probability.C = classes_in_case(1).N / total;
        probability.D = classes_in_case(2).N / total;
        probability.E = classes_in_case(3).N / total;
        
    end
end