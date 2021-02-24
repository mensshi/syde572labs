function cases = gridClass( classes, cases )

	A = classes(1);
    B = classes(2);
    C = classes(3);
    D = classes(4);
    E = classes(5);

    %% Set up for each case
    for i = 1:2             
        cases(i).Grid.MED =  zeros(length( cases(i).XAxis ),length( cases(i).YAxis ));
        cases(i).Grid.MICD = zeros(length( cases(i).XAxis ),length( cases(i).YAxis ));
        cases(i).Grid.MAP =  zeros(length( cases(i).XAxis ),length( cases(i).YAxis ));
        cases(i).Grid.NN =   zeros(length( cases(i).XAxis ),length( cases(i).YAxis ));
        cases(i).Grid.kNN =  zeros(length( cases(i).XAxis ),length( cases(i).YAxis ));
    end
     
    %% Case 1
    
    for i = 1:length( cases(1).XAxis )
        for j = 1:length( cases(1).YAxis )
            
            x = cases(1).XAxis(i);
            y = cases(1).YAxis(j);
            
            % MED
            cases(1).Grid.MED(j,i) = MED1( x, y, A, B );
            
            % MICD
            cases(1).Grid.MICD(j,i) = MICD1( x, y, A, B );
            
            % MAP
            cases(1).Grid.MAP(j,i) = MAP1( x, y, A, B );
            
            % NN
            cases(1).Grid.NN(j,i) = NN1( x, y, A, B );
            
            % kNN
            cases(1).Grid.kNN(j,i) = kNN1( x, y, A, B );
            
        end
    end
    
    %% Case 2
    for i = 1:length( cases(2).XAxis )
        for j = 1:length( cases(2).YAxis )
            
            x = cases(2).XAxis(i);
            y = cases(2).YAxis(j);
            
            % MED
            cases(2).Grid.MED(j,i) = MED2( x, y, C, D, E );
            
            % MICD         
            cases(2).Grid.MICD(j,i) = MICD2( x, y, C, D, E );

            % MAP
            cases(2).Grid.MAP(j,i) = MAP2( x, y, C, D, E );
            
            % NN
            cases(2).Grid.NN(j,i) = NN2( x, y, C, D, E );
            
            % kNN
            cases(2).Grid.kNN(j,i) = kNN2( x, y, C, D, E );
            
        end
    end
end