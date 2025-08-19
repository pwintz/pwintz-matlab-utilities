function plotLinearVectorField(A, varargin)
  % plotLinearVectorField - Given a 2x2 matrix A, plot the vector field in 2D.
  x_array = -2:0.1:2;
  y_array = -2:0.1:2;
  [x1, x2] = meshgrid(x_array, y_array);
  p = A*[reshape(x1, 1, []); 
        reshape(x2, 1, [])];
  p1 = reshape(p(1,:), size(x1));
  p2 = reshape(p(2,:), size(x1));
  quiver(x1,x2,p1,p2, varargin{:});
end