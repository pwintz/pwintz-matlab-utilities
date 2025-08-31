function assertAllAreMembers(values, array, options)
  arguments(Input)
    values (:, :) double;
    array (:, :) double;
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
    array_name = inputname(2);
    if isempty(array_name)
      array_name = 'array';
    end
    missing_values_ndxs = find(~are_values_in_array);
    missing_entries_str = arrayfun(@(ndx) sprintf("Index %2d: %f", ndx, values(ndx)), missing_values_ndxs);
  
    % Raise error.
    if options.tolerance == 0
      tolerance_msg = "";
    else
      tolerance_msg = sprintf("(up to a small numerical tolerance)");
    end

    error("There were missing elements not found in '%s'%s. The missing values are: \n\t%s.", array_name, tolerance_msg, join(missing_entries_str, sprintf("\n\t")));
  end
end % end function