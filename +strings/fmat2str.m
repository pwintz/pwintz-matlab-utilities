function str = fmat2str(format, array)
  % Formatted mat2str. Uses sprintf format specifications to each entry. 
  if isa(format,'function_handle')
    formatter = format;
  else
    formatter = @(entry) sprintf(format, entry);
  end
  if iscell(array)
    string_array = cellfun(formatter, array);
    string_format = "{%s}";
  else
    string_array = arrayfun(formatter, array);
    string_format = "[%s]";
  end
  if isempty(array)
    rows_string_array = "";
  else
    rows_string_array = pwintz.arrays.mapRows(@(row) join(row, ", "), string_array);
  end
  % Join each each row string with ";" and insert it into the string_format, which will be either "[]" or "{}".
  str = sprintf(string_format, join(rows_string_array, "; "));
end