function assertAllEqual(left, right, options)
  arguments(Input)
    left (:, :);
    right (:, :);
    options.leftName  = [];
    options.rightName = [];
    options.tolerance = 0;
  end % End of Input arguments block

  is_eq = abs(left - right) < options.tolerance;

  if ~all(is_eq, "all")
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
    
    % TODO: Move this construction of the error string into its own function.
    neq_indices = transpose(find(~is_eq)); % Column vector.
    scalar_to_col = @(scalar) repmat(scalar, size(neq_indices));
    if isscalar(left)
      left_neq_values = scalar_to_col(left);
      left_neq_indices = ones(size(neq_indices));
    else
      left_neq_values = left(neq_indices)';
      left_neq_indices = neq_indices;
    end
    if isscalar(right)
      right_neq_values = scalar_to_col(right);
      right_neq_indices = ones(size(neq_indices));
    else
      right_neq_values = right(neq_indices)';
      right_neq_indices = neq_indices;
    end
    left_name_rep = scalar_to_col(left_name);
    right_name_rep = scalar_to_col(right_name);
    table = pwintz.tables.makeTable(...
      "left_name", left_name_rep, ...
      "left_indx", left_neq_indices, ...
      "left_neq_values", left_neq_values, ...
      "relation", scalar_to_col("≠"), ...
      "right_neq_values", right_neq_values,  ...
      "right_name", right_name_rep, ...
      "right_index", right_neq_indices, ...
      NumRows=numel(neq_indices) ...
    );
    % values_str = sprintf("\t(%s)(%d) = %8g ≠ (%s)(%d) = %8g \n", left_name, neq_indices, left_neq_values, right_name, neq_indices, right_neq_values)
    
    error = pwintz.Exception("pwintz:assertAllLessThanOrEqual", "%s=%s was not equal to %s=%.8g at indice(s) %d. That is:\n%D", left_name, left, right_name, right, find(~is_eq), table);
    throw(error);
  end
end % end function

