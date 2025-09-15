function assertNoneEqual(left, right, context, context_args, options)
  % ` runtests Test_assertNoneEqual

  arguments(Input)
    left (:, :);
    right (:, :);
    context (1, 1) string = "";
  end % End of Input arguments block
  
  arguments(Input, Repeating)
    context_args;
  end % End of Input arguments block
  
  arguments(Input)
    options.leftName  (1,1) string = "";
    options.rightName (1,1) string = "";
    options.tolerance = 0;
  end % End of Input arguments block

  is_neq = abs(left - right) > options.tolerance;

  if ~all(is_neq, "all")
    % ╭────────────────────────────────────────────────────────────────────╮
    % │             Generate the "name" for the left argument.             │
    % ╰────────────────────────────────────────────────────────────────────╯
    left_name = options.leftName; 
    if left_name == "" % Check if no left name given. 
      left_name = string(inputname(1));
      % The input names may be empty, if the caller passed an expression instead of a single variable.
      if left_name == ""
          left_name = "<left>";
      end
    end
    
    % ╭────────────────────────────────────────────────────────────────────╮
    % │             Generate the "name" for the right argument.            │
    % ╰────────────────────────────────────────────────────────────────────╯
    right_name = options.rightName; 
    if right_name == "" % Check if no right name given.
      right_name = string(inputname(2));
      % The input names may be empty, if the caller passed an expression instead of a single variable.
      if right_name == ""
          right_name = "<right>";
      end
    end
    
    % TODO: Move this construction of the error string into its own function.
    neq_indices = reshape(find(~is_neq), [], 1) % Column vector.
    size(neq_indices)
    if isscalar(left)
      left_neq_values = left;
      left_neq_indices = 1;
    else
      left_neq_values = left(neq_indices)';
      left_neq_indices = neq_indices;
    end
    if isscalar(right)
      right_neq_values = right;
      right_neq_indices = 1;
    else
      right_neq_values = right(neq_indices)';
      right_neq_indices = neq_indices;
    end
    % left_name_class = class(left_name)
    % right_name_class = class(right_name)
    % left_name


    n = numel(neq_indices);
    % left_neq_values  = ensureNX1(left_neq_values, n) ;
    % left_neq_indices = ensureNX1(left_neq_indices, n)  ;
    % left_name        = ensureNX1(left_name, n)  ;
    % right_neq_values = ensureNX1(right_neq_values, n)  ;
    % right_neq_values = ensureNX1(right_neq_values, n)  ;
    % right_name       = ensureNX1(right_name, n)  ;
    table = pwintz.tables.makeTable(...
      "left_name",       ensureNX1(left_name, n), ...
      "left_indx",       ensureNX1(left_neq_indices, n), ...
      "left_neq_values", ensureNX1(left_neq_values, n), ...
      "relation",        ensureNX1("=", n), ...
      "right_neq_values",ensureNX1(right_neq_values, n),  ...
      "right_name",      ensureNX1(right_name, n), ...
      "right_index",     ensureNX1(right_neq_indices, n), ...
      NumRows=numel(neq_indices) ...
    );
    % values_str = sprintf("\t(%s)(%d) = %8g ≠ (%s)(%d) = %8g \n", left_name, neq_indices, left_neq_values, right_name, neq_indices, right_neq_values)

    if context ~= ""
      context = "\nContext:\n" + pwintz.strings.format(context, context_args{:});
    end

    MSG_ID = "pwintz:assertNoneEqual";
    error = pwintz.Exception(MSG_ID, "%s=%s was equal to %s=%s at indices %d. That is:\n%D%s", left_name, left, right_name, right, find(~is_neq), table, context);
    throw(error);
  end
end % end function

function array = ensureNX1(array, n)
  assert(isvector(array), "must be a vector.")
  if isscalar(array)
    array = repmat(array, [n, 1]);
  end
  if isrow(array)
    array = transpose(array);
  end
end