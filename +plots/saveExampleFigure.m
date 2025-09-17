function saveExampleFigure(save_path, filename, varargin)
% global EXAMPLES_SAVE_PATH

p = inputParser;
p.FunctionName = 'saveExampleFigure';
addOptional(p, 'width', 300);
addOptional(p, 'height', 250);
addParameter(p, 'save_pdf', true, @islogical);
addParameter(p,'save_png_preview', true, @islogical);
addParameter(p,'save_png', false, @islogical);
addParameter(p,'save_jpg', false, @islogical);
addParameter(p,'save_fig', false, @islogical);
parse(p,varargin{:});

width = p.Results.width;
height = p.Results.height;

path = fullfile(save_path, filename);
path_preview = fullfile(save_path, filename + "_preview");

fig = gcf();

if strcmp(get(fig, 'WindowStyle'), 'docked')
    warning('Figure is docked, skipping saving');
    return
end

previous_position = get(fig, "position");

set(fig,'WindowStyle','normal');
set(fig, "position", [previous_position(1:2), width, height]);

if p.Results.save_png_preview
    saveas(fig, path_preview, "png");
end
if p.Results.save_png
    saveas(fig, path, "png");
end
if p.Results.save_jpg
    saveas(fig, path, "jpg");
end

% Draw a white rectangle around the figure to force the saved PDF to have a
% margin.
annotation('rectangle', [0 0 1 1], 'Color','w')

if p.Results.save_pdf
    % Save as a PDF
    exportgraphics(fig, path + ".pdf", 'ContentType','vector', 'BackgroundColor','none')
    
    %%% Open the saved PDF:
    % web(path + ".pdf")
end
if p.Results.save_fig
    savefig(fig, path + ".fig", 'compact')
end
    
end