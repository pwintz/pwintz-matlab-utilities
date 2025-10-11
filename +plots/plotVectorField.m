function plotVectorField(f, plot_args, options)
  arguments(Input)
    f (1, 1) function_handle;
  end % End of Input arguments block

  arguments(Input, Repeating)
    plot_args;
  end % End of Input arguments block

  arguments(Input)
    options.offset = [0; 0]; % Offset the point where the origin is plotted.
    options.xRange = [-2, 2];
    options.yRange = [-2, 2];
    options.Color = [0.2, 0.2, 0.6];
  end % End of Input arguments block

  % plotLinearVectorField - Given a 2x2 matrix A, plot the vector field in 2D.
  x_array = options.xRange(1):0.1:options.xRange(2);
  y_array = options.yRange(1):0.1:options.yRange(2);
  [x1, x2] = meshgrid(x_array, y_array);

  % 
  x = [reshape(x1, 1, []); 
       reshape(x2, 1, [])];

  % p = arrayfun(@(x1, x2) x1 + x2, param1_array)
  vectors = pwintz.arrays.mapColumns(f, x);

  pwintz.assertions.assertNumRows(vectors, 2);

  % ⋘──────── Add offset ────────⋙
  x1 = x1 + options.offset(1);
  x2 = x2 + options.offset(2);


  pwintz.strings.format("x1 (%z), x2 (%z), x (%z), vectors (%z)", x1, x2, x, vectors);

  % Reshape
  p1 = reshape(vectors(1,:), size(x1));
  p2 = reshape(vectors(2,:), size(x2));
  quiver(x1, x2, p1, p2, "Color", options.Color, plot_args{:});
end