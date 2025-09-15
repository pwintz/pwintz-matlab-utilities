function [vertices, vertex_ndxs] = verticesOfConvexHull(points)
  dim      = size(points, 1);
  assert(ismember(dim, [2, 3]), "The dimension of the points must be 2D or 3D.");
  
  points = pwintz.arrays.uniqueColumns(points, tolerance=1e-8);
  n_points = size(points, 2);

  % Handle cases that "convhull" throws errors for. 
  if n_points < dim + 1
    vertices = points;
    vertex_ndxs = 1:n_points;
    % TODO: For n_points = 3, dim = 3, check that the points are not colinear.
    return
  end

  % switch n_points
    % case 0
    % case 1
    %   vertices = points;
    %   vertex_ndxs = 1;
    % case 2
    %   vertices = points;
    %   vertex_ndxs = 1:2;
    % otherwise
      K = convhull(points');
      vertex_ndxs = unique(K);
      vertices = points(:, vertex_ndxs);
  % end
  


end