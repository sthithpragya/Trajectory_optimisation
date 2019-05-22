function objective_path_length = distance(terminal_points,guess_points) %Objective function - path length which we have to minimise

% each point as a 1x2 vector
% terminal_points - [A;B] -> 2x2
% A - start
% B - end

% guess_points - [p1;p2;.....pn] -> nx2
    path_APn = [terminal_points(1,:);guess_points];
    path_P1B = [guess_points;terminal_points(2,:)];
    distance_vector = path_APn - path_P1B; 
    %APn - points from A to last guess point 
    %P1B - points from first guess point to terminal point
    distance_square = distance_vector.*distance_vector; %vector of intermediate paths
    distance_square = sum(distance_square,2);
    path_distance = sqrt(distance_square);
    total_distance = sum(path_distance,1);
    objective_path_length = total_distance;
end

