% Non-Parametric Estimator - Parzen
% Uses Gaussian distribution

function pdf = Non_Parametric_Estimator( X, samples, std )
        
    %% ME1D
    if isequal( size( samples ), [ 100 1 ] )
        pdf = zeros( 1, length( X ));

        for i = 1:length( samples )
            pdf = pdf + normpdf( X, samples(i), std );
        end

        pdf = pdf / length( samples );
    
    %% ME2D
    else
        [ pdf.p, pdf.x, pdf.y] = parzen( samples, 1, 400 ); % change res to whatever
    end
end