function assertNonempty(values, context, context_args, options)
  arguments(Input)
    values (:, :);
    context (1, 1) string = "";
  end % End of Input arguments block

  arguments(Input, Repeating)
    context_args;
  end % End of Input arguments block

  arguments(Input)
    options.name  = [];
  end % End of Input arguments block
  
  if isempty(values)
    % ╭───────────────────────────────────────────────────────╮
    % │             Generate the "name" argument.             │
    % ╰───────────────────────────────────────────────────────╯
    name = options.name; 
    if isempty(name)% Check if no left name given. 
      name = inputname(1);
      % The input names may be empty, if the caller passed an expression instead of a single variable.
      if isempty(name)
          name = "<values>";
      end
    end
    
    if context ~= ""
      context = "\nContext:\n" + pwintz.strings.format(context, context_args{:});
    end

    error = pwintz.Exception("pwintz:assertNonempty", "%s = %s was empty.", name, values);
    throw(error);
  end
end % end function

