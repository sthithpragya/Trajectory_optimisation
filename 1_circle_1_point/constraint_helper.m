function constraint_value = constraint_helper(points,circle) 
% Evaluates the shortest distance between a line segment and the circle obstacle
% and formulates the constraint as (radius - distance) < 0
% NOTE: Definition of distance varies in different cases

% points - 2x2 vector which contains the P1 and P2 points whose segment should not lie inside the circle
% circle - 1x3 vector (centre_x,centre_y,radius)

      p1 = [points(1,:),1]; %guess point 1 (homogenised)
      p2 = [points(2,:),1]; %guess point 2 (homogenised)
      
      radius = circle(3);
      line_of_join = cross(p1,p2); %ax + by + c = 0 
      a = line_of_join(1);
      b = line_of_join(2);
      c = line_of_join(3);
      
      c_centre = [circle(1,1:2),1]; % homogenised circle centre
      distance = abs(dot(line_of_join,c_centre))/sqrt(a^2 + b^2); % distance bw centre of circle and segment
      
      %line perpendicular to line of join (containing the shortest distance & passing through c_centre)    
      line_of_normal = [-b,a,b*c_centre(1)-a*c_centre(2)]; %-bX + aY + (bx - ay) = 0
      
      X1 = [p1(1,1:2);circle(1,1:2)];
      d1 = pdist(X1,'euclidean'); % dist from circle centre to p1
      
      X2 = [p2(1,1:2);circle(1,1:2)];
      d2 = pdist(X2,'euclidean'); % dist from circle centre to p2
      
      % Checking whether the point of projection of circle centre on line of join lies in between p1 and p2 or not
      % Checking via seeing whether p1 and p2 lie on same side of normal or not
      
      dot_prod_matrix = line_of_normal*[p1.' p2.']; % contains dot product of normal with p1 and p2
      greater_vector = dot_prod_matrix >= [0 0]; % check if both p1 and p2 on positive side of the line
      lesser_vector = dot_prod_matrix <= [0 0]; % check if both pts on negative side of the line
      compare_vector = logical([1 1]);

      if isequal(greater_vector,compare_vector) || isequal(lesser_vector,compare_vector) % both points on only one side
          constraint_value = radius - min(d1,d2);% since negative value satisfies the constraint
      else
          constraint_value = radius - distance; % since positive value represents a bad case
      end
end

