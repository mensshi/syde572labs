% kNN Classifier

function est = kNN( x, y, classes_in_case)
    est = 0;
    
    %% Case 1
    if length(classes_in_case) == 2
        A = classes_in_case(1);
        B = classes_in_case(2);
        
        closestA = closestK(A, x, y, 5);
        closestB = closestK(B, x, y, 5);
        
        knnDist_A = ( x - closestA(1) )^2 + ( y - closestA(2) )^2 ;
        knnDist_B = ( x - closestB(1) )^2 + ( y - closestB(2) )^2 ;

        if (knnDist_A < knnDist_B)
            est = 1;
        elseif (knnDist_A > knnDist_B)
            est = 2;
        end
        % leave as est = 0 for undetermined class
        
    %% Case 2
    else
        C = classes_in_case(1);
        D = classes_in_case(2);
        E = classes_in_case(3);
        
        closestC = closestK(C, x, y, 5);
        closestD = closestK(D, x, y, 5);
        closestE = closestK(E, x, y, 5);
        
        nnDist_C = ( x - closestC(1) )^2 + ( y - closestC(2) )^2 ;
        nnDist_D = ( x - closestD(1) )^2 + ( y - closestD(2) )^2 ;
        nnDist_E = ( x - closestE(1) )^2 + ( y - closestE(2) )^2 ;

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

function prototype = closestK(class, x, y, k)
    closest = [];
    for i = 1:k
        closest = [ closest; class.samples( i, 1 ) class.samples( i, 2 ) ( x - class.X1(i) )^2 + ( y - class.X2(i) )^2 ];
    end
    closest = sortrows(closest,3); % smallest to biggest distance
    for i = (k+1):size(class.samples,1)
        newDist = ( x - class.X1(i) )^2 + ( y - class.X2(i) )^2;
        for j = k:-1:1
            if newDist <= closest(j,3)
                if j < k
                    closest(j+1,:) = closest(j,:);
                end
                closest(j,:) = [class.samples( i, 1 ) class.samples( i, 2 ) newDist];
            end
        end
    end
    totalX = 0;
    totalY = 0;
    for i = 1:k
        totalX = totalX + closest(i, 1);
        totalY = totalY + closest(i, 2);
    end
    prototype = [totalX/k totalY/k];
end