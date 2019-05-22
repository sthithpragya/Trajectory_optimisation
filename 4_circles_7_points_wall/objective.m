function objective(terminals,guess_points,circles,walls)
    % This function carries out the optimisation problem by finding the
    %   position of intermediate points which minimises the over-all
    %   point-to-point distance
    % It also generates the plot of the data (both before and after optimisation)

    % Plotting the guess points before optimisation    
    axis square
    Vector_ini = [terminals(1,:);guess_points;terminals(2,:)];
    x_ini = Vector_ini(:,1);
    y_ini = Vector_ini(:,2);
    plot(x_ini,y_ini,'-o')
    hold on

    % Naming the points
    end_pt = size(x_ini,1);
    text(x_ini(1)+0.25,y_ini(1),'A')
    text(x_ini(end_pt)+0.25,y_ini(end_pt),'B')

    for i = 2:end_pt-1
        text(x_ini(i)+0.25,y_ini(i),num2str(i-1))
    end

    % Plotting circles
    for i = 1:size(circles,1)
        pos = [circles(i,1)-circles(i,3), circles(i,2)-circles(i,3), 2*circles(i,3), 2*circles(i,3)]; 
        rectangle('Position',pos,'Curvature',[1 1])
        hold on
    end

    % Plotting walls
    for i = 1:size(walls,1)
        wall_temp = walls(i,:);
        x = wall_temp(1);
        y = wall_temp(4);
        w = abs(wall_temp(3)-wall_temp(1));
        h = abs(wall_temp(4)-wall_temp(2));
        rectangle('Position',[x,y,w,h],'FaceColor',[0 .5 .5],'EdgeColor','b')
        hold on
    end

    % Finding the optimal points
    
    walls_x_lower = walls(:,1);
    walls_x_lower = min(walls_x_lower);
    
    walls_x_upper = walls(:,3);
    walls_x_upper = max(walls_x_upper);
    
    y_limits = [walls(:,2);walls(:,4)];
    y_lower = sort(y_limits);
    y_upper = sort(y_limits,'descend');
    
    walls_y_lower = 0;
    walls_y_upper = 10;
    
    for i = 0:size(y_lower)
        if y_lower(i+1) > y_upper(i+1)
            break
        else
            walls_y_lower = y_lower(i+1);
            walls_y_upper = y_upper(i+1);
        end
    end
    
    %region limits (0,0) to (10,10)
    x_min_reg = 0;
    x_max_reg = 10;
    y_min_reg = 0;
    y_max_reg = 10;
    
    %       |----------------------------------|--------------------------|----------(x_max_reg,y_max_reg)
    %       |                                  |--------------------------|                      |
    %       |                                  |--------------------------|                      |
    %       |                                  |--------------------------|                      |
    %       |                       (walls_x_lower,walls_y_upper)---------|                      |
    %       |                                                                                    |
    %       |                                                                                    |       
    %       |                                                                                    |
    %       |                                  |--------------(walls_x_upper,walls_y_lower)      |
    %       |                                  |--------------------------|                      |
    %       |                                  |--------------------------|                      |
    %(x_min_reg,y_min_reg)------------------------------------------------|----------------------|
    
    lower_limit = [x_min_reg y_min_reg; x_min_reg y_min_reg; x_min_reg y_min_reg;... % limits for the first 3 points
        walls_x_lower walls_y_lower; walls_x_upper walls_y_lower;... % limits for the next two points
        walls_x_upper y_min_reg; walls_x_upper y_min_reg]; %limtis for the last 2 points
    
    upper_limit = [walls_x_lower y_max_reg ; walls_x_lower y_max_reg ; walls_x_lower y_max_reg ;...
        walls_x_lower walls_y_upper; walls_x_upper walls_y_upper;... 
        x_max_reg y_max_reg ; x_max_reg y_max_reg ]; %(x,y)
    
    guess_pt_opt = fmincon(@(guess_pt)distance(terminals,guess_pt),guess_points,[],[],[],[],...
        lower_limit,upper_limit,... % value bounds
        @(guess_pt)constraint(terminals,guess_pt,circles)); % constraints 

    % Plotting points after optimisation

    Vector_opt = [terminals(1,:);guess_pt_opt;terminals(2,:)];
    x_opt = Vector_opt(:,1);
    y_opt = Vector_opt(:,2);
    plot(x_opt,y_opt,'-x')
    hold off

    % Naming the points
    end_pt = size(x_opt,1);

    for i = 2:end_pt-1
        text(x_opt(i)+0.25,y_opt(i),num2str(i-1))
    end
    
    disp('optimal points are:')
    Vector_opt

end