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
            classes(i).D = classes(i).sigma; %eigenval
            classes(i).V = [1 0; 0 1]; %eigenvec
        else
            [classes(i).V, classes(i).D] = eig(classes(i).sigma);
        end
        %L = lamba, W = whitening/transform
        classes(i).samples = genSampleData( classes(i) );
        classes(i).X1 = classes(i).samples(:, 1);
        classes(i).X2 = classes(i).samples(:, 2);
        
        classes(i).stdContour = genStdContour( classes(i) );
        
        classes(i).invSigma = inv( classes(i).sigma );
    end
end

%% Helper functions

% Generates class samples and whitening matrix based on mean and covariance
function samples = genSampleData( class )

    L = class.D^(-1/2); % lambda matrix
    W = L * class.V'; % whitening matrix
    mean_array = repmat( class.mu', class.N, 1 ); % replicated array of mean
    
    % applies inverse whitening matrix to generated normal distribution
    samples = randn( class.N, 2) * inv(class.V) * inv(L) + mean_array;
    
end

% Generates unit standard deviation contour based on original data (not
% samples)
function stdContour = genStdContour( class )

    % atan2 has to be (y, x)
    theta = atan2( class.V(2,1), class.V(1,1) );
    t = linspace(0,2*pi,100);
    a = sqrt(class.D(1,1));
    b = sqrt(class.D(2,2));
    x0 = class.mu(1);
    y0 = class.mu(2);
    stdContour.X = x0 + a*cos(t)*cos(theta) - b*sin(t)*sin(theta);
    stdContour.Y = y0 + b*sin(t)*cos(theta) + a*cos(t)*sin(theta);
    
end