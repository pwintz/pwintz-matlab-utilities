function [duplicated_rows, duplicated_row_ndxs_in_array, nonduplicated_rows, nonduplicated_row_ndxs_in_array] = duplicatedRows(array, options)
  % Find all of the rows in an array that occur more than once (with an optional tolerance). 
  % Can also get the rows that occur exactly once as "unique_rows" (this different than the output of "unque" or "uniquetol" because it does not include the duplicated rows). 
  % ` runtests Test_duplicatedRows

  arguments(Input)
    array (:, :);
    options.tolerance (1, 1) double = 0.0; % Relative to largest absolute value in array.
  end % End of Input arguments block

  [unique_rows, ndxs_of_unique_rows_in_array, ndx_in_array_of_unique_rows] = uniquetol(array, options.tolerance, "ByRows", true, "OutputAllIndices", true);
  % unique_rows, ndxs_of_unique_rows_in_array, ndx_in_array_of_unique_rows

  if isempty(ndxs_of_unique_rows_in_array)
    duplicated_rows                 = unique_rows;
    duplicated_row_ndxs_in_array    = ndx_in_array_of_unique_rows;
    nonduplicated_rows              = unique_rows;
    nonduplicated_row_ndxs_in_array  = ndx_in_array_of_unique_rows;
    return;
  end

  is_row_unique = cell2mat(cellfun(@(element) numel(element) == 1, ndxs_of_unique_rows_in_array, "UniformOutput", false));
  duplicated_rows     = unique_rows(~is_row_unique, :);
  nonduplicated_rows  = unique_rows( is_row_unique, :);

  % ndxs_of_unique_rows_in_array
  duplicated_row_ndxs_in_array    = vertcat(ndxs_of_unique_rows_in_array{~is_row_unique});
  nonduplicated_row_ndxs_in_array = vertcat(ndxs_of_unique_rows_in_array{ is_row_unique});

  % ⋘──────── Sort the ndxs ────────⋙
  duplicated_row_ndxs_in_array    = sort(duplicated_row_ndxs_in_array); 
  nonduplicated_row_ndxs_in_array = sort(nonduplicated_row_ndxs_in_array);    
end % end function