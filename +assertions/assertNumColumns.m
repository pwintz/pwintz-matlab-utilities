function assertNumColumns(array, n_rows)
  if size(array, 2) ~= n_rows
    array_name = inputname(1);
    % The input names may be empty, if the caller passed an expression instead of a single variable.
    if isempty(array_name)
        array_name = "<left>";
    end

    error = MException("ARRAY_SIZE:WRONG_NUM_ROWS", "%s must have %d columns, but instead had %d.", array_name, n_rows, size(array, 2));
    throwAsCaller(error);
  end
end