function plot_handle = plotPoints(points, options)
  % Plot one or more points in 2D. 
  % The first argument 

  arguments(Input)
    points (2, :) double;
    options.plotArgs cell;
  end % End of Input arguments
  
  n_points = size(points, 2);
  if n_points == 0
    warning('No points were passed to pwintz.plots.plotPoints');
  end
  
  if n_pionts == 1
    default_plot_args = {"Marker", "*"}; % Change from the default marker, which is "none" so that a single point is still visible.
  else
    default_plot_args = {};
  end

  h = plot(points(1, :), points(2, :), default_plot_args{:}, options.plotArgs{:});

  if nargin() == 1
    plot_handle = h;
  end
end % end function