function objective(terminals,guess_points,circles)
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

    
    % Finding the optimal points
    lower_limit = zeros(size(guess_points));
    upper_limit = 10*ones(size(guess_points));

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