function saveExampleFigure(save_path, filename, options)
    arguments(Input)
        save_path cell;
        filename string;
        options.width   = 300;
        options.height  = 250;
        options.save_pdf         = true; 
        options.save_png_preview = true; 
        options.save_png = false; 
        options.save_jpg = false; 
        options.save_fig = false; 
        options.verbose  = true;
    end % End of Input arguments block
    
width = options.width;
height = options.height;
pwintz.assertions.assertIsA(save_path, "cell")
pwintz.assertions.assertIsA(filename, "string")

if options.verbose
    verboseDisp = @(str) disp(str);
else
    verboseDisp = @(str) [];
end

path         = fullfile(save_path{:}, filename);
path_preview = fullfile(save_path{:}, filename + "_preview");

fig = gcf();

% ╭───────────────────────────────────────╮
% │             Undock Figure             │
% ╰───────────────────────────────────────╯
set(fig,'WindowStyle','normal')

% ╭────────────────────────────────────────────╮
% │             Update Figure Size             │
% ╰────────────────────────────────────────────╯
previous_position = get(fig, "position");
set(fig, "position", [previous_position(1:2), width, height]);

if options.save_png_preview
    saveas(fig, path_preview, "png");
end
if options.save_png
    verboseDisp("Saving figure as PNG in " + path);
    saveas(fig, path, "png");
end
if options.save_jpg
    verboseDisp("Saving figure as JPEG in " + path);
    saveas(fig, path, "jpg");
end

% Draw a white rectangle around the figure to force the saved PDF to have a margin.
annotation('rectangle', [0 0 1 1], 'Color','w')

if options.save_pdf
    verboseDisp("Saving figure as PDF in " + path);
    % Save as a PDF
    exportgraphics(fig, path + ".pdf", 'ContentType','vector', 'BackgroundColor','none')
    
    %%% Open the saved PDF:
    % web(path + ".pdf")
end
if options.save_fig
    verboseDisp("Saving figure as MATLAB .fig file in " + path);
    savefig(fig, path + ".fig")
end
    
end
