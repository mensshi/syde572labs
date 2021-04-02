% Parametric Estimator - Uniform

function variable = PE_Uniform( samples )
    min = samples(1);
    max = samples(1);
    N = size(samples, 1);
    for i = 2:N
        if samples(i) < min
            min = samples(i);
        elseif samples(i) > max
            max = samples(i);
        end
    end
    variable.a = min;
    variable.b = max;
    variable.y = 1/(variable.b-variable.a);
end