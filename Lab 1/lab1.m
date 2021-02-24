% SYDE Lab 1 - Clusters and Classification Boundaries
% Names: Robyn Ching, Silvia George, Amy Lu  Date: , 2021

%% Initial set up

clear % clear all variables from memory
close all  % close all open figures
rng('default')

% class definitions and sample generation in another function
% classes is an array
classes = getClasses();

% plots original classes; gets case data
cases = plotOriginal( classes );

% runs dist calculatiosn for entire grid
cases = gridClass( classes, cases );

% plots classifiers and decision boundaries
plotGrid( classes, cases );

% classifies samples
cases = classify( classes, cases );

% calculates error