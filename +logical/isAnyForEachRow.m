function is_any_in_row = isAnyForEachRowRow(array)
  
  % Check if there is any truthy values in each row. 
  dim = 2;
  is_any_in_row = any(array, dim); 

  pwintz.assertions.assertSize(is_any_in_row, [size(array, 1), 1]);
end % end function