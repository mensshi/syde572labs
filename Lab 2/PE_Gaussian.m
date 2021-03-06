% Parametric Estimator - Gaussian
% Slide 8, Feb 24
% Note: you don't need to add bias

function variable = PE_Gaussian( samples )

    %% ME1D
    if isequal( size( samples ), [ 100 1 ] )
        mu = 0;
        sigma = 0;
        N = size(samples, 1);
        for i = 1:N
            mu = mu + samples(i);
        end
        mu = mu/N;
        
        for j = 1:N
            sigma = sigma + (samples(i) - mu)^2;
        end
        sigma = sigma/N;
    
    %% ME2D
    else
        mu = [ 0 0 ]';
        sigma = [ 1 0; 0 1 ];
    end
    
    variable.mu = mu;
    variable.sigma = sigma;
end