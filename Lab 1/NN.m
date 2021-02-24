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

        nnDistA = pdist( [ x y; A.X1(1) A.X2(1) ], 'euclidean' );
        for i = 2:size(A.samples,1)
            dist = pdist( [ x y; A.X1(i) A.X2(i) ], 'euclidean' );
            if (dist < nnDistA)
                nnDistA = dist;
            end
        end

        nnDistB = pdist( [ x y; B.X1(1) B.X2(1) ], 'euclidean' );
        for i = 2:size(B.samples,1)
            dist = pdist( [ x y; B.X1(i) B.X2(i) ], 'euclidean' );
            if (dist < nnDistB)
                nnDistB = dist;
            end
        end

        if (nnDistA < nnDistB)
            est = 1;
        elseif (nnDistA > nnDistB)
            est = 2;
        end
        % leave as est = 0 for undetermined class
        
    %% Case 2
    else
        C = classes_in_case(1);
        D = classes_in_case(2);
        E = classes_in_case(3);
        
        nnDistC = pdist( [ x y; C.X1(1) C.X2(1) ], 'euclidean' );
        for i = 2:size(C.samples,1)
            dist = pdist( [ x y; C.X1(i) C.X2(i) ], 'euclidean' );
            if (dist < nnDistC)
                nnDistC = dist;
            end
        end

        nnDistD = pdist( [ x y; D.X1(1) D.X2(1) ], 'euclidean' );
        for i = 2:size(E.samples,1)
            dist = pdist( [ x y; D.X1(i) D.X2(i) ], 'euclidean' );
            if (dist < nnDistD)
                nnDistD = dist;
            end
        end

        nnDistE = pdist( [ x y; E.X1(1) E.X2(1) ], 'euclidean' );
        for i = 2:size(E.samples,1)
            dist = pdist( [ x y; E.X1(i) E.X2(i) ], 'euclidean' );
            if (dist < nnDistE)
                nnDistE = dist;
            end
        end

        diffCD = nnDistC-nnDistD;
        diffDE = nnDistD-nnDistE;
        diffEC = nnDistE-nnDistC;

        % Covers cases with 0 diff, but closer to third
        if      diffCD == 0 && nnDistE < nnDistC
            est = 5;
        elseif  diffDE == 0 && nnDistC < nnDistD
            est = 3;
        elseif  diffEC == 0 && nnDistD < nnDistE
            est = 4;

        % Finds min
        elseif  nnDistC < nnDistD && nnDistC < nnDistE
            est = 3;
        elseif  nnDistD < nnDistC && nnDistD < nnDistE
            est = 4;
        elseif  nnDistE < nnDistC && nnDistE < nnDistD
            est = 5;   
        end
    end
end