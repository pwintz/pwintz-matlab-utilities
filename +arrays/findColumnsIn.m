function col_ndxs = findColumnsIn(col_vectors, array)
  % pwintz.arrays.findColumnsIn : Find the row indices of all rows in array that are equal to the given row vector. The row indices are returned as a column vector. If there are no matches, then an empty array is returned.
  % assert(isrow(col_vectors), '"col_vectors" must be a row vector (shocking, I know).');

  arguments(Input)
    col_vectors (:, :);
    array       (:, :);
  end % End of Input arguments block
  
  arguments(Output)
    col_ndxs (:, 1) cell;
  end % End of Output arguments block
  
  warning("findColumnsIn:ID","pwintz.arrays.findColumnsIn has not been tested. Did you mean to use pwintz.arrays.findColumnIn?");

  assert(size(col_vectors, 1) == size(array, 1), 'The height of "col_vectors" must equal the hight of "array".');

  % We use "ismembertol" instead of "ismember" because "ismember" only returns one index. In the furture, we might also allow for nonzero tolerances, but this is not yet implemented.
  tolerance = 0.0;
  [~, col_ndxs] = ismembertol(col_vectors', array', tolerance, "ByRows", true, "OutputAllIndices", true);

  if col_ndxs == 0
    col_ndxs = {};
  end
end % end function