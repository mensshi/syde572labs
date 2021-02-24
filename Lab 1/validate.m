% runs through samples or tests and checks if properly classified
% counter for errors

function Error = validate( Case )

    Error.MED = 0;
    Error.MICD = 0;
    Error.MAP = 0;
    Error.NN = 0;
    Error.kNN = 0;
    
    classes_in_case = Case.classes_in_case;
    probability = Case.probability;
    
    for class_num = 1:length( classes_in_case )
        samples = classes_in_case(class_num).samples;
        
        for i = 1:classes_in_case(class_num).N
            x = samples(i, 1);
            y = samples(i, 2);

            % MED          
            if MED( x, y, classes_in_case ) ~= class_num
                Error.MED = Error.MED + 1;
            end

            % MICD
            if MICD( x, y, classes_in_case ) ~= class_num
                Error.MICD = Error.MICD + 1;
            end
            
            % MAP
            if MAP( x, y, classes_in_case, probability ) ~= class_num
                Error.MAP = Error.MAP + 1;
            end
            
            % NN
            if NN( x, y, classes_in_case ) ~= class_num
                Error.NN = Error.NN + 1;
            end
            
            % kNN
            if kNN( x, y, classes_in_case ) ~= class_num
                Error.kNN = Error.kNN + 1;
            end
        end
    end
        
end