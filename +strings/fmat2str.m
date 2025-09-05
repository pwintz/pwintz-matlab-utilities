function str = fmat2str(format, array)
  % Formatted mat2str. Uses sprintf format specifications to each entry. 
  if isa(format,'function_handle')
    formatter = format;
  else
    formatter = @(entry) sprintf(format, entry);
  end
  if iscell(array)
    string_array = cellfun(formatter, array);
    rows_string_array = pwintz.arrays.mapRows(@(row) join(row, ", "), string_array);
    str = sprintf("{%s}", join(rows_string_array, "; "));
  else
    string_array = arrayfun(formatter, array);
    rows_string_array = pwintz.arrays.mapRows(@(row) join(row, ", "), string_array);
    str = sprintf("[%s]", join(rows_string_array, "; "));
  end
end