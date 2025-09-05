function assertNumRows(array, n_rows, context, options)
  arguments(Input)
    array (:, :);
    n_rows (1, 1) {pwintz.validators.mustBeIndexScalar};
    context      (1, 1) string = "";
    options.name (1, 1) string = "";
  end % End of Input arguments block
  
  if size(array, 1) ~= n_rows
    array_name = options.name; 
    if array_name == ""
      array_name = inputname(1);
      % The input names may be empty, if the caller passed an expression instead of a single variable.
      if isempty(array_name)
          array_name = "<array>";
      end
    end

    message = sprintf("Error: %s must have %d rows, but instead had %d rows (the size is %s).", array_name, n_rows, size(array, 1), mat2str(size(array)));
    if context ~= ""
      message = sprintf("%s\nContext: %s", message, context);
    end
    error_ID = "ARRAY_SIZE:WRONG_NUM_ROWS";
    error = MException(error_ID, message);
    throwAsCaller(error);
  end
end