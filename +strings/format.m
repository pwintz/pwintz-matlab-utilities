function out_string = format(format_string, values)
  % Format a string a la sprintf with expanded format types and automatic handling of arrays and objects...
  % For scalar values, all the specifications except %s (namely, "%d, %i, %u, %o, %x, %X, %f, %e, %E, %g, %G, %c) behave like sprintf. 
  % When a value is an array or cell array, 
  % * the format specification is applied to each entry,  
  % * each entry is separated by a comma
  % * each row is separated by a semicolon
  % * "[]" or "{}" are placed around the string, based on whether it is an array or cell array.
  % 
  % For the %s specification, objects and arrays are automatically converted into a string. 
  % 
  % The %z specification (not available in sprintf) inserts the size of the value as "mxn", where "m" is the number of rows and "n" is the number of columns. Higher order arrays are also supported.

  % ` runtests test_string_format

  arguments(Input)
    format_string (1, 1) string;
  end % End of Input arguments block

  arguments(Input, Repeating)
    values;
  end % End of Input arguments block
  
  regex_expression = '(?<!%)%.*?[diuoxXfeEgGcszD]';
  replacement_fmts = extract(format_string, regexpPattern(regex_expression))';
  % [fmt_start_ndxs, fmt_end_ndxs] = regexp(format_string, regex_expression);
  
  n_fmts = numel(replacement_fmts);
  n_values = size(values, 2);
  % TODO: Improve error string when number of values don't match the number of specifications.

  if n_values ~= n_fmts
    error("The number of values given (%d) does not match the number of format specifications (%d)", n_values, n_fmts)
  end
  % Don't use "assertNumColumns" because that 
  % pwintz.assertions.assertNumColumns(values, n_fmts);

  fmt_out = strings(n_fmts, 1);
  for i_fmt = 1:n_fmts
    fmt = replacement_fmts(i_fmt);
    value = values{i_fmt};
    last_char = extract(fmt, strlength(fmt));
    switch last_char
      case "s"

        if isempty(value) % && ~(ischar(value) && ~isstring(value))
          
          fmt_out(i_fmt) = empty2str(value);
        elseif isscalar(value) && ~iscell(value)
          if isnumeric(value)
            % If we pass a number to the default %s format template, then the output is either " " (for value=0) or an empty strings (for other values). 
            fmt_out(i_fmt) = num2str(value);
          else
            % Use default formatter.
            fmt_out(i_fmt) = sprintf(fmt, value);
          end
        elseif ischar(value)
          fmt_out(i_fmt) = sprintf(fmt, value);
        else % If an array, map each element using the given format.
          % formatter = @(entry) strip(formattedDisplayText(entry));
          fmt_out(i_fmt) = pwintz.strings.fmat2str(@entry2str, value);
        end
      case "D" % "display" output
        if isempty(value)
          % formattedDisplayText doesn't show empty values, so we use our own
          fmt_out(i_fmt) = empty2str(value);
        else
          % We don't trim the white space because many displays are printed with space before each line.
          fmt_out(i_fmt) = "\n" + formattedDisplayText(value, SuppressMarkup=true);
        end
      case "z" % "Size" output
        fmt_out(i_fmt) = size2str(value);
      otherwise
        if iscell(value)
          fmt_out(i_fmt) = pwintz.strings.fmat2str(fmt, value);
        elseif isscalar(value)
          % Use default formatter.
          fmt_out(i_fmt) = sprintf(fmt, value);
        else % If an array, map each element using the given format.
          fmt_out(i_fmt) = pwintz.strings.fmat2str(fmt, value);
        end
    end
  end
  out_string = regexprep(format_string, regex_expression, fmt_out, "once");
  out_string = sprintf(out_string); % Handles escaped characters, like "\n".

  if nargout == 0
      % If the output is not being assigned to a variable, then print it.
      disp(out_string);

      % Clear the output variable to prevent it from being printed again. 
      clearvars out_string;
  end

end % end function

function str = entry2str(entry)
  % Format an array entry (of any type) as a string. 
  if isscalar(entry) && ~iscell(entry)
    str = strip(formattedDisplayText(entry));
  else
    str = sprintf("%s %s", size2str(entry), class(entry));
  end
end % end function

function str = size2str(array)
  size_strings = arrayfun(@(sz) sprintf("%d", sz), size(array));
  str = join(size_strings, "x");
end

function str = empty2str(value)
  str = sprintf("%s.empty(%s)", class(value), size2str(value));
end