function row_ndxs = findRowsIn(row_vectors, array, options)
  % pwintz.arrays.findRowsIn: For each row in "row_vectors", find the rows in "array" that are equal (up to an optional tolerance). The return value is an nx1 cell array where n is the number of rows in "row_vectors". Each ith entry in the output has the indices of the rows in "array" that are equal to row_vectors(i, :). The each entry in the returned cell array is a (possibly empty) column vector. 
  arguments(Input)
    row_vectors (:, :) {mustBeFloat};
    array       (:, :) {mustBeFloat};
    options.tolerance (1, 1) {mustBeNonnegative} = 0.0;
    % options.verbose (1, 1) logical = false;
  end % End of Input arguments block
  
  arguments(Output)
    row_ndxs (:, 1) cell;
  end % End of Output arguments block
  
  pwintz.assertions.assertSameNumColumns(row_vectors, array);

  % We use "ismembertol" instead of "ismember" because "ismember" only returns one index. 
  [~, row_ndxs] = ismembertol(row_vectors, array, ...
    options.tolerance, ... 
    "ByRows", true, ...
    "OutputAllIndices", true, ...
    'DataScale', 1 ... % Use absolute tolerance instead of relative.
  );

  % Change any entries in col_ndx that are "0" (indicating no matches) to an empty array. 
  for i = pwintz.arrays.cellVectorIndices(row_ndxs)
    if isequal(row_ndxs{i}, 0)
      row_ndxs{i} = double.empty(1, 0);
    end
  end
end % end function