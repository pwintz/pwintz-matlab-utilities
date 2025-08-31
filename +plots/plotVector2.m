function plot_handle = plotVector2(vectors, options)
  % Plot a vector in 2D. 
  % If one positional argument is given it is the vector to be plotted. 
  % It two positional arguments are given, the first is taken to be the start of the vector and the second argument gives the displacement from the start to the end of the vector.

  arguments(Input, Repeating)
    vectors (2, 1) double;
  end % End of Output arguments block
  
  arguments(Input)
    options.plotArgs cell;
  end % End of Input arguments
  
  switch numel(vectors)
    case 1
      start_point = [0; 0];
      vector      = vectors{1};
    case 2
      start_point = vectors{1};
      vector      = vectors{2};
    otherwise
      error('There must exactly one or two arguments passed to pwintz.plots.plotVector2. Instead there were %d', numel(vectors));
  end

  h = quiver(start_point(1), start_point(2), vector(1), vector(2), options.plotArgs{:}, "AutoScale", false);

  % h = plot(x, y, options.plotArgs{:});
  if nargin() == 1
    plot_handle = h;
  end
end % end function