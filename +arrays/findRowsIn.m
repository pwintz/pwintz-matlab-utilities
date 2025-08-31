function row_ndxs = findRowsIn(row_vectors, array)
  % pwintz.arrays.findRowsIn : Find the row indices of all rows in array that are equal to the given row vector. The row indices are returned as a column vector. If there are no matches, then an empty array is returned.
  % assert(isrow(row_vectors), '"row_vectors" must be a row vector (shocking, I know).');

  arguments(Input)
  row_vectors (:, :);
  array       (:, :);
  end % End of Input arguments block
  
  arguments(Output)
    row_ndxs (:, 1) cell;
  end % End of Output arguments block
  
  warning("findRowsIn:ID","pwintz.arrays.findRowsIn has not been tested. Did you mean to use pwintz.arrays.findRowIn?");

  assert(size(row_vectors, 2) == size(array, 2), 'The width of the arrays must match.');

  % We use "ismembertol" instead of "ismember" because "ismember" only returns one index. In the furture, we might also allow for nonzero tolerances, but this is not yet implemented.
  tolerance = 0.0;
  [~, row_ndxs] = ismembertol(row_vectors, array, tolerance, "ByRows", true, "OutputAllIndices", true);

  if row_ndxs == 0
    row_ndxs = {};
  end
end % end function