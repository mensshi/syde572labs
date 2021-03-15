% Runs all estimators

function [ ME1D, ME2D, SD ] = runEst( ME1D, ME2D, SD )

    %% ME1D
    X = ME1D.X;
    
    % PEs store variables, NPE stores pdf
    ME1D.A.PE_G = PE_Gaussian( ME1D.A.samples );
    ME1D.A.PE_E = PE_Exponential( ME1D.A.samples );
    ME1D.A.PE_U = PE_Uniform( ME1D.A.samples );
    ME1D.A.NPE1 = Non_Parametric_Estimator( X, ME1D.A.samples, 0.1 );
    ME1D.A.NPE2 = Non_Parametric_Estimator( X, ME1D.A.samples, 0.4 );
    
    ME1D.B.PE_G = PE_Gaussian( ME1D.B.samples );
    ME1D.B.PE_E = PE_Exponential( ME1D.B.samples );
    ME1D.B.PE_U = PE_Uniform( ME1D.B.samples );
    ME1D.B.NPE1 = Non_Parametric_Estimator( X, ME1D.B.samples, 0.1 );
    ME1D.B.NPE2 = Non_Parametric_Estimator( X, ME1D.B.samples, 0.4 );
    
    %% ME2D   
    X = ME1D.X;
    
    ME2D.L.A.PE = PE_Gaussian( ME2D.L.A.samples );
    ME2D.L.B.PE = PE_Gaussian( ME2D.L.B.samples );
    ME2D.L.C.PE = PE_Gaussian( ME2D.L.C.samples );
    
    ME2D.L.A.NPE = Non_Parametric_Estimator( X, ME2D.L.A.samples );
    ME2D.L.B.NPE = Non_Parametric_Estimator( X, ME2D.L.B.samples );
    ME2D.L.C.NPE = Non_Parametric_Estimator( X, ME2D.L.C.samples );

end