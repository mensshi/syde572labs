% runs through samples or tests and checks if properly classified
% counter for errors

function [ Test, experimental_error ] = validate( Case )

    classes_in_case = Case.classes_in_case;
    
    % first column is total errors
    % second column is confusion matrix
    Test = cell( 5, 2 );

    Test(:,1) = {0};
    
    % confusion matrix ( rows are actual values; cols are estimates )
    % has extra column for 0 (decision boundary)
    Test(:,2) = { zeros( length( classes_in_case ), length( classes_in_case ) + 1 ) };
    
    for class_num = 1:length( classes_in_case )
        samples = classes_in_case(class_num).samples;
        test_samples = classes_in_case(class_num).test_samples;
        
        % classifying samples
        for i = 1:classes_in_case(class_num).N
            x = samples(i, 1);
            y = samples(i, 2);
            x_nn = test_samples(i, 1);
            y_nn = test_samples(i, 2);
            est = zeros( 5 );

            % run each classifier
            est(1) = MED(   x,      y,      classes_in_case     );
            est(2) = MICD(  x,      y,      classes_in_case     );
            est(3) = MAP(   x,      y,      classes_in_case,    Case.threshold );
            est(4) = NN(    x_nn,   y_nn,   classes_in_case     );
            est(5) = kNN(   x_nn,   y_nn,   classes_in_case     );
            
            % check each estimate and increment error and confusion matrix
            for j = 1:5
                Test = check( j, est(j), Test, class_num );
            end
        end
        
        % calculating experimental error
        experimental_error = 0;
        for i = 1:length( Case.XAxis )
            for j = 1:length( Case.YAxis )
                
                %% Case 1
                if length( classes_in_case ) == 2
                    
                    pdf_A = getLikelihood( x, y, Case.classes_in_case(1) );
                    pdf_B = getLikelihood( x, y, Case.classes_in_case(2) );
                    
                    p_x = pdf_A + pdf_B;
                    
                    experimental_error = experimental_error + min(pdf_A, pdf_B) * p_x ;
                    
                %% Case 2
                else
                    pdf_C = getLikelihood( x, y, Case.classes_in_case(1) );
                    pdf_D = getLikelihood( x, y, Case.classes_in_case(2) );
                    pdf_E = getLikelihood( x, y, Case.classes_in_case(3) );
                    
                    p_x = pdf_C + pdf_D + pdf_E;
                    
                    experimental_error = experimental_error + ( pdf_C + pdf_D + pdf_E - max([ pdf_C, pdf_D, pdf_E ])) * p_x ;
                end
                
            end
        end
        
        dA = abs(( Case.XAxis(1) - Case.XAxis(2) ) * ( Case.YAxis(1) - Case.YAxis(2) ));
        experimental_error = experimental_error * dA ;
        
    end
        
end

function Test = check( classifier_num, est, Test, class_num )
    Test{classifier_num ,2}( class_num, est + 1 ) = Test{classifier_num ,2}( class_num, est + 1 ) + 1;
    if est ~= class_num
        Test{classifier_num ,1} = Test{classifier_num ,1} + 1;
    end
end

% likelihood = p(x|A)*p(A)
function likelihood = getLikelihood( x, y, class )
    diff = [x y]' - class.mu;
    p_x_class = exp( -1/2 * diff' * class.invSigma * diff ) / ( 2*pi*class.det^(1/2) ) ;
    likelihood = p_x_class * class.probability ;
end