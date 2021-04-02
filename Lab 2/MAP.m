% MAP Classifier

function est = MAP( x, y, A, B, C, threshold )
    est = 0;

    l_A_B = l_class( x, y, B ) - l_class( x, y, A );
    l_B_C = l_class( x, y, C ) - l_class( x, y, B );
    l_C_A = l_class( x, y, A ) - l_class( x, y, C );

    if  l_A_B > threshold.A_B && l_C_A < threshold.C_A
        est = 1;
    elseif  l_B_C > threshold.B_C && l_A_B < threshold.A_B
        est = 2;
    elseif  l_C_A > threshold.C_A && l_B_C < threshold.B_C
        est = 3;

    % Else est = 0
    end
        
end

%% Helper function
% exponent part of p_x_class * -2
function l_class = l_class( x, y, class )
    diff = [x y]' - class.mu;
    l_class = diff' * class.invSigma * diff ;
end