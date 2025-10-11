function result = mapColumns(map_function, input_arrays)
  % pwintz.arrays.mapColumns: For a given row vector, find the indices of all rows in array that are equal to the given row. The row indices are returned as a column vector. If there are no matches, then an empty array is returned.
  % TODO: ` runtests Test_mapColumns
  arguments(Input)
    map_function function_handle;
  end % End of Input arguments block
  arguments(Input, Repeating)
    input_arrays (:, :);
  end

  arguments(Output)
    result (:, :);
  end % End of Output arguments block
  
  % ⋘──────── Check dimensions. ────────⋙
  
  n_cols = size(input_arrays{1}, 2);
  for ndx = pwintz.arrays.cellVectorIndices(input_arrays)
    input_array = input_arrays{ndx};
    pwintz.assertions.assertNumColumns(input_array, n_cols,  "All the input arrays to mapColumns must have the same number of columns. Inputs: %s" + formattedDisplayText(input_arrays));
  end

  out_cell = cell(n_cols, 1);
  for col = 1:n_cols
    col_of_each_input_arrays = cellfun(@(array) array(:, col), input_arrays, "UniformOutput", false);

    out_cell{col} = map_function(col_of_each_input_arrays{:});
    % if ~isdouble(out_cell{col}) && ~isstring(out_cell{col}) && ~ischar(out_cell{col})
    %   warning("Output of the map_function handle\n\n%s\nis not a %s instead of a double, string, or char. It might not be convertible to a matrix.", formattedDisplayText(map_function), class(out_cell{col}))
    % end % End of if block.
    assert(iscolumn(out_cell{col}), "The output of the map_function must be a column vector. Instead its size was %s", mat2str(size(out_cell{col})));
  end 

  % ╭────────────────────────────────────────────────────────────────╮
  % │             Convert from a cell array to an array.             │
  % ╰────────────────────────────────────────────────────────────────╯
  try
    result = [out_cell{:}]'; % Transpose to make into column vector.
    % if iscell(out_cell{1})
    %   out_cell = cellfun(@(entry) entry, out_cell, "UniformOutput", false);
    % end
    % result = cell2mat(out_cell);
  catch exception
    exception = exception.addCause(MException("pwintz:mapColumns", "Failed to convert cell array %s to a matrix.", formattedDisplayText(out_cell)));
    rethrow(exception);
  end % End of try-catch block

  % Translate so that each column in the output is in the same column as from the input.
  result = transpose(result);

  pwintz.assertions.assertNumColumns(result, n_cols, "The output of mapColumns must have the same number of rows as the inputs. Output size " + mat2str(size(result)));

  
end % end function
