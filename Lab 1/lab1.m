% SYDE Lab 1 - Clusters and Classification Boundaries
% Names: Robyn Ching, Silvia George, Amy Lu  Date: , 2021

clear % clear all variables from memory
close all  % close all open figures
rng('default')

% class definitions and sample generation in another function
% classes is an array
classes = getClasses();

% plots original classes; gets axis data for grid classification
cases = plotOriginal( classes );

% allocates classes to cases
cases(1).classes_in_case = [ classes(1), classes(2) ];
cases(2).classes_in_case = [ classes(3), classes(4), classes(5) ];

for i = 1:length( cases )
    
    % sets total of samples
    cases(i).total = getTotal( cases(i).classes_in_case );
    
    % runs grid through multiple classifiers
    [ cases(i).Grid, cases(i).classes_in_case, cases(i).threshold ] = gridClass( cases(i) );
    
    % error analysis
    [ cases(i).Test, cases(i).experimental_error ] = validate( cases(i) );
end

% plots classifiers and decision boundaries
plotGrid( classes, cases );


%% Helper functions
function total = getTotal( classes_in_case )
    total = 0;
    for i = 1:length( classes_in_case )
       total = total + classes_in_case(i).N;
    end
end