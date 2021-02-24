% MICD classifier

function est = MICD( x, y, classes_in_case)
    est = 0;
    
    %% Case 1
    if length(classes_in_case) == 2
        A = classes_in_case(1);
        B = classes_in_case(2);
        
        distA = getMICD( x, y, A);
        distB = getMICD( x, y, B);

        if (distA < distB)
            est = 1;
        elseif (distA > distB)
            est = 2;
        end
        
    %% Case 2
    else
        C = classes_in_case(1);
        D = classes_in_case(2);
        E = classes_in_case(3);
        
        distC = getMICD( x, y, C);
        distD = getMICD( x, y, D);
        distE = getMICD( x, y, E);

        diffCD = distC - distD;
        diffDE = distD - distE;
        diffEC = distE - distC;

        % Covers cases with 0 diff, but closer to third
        if      diffCD == 0 && distE < distC
            est = 3;
        elseif  diffDE == 0 && distC < distD
            est = 1;
        elseif  diffEC == 0 && distD < distE
            est = 2;

        % Finds min
        elseif  distC < distD && distC < distE
            est = 1;
        elseif  distD < distC && distD < distE
            est = 2;
        elseif  distE < distC && distE < distD
            est = 3;

        % Else est = 0
        end
    end
end

%% Helper functions
function dist = getMICD( x, y, class )
    diff = [x,y]' - class.mu;
    dist = (diff'*inv(class.sigma)*diff)^(1/2);
end