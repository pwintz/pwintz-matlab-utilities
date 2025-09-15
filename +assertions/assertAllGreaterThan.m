function assertAllGreaterThan(left, right, context, context_args, options)
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

  is_greater_than = left > right; % + options.tolerance;

  if ~all(is_greater_than, "all")
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

    leq_indices = find(~is_greater_than);
    if isscalar(left)
      left_neq_values = left;
      left_leq_indices = 1;
    else
      left_neq_values = left(leq_indices);
      left_leq_indices = leq_indices;
    end
    if isscalar(right)
      right_neq_values = right;
      right_leq_indices = 1;
    else
      right_neq_values = right(leq_indices);
      right_leq_indices = leq_indices;
    end
    table = struct2table(struct(...
      "left_name", left_name, ...
      "left_indx", left_leq_indices, ...
      "left_neq_values", left_neq_values, ...
      "relation", "≤", ...
      "right_neq_values", right_neq_values,  ...
      "right_name", right_name, ...
      "right_index", right_leq_indices  ...
    ));
    error = pwintz.Exception("pwintz:assertAllGreaterThan", "%s=%s was not greater than %s=%s at indices %d, That is:\n%D\n", left_name, left, right_name, right, find(~is_greater_than), table);
    throw(error);
  end
end % end function

