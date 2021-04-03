function [ ME1D, ME2D ] = gridClass( ME1D, ME2D )

    %% ME1D   
    for i = 1:length( ME1D.X )
        x = ME1D.X(i);
            
        ME1D.A.Grid.true(i) = getGPDF( x, ME1D.A.true ); % Gaussian
        ME1D.A.Grid.PE_G(i) = getGPDF( x, ME1D.A.PE_G );
        ME1D.A.Grid.PE_E(i) = getEPDF( x, ME1D.A.PE_E );
        ME1D.A.Grid.PE_U(i) = getUPDF( x, ME1D.A.PE_U );
        ME1D.A.Grid.NPE1(i) = Non_Parametric_Estimator( x, 0, ME1D.A.samples, 0.1 );
        ME1D.A.Grid.NPE2(i) = Non_Parametric_Estimator( x, 0, ME1D.A.samples, 0.4 );
        
        ME1D.B.Grid.true(i) = getEPDF( x, ME1D.B.true ); % Exponential
        ME1D.B.Grid.PE_G(i) = getGPDF( x, ME1D.B.PE_G );
        ME1D.B.Grid.PE_E(i) = getEPDF( x, ME1D.B.PE_E );
        ME1D.B.Grid.PE_U(i) = getUPDF( x, ME1D.B.PE_U );
        ME1D.B.Grid.NPE1(i) = Non_Parametric_Estimator( x, 0, ME1D.B.samples, 0.1 );
        ME1D.B.Grid.NPE2(i) = Non_Parametric_Estimator( x, 0, ME1D.B.samples, 0.4 );
        
    end

    %% ME2D
    ME2D.Grid.PE = zeros( length( ME2D.Y ), length( ME2D.X ));
    ME2D.Grid.NPE = NaN( length( ME2D.Y ), length( ME2D.X ));
    L = ME2D.L;
    
    threshold.A_B = getThreshold( L.A.PE, L.B.PE );
    threshold.B_C = getThreshold( L.B.PE, L.C.PE );
    threshold.C_A = getThreshold( L.C.PE, L.A.PE );
    
    for i = 1:length( ME2D.X )
        x = ME2D.X(i);
        
        for j = 1:length( ME2D.Y )
            y = ME2D.Y(j);
            
            ME2D.Grid.PE(j,i) = MAP( x, y, L.A.PE, L.B.PE, L.C.PE, threshold );
            ME2D.Grid.NPE(j,i) = ML_NPE( i, j, L.A.NPE, L.B.NPE, L.C.NPE );
        end
    end
    
end

% returns pdf of x, based on gaussian distribution
function pdf = getGPDF( x, class )
    pdf = exp(-0.5 * ( x-class.mu )^2 / class.sigma^2) / ( class.sigma * sqrt(2*pi) );
end

% returns pdf of x, based on exponential distribution
function pdf = getEPDF( x, class )
    if x < 0
        pdf = 0;
    else
        pdf = class.lambda*exp(-(class.lambda) * x);
    end
end

% returns pdf of x, based on uniform distribution
function pdf = getUPDF( x, class )
    if x < class.a || x > class.b
        pdf = 0;
    else
        pdf = class.y;
    end
end

%% Helper Function

% greater class is assigned label if greater than threshold
% lesser class is assigned label is lower than threshold
function threshold = getThreshold( greater_class, lesser_class )
    
    g_det =     det(greater_class.sigma);
    l_det = 	det(lesser_class.sigma);
    
    threshold = 2 * log( sqrt(g_det) / sqrt(l_det) ) ;
end