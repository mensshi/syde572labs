function classes = getClasses()
    %% Class Variables

    % CASE 1 variables
    A.N = 200;
    A.mu = [5 10]';
    A.sigma = [8 0; 0 4];

    B.N = 200;
    B.mu = [10 15]';
    B.sigma = [8 0; 0 4];

    % CASE 2 variables
    C.N = 100;
    C.mu = [5 10]';
    C.sigma = [8 4; 4 40];

    D.N = 200;
    D.mu = [15 10]';
    D.sigma = [8 0; 0 8];

    E.N = 150;
    E.mu = [10 5]';
    E.sigma = [10 -5; -5 20];

    %% Class Calculations

    classes = [ A, B, C, D, E ];
    
    for i = 1 : length(classes)
        
        % this is because for A and B, eig(sigma) returns V = [0 1; 1 0],
        % which rotates all points by 90 deg
        if i <= 2
            V = [1 0; 0 1]; %eigenvec
            D = classes(i).sigma; %eigenval
        else
            [V, D] = eig(classes(i).sigma);
        end
        
        classes(i).samples = genSampleData( classes(i), V, D );
        classes(i).X1 = classes(i).samples(:, 1);
        classes(i).X2 = classes(i).samples(:, 2);
        
        classes(i).test_samples = genSampleData( classes(i), V, D );
        classes(i).test_X1 = classes(i).test_samples(:, 1);
        classes(i).test_X2 = classes(i).test_samples(:, 2);
        
        classes(i).stdContour = genStdContour( classes(i).mu, V, sqrt(D(1,1)), sqrt(D(2,2)) );
        
        classes(i).invSigma = inv( classes(i).sigma );
        classes(i).det = det( classes(i).sigma );
    end
end

%% Helper functions

% Generates class samples and whitening matrix based on mean and covariance
function samples = genSampleData( class, V, D )

    L = D^(-1/2); % lambda matrix
    mean_array = repmat( class.mu', class.N, 1 ); % replicated array of mean
    
    % applies inverse whitening matrix to generated normal distribution
    samples = randn( class.N, 2) * inv(V) * inv(L) + mean_array;
    
end

% Generates unit standard deviation contour based on original data (not
% samples)
function stdContour = genStdContour( mu, V, x_rad, y_rad )

    % atan2 has to be (y, x)
    theta = atan2( V(2,1), V(1,1) );
    t = linspace(0,2*pi,100);
    stdContour.X = mu(1) + x_rad*cos(t)*cos(theta) - y_rad*sin(t)*sin(theta);
    stdContour.Y = mu(2) + y_rad*sin(t)*cos(theta) + x_rad*cos(t)*sin(theta);
    
end