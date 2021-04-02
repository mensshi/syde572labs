function est = ML_NPE ( x, y, A, B, C )
    p_A = 0;
    p_B = 0;
    p_C = 0;
    
    if x >= A.x(1) && x <= A.x(end) && y >= A.y(1) && y <= A.y(end)
        %A.y = [5, 6, 7, 8]
        %y = 6
        %y-A.y(1) = 1
        p_A = A.p(y-A.y(1)+1,x-A.x(1)+1);
    end
    if x >= B.x(1) && x <= B.x(end) && y >= B.y(1) && y <= B.y(end)
        p_B = B.p(y-B.y(1)+1,x-B.x(1)+1);
    end    
    if x >= C.x(1) && x <= C.x(end) && y >= C.y(1) && y <= C.y(end)
        p_C = C.p(y-C.y(1)+1,x-C.x(1)+1);
    end
    if p_A + p_B + p_C == 0 %they are all out of bounds
        est = NaN;
    elseif  p_A > p_B && p_A > p_C
        est = 1;
    elseif  p_B > p_A && p_B > p_C
        est = 2;
    elseif  p_C > p_A && p_C > p_B
        est = 3; 
    else %probablity is equal
        est = 0;
    end
end