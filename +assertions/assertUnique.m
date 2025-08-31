function assertUnique(array, options)
  arguments(Input)
    array (:, :) double;
    options.tolerance (1, 1) double = 0.0;
  end % End of Input arguments block

  assert(isvector(array), "Not implemented for non-vectors. size(array)=%s", mat2str(size(array)));

  [unique_values, ndxs_of_unique_values] = uniquetol(array, options.tolerance, 'OutputAllIndices', true);
  if(numel(unique_values) < numel(array)) % If there were duplicates:
    % Generate an informative error message...
    is_entry_duplicate = cellfun(@(entry) numel(entry) > 1, ndxs_of_unique_values');
    duplicate_entries_str = cellfun(@(ndxs) sprintf("%f is duplicated at indices %s", array(ndxs(1)), mat2str(ndxs)), ndxs_of_unique_values(is_entry_duplicate));
  
    % Raise error.
    array_name = inputname(1);
    if options.tolerance == 0
      tolerance_msg = "";
    else
      tolerance_msg = sprintf("(up to a small numerical tolerance)");
    end

    error("There was a repeated entry in '%s'%s. The list had %d items but only %d were unique. The duplicated items are: \n\t%s.", array_name, tolerance_msg, numel(array), numel(ndxs_of_unique_values), join(duplicate_entries_str, "\n\t"));
  end
end % end function