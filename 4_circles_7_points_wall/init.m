% INITIALIZATION FILE - to setup the constraint and guess points and
%   initialize the optimisation

% terminals - the start and end points input as a 2x2 array 
%   [x1 y1; x2 y2]

% guess_points - initial position of the guess_points input as an nx2
%   array where n is number of guess_points

% walls - walls given in the problem to be plot in the data input as
%   nx4 array where n is the number of walls and each row is a 1x4
%   vector [x1,y1,x4,y4] of diagnol points in clockwise fashion
%               (x1,y1)------|
%                   |--------| 
%                   |--------| 
%                   |------(x4,y4)

terminals = [1 9; 9 1]; %terminal points
walls = [4,10,6,6;4,4,6,0]; %initialisation of the walls

%pre-determined points
guess_points = [8 8; 3 7; 3.5 3; 4.5 5; 4.75 4.5; 7 3.5; 6 1]; %initialisation of guess points (before optimisation) 
circles = [2 8 0.75; 3 6 0.75; 8 2 0.5; 8 6 0.9]; %initialisation of circular constraints (before optimisation) 

%random initialisation
% guess_points = 10*rand(7,2);
% circles = [10*rand(4,2) 0.25+2*rand(4,1)]; %initialisation of circular constraints (before optimisation) 




% runs and outputs the results
objective(terminals,guess_points,circles,walls)