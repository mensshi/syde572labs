function [ grid, probability ] = gridClass( Case )

    classes_in_case = Case.classes_in_case;
        
    grid.MED =  zeros(length( Case.XAxis ),length( Case.YAxis ));
    grid.MICD = zeros(length( Case.XAxis ),length( Case.YAxis ));
    grid.MAP =  zeros(length( Case.XAxis ),length( Case.YAxis ));
    grid.NN =   zeros(length( Case.XAxis ),length( Case.YAxis ));
    grid.kNN =  zeros(length( Case.XAxis ),length( Case.YAxis ));
    
    probability =  zeros(length( Case.classes_in_case ));
     
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
            for k = 1:length( classes_in_case )
                probability(k) = classes_in_case(k).N / Case.total;
            end
            grid.MAP(j,i) = MAP( x, y, classes_in_case, probability );
            
            % NN
            grid.NN(j,i) = NN( x, y, classes_in_case );
            
            % kNN
            grid.kNN(j,i) = kNN( x, y, classes_in_case );
            
        end
    end
end