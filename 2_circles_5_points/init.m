% INITIALIZATION FILE - to setup the constraint and guess points and
%   initialize the optimisation

% terminals - the start and end points input as a 2x2 array 
%   [x1 y1; x2 y2]

% guess_points - initial position of the guess_points input as an nx2
%   array where n is number of guess_points

terminals = [1 9; 9 1]; %terminal points
% random initialisation
% guess_points = 10*rand(5,2);
% circles = [10*rand(2,2) 2*rand(2,1)];

% pre-determined points
guess_points = [8 8; 3 7; 3.5 3; 4.5 5; 4.75 4.5]; %initialisation of guess points (before optimisation) 
circles = [2 8 0.75; 8 2 0.5]; %initialisation of circular constraints (before optimisation) 


% runs and outputs the results
objective(terminals,guess_points,circles)