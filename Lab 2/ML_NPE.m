function est = ML_NPE ( i, j, A, B, C )
    p_A = A.p(j,i);
    p_B = B.p(j,i);
    p_C = C.p(j,i);
    
    if  p_A > p_B && p_A > p_C
        est = 1;
    elseif  p_B > p_A && p_B > p_C
        est = 2;
    elseif  p_C > p_A && p_C > p_B
        est = 3; 
    else %probablity is equal
        est = 0;
    end
end