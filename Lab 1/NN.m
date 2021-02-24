% Nearest Neighbour Classifier

function est = NN( x, y, classes_in_case)
    est = 0;
    
    %% Case 1
    if length(classes_in_case) == 2
        A = classes_in_case(1);
        B = classes_in_case(2);
        
    %% Case 2
    else
        C = classes_in_case(1);
        D = classes_in_case(2);
        E = classes_in_case(3);
    end
end