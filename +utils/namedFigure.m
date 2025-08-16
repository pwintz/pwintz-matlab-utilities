function fig = namedFigure(name)
    % This file is a replacement for pwintz.utils.named_figure.
    % The changes relative to pwintz.utils.named_figure are 
    % 1. A figure ID is not given. The figure name acts as its identifier.
    % 2. If a figure with the given name already exists, then it is selected.
    % 2. We do not clear the figure after selecting it. 

    % Function signature should be like: myFunction(<positional arguments>, options)
    arguments
        name (1, 1) string
    end
    
    % Search for an existing figure with the specified name
    fig = findobj('Type', 'figure', 'Name', name);
    
    if isempty(fig)
        % If the figure does not exist, create a new one
        fig = figure();
        set(fig, 'Name', name, NumberTitle='off')
    else
        % If the figure exists, make it the current figure
        figure(fig);
    end
end