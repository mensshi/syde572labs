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

% runs grid through multiple classifiers
cases(1).Grid = gridClass( cases(1) );
cases(2).Grid = gridClass( cases(2) );

% plots classifiers and decision boundaries
plotGrid( classes, cases );

% classifies samples
cases(1).Error = validate( cases(1) );
cases(2).Error = validate( cases(2) );

% calculates error