function plt = plotCircleFill(center, radius, varargin)
    theta = linspace(0, 2*pi);
    x = center(1) + radius*cos(theta(1:end-1));
    y = center(2) + radius*sin(theta(1:end-1));

    % Create a polygon and plot it.
    plt = polyshape(x, y).plot(varargin{:});

    if nargout == 0
        % Prevent output if function is not terminated with a semicolon.
        clearvars this
    end
end