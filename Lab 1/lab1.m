% SYDE Lab 1 - Clusters and Classification Boundaries
% Names: Robyn Ching, Silvia George, Amy Lu  Date: , 2021

%% Initial set up

clear % clear all variables from memory
close all  % close all open figures
rng('default')

% class definitions and sample generation in another function
% classes is an array
classes = getClasses();

% plots original classes; gets axis data for grid classification
cases = plotOriginal( classes );

% classifies entire grid
cases = gridClass( classes, cases );

% plots classifiers and decision boundaries
plotGrid( classes, cases );

% classifies samples
cases = validate( classes, cases );

% calculates error