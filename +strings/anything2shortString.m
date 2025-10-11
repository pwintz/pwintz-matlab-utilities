function str = anything2shortString(value)
  % Given any input, this aims to produce a string of moderate length (<80 char) such that is useful for identifying what the input is, for the purpose of debugging.

  % Example usage with cell arrays:
  % 
  %   pwintz.strings.anything2shortString({1, "3", []})
  %   pwintz.strings.anything2shortString({1, "3", []; 2, 'sh', [1, 2;3,4]})
  % 
  % Example usage with arrays:
  % 
  %   pwintz.strings.anything2shortString([1, 2; 4, 5])
  % 

  if isempty(value)
    str = pwintz.strings.format("%s.empty(%z)", values);
  elseif iscell(value)
    entry_types = cellfun(@(entry) pwintz.strings.format("%z %s", entry, class(entry)), value, "UniformOutput", false);
    str = pwintz.strings.format("cell (%z) = %s", value, entry_types);
  elseif ~isscalar(value)
    str = pwintz.strings.format("%s (%z) = %s", class(value), value, value);
  else % is a non-cell array scalar.
    str = pwintz.strings.format("%s (%z) = %s", class(value), value, value);
  end

  % ╭───────────────────────────────────────────────╮
  % │             Truncate long strings             │
  % ╰───────────────────────────────────────────────╯
  MAX_LENGTH = 80;
  actual_length = strlength(str);
  if actual_length > MAX_LENGTH
    omission_msg_fmt = " ... <omitted %d characters> ... ";
    omission_msg_length = strlength(sprintf(omission_msg_fmt, 1e4));
    % n_chars_to_omit = actual_length - MAX_LENGTH;
    max_content_length = MAX_LENGTH - omission_msg_length;
    n_per_side = floor(max_content_length / 2);
    str_start = extractBefore(str, n_per_side)
    str_end    = extractAfter(str, actual_length - n_per_side);
    n_omitted = actual_length - 2*n_per_side;
    omission_str = sprintf(omission_msg_fmt, n_omitted)
    str = str_start + omission_str + str_end;
  end
end % end function