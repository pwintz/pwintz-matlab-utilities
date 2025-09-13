function norms = columnNorms(matrix)
  arguments(Input)
    matrix (:, :) double;
  end % End of Input arguments block
  arguments(Output)
    norms (1, :) double;
  end % End of Output arguments block

  p = 2; % Use 2-norm.
  along_dim = 1;
  norms = vecnorm(matrix, p, along_dim);
end % end function