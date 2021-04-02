function SC = getSC( A, B, J )

    j = 1;
    
    % run for each iteration of j
    while( j-1 ~= J && size(A,1) ~= 0 && size(B,1) ~= 0 )
        
        size_A = size(A,1);
        size_B = size(B,1);
        
        % run until appropriate discriminant G is found
        while 1
            pnt_A = A( randi( size_A ), : );
            pnt_B = B( randi( size_B ), : );
            
            n_a_B = 0; % should be class A, but identified as class B
            n_b_A = 0; % should be class B, but identified as class A
            
            for i = 1:size_A
               if MED( A(i,:), pnt_A, pnt_B) ~= 1
                   n_a_B = n_a_B + 1;
               end
            end
            
            for i = 1:size_B
               if MED( B(i,:), pnt_A, pnt_B) ~= 2
                   n_b_A = n_b_A + 1;
               end
            end
            
            if n_a_B ==0 || n_b_A == 0
                break;
            end
        end
        
        if n_a_B == 0
            B = applyG( B, pnt_A, pnt_B, 2 );
        end
        
        if n_b_A == 0
            A = applyG( A, pnt_A, pnt_B, 1 );
        end
        
        G.pnt_A = pnt_A;
        G.pnt_B = pnt_B;
        G.n_a_B = n_a_B;
        G.n_b_A = n_b_A;
        
        SC(j) = G;
        
        j = j + 1;
    end

end