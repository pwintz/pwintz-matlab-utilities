function plt = plotCircle(center, radius, varargin)
    theta = linspace(0, 2*pi);
    x = center(1) + radius*cos(theta);
    y = center(2) + radius*sin(theta);
    plt = plot(x, y, '-k', varargin{:});

    if nargout == 0
        % Prevent output if function is not terminated with a semicolon.
        clearvars this
    end
end
