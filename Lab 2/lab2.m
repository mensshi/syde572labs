% SYDE Lab 2 - Model Estimation and Discriminant Functions
% Names: Robyn Ching, Silvia George, Amy Lu  
% Date: April 2, 2021

clear % clear all variables from memory
close all  % close all open figures

% loads data and allocates information
[ ME1D, ME2D, SD ] = loadData();

% runs estimators
[ ME1D, ME2D, SD ] = runEst( ME1D, ME2D, SD );

% classify grid
ME2D = gridClass( ME2D );

% error analysis for discriminants?

% plots all datasets and estimations
plotData( ME1D, ME2D, SD );


%% Helper functions