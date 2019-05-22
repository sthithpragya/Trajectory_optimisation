function [constraint_value, ceq] = constraint(terminals,points,circles) 
%Formulated using the constraint_helper function by looping it on all possible circle and line-segment pairs
%Returns a vector containing the constraint value corresponding to all the pairs

ceq = [];
%points - sequential array of guess points (in order) N_Px2 
%circles - array of all the circles N_Cx3
%terminals - array of [A;B] 2x2
    constraint_value = [];
    POINTS = [terminals(1,:);points;terminals(2,:)];
    
    n_c = size(circles,1); % n_c = number of circles
    n_p = size(POINTS,1); % n_p = total number of points
    for i = 1:n_p-1
        for j = 1:n_c
            temp_points = [POINTS(i,:); POINTS(i+1,:)];
            temp_circle = circles(j,:);
            temp_constraint_value = constraint_helper(temp_points,temp_circle);
            constraint_value = [constraint_value; temp_constraint_value];
        end
    end
end

