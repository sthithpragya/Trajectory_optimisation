% INITIALIZATION FILE - to setup the constraint and guess points and
%   initialize the optimisation

% terminals - the start and end points input as a 2x2 array 
%   [x1 y1; x2 y2]

% guess_points - initial position of the guess_points input as an nx2
%   array where n is number of guess_points

% circles - circular constraints input as nx3 vector where n is the number
%   of circular constraint regions
%   each row is a 1x3 vector - [x y r] where (x,y) is the circle centre and
%   r is the radius

terminals = [1 9; 9 1];
%random initialisation
% guess_points = 10*rand(1,2); % random initialisation of guess point
% circles = [10*rand(1,2) 2*rand]; % random circular constraint with radius between 0 and 2


%pre-determined points
guess_points = [8 8]; %initialisation of guess points (before optimisation) 
circles = [2 8 0.75]; %initialisation of circular constraints (before optimisation) 





% runs and outputs the results
objective(terminals,guess_points,circles)