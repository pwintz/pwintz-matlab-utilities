function assertAllLessThan(left, right, context, context_args, options)
  arguments(Input)
    left (:, :);
    right (:, :);
    context (1, 1) string = "";
  end % End of Input arguments block
  
  arguments(Input, Repeating)
    context_args;
  end % End of Input arguments block
  
  arguments(Input)
    options.leftName = [];
    options.rightName = [];
    % options.tolerance = 0;
  end % End of Input arguments block

  is_less_than = left <right; % + options.tolerance;

  if ~all(is_less_than, "all")
    % ╭────────────────────────────────────────────────────────────────────╮
    % │             Generate the "name" for the left argument.             │
    % ╰────────────────────────────────────────────────────────────────────╯
    left_name = options.leftName; 
    if isempty(left_name)% Check if no left name given. 
      left_name = inputname(1);
      % The input names may be empty, if the caller passed an expression instead of a single variable.
      if isempty(left_name)
          left_name = "<left>";
      end
    end
    
    % ╭────────────────────────────────────────────────────────────────────╮
    % │             Generate the "name" for the right argument.            │
    % ╰────────────────────────────────────────────────────────────────────╯
    right_name = options.rightName; 
    if isempty(right_name)% Check if no right name given.
      right_name = inputname(2);
      % The input names may be empty, if the caller passed an expression instead of a single variable.
      if isempty(right_name)
          right_name = "<right>";
      end
    end
    
    error = pwintz.Exception("pwintz:assertAllLessThan", "%s=%s was not less than %s=%s at indices %d", left_name, left, right_name, right, find(~is_less_than));
    throw(error);
  end
end % end function

