% Non-Parametric Estimator - Parzen
% Uses Gaussian distribution

function pdf = Non_Parametric_Estimator( X, Y, samples, std )
        
    %% ME1D
    if isequal( size( samples ), [ 100 1 ] )
        pdf = 0;

        for i = 1:length( samples )
            pdf = pdf + exp(-0.5 * ( X-samples(i) )^2 / std^2) / ( std * sqrt(2*pi) );
        end

        pdf = pdf / length( samples );
    
    %% ME2D
    else
        [ pdf.p, pdf.x, pdf.y] = parzen( samples, [1, X(1), Y(1), X(end-1), Y(end-1)], sqrt(400) ); % change res to whatever
    end
end