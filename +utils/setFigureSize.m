function setFigureSize(width, height)
    if ~exist('width', 'var') || isempty(width)
        width = 300;
    end
    if ~exist('height', 'var')
       height = 250; 
    end

    fig = gcf();

    if strcmp(get(fig, 'WindowStyle'), 'docked')
        warning('Figure is docked, cannot change size.')
        return
    end

    previous_position = get(fig, "position");
    
    set(fig,'WindowStyle','normal')
    set(fig, "position", [previous_position(1:2), width, height])
end