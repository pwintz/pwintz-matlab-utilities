function assertIsRow(array, context, options)
  % See also assertNumRows, assertSize, assertSameNumRows, assertSameNumRows, assertSameSize
  arguments(Input)
    array (:, :);
    context      (1, 1) string = "";
    options.name (1, 1) string = "";
  end % End of Input arguments block

  if ~isrow(array)
    array_name = options.name; 
    if array_name == ""
      array_name = inputname(1);
    end
    % The input names may be empty, if the caller passed an expression instead of a single variable.
    if array_name == "" || isempty(array_name)
        array_name = "<array>";
    else 
      array_name = """" + array_name + """";
    end

    message = pwintz.strings.format("Expected %s to be a row vector but instead its size is %z.", array_name, array);
    if context ~= ""
      message = sprintf("%s\nContext: %s", message, context);
    end
    error_ID = "pwintz:WRONG_SIZE:NOT_ROW";
    error = MException(error_ID, message);
    throw(error);
  end
end