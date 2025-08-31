function row_ndxs = findRowIn(row_vector, array, options)
  % pwintz.arrays.findRowIn : For a given row vector, find the indices of all rows in array that are equal to the given row. The row indices are returned as a row vector. If there are no matches, then an empty array is returned.
  arguments(Input)
    row_vector (1, :);
    array      (:, :);
    options.tolerance (1, 1) {mustBeNonnegative} = 0.0;
    options.verbose (1, 1) logical = false;
  end % End of Input arguments block
  
  arguments(Output)
    row_ndxs (1, :);
  end % End of Output arguments block
  
  % assert(isrow(row_vector), '"row_vector" must be a row vector (shocking, I know). If you want to find multiple rows, use "pwintz.arrays.findRowsIn" instead.');
  assert(size(row_vector, 2) == size(array, 2), 'The width of row_vector must match the width the array. The height of col_vector is %s and the height of array is %s.', mat2str(size(row_vector)), mat2str(size(array)));

  % We use "ismembertol" instead of "ismember" because "ismember" only returns one index. In the furture, we might also allow for nonzero tolerances, but this is not yet implemented.
  [~, row_ndxs] = ismembertol(...
    row_vector, array, ...
    options.tolerance, ... 
    "ByRows", true, ...
    "OutputAllIndices", true, ...
    'DataScale', 1 ... % Use absolute tolerance instead of relative.
  );

  % Convert row_ndxs into an array;
  row_ndxs = cell2mat(row_ndxs);
  if row_ndxs == 0
    row_ndxs = [];
  end

  if options.verbose
    fprintf("Searched for the row vector %s in the array %s with tolerance %.2g.\n", mat2str(row_vector, 10), mat2str(array, 10), options.tolerance);
    row_errors = vecnorm((row_vector - array)')';
    if isempty(row_ndxs)
      fprintf('The row was not found in the array. The closest row in array was a distance of %.2g\n', min(row_errors));
    else
      fprintf('The row was found at indices %s. The error of the found terms was %s.\n', mat2str(row_ndxs), mat2str(row_errors(row_ndxs)));
    end
  end


end % end function