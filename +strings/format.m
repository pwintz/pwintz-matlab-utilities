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
  
  regex_expression = '(?<!%)%.*?[diuoxXfeEgGcsz]';
  replacement_fmts = extract(format_string, regexpPattern(regex_expression))';
  % [fmt_start_ndxs, fmt_end_ndxs] = regexp(format_string, regex_expression);
  
  n_fmts = numel(replacement_fmts);
  % TODO: Improve error string when number of values don't match the number of specifications.
  pwintz.assertions.assertNumColumns(values, n_fmts);

  fmt_out = strings(n_fmts, 1);
  for i_fmt = 1:n_fmts
    fmt = replacement_fmts(i_fmt);
    value = values{i_fmt};
    last_char = extract(fmt, strlength(fmt));
    switch last_char
      case "s"
        if isscalar(value) && ~iscell(value)
          % Use default formatter.
          fmt_out(i_fmt) = sprintf(fmt, value);
        else % If an array, map each element using the given format.
          % formatter = @(entry) strip(formattedDisplayText(entry));
          fmt_out(i_fmt) = pwintz.strings.fmat2str(@entry2str, value);
        end

      case "z" % "Size" output
        fmt_out(i_fmt) = size2str(value);
      otherwise
        if isscalar(value)
          % Use default formatter.
          fmt_out(i_fmt) = sprintf(fmt, value);
        else % If an array, map each element using the given format.
          fmt_out(i_fmt) = pwintz.strings.fmat2str(fmt, value);
        end

    end

  end
  out_string = regexprep(format_string, regex_expression, fmt_out, "once");

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