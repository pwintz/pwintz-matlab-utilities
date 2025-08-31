function assertSize(array, expected_shape)
  arguments(Input)
    array (:, :);
    expected_shape (1, 2) double;
  end % End of Input arguments block

  if ~all(size(array) == expected_shape)
    array_name = inputname(1);
    error("The array '%s' must have shape %s but instead had shape %s", array_name, mat2str(expected_shape), mat2str(size(array)));
  end
end % end function