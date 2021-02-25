% Nearest Neighbour Classifier

function est = NN( x, y, classes_in_case)
    est = 0;
    
    %% Case 1
    if length(classes_in_case) == 2
        A = classes_in_case(1);
        B = classes_in_case(2);
        
        % for loop
        % find the point in A closest to (x,y), set nnDistA
        % for loop
        % find the point in B closest to (x,y), set nnDistB

        % check if nnDistA < nnDistB
        % assign est = 1 (A)
        % else est = 2 (B)

        nnDist_A = ( x - A.mu(1) )^2 + ( y - A.mu(2) )^2 ;
        for i = 2:size(A.samples,1)
            dist = ( x - A.X1(i) )^2 + ( y - A.X2(i) )^2 ;
            if (dist < nnDist_A)
                nnDist_A = dist;
            end
        end

        nnDist_B = ( x - B.mu(1) )^2 + ( y - B.mu(2) )^2 ;
        for i = 2:size(B.samples,1)
            dist = ( x - B.X1(i) )^2 + ( y - B.X2(i) )^2 ;
            if (dist < nnDist_B)
                nnDist_B = dist;
            end
        end

        if (nnDist_A < nnDist_B)
            est = 1;
        elseif (nnDist_A > nnDist_B)
            est = 2;
        end
        % leave as est = 0 for undetermined class
        
    %% Case 2
    else
        C = classes_in_case(1);
        D = classes_in_case(2);
        E = classes_in_case(3);
        
        nnDist_C = ( x - C.mu(1) )^2 + ( y - C.mu(2) )^2 ;
        for i = 2:size(C.samples,1)
            dist = ( x - C.X1(i) )^2 + ( y - C.X2(i) )^2 ;
            if (dist < nnDist_C)
                nnDist_C = dist;
            end
        end

        nnDist_D = ( x - D.mu(1) )^2 + ( y - D.mu(2) )^2 ;
        for i = 2:size(D.samples,1)
            dist = ( x - D.X1(i) )^2 + ( y - D.X2(i) )^2 ;
            if (dist < nnDist_D)
                nnDist_D = dist;
            end
        end

        nnDist_E = ( x - E.mu(1) )^2 + ( y - E.mu(2) )^2 ;
        for i = 2:size(E.samples,1)
            dist = ( x - E.X1(i) )^2 + ( y - E.X2(i) )^2 ;
            if (dist < nnDist_E)
                nnDist_E = dist;
            end
        end

        % Finds min
        % Covers cases with 0 diff, but closer to third
        if  nnDist_C < nnDist_D && ( nnDist_C < nnDist_E || nnDist_D-nnDist_E == 0 )
            est = 1;
        elseif  nnDist_D < nnDist_C && ( nnDist_D < nnDist_E || nnDist_E-nnDist_C == 0 )
            est = 2;
        elseif  nnDist_E < nnDist_C && ( nnDist_E < nnDist_D || nnDist_C-nnDist_D == 0 )
            est = 3;   
        end
    end
end