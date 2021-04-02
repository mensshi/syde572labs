% Parametric Estimator - Exponential

function variable = PE_Exponential( samples )
    lambda = 0;
    N = size(samples, 1);
    for i = 1:N
        lambda = lambda + samples(i);
    end
    lambda = N/lambda;
    variable.lambda = lambda;
end