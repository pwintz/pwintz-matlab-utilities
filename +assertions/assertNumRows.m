function assertNumRows(array, n_rows)
  array_name = inputname(1);
  if size(array, 1) ~= n_rows
    error = MException("ARRAY_SIZE:WRONG_NUM_ROWS", "%s must have %d rows, but instead had %d.", array_name, n_rows, size(array, 1));
    throwAsCaller(error);
  end
end