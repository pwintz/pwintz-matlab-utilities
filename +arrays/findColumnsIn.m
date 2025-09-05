function col_ndxs = findColumnsIn(col_vectors, array)
  % pwintz.arrays.findColumnsIn : Find the row indices of all rows in array that are equal to the given row vector. The row indices are returned as a column vector. If there are no matches, then an empty array is returned.
  arguments(Input)
    col_vectors (:, :);
    array       (:, :);
  end % End of Input arguments block
  
  arguments(Output)
    col_ndxs (1, :) cell;
  end % End of Output arguments block
  
  warning("findColumnsIn:ID","pwintz.arrays.findColumnsIn has not been tested. Did you mean to use pwintz.arrays.findColumnIn?");

  pwintz.assertions.assertSameNumRows(col_vectors, array);

  col_ndxs = pwintz.arrays.findRowIn(col_vector', array', tolerance=options.tolerance);

  % Transpose each array, so the are row vectors.
  col_ndxs = cellfun(@(x) x', col_ndxs);
end % end function