function assertAllAreMembers(values, array, context, context_args, options)
  % ` runtests assertAllAreMembers
  arguments(Input)
    values (1, :) double;
    array (1, :) double;
    context (1, 1) string = "";
  end % End of Input arguments block
  
  arguments(Input, Repeating)
    context_args;
  end % End of Input arguments block
  
  arguments(Input)
  options.valuesName  = [];
  options.arrayName = [];
  options.tolerance (1, 1) double = 0.0;
  end % End of Input arguments block
  


  assert(isvector(values), "Not implemented for non-vectors. size(values)=%s", mat2str(size(values)));
  assert(isvector(array), "Not implemented for non-vectors. size(array)=%s", mat2str(size(array)));

  % [unique_values, ndxs_of_unique_values] = uniquetol(array, options.tolerance, 'OutputAllIndices', true);

  % Find the values that are not 
  % Array:      are_values_in_array
  % Cell array: value_ndxs_in_array
  [are_values_in_array, value_ndxs_in_array] = ismembertol(values, array, options.tolerance, "OutputAllIndices", true);


  if ~all(are_values_in_array) % If were any missing elements
    % Generate an informative error message...
    values_name = options.valuesName; 
    if isempty(values_name)% Check if no values_name given. 
      values_name = inputname(1);
      % The input names may be empty, if the caller passed an expression instead of a single variable.
      if isempty(values_name)
          values_name = "<values>";
      end
    end
    array_name = options.arrayName; 
    if isempty(array_name)% Check if no array_name given. 
      array_name = inputname(2);
      % The input names may be empty, if the caller passed an expression instead of a single variable.
      if isempty(array_name)
          array_name = "<array>";
      end
    end

    missing_values_ndxs = find(~are_values_in_array);
    missing_entries_str = arrayfun(@(ndx) pwintz.strings.format("Index %2d: %s", ndx, values(ndx)), missing_values_ndxs);
  
    % Raise error.
    if options.tolerance == 0
      tolerance_msg = "";
    else
      tolerance_msg = sprintf("(up to a small numerical tolerance)");
    end

    pwintz.error("Some of the values in '%s' were not found in '%s'%s.\nThe missing values are: \n\t%s.\n'%s': %D\n'%s': %D", values_name, array_name, tolerance_msg, join(missing_entries_str, sprintf("\n\t")), values_name, values, array_name, array);
  end
end % end function