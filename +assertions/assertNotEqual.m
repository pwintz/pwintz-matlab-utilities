function assertNotEqual(v1, v2, options)
  % Check that the values are not equal. Also fails if the sizes are are not equal, unless one of the arguments is a scalar.

  arguments(Input)
    v1;
    v2;
    options.reason (:, 1) string = [];
    options.ignoreTypes logical = true;
    options.ignoreSizes logical = false;
    options.errorID string = "assertNotEqual:FAILED";
  end % End of Input arguments block
  
  if options.ignoreSizes
    % TODO: We can remove this assertion to allow for checks like all([1; 2] == [1 1 1; 2, 3, 4]).
    assert(isscalar(v1) || isscalar(v2), "Can only use ignoreSizes when one of the arguments is a scalar.");
    sizes_OK = true;
    values_OK = all(v1 ~= v2);
  else
    sizes_OK  = isequal(size(v1), size(v2));
    values_OK = ~isequal(v1, v2);
  end
  types_OK  = isequal(class(v1), class(v2)) || options.ignoreTypes;

  % We put all of the slower operations inside the following if-block, running them only if one of the checks fails.
  if ~sizes_OK || ~types_OK || ~values_OK
    % ⋘──────── Construct names for the arguments ────────⋙
    v1_name = inputname(1);
    v2_name = inputname(2);
    % The input names may be empty, if the caller passed an expression instead of a single variable.
    if isempty(v1_name)
        v1_name = "<left>";
    end
    if isempty(v2_name)
        v2_name = "<right>";
    end

    reasons = options.reason;
    if ~sizes_OK
        reasons(end+1) = sprintf("Size mismatch:  size(%s) = %s and size(%s) = %s.", v1_name, mat2str(size(v1)), v2_name, mat2str(size(v2)));
    end
    if ~types_OK
        reasons(end+1) = sprintf("Type mismatch:  class(%s) = %s and class(%s) = %s", v1_name, class(v1), v2_name, class(v2));
    end
    if ~values_OK
      if isnumeric(v1) || islogical(v1)
        v1_str = mat2str(v1);
      else
        v1_str = string(v1);
      end
      if isnumeric(v2) || islogical(v1)
        v2_str = mat2str(v2);
      else
        v2_str = string(v2);
      end
      reasons(end+1) = sprintf("Value match: %s = %s and %s = %s are equal.", v1_name, v1_str, v2_name, v2_str)
    end
    exception = MException(options.errorID, "%s and %s are equal or their type/sizes are mismatched.\n\t%s", v1_name, v2_name, join(reasons, sprintf("\n\t")));
    throw(exception);
  end
end