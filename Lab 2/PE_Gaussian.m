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
            sigma = sigma + (samples(j) - mu)^2;
        end
        sigma = sqrt(sigma/N);
    
    %% ME2D
    else
        mu = [ 0 0 ]';
        sigma = [ 1 0; 0 1 ];
        
        N = size(samples, 1);
        for i = 1:N
            mu = mu + samples(i,:)';
        end
        mu = mu/N;
        
        for j = 1:N
            temp = samples(j,:)' - mu;
            sigma = sigma + temp*(temp');
        end
        sigma = sigma/N;
        [V, D] = eig(sigma);
        variable.stdContour = genStdContour( mu, V, sqrt(D(1,1)), sqrt(D(2,2)) );
    end
    
    variable.mu = mu;
    variable.sigma = sigma;
    variable.invSigma = inv(sigma);
        
end

function stdContour = genStdContour( mu, V, x_rad, y_rad )

    % atan2 has to be (y, x)
    theta = atan2( V(2,1), V(1,1) );
    t = linspace(0,2*pi,100);
    stdContour.X = mu(1) + x_rad*cos(t)*cos(theta) - y_rad*sin(t)*sin(theta);
    stdContour.Y = mu(2) + y_rad*sin(t)*cos(theta) + x_rad*cos(t)*sin(theta);
    
end