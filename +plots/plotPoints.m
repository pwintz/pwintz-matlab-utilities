function plot_handle = plotPoints(points, options)
  % Plot one or more points in 2D. 
  % The first argument 

  arguments(Input)
    points (:, :) double;
    options.plotArgs cell = {};
  end % End of Input arguments
  
  dim = size(points, 1);
  n_points = size(points, 2);
  if n_points == 0
    warning('No points were passed to pwintz.plots.plotPoints');
  end
  assert(ismember(dim, [2, 3]), "points must have 2 or 3 rows. Instead it had %d", dim)
  
  % Change from the default marker, which is "none" so that a single point is still visible.
  default_plot_args = {"LineStyle", "none", "Marker", "*"}; 

  switch dim
    case 2
      h = plot(points(1, :), points(2, :), default_plot_args{:}, options.plotArgs{:});
    case 3
      h = plot3(points(1, :), points(2, :), points(3, :), default_plot_args{:}, options.plotArgs{:});
  end

  if nargin() == 1
    plot_handle = h;
  end
end % end function