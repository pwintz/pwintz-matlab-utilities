function [unique_rows, src_ndxs_cell, out_rows_ndxs] = uniqueRows(array, options)
  arguments(Input)
    array (:, :);
    options.tolerance (1, 1) double = 0.0; % Relative to largest absolute value in array.
  end % End of Input arguments block
  arguments(Output)
    unique_rows (:, :);
    src_ndxs_cell (:, 1) cell;
    out_rows_ndxs (:, 1);
  end % End of Output arguments block
  
  [unique_rows, src_ndxs_cell, out_rows_ndxs] = uniquetol(array, options.tolerance, "ByRows", true, "OutputAllIndices", true);
end