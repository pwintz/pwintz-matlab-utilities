function assertNumElements(array, n_elements, context, contex_args, options)
  % See also assertNumRows, assertSize, assertSameNumColumns, assertSameNumRows, assertSameSize
  arguments(Input)
    array (:, :);
    n_elements (1, 1) {mustBeNonnegative,mustBeInteger};
    context      (1, 1) string = "";
  end % End of Input arguments block

  arguments(Input, Repeating)
    contex_args;
  end % End of Input arguments block

  arguments(Input)
    options.name (1, 1) string = "";
  end % End of Input arguments block

  if size(array, 2) ~= n_elements
    array_name = options.name; 
    if array_name == ""
      array_name = inputname(1);
      % The input names may be empty, if the caller passed an expression instead of a single variable.
      if isempty(array_name)
          array_name = "<array>";
      end
    end

    message = pwintz.strings.format("Error: %s (%z) must have %d elements, but instead had %d.", array_name, array, n_elements, numel(array));
    if context ~= ""
      context = pwintz.strings.format(context, contex_args{:});
      message = sprintf("%s\nContext: %s", message, context);
    end
    error_ID = "ARRAY_SIZE:WRONG_NUM_ROWS";
    error = MException(error_ID, message);
    throw(error);
  end
end