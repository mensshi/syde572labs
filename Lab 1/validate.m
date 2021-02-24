% runs through samples or tests and checks if properly classified
% counter for errors

function Test = validate( Case )

    classes_in_case = Case.classes_in_case;
    probability = Case.probability;
    pdf = Case.pdf;

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
        
        % classifying samples
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
            est = MAP( x, y, classes_in_case, -1, -1, probability, pdf );
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
        
        % calculating experimental error
        Test.experimental_error = 0;
        dA = abs(( Case.XAxis(1) - Case.XAxis(2) ) * ( Case.YAxis(1) - Case.YAxis(2) ));
        
        for i = 1:length( Case.XAxis )
            for j = 1:length( Case.YAxis )
                
                %% Case 1
                if length( classes_in_case ) == 2
                    
                    pdf_A = pdf{1}(i,j);
                    pdf_B = pdf{2}(i,j);
                    
                    Test.experimental_error = Test.experimental_error + min(pdf_A, pdf_B) * dA;
                    
                %% Case 2
                else
                    pdf_C = pdf{1}(i,j);
                    pdf_D = pdf{2}(i,j);
                    pdf_E = pdf{3}(i,j);
                    
                    Test.experimental_error = Test.experimental_error + (pdf_C + pdf_D + pdf_E - max([ pdf_C, pdf_D, pdf_E ])) * dA;
                end
                
            end
        end
    end
        
end