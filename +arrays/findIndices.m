function linear_ndxs = findIndices(test_func, array)
  arguments(Input)
    test_func {mustBeA(test_func, "function_handle")};
    array (:, :);
  end % End of Input arguments block
  
  linear_ndxs = find(test_func(array));

end % end function