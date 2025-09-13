function assertNotColumnIn(column, array, context, options)
  % See also assertNumRows, assertSize, assertSameNumColumns, assertSameNumRows, assertSameSize
  arguments(Input)
    column (:, :) {pwintz.validators.mustBeColumnVector};
    array (:, :);
    context      (1, 1) string = "";
    options.columnName (1, 1) string = "";
    options.arrayName (1, 1) string = "";
    options.tolerance (1, 1) double = 0.0;
  end % End of Input arguments block

  if pwintz.arrays.isColumnIn(column, array)
    column_name = options.columnName; 
    if column_name == ""
      column_name = inputname(1);
    end
    % The input names may be empty, if the caller passed an expression instead of a single variable.
    if column_name == "" || isempty(column_name)
        column_name = "<column>";
    else 
      column_name = """" + column_name + """";
    end

    array_name = options.arrayName; 
    if array_name == ""
      array_name = inputname(1);
    end
    % The input names may be empty, if the caller passed an expression instead of a single variable.
    if array_name == "" || isempty(array_name)
        array_name = "<array>";
    else 
      array_name = """" + array_name + """";
    end

    message = pwintz.strings.format("Expected %s=%g to not be a column in %s=%g.", column_name, column, array_name, array);

    if context ~= ""
      message = sprintf("%s\nContext: %s", message, context);
    end
    error_ID = "pwintz:assertNotColumnIn";
    error = MException(error_ID, message);
    throw(error);
  end
end