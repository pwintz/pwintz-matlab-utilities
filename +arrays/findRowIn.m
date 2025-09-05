function row_ndxs = findRowIn(row_vector, array, options)
  % pwintz.arrays.findRowIn : For a given row vector, find the indices of all rows in array that are equal to the given row. The row indices are returned as a column vector. If there are no matches, then an empty array is returned.
  % ` runtests Test_findRowIn
  arguments(Input)
    row_vector (1, :);
    array      (:, :);
    options.tolerance (1, 1) {mustBeNonnegative} = 0.0;
    options.verbose (1, 1) logical = false;
  end % End of Input arguments block
  
  arguments(Output)
    row_ndxs (:, 1);
  end % End of Output arguments block
  
  % Check dimensions.
  pwintz.assertions.assertSameNumColumns(row_vector, array);

  % We use "ismembertol" instead of "ismember" because "ismember" only returns one index. In the furture, we might also allow for nonzero tolerances, but this is not yet implemented.
  [~, row_ndxs] = ismembertol(...
    row_vector, array, ...
    options.tolerance, ... 
    "ByRows", true, ...
    "OutputAllIndices", true, ...
    'DataScale', 1 ... % Use absolute tolerance instead of relative.
  );

  % Convert row_ndxs into an array;
  if iscell(row_ndxs)
    row_ndxs = cell2mat(row_ndxs);
  end
  if numel(row_ndxs) == 1 && row_ndxs == 0
    row_ndxs = double.empty(0, 1);
  % else
  %   error("findRowIn(): Unexpected case: row_vector=%s, array=%s, row_ndxs=%s", mat2str(row_vector), mat2str(array), mat2str(row_ndxs) )
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