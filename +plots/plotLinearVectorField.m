function plotLinearVectorField(A, plot_args, options)
  arguments(Input)
    A (:, :) double;
  end % End of Input arguments block

  arguments(Input, Repeating)
    plot_args;
  end % End of Input arguments block

  arguments(Input)
    options.offset = [0; 0];
    options.xRange = [-2, 2];
    options.yRange = [-2, 2];
  end % End of Input arguments block

  % plotLinearVectorField - Given a 2x2 matrix A, plot the vector field in 2D.
  x_array = options.xRange(1):0.1:options.xRange(2);
  y_array = options.yRange(1):0.1:options.yRange(2);
  [x1, x2] = meshgrid(x_array, y_array);

  % 
  p = A*[reshape(x1, 1, []); 
         reshape(x2, 1, [])];
  % ⋘──────── Add offset ────────⋙
  x1 = x1 + options.offset(1);
  x2 = x2 + options.offset(2);

  % Reshape
  p1 = reshape(p(1,:), size(x1));
  p2 = reshape(p(2,:), size(x1));
  quiver(x1,x2,p1,p2, plot_args{:});
end