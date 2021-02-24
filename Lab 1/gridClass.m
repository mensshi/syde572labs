function grid = gridClass( Case )
        
    grid.MED =  zeros(length( Case.XAxis ),length( Case.YAxis ));
    grid.MICD = zeros(length( Case.XAxis ),length( Case.YAxis ));
    grid.MAP =  zeros(length( Case.XAxis ),length( Case.YAxis ));
    grid.NN =   zeros(length( Case.XAxis ),length( Case.YAxis ));
    grid.kNN =  zeros(length( Case.XAxis ),length( Case.YAxis ));
     
    for i = 1:length( Case.XAxis )
        for j = 1:length( Case.YAxis )
            
            % coordinates for every point in a case
            x = Case.XAxis(i);
            y = Case.YAxis(j);
            
            % MED
            grid.MED(j,i) = MED( x, y, Case.classes_in_case );
            
            % MICD
            grid.MICD(j,i) = MICD( x, y, Case.classes_in_case );
            
            % MAP
            grid.MAP(j,i) = MAP( x, y, Case.classes_in_case );
            
            % NN
            grid.NN(j,i) = NN( x, y, Case.classes_in_case );
            
            % kNN
            grid.kNN(j,i) = kNN( x, y, Case.classes_in_case );
            
        end
    end
end