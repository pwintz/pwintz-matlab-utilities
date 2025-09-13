function col_ndxs = findColumnsIn(col_vectors, array, options)
  % pwintz.arrays.findColumnsIn : Find the column indices of all columns in array that are equal to the given row vector. The column indices are returned as a a cell array of rows vectors. If there are no matches, then the corresponding entry is empty.

  % `runtests Test_findColumnsIn

  arguments(Input)
    col_vectors (:, :) {mustBeFloat};
    array       (:, :) {mustBeFloat};
    options.tolerance (1, 1) {mustBeNonnegative} = 0.0;
  end % End of Input arguments block
  
  arguments(Output)
    col_ndxs (1, :) cell;
  end % End of Output arguments block
  
  pwintz.assertions.assertSameNumRows(col_vectors, array);

  % col_ndxs = pwintz.arrays.findRowIn(col_vector', array', tolerance=options.tolerance);

  % We use "ismembertol" instead of "ismember" because "ismember" only returns one index. 
  [~, col_ndxs] = ismembertol(col_vectors', array', ...
    options.tolerance, ... 
    "ByRows", true, ...
    "OutputAllIndices", true, ...
    'DataScale', 1 ... % Use absolute tolerance instead of relative.
  );

  % Transpose each array, so they are row vectors. We use "UniformOutput=false" to ensure that the output is still a cell array.
  col_ndxs = cellfun(@(x) x', col_ndxs, "UniformOutput", false);

  % Change any entries in col_ndx that are "0" (indicating no matches) to an empty array. 
  for i = pwintz.arrays.cellVectorIndices(col_ndxs)
    if isequal(col_ndxs{i}, 0)
      col_ndxs{i} = double.empty(0, 1);
    end
  end

end % end function