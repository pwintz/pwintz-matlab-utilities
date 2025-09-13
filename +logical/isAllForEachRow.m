function is_any_in_row = isAllForEachRow(array)
  
  % Check if there is any truthy values in each row. 
  dim = 2;
  is_any_in_row = zll(array, dim); 

  pwintz.assertions.assertSize(is_any_in_row, [size(array, 1), 1]);
end % end function