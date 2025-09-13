function matched_rows = filterRows(filter_fnc, array)
  % pwintz.arrays.filterRows: Remove the rows in "array" such that filter_fnc(row) is false.  
  arguments(Input)
    filter_fnc  (:, :) {mustBeA(filter_fnc, "function_handle")};
    array       (:, :);
  end % End of Input arguments block
  
  arguments(Output)
    matched_rows (:, :);
  end % End of Output arguments block
  
  is_row_matched = pwintz.arrays.mapRows(filter_fnc, array);
  
  pwintz.assertions.assertSize(is_row_matched, [size(array, 1), 1]);
  is_row_matched = logical(is_row_matched);

  matched_rows = array(is_row_matched, :);

end % end function