function out_array = normalizeRows(in_array)
  arguments(Input)
    in_array (:, :) double;
  end % End of Input arguments block
  arguments(Output)
    out_array (:, :) double;
  end % End of Output arguments block

  p = 2; % Use 2-norm.
  along_dim = 2;
  norms = vecnorm(in_array, p, along_dim);
  assert(all(norms > 0));
  out_array = in_array ./ norms;

  % Check that the columns are unit vectors.
  assert(all(abs(vecnorm(out_array, 2, along_dim) - 1) < 1e-8));
end % end function