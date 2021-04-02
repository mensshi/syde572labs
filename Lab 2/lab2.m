% SYDE Lab 2 - Model Estimation and Discriminant Functions
% Names: Robyn Ching, Silvia George, Amy Lu  
% Date: April 2, 2021

clear % clear all variables from memory
close all  % close all open figures
rng( 'default' );

% loads data and allocates information
[ ME1D, ME2D, SD ] = loadData();

% runs estimators
[ ME1D, ME2D ] = runEst( ME1D, ME2D );

% classify grid/points
[ ME1D, ME2D ] = gridClass( ME1D, ME2D );

% plots all datasets and estimations
plotData( ME1D, ME2D );

% sequential classifier
SD.SC{1} = getSC( SD.A.samples, SD.B.samples, -1 );
SD.SC{2} = getSC( SD.A.samples, SD.B.samples, -1 );
SD.SC{3} = getSC( SD.A.samples, SD.B.samples, -1 );
% 
% % plot sequential classifers
plotSD( SD );

% error analysis for discriminants?
errorSD( SD );

%% Helper functions