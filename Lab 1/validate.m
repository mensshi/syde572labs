% runs through samples or tests and checks if properly classified
% counter for errors

function Test = validate( Case )

    classes_in_case = Case.classes_in_case;
    probability = Case.probability;

    Test.MED.error = 0;
    Test.MICD.error = 0;
    Test.MAP.error = 0;
    Test.NN.error = 0;
    Test.kNN.error = 0;
    
    % confusion matrix ( rows are actual values; cols are estimates )
    % has extra column for 0 (decision boundary)
    Test.MED.confusion =    zeros( length( classes_in_case ), length( classes_in_case ) + 1 );
    Test.MICD.confusion =   zeros( length( classes_in_case ), length( classes_in_case ) + 1 );
    Test.MAP.confusion =    zeros( length( classes_in_case ), length( classes_in_case ) + 1 );
    Test.NN.confusion =     zeros( length( classes_in_case ), length( classes_in_case ) + 1 );
    Test.kNN.confusion =    zeros( length( classes_in_case ), length( classes_in_case ) + 1 );
    
    for class_num = 1:length( classes_in_case )
        samples = classes_in_case(class_num).samples;
        
        for i = 1:classes_in_case(class_num).N
            x = samples(i, 1);
            y = samples(i, 2);

            % MED     
            est = MED( x, y, classes_in_case );
            Test.MED.confusion( class_num, est + 1 ) = Test.MED.confusion( class_num, est + 1 ) + 1;
            if est ~= class_num
                Test.MED.error = Test.MED.error + 1;
            end

            % MICD
            est = MICD( x, y, classes_in_case );
            Test.MICD.confusion( class_num, est + 1 ) = Test.MICD.confusion( class_num, est + 1 ) + 1;
            if est ~= class_num
                Test.MICD.error = Test.MICD.error + 1;
            end
            
            % MAP
            est = MAP( x, y, classes_in_case, probability );
            Test.MAP.confusion( class_num, est + 1 ) = Test.MAP.confusion( class_num, est + 1 ) + 1;
            if est ~= class_num
                Test.MAP.error = Test.MAP.error + 1;
            end
            
            % NN
            est = NN( x, y, classes_in_case );
            Test.NN.confusion( class_num, est + 1 ) = Test.NN.confusion( class_num, est + 1 ) + 1;
            if est ~= class_num
                Test.NN.error = Test.NN.error + 1;
            end
            
            % kNN
            est = kNN( x, y, classes_in_case );
            Test.kNN.confusion( class_num, est + 1 ) = Test.kNN.confusion( class_num, est + 1 ) + 1;
            if est ~= class_num
                Test.kNN.error = Test.kNN.error + 1;
            end
        end
    end
        
end