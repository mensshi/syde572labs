function cases = validate( classes, cases )

	A = classes(1);
    B = classes(2);
    C = classes(3);
    D = classes(4);
    E = classes(5);

    %% Set up for each class
    for i = 1:2
        cases(i).Error.MED = 0;
        cases(i).Error.MICD = 0;
        cases(i).Error.MAP = 0;
        cases(i).Error.NN = 0;
        cases(i).Error.kNN = 0;
    end
     
    %% Case 1
    
    for class_num = 1:2
        samples = classes(class_num).samples;
        
        for i = 1:classes(class_num).N
            x = samples(i, 1);
            y = samples(i, 2);

            % MED          
            if MED1( x, y, A, B ) ~= class_num
                cases(1).Error.MED = cases(1).Error.MED + 1;
            end

            % MICD
            if MICD1( x, y, A, B ) ~= class_num
                cases(1).Error.MICD = cases(1).Error.MICD + 1;
            end
            
            % MAP
            if MAP1( x, y, A, B ) ~= class_num
                cases(1).Error.MAP = cases(1).Error.MAP + 1;
            end
            
            % NN
            if NN1( x, y, A, B ) ~= class_num
                cases(1).Error.NN = cases(1).Error.NN + 1;
            end
            
            % kNN
            if kNN1( x, y, A, B ) ~= class_num
                cases(1).Error.kNN = cases(1).Error.kNN + 1;
            end
        end
        
    end
    
    %% Case 2
    for case_num = 3:5
        samples = classes(class_num).samples;
        
        for i = 1:classes(class_num).N
            x = samples(i, 1);
            y = samples(i, 2);
            
            % MED
            if MED2( x, y, C, D, E ) ~= class_num
                cases(2).Error.MED = cases(2).Error.MED + 1;
            end
            
            % MICD
            if MICD2( x, y, C, D, E ) ~= class_num
                cases(2).Error.MICD = cases(2).Error.MICD + 1;
            end
            
            % MAP
            if MAP2( x, y, C, D, E ) ~= class_num
                cases(2).Error.MAP = cases(2).Error.MAP + 1;
            end
            
            % NN
            if NN2( x, y, C, D, E ) ~= class_num
                cases(2).Error.NN = cases(2).Error.NN + 1;
            end
            
            % kNN
            if kNN2( x, y, C, D, E ) ~= class_num
                cases(2).Error.kNN = cases(2).Error.kNN + 1;
            end
            
        end
        
    end
    
end