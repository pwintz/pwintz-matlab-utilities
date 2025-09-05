function assertSameSize(left_array, right_array)
  arguments(Input)
    left_array (:, :);
    right_array (:, :);
  end % End of Input arguments block

  if ~all(size(left_array) == size(right_array))
    left_array_name = inputname(1);
    right_array_name = inputname(2);
    % The input names may be empty, if the caller passed an expression instead of a single variable.
    if isempty(left_array_name)
        left_array_name = "<left>";
    end
    if isempty(right_array_name)
        right_array_name = "<right>";
    end
    error("Expected size(%s)=%s to equal size(%s)=%s", left_array_name, mat2str(size(left_array)), right_array_name, mat2str(size(right_array)));
  end
end % end function