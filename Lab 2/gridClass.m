function [ ME1D, ME2D ] = gridClass( ME1D, ME2D )

    %% ME1D   
    for i = 1:length( ME1D.X )
        x = ME1D.X(i);
            
        ME1D.A.Grid.true(i) = getGPDF( x, ME1D.A.true ); % Gaussian
        ME1D.A.Grid.PE_G(i) = getGPDF( x, ME1D.A.PE_G );
        ME1D.A.Grid.PE_E(i) = getEPDF( x, ME1D.A.PE_E );
        ME1D.A.Grid.NPE1(i) = Non_Parametric_Estimator( x, ME1D.A.samples, 0.1 );
        ME1D.A.Grid.NPE2(i) = Non_Parametric_Estimator( x, ME1D.A.samples, 0.4 );
        
        ME1D.B.Grid.true(i) = getEPDF( x, ME1D.B.true ); % Exponential
        ME1D.B.Grid.PE_G(i) = getGPDF( x, ME1D.B.PE_G );
        ME1D.B.Grid.PE_E(i) = getEPDF( x, ME1D.B.PE_E );
        ME1D.B.Grid.NPE1(i) = Non_Parametric_Estimator( x, ME1D.B.samples, 0.1 );
        ME1D.B.Grid.NPE2(i) = Non_Parametric_Estimator( x, ME1D.B.samples, 0.4 );
        
    end

    %% ME2D
    ME2D.Grid.PE = zeros( length( ME2D.X ), length( ME2D.Y ));
    ME2D.Grid.NPE = ME2D.Grid.PE;
    L = ME2D.L;
    
    for i = 1:length( ME2D.X )
        x = ME2D.X(i);
        
        for j = 1:length( ME2D.Y )
            y = ME2D.Y(j);
            
            ME2D.Grid.PE(j,i) = ML_PE_G( x, y, L.A.PE, L.B.PE, L.C.PE );
            ME2D.Grid.NPE(j,i) = ML_NPE( x, y, L.A.NPE, L.B.NPE, L.C.NPE );
        end
    end
    
end

% returns pdf of x, based on gaussian distribution
function pdf = getGPDF( x, class )
    pdf = exp(-0.5 * ( x-class.mu )^2 / class.sigma^2) / ( class.sigma * sqrt(2*pi) );;
end

% returns pdf of x, based on exponential distribution
function pdf = getEPDF( x, class )
    pdf = 0;
end

function pdf = getGPDF2( x, y, class )
    pdf = 0;
end

function est = ML_PE_G ( x, y, A, B, C )
    est = 0;
    
    pdf_A = getGPDF2( x, y, A );
    pdf_B = getGPDF2( x, y, B );
    pdf_C = getGPDF2( x, y, C );
    
    if pdf_A > pdf_B && pdf_A > pdf_C
        est = 1;
    elseif pdf_B > pdf_A && pdf_B > pdf_C
        est = 2;
    elseif pdf_C > pdf_A && pdf_C > pdf_B
        est = 3;
    end
end

function est = ML_NPE ( x, y, A, B, C )
    est = 0;
end