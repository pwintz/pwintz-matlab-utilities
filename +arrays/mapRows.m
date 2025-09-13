function result = mapRows(map_function, input_arrays)
  % pwintz.arrays.mapRows: For a given row vector, find the indices of all rows in array that are equal to the given row. The row indices are returned as a column vector. If there are no matches, then an empty array is returned.
  % TODO: ` runtests Test_mapRows
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
  
  n_rows = size(input_arrays{1}, 1);
  for ndx = pwintz.arrays.cellVectorIndices(input_arrays)
    input_array = input_arrays{ndx};
    pwintz.assertions.assertNumRows(input_array, n_rows,  "The inputs to mapRows must have the same number of rows. Inputs: %s" + formattedDisplayText(input_arrays));
  end

  out_cell = cell(n_rows, 1);
  for row = 1:n_rows
    row_of_each_input_arrays = cellfun(@(array) array(row, :), input_arrays, "UniformOutput", false);

    out_cell{row} = map_function(row_of_each_input_arrays{:});
    % if ~isdouble(out_cell{row}) && ~isstring(out_cell{row}) && ~ischar(out_cell{row})
    %   warning("Output of the map_function handle\n\n%s\nis not a %s instead of a double, string, or char. It might not be convertable to a matrix.", formattedDisplayText(map_function), class(out_cell{row}))
    % end % End of if block.
    assert(isrow(out_cell{row}), "The output of the map_function must be a row vector. Instead its size was %s", mat2str(size(out_cell{row})));
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
    exception = exception.addCause(MException("pwintz:mapRows", "Failed to convert cell array %s to a matrix.", formattedDisplayText(out_cell)));
    rethrow(exception);
  end % End of try-catch block

  pwintz.assertions.assertNumRows(result, n_rows, "The output of mapRows must have the same number of rows as the inputs. Output size " + mat2str(size(result)));

end % end function
