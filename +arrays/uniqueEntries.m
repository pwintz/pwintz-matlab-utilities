function [unique_entries, src_ndxs_cell, out_ndxs] = uniqueEntries(array, options)
  arguments(Input)
    array (:, :);
    options.tolerance (1, 1) double = 0.0; % Relative to largest absolute value in array.
  end % End of Input arguments block
  arguments(Output)
    unique_entries (1, :);
    src_ndxs_cell  (1, :) cell;
    out_ndxs       (1, :);
  end % End of Output arguments block
  
  [unique_entries, src_ndxs_cell, out_ndxs] = uniquetol(array, options.tolerance, "OutputAllIndices", true);
end